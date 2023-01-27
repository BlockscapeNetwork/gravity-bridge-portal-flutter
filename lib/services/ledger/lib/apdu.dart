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

// Spec can be found here: https://github.com/LedgerHQ/app-cosmos/blob/main/docs/APDUSPEC.md
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/der_encoding.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/hid_framing.dart';

import 'bip32_path.dart';

const _chunkSize = 250;
const _cla = 0x55;
const _appKey = "CSM";
const _insGetVersion = 0x00;
const _insSignSecp256k1 = 0x02;
const _insGetAddrSecp256k1 = 0x04;
const _payloadTypeInit = 0x00;
const _payloadTypeAdd = 0x01;
const _payloadTypeLast = 0x02;
const _swOk = 0x9000;
const _swCancel = 0x6986;

Map<int, String> returnMessages = {
  0x6400: "Execution Error",
  0x6700: "Too Long",
  0x6982: "Empty buffer",
  0x6983: "Output buffer too small",
  0x6986: "Command not allowed",
  0x6D00: "INS not supported",
  0x6E00: "CLA not supported",
  0x6E01: "Cosmos app not open",
  0x6F00: "Unknown",
  0x9000: "Success"
};

/// Field	Type	Content	Expected
/// CLA	byte (1)	Application Identifier	0x55
/// INS	byte (1)	Instruction ID	0x00
/// P1	byte (1)	Parameter 1	ignored
/// P2	byte (1)	Parameter 2	ignored
/// L	byte (1)	Bytes in payload	0
Uint8List Command_GET_VERSION() {
  int cla = _cla;
  int ins = _insGetVersion;
  int p1 = 0;
  int p2 = 0;
  int l = 0;
  return Uint8List.fromList([cla, ins, p1, p2, l]);
}

/// Expects an address format of "m/44'/118'/0'/0/0". Please note the first 2 parts are fixed to 44 and 118 respectively.
/// Different paths will cause an exception.
Uint8List Command_INS_GET_ADDR_SECP256K1(
    String hrp, bool displayAddressOnDevice, String hdPath) {
  final buf = WriteBuffer();
  buf.putUint8(_cla); //cla
  buf.putUint8(_insGetAddrSecp256k1); // ins
  if (displayAddressOnDevice) {
    buf.putUint8(0x01);
  } else {
    buf.putUint8(0x00);
  }
  buf.putUint8(0x00); //ignored
  if (hrp.isEmpty || hrp.length > 83) {
    throw Exception(
        "Ledger Error: Can't get SECP256K1 address from ledger. Bech32 hrp should be between 1 and 83 characters (inclusive) but was ${hrp.length}");
  }

  final hrpBytes = Uint8List.fromList(hrp.codeUnits);
  buf.putUint8(21 +
      hrpBytes
          .length); // payload length in bytes (1 hrp length, ? hrp, 20 hdPath)
  buf.putUint8(hrp.length); // length of hrp
  buf.putUint8List(hrpBytes); // hrp
  final bipPath = BIP32Path.fromString(hdPath);
  if (bipPath.purpose.value != 44 || bipPath.coinType.value != 118) {
    throw Exception(
        "Ledger Error: hd path must start with 44'/118'. Path was (${bipPath.toString()}");
  }
  buf.putUint8List(bipPath.serialize());

  final data = buf.done();

  return data.buffer.asUint8List(0, data.lengthInBytes);
}

// Creates the apdu payload chunks without headers. Each chunk's max size is defined by _chunkSize.
List<Uint8List> getApduDataChunks(Uint8List data, String hdPath) {
  final List<Uint8List> chunks = [];

  final bip32 = BIP32Path.fromString(hdPath);
  chunks.add(bip32.serialize());

  for (var i = 0; i < data.length; i += _chunkSize) {
    var end = i + _chunkSize;
    if (end > data.length) {
      end = data.length;
    }
    chunks.add(data.sublist(i, end));
  }

  return chunks;
}

// Create Apdu parts for signing a transaction for Ledger Cosmos app v2
List<Uint8List> createApduSignMessagesV2(List<Uint8List> payloadChunks) {
  List<Uint8List> parts = [];
  for (var i = 0; i < payloadChunks.length; i++) {
    if (i == 0) {
      parts.add(_createApduPart(
          _cla, _insSignSecp256k1, _payloadTypeInit, 0, payloadChunks[i]));
    } else if (i == payloadChunks.length - 1) {
      parts.add(_createApduPart(
          _cla, _insSignSecp256k1, _payloadTypeLast, 0, payloadChunks[i]));
    } else {
      parts.add(_createApduPart(
          _cla, _insSignSecp256k1, _payloadTypeAdd, 0, payloadChunks[i]));
    }
  }
  return parts;
}

//  Uint8 cla, Uint8 ins, Uint8 p1, Uint8 p2,
Uint8List _createApduPart(int cla, int ins, int p1, int p2, Uint8List chunk) {
  final buf = WriteBuffer();
  buf.putUint8(cla);
  buf.putUint8(ins);
  buf.putUint8(p1);
  buf.putUint8(p2);
  buf.putUint8(chunk.lengthInBytes);
  buf.putUint8List(chunk);
  final data = buf.done();

  return data.buffer.asUint8List(0, data.lengthInBytes);
}

class GetVersionResponse {
  int cla;
  int major;
  int minor;
  int patch;
  int locked;
  int sw1sw2;
  WidgetRef ref;

  GetVersionResponse._(this.cla, this.major, this.minor, this.patch,
      this.locked, this.sw1sw2, this.ref);

  /*
CLA	byte (1)	Test Mode	0xFF means test mode is enabled
1 MAJOR	byte (1)	Version Major	
2 MINOR	byte (1)	Version Minor	
3 PATCH	byte (1)	Version Patch	
4 LOCKED	byte (1)	Device is locked	
5 SW1-SW2	byte (2)	Return code	see list of return codes
*/
  factory GetVersionResponse(HidResponse resp, WidgetRef ref) {
    _checkForErrors(resp.data, resp.length, ref);
    final bytes = resp.data.buffer.asByteData();

    final cla = bytes.getUint8(0);
    final major = bytes.getUint8(1);
    final minor = bytes.getUint8(2);
    final patch = bytes.getUint8(3);
    final locked = bytes.getUint8(4);
    final targetId = (bytes.getUint8(5) << 24) +
        (bytes.getUint8(6) << 16) +
        (bytes.getUint8(7) << 8) +
        bytes.getInt8(8);
    // This is not documented but can be seen in ledger.js:
    // https://github.com/Zondax/ledger-cosmos-js/blob/150ccbe6a2e9f6bc379c4a9f41d2076cdfbfe80c/src/common.ts#L114
    final sw1sw2 = bytes.getUint16(9);

    return GetVersionResponse._(cla, major, minor, patch, locked, sw1sw2, ref);
  }

  String get version {
    return "v$major.$minor.$patch";
  }

  bool get isLocked {
    return locked == 1;
  }

  bool get testmode {
    return cla == 255;
  }
}

class SECP256k1AddrResponse {
  Uint8List pubKey;
  String addr;
  int sw1sw2;
  WidgetRef ref;

  String get pubKeyBase64 {
    return base64.encode(pubKey);
  }

  SECP256k1AddrResponse._(this.pubKey, this.addr, this.sw1sw2, this.ref);

  /// PK	byte (33)	Compressed Public Key
  /// ADDR	byte (65)	Bech32 addr  // this is false, length seems to be dynamic
  /// SW1-SW2	byte (2)	Return code	see list of return codes
  factory SECP256k1AddrResponse(HidResponse resp, WidgetRef ref) {
    _checkForErrors(resp.data, resp.length, ref);
    final bytes = resp.data.buffer.asByteData();

    final text = String.fromCharCodes(resp.data);

    Uint8List pubKey = resp.data.sublist(0, 33);
    String addr = String.fromCharCodes(resp.data.sublist(33, resp.length - 2));
    int sw1sw2 = resp.data.buffer.asByteData().getUint16(resp.length - 2);

    return SECP256k1AddrResponse._(pubKey, addr, sw1sw2, ref);
  }
}

class SignatureResponse {
  Uint8List sig;
  int sw1sw2;
  WidgetRef ref;

  String get sigBase64 {
    return decodeDERSignature(sig);
  }

  SignatureResponse._(this.sig, this.sw1sw2, this.ref);

  factory SignatureResponse(HidResponse resp, WidgetRef ref) {
    _checkForErrors(resp.data, resp.length, ref);
    final sig = resp.data.sublist(0, resp.length - 2);
    final sw1sw2 = resp.data.buffer.asByteData().getUint16(resp.length - 2);
    return SignatureResponse._(sig, sw1sw2, ref);
  }
}

/// parses response bytes and throws an error if return code was unsuccessful
parseSignResponse(HidResponse response, WidgetRef ref) {
  _checkForErrors(response.data, response.length, ref);
}

void _checkForErrors(
    Uint8List responseData, int expectedLength, WidgetRef ref) {
  final sw1_2 =
      responseData.buffer.asByteData().getUint16(responseData.length - 2);
  if (sw1_2 != _swOk) {
    String msg = returnMessages[sw1_2.toInt()] ??
        "unknown Error ${sw1_2.toRadixString(16)}";
    if (msg.toLowerCase() == "command not allowed") {
      msg = msg + " - ledger is logged out, or you rejected a transaction.";
    }
    throw LedgerException(msg);
  }
  if (responseData.length != expectedLength) {
    throw LedgerException(
        "Expected Length of payload to be $expectedLength, but was ${responseData.length}");
  }
}
