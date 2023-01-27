// /*
//     Gravity Bridge is a UI for interacting with the gravity chain.
//     Copyright (C) 2023  blockscape Finance AG, Switzerland
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
// */

// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:js_util';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/apdu.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/event_manager.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:web_hid/web_hid.dart';

import 'hid_framing.dart';

const int _ledgerVendorId = 0x2c97;

class LedgerDevice {
  HidDevice? _device;
  HidResponse? _latestResponse;
  void Function(HidResponse)? _completeResponseCallback;

  /// always get this by using getCallback, so we have on unique callback object that can be used to unsubscribe from events.
  void Function(Event)? _eventCallback;
  late EventManager _em;

  LedgerDevice() {
    _em = EventManager();
    _em.addDisconnectHandler((hidDevice) {
      if (_device != null && hidDevice.vendorId == _ledgerVendorId) {
        dlog("Ledger device disconnected. Resetting...");
        disconnectLedger();
      }
    });
  }

  Future<void> connectLedger() async {
    disconnectLedger();

    List<HidDevice> requestDevice = await hid.requestDevice(RequestOptions(
      filters: [RequestOptionsFilter(vendorId: _ledgerVendorId)],
    ));
    _device = requestDevice[0];
    if (!_device!.opened) {
      await _device!.open();
    }
    _listenForResponses();
  }

  Future<void> disconnectLedger() async {
    if (_device != null) {
      dlog("close previous device");
      //unsubscribe Listeners
      _device!.unsubscribeInputReport(_getCallback());
      // close previous device
      await _device!.close();
      _device = null;
    }
  }

  /// Should only be called when connecting to new device
  void _listenForResponses() {
    _device!.subscribeInputReport(_getCallback());
  }

  /// this is the callback for the events of the ledger
  void Function(Event event) _getCallback() {
    _eventCallback ??= allowInterop((Event event) {
      dlog("LEDGER: Receiving input report from device");
      ByteData blockData = getProperty(event, 'data');

      final respPart = HidResponsePart(blockData);
      if (respPart.sequence == 0) {
        _latestResponse = HidResponse(respPart);
      } else {
        if (_latestResponse == null) {
          dlog(
              "Error tried to add HidResponsePart to non-existent HodResponse");
          return;
        }
        _latestResponse!.addPart(respPart);
      }

      if (_latestResponse!.completed) {
        if (_completeResponseCallback == null) {
          dlog(
              "Error On Complete Response, callback not available. Response: length: ${_latestResponse!.length}");
          return;
        }
        _completeResponseCallback!(_latestResponse!);
        _completeResponseCallback = null;
      }
    });

    return _eventCallback!;
  }

  Future<HidResponse> _transferAndWaitForResponse(Uint8List apduPart) async {
    final completer = Completer<HidResponse>();
    _completeResponseCallback = (resp) {
      completer.complete(resp);
    };

    await _exchange(apduPart);
    return completer.future;
  }

  Future<void> _exchange(Uint8List payload) async {
    // reset connection
    if (_device == null) {
      await connectLedger();
    }

    //logging payloads to send
    dlog("Send to Ledger: ${_uint8ListToString(payload)}");

    try {
      final blocks = createBlocks(payload);
      for (var i = 0; i < blocks.length; i++) {
        await _device!.sendReport(0, blocks[i]);
      }
    } catch (e) {
      dlog(e.toString());
      rethrow;
    }
  }

  Future<String> signTx(Uint8List txBytes, String hdPath, WidgetRef ref) async {
    dlog("LEDGER SIGN");
    final payloadChunks = getApduDataChunks(txBytes, hdPath);
    final apduParts = createApduSignMessagesV2(payloadChunks);
    String sig = "";
    for (var i = 0; i < apduParts.length; i++) {
      final resp = await _transferAndWaitForResponse(apduParts[i]);
      final sigResp = SignatureResponse(resp, ref);
      if (i == apduParts.length - 1) {
        sig = sigResp.sigBase64;
      }
    }
    return sig;
  }

  Future<String> getVersion(WidgetRef ref) async {
    dlog("LEDGER GET VERSION");
    final apduVersion = Command_GET_VERSION();
    final resp = await _transferAndWaitForResponse(apduVersion);
    final versionResponse = GetVersionResponse(resp, ref);
    return versionResponse.version;
  }

  Future<SECP256k1AddrResponse> getSecp256K1Addr(String hrp, String hdPath,
      bool displayAddressOnDevice, WidgetRef ref) async {
    dlog("LEDGER GET ADDRESS");
    final apdu =
        Command_INS_GET_ADDR_SECP256K1(hrp, displayAddressOnDevice, hdPath);
    final resp = await _transferAndWaitForResponse(apdu);
    dlog(resp);

    final addr = SECP256k1AddrResponse(resp, ref);

    return addr;
  }
}

String _uint8ListToString(Uint8List l) {
  String res = "[";
  for (var i = 0; i < l.lengthInBytes; i++) {
    if (i != 0) {
      res += ",";
    }
    res += "0x${l.elementAt(i).toRadixString(16)}";
  }
  res += "]";
  return res;
}
