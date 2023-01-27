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

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/ledger/amino.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/ledger_device.dart';
import 'package:gravity_bridge_flutter/utils.dart';

import '../keplr/keplr.dart';
import 'lib/apdu.dart';

/// The Ledger Service offers the same amino signing as Keplr, but without Keplr as intermediary.
class LedgerService {
  static LedgerDevice? ledger;

  static connectLedger() async {
    ledger = LedgerDevice();
    dlog("connecting Ledger");
    await ledger!.connectLedger();
  }

  static closeLedgerConnection() {
    dlog("disconnecting Ledger");
    if (ledger != null) {
      ledger!.disconnectLedger();
      ledger = null;
    }
  }

  static Future<SECP256k1AddrResponse> getAddressFromLedger(
      String prefix, WidgetRef ref) async {
    if (ledger == null) {
      await connectLedger();
    }

    prefix = prefix.replaceAll(RegExp(r"\d+\b"), "");
    final resp =
        await ledger!.getSecp256K1Addr(prefix, "m/44'/118'/0'/0/0", false, ref);
    return resp;
  }

  static Future<String> getLedgerVersion(WidgetRef ref) async {
    if (ledger == null) {
      await connectLedger();
    }

    final version = await ledger!.getVersion(ref);
    dlog("Cosmos Ledger App Version: $version");
    return version;
  }

  static Future<String> signAmino(
      String chainID, String signer, StdSignDoc signDoc, WidgetRef ref) async {
    if (ledger == null) {
      await connectLedger();
    }

    final signDocJson = stdSignDocToAminoJson(signDoc);
    dlog(signDocJson);
    // convert to bytes
    List<int> list = utf8.encode(signDocJson);
    Uint8List bytes = Uint8List.fromList(list);

    // Possible Improvement: maybe chain can just be provided as a param
    final bip44 =
        chainInfos.values.firstWhere((info) => info.chainId == chainID).bip44;

    //Sign
    return await ledger!.signTx(bytes, "m/44'/${bip44.coinType}'/0'/0/0", ref);
  }
}
