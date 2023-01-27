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

import 'package:fixnum/fixnum.dart';
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/proto/cosmos/base/abci/v1beta1/abci.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/cosmos/tx/v1beta1/service.pbgrpc.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/msgs.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/pool.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/query.pbgrpc.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:grpc/grpc_web.dart';
import 'package:http/http.dart' as http;

import '../generated/proto/gravity/v1/batch.pb.dart';

QueryClient? _gravityQueryClient;
ServiceClient? _cosmosTxClient;

class GravityService {
  // private constructor
  GravityService._() {
    _ensureClients();
  }

  static final GravityService _instance = GravityService._();
  factory GravityService() => _instance;

  void _ensureClients() {
    _gravityQueryClient ??=
        QueryClient(GrpcWebClientChannel.xhr(Uri.parse(Config.keplr.webGRPC)));
    _cosmosTxClient ??= ServiceClient(
        GrpcWebClientChannel.xhr(Uri.parse(Config.keplr.webGRPC)));
  }

  /// Get Transaction ID by hash from the originating sendToEth Tx.
  /// The Transaction ID is used to  match the Transactions.
  Future<Int64> getTransactionIdByTxHash(String txHash) async {
    final txRes = await _getTx(txHash);
    final outgoingTxEvent = txRes.events
        .firstWhere((event) => event.type == "gravity.v1.EventOutgoingTxId");

    final txIdAttribute = outgoingTxEvent.attributes
        .firstWhere((attribute) => utf8.decode(attribute.key) == "tx_id");

    // value is stored as integer with surrounding quotation marks, which we have to remove first
    return Int64.parseInt(
        utf8.decode(txIdAttribute.value).replaceAll("\"", ""));
  }

  Future<TxResponse> _getTx(String txHash) async {
    final tx = await _cosmosTxClient!.getTx(GetTxRequest(hash: txHash));
    if (tx.txResponse.code != 0) {
      throw Exception("the transaction has an error");
    }
    return tx.txResponse;
  }

  /// Will check bridge transactions of a wallet which aren't completed yet.
  /// Return value contains Lists of transactions that have been batched but not yet relayed,
  /// as well as transactions that have not been batched yet.
  Future<QueryPendingSendToEthResponse> checkBridgeTransactionsOfWallet(
      String walletAddr) async {
    final pendingSendToEth = await _gravityQueryClient!
        .getPendingSendToEth(QueryPendingSendToEth(senderAddress: walletAddr));

    return pendingSendToEth;
  }

  /// Get outstanding fees for yet unbatched transactions
  Future<List<BatchFees>> getBatchFees() async {
    final batchFees =
        await _gravityQueryClient!.batchFees(QueryBatchFeeRequest());
    return batchFees.batchFees;
  }

  /// return information about a bridgeToken by contract address.
  /// Works for tokens with cosmos origin, as well as tokens with ethereum origin
  Future<TokenData> getGravityTokenData(String contract) async {
    final denom = await _gravityQueryClient!
        .eRC20ToDenom(QueryERC20ToDenomRequest(erc20: contract));

    TokenOrigin origin;
    if (denom.cosmosOriginated) {
      origin = TokenOrigin.cosmos;
    } else {
      origin = TokenOrigin.ethereum;
    }

    return TokenData(
        origin: origin, erc20Contract: contract, denom: denom.denom);
  }

  Future<String> getErc20AdressForDenom(final String gravDenom) async {
    String erc20Addr = "";
    try {
      final resp = await _gravityQueryClient!
          .denomToERC20(QueryDenomToERC20Request(denom: gravDenom));
      erc20Addr = resp.erc20;
    } catch (e) {
      /// [gravDenom] is not from a ERC20-token
      // dlogError(error: e, prefix: "getErc20AdressForDenom");
    }
    return erc20Addr;
  }

  Future<List<PendingTokenTransfers>> getPendingTokenTransfers() async {
    final fees = await getBatchFees();
    final pendingTransfers = fees.map((f) async {
      final data = await getGravityTokenData(f.token);
      return PendingTokenTransfers(
          origin: data.origin,
          erc20Contract: f.token,
          denom: data.denom,
          txCount: f.txCount,
          totalFees: BigInt.parse(f.totalFees));
    });

    return await Future.wait(pendingTransfers);
  }

  Future<List<OutgoingTxBatch>> getUnrelayedBatches() async {
    final outgoingBatchesResponse = await _gravityQueryClient!
        .outgoingTxBatches(QueryOutgoingTxBatchesRequest());
    dlog("Unrelayed-Batches: ["
        "${outgoingBatchesResponse.batches.map((e) => "{ $e }").join(", ")}"
        "]");
    return outgoingBatchesResponse.batches;
  }

  Future<List<MsgConfirmBatch>> getBatchConfirmationsFromOutgoingTxBatch(
      OutgoingTxBatch txBatch) {
    return getBatchConfirmation(txBatch.batchNonce, txBatch.tokenContract);
  }

  Future<List<MsgConfirmBatch>> getBatchConfirmation(
      Int64 nonce, String contract) async {
    final batchConfirms = await _gravityQueryClient!.batchConfirms(
        QueryBatchConfirmsRequest(nonce: nonce, contractAddress: contract));
    return batchConfirms.confirms;
  }

  Future<String> getGravityBlockTimestamp(int blockHeight) async {
    final String gravityRpcUrl = Config.keplr.rpc;
    const String path = "/block?height=";
    var url = Uri.parse(gravityRpcUrl + path + blockHeight.toString());
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return "";
    }
    final String gravityTimestamp =
        json.decode(response.body)["result"]["block"]["header"]["time"];
    return gravityTimestamp;
  }

  Future<SupplyInfo?> getGravityChainSupplyInfo() async {
    const String gravityChainUrl = Constants.gravityChainUrl;
    const String path = "/supply_info";
    SupplyInfo? ret;

    try {
      var url = Uri.parse(gravityChainUrl + path);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        ret = SupplyInfo(
          totalLiquidSupply: json.decode(response.body)["total_liquid_supply"],
          totalLiquidBalances:
              json.decode(response.body)["total_liquid_balances"],
          totalUnclaimedRewards:
              json.decode(response.body)["total_unclaimed_rewards"],
          totalNonvestingStaked:
              json.decode(response.body)["total_nonvesting_staked"],
          totalVesting: json.decode(response.body)["total_vesting"],
          totalVestingStaked:
              json.decode(response.body)["total_vesting_staked"],
          totalVested: json.decode(response.body)["total_vested"],
        );
      }
    } catch (e) {
      rlogError(error: e, prefix: "getGravityChainSupplyInfo");
    }
    return ret;
  }

  Future<VolumeInfo?> getGravityChainVolumeInfo() async {
    const String gravityChainUrl = Constants.gravityChainUrl;
    const String path = "/bridge_volume";
    var url = Uri.parse(gravityChainUrl + path);
    VolumeInfo? res;
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        res = VolumeInfo(
          dailyVolume: json.decode(response.body)["daily_volume"].toString(),
          dailyInflow: json.decode(response.body)["daily_inflow"].toString(),
          dailyOutflow: json.decode(response.body)["daily_outflow"].toString(),
          weeklyVolume: json.decode(response.body)["weekly_volume"].toString(),
          weeklyInflow: json.decode(response.body)["weekly_inflow"].toString(),
          weeklyOutflow:
              json.decode(response.body)["weekly_outflow"].toString(),
        );
      }
    } catch (e) {
      rlogError(error: e, prefix: "getGravityChainVolumeInfo");
    }
    return res;
  }

  Future<List<TransactionQueue>> getGravityChainTransactionQueueInfo() async {
    const String gravityChainUrl = Constants.gravityChainUrl;
    const String path = "/gravity_bridge_info";
    var url = Uri.parse(gravityChainUrl + path);
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    List<TransactionQueue> transactionQueueList = [];
    for (var i = 0; i < json.decode(response.body)["pending_tx"].length; ++i) {
      var pendingTx = json.decode(response.body)["pending_tx"][i];
      transactionQueueList.add(
        TransactionQueue(
          tokenContractAddress: pendingTx["token"].toString(),
          totalFees: pendingTx["total_fees"].toString(),
          txCount: pendingTx["tx_count"].toString(),
        ),
      );
    }
    return transactionQueueList;
  }
}

enum TokenOrigin {
  cosmos,
  ethereum,
}

class TokenData {
  TokenOrigin origin;
  String erc20Contract;
  String denom;

  TokenData(
      {required this.origin, required this.erc20Contract, required this.denom});
}

class PendingTokenTransfers {
  TokenOrigin origin;
  String erc20Contract;
  String denom;
  Int64 txCount;
  BigInt totalFees;

  PendingTokenTransfers(
      {required this.origin,
      required this.erc20Contract,
      required this.denom,
      required this.txCount,
      required this.totalFees});
}

class SupplyInfo {
  String totalLiquidSupply;
  String totalLiquidBalances;
  String totalUnclaimedRewards;
  String totalNonvestingStaked;
  String totalVesting;
  String totalVestingStaked;
  String totalVested;

  SupplyInfo({
    required this.totalLiquidSupply,
    required this.totalLiquidBalances,
    required this.totalUnclaimedRewards,
    required this.totalNonvestingStaked,
    required this.totalVesting,
    required this.totalVestingStaked,
    required this.totalVested,
  });
}

class VolumeInfo {
  String dailyVolume;
  String dailyInflow;
  String dailyOutflow;
  String weeklyVolume;
  String weeklyInflow;
  String weeklyOutflow;

  VolumeInfo({
    required this.dailyVolume,
    required this.dailyInflow,
    required this.dailyOutflow,
    required this.weeklyVolume,
    required this.weeklyInflow,
    required this.weeklyOutflow,
  });
}

class TransactionQueue {
  String tokenContractAddress;
  String totalFees;
  String txCount;

  TransactionQueue({
    required this.tokenContractAddress,
    required this.totalFees,
    required this.txCount,
  });
}
