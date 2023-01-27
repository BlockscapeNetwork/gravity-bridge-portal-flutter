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

import 'dart:io';

import 'package:alan/alan.dart';
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/common_query_tx_resp.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/query_tx_response_error.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/query_tx_response_success.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/tx_broadcast_response.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:http/http.dart' as http;

import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;

class CosmosRPCService {
  // get Tokens
  static Future<TxBroadcastResponse> broadcastTx(
      String rpcAddr, String bodyJson) async {
    final url = Uri.parse(rpcAddr);

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var res = await http.post(url, headers: headers, body: bodyJson);

    if (res.statusCode != 200) {
      throw HttpException(
          "returned status code ${res.statusCode}: ${res.body}");
    }

    return txBroadcastResponseFromJson(res.body);
  }

  //used to get the tx url
  static Uri rpcUrlFromHash(String? rpcAddr, String hash) {
    rpcAddr ??= Config.keplr.rpc;

    if (!hash.startsWith("0x")) {
      hash = "0x" + hash;
    }
    final params = {"hash": hash};

    Uri url;
    final lcdUri = Uri.parse(rpcAddr);
    url = lcdUri.replace(path: lcdUri.path + "/tx", queryParameters: params);

    return url;
  }

  static Future<CommonQueryTxResponse> queryTx(Uri uri) async {
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      final successRes = queryTxResponseSuccessFromMap(res.body);
      final msg =
          "Code ${successRes.result.txResult.code}: ${successRes.result.txResult.log}";
      const bool found = true;
      final bool success = successRes.result.txResult.code == 0;
      rlog("Status: 200, Found: $found, Success: $success, Url: $uri",
          "queryTx");
      return CommonQueryTxResponse(
          found, success, msg, successRes.result.height);
    } else if (res.statusCode == 500) {
      final errorRes = queryTxResponseErrorFromMap(res.body);
      rlogError(
          message: "Status: 500, Found: false, Url: $uri", prefix: "queryTx");
      return CommonQueryTxResponse(
          false, false, "tx not found yet: ${errorRes.error.message}", "");
    } else //if (res.statusCode != 200)
    {
      rlogError(
          message: "Status: ${res.statusCode}, Url: $uri", prefix: "queryTx");
      throw HttpException(
          "returned status code ${res.statusCode}: ${res.body}");
    }
  }

  static Future<Map<String, String>> getBalanceForAddress(
      String addr, String gRpcAddr) async {
    final networkInfo = NetworkInfo.fromSingleHost(
      bech32Hrp: 'cosmos',
      host: gRpcAddr,
    );
    final channel = networkInfo.gRPCChannel;
    final bankClient = bank.QueryClient(channel);

    final request = bank.QueryAllBalancesRequest(address: addr);
    final response = await bankClient.allBalances(request);

    Map<String, String> balances = {};
    for (var b in response.balances) {
      balances[b.denom] = b.amount;
    }
    return balances;
  }
}
