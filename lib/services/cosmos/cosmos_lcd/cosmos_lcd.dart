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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_lcd/types/account.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_lcd/types/balance.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:http/http.dart' as http;

import 'package:gravity_bridge_flutter/services/cosmos/cosmos_lcd/types/denom_trace.dart';

const String baseAccountType = "/cosmos.auth.v1beta1.BaseAccount";
const String vestingAccountType =
    "/cosmos.vesting.v1beta1.ContinuousVestingAccount";
const String evmosAccountType = "/ethermint.types.v1.EthAccount";

class CosmosLcdService {
  // get Tokens
  static Future<Balance> getBalanceOfAddress({
    required final String lcdAddr,
    required final String accAddr,
    final String paginationKey = "",
    Balance? balance,
  }) async {
    try {
      Uri url;

      final Chain? chain = getChainFromWalletAddress(accAddr);
      if (chain == Chain.evmos || chain == Chain.iris || chain == Chain.regen) {
        url = Uri.parse("$lcdAddr/cosmos/bank/v1beta1/balances/$accAddr");
        final Map<String, dynamic> queryParams = {};

        /// [TESTING] - must be commented out
        // queryParams["pagination.limit"] = "1";

        if (paginationKey.isNotEmpty) {
          queryParams["pagination.key"] = paginationKey;
        }
        url = url.replace(queryParameters: queryParams);
      } else {
        final lcdUri = Uri.parse(lcdAddr);
        url = lcdUri.replace(path: lcdUri.path + "/bank/balances/$accAddr");
      }

      final res = await http.get(url);
      if (res.statusCode != 200) {
        throw HttpException(
            "returned status code ${res.statusCode}: ${res.body}");
      }

      final currentBalance =
          balanceFromMap(res.body, url.toString().contains("v1beta1"));
      if (balance == null) {
        balance = currentBalance;
      } else {
        balance.result.addAll(currentBalance.result);
      }

      final String? nextPaginationKey =
          ((jsonDecode(res.body) as Map<String, dynamic>)["pagination"]
              as Map<String, dynamic>?)?["next_key"];

      if (nextPaginationKey != null && nextPaginationKey.isNotEmpty) {
        return getBalanceOfAddress(
          lcdAddr: lcdAddr,
          accAddr: accAddr,
          paginationKey: nextPaginationKey,
          balance: balance,
        );
      } else {
        return balance;
      }
    } catch (e, s) {
      rlogError(error: e, stackTrace: s, prefix: "getBalanceOfAddress");
      rethrow;
    }
  }

  // get Account Number
  static Future<GenericAccount> getAccount(
      String lcdAddr, String accAddr) async {
    Uri url;

    final lcdUri = Uri.parse(lcdAddr);
    url = lcdUri.replace(
        path: lcdUri.path + "/cosmos/auth/v1beta1/accounts/$accAddr");

    var res = await http.get(url);

    if (res.statusCode != 200) {
      throw HttpException(
          "returned status code ${res.statusCode}: ${res.body}");
    }
    debugPrint(res.body);
    final minAccResp = minimalAccountRespFromJson(res.body);

    switch (minAccResp.account.type) {
      case baseAccountType:
        return genericAccountFromBaseAccount(res.body);
      case vestingAccountType:
        return genericAccountFromVestingAccount(res.body);
      case evmosAccountType:
        return genericAccountFromEvmosAccount(res.body);
      default:
        throw Exception("Unsupported account type: ${minAccResp.account.type}");
    }
  }

  static GenericAccount genericAccountFromBaseAccount(String json) {
    final acc = accountFromMap(json);
    return GenericAccount(
        accountNumber: acc.account.accountNumber,
        sequence: acc.account.sequence,
        type: acc.account.type);
  }

  static GenericAccount genericAccountFromVestingAccount(String json) {
    final acc = vestingAccountRespFromJson(json);
    return GenericAccount(
        accountNumber: acc.account.baseVestingAccount.baseAccount.accountNumber,
        sequence: acc.account.baseVestingAccount.baseAccount.sequence,
        type: acc.account.type);
  }

  static GenericAccount genericAccountFromEvmosAccount(String json) {
    final acc = evmosAccountFromJson(json);
    return GenericAccount(
        accountNumber: acc.account.baseAccount.accountNumber,
        sequence: acc.account.baseAccount.sequence,
        type: acc.account.type);
  }

  static Future<DenomTraceResp> getDenomTraceLegacy(
      String hash, String lcdAddr) async {
    const path = "/ibc/applications/transfer/v1beta1/denom_traces/";
    return _getDenomTraceFromPath(hash, lcdAddr, path);
  }

  static Future<DenomTraceResp> getDenomTrace(
      String hash, String lcdAddr) async {
    const path = "/ibc/apps/transfer/v1/denom_traces/";
    return _getDenomTraceFromPath(hash, lcdAddr, path);
  }

  static Future<DenomTraceResp> _getDenomTraceFromPath(
      String hash, String lcdAddr, String path) async {
    final url = Uri.parse(lcdAddr + path + hash);
    final res = await http.get(url);

    if (res.statusCode == 404) {
      throw Exception("Could'nt find denom trace for hash $hash");
    }

    if (res.statusCode != 200) {
      final errorRes = denomTraceErrRespFromJson(res.body);
      throw Exception("${errorRes.code}: ${errorRes.message}");
    }

    return denomTraceRespFromJson(res.body);
  }
}

class GenericAccount {
  final String accountNumber;
  final String sequence;
  final String type;

  GenericAccount(
      {required this.accountNumber,
      required this.sequence,
      required this.type});
}
