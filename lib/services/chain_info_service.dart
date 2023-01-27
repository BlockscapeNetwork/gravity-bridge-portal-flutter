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
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import '../generated/l10n.dart';
import 'chain_configs/chain_configs.dart';

class ChainInfoService {
  static Future<Status> getStatus(Chain chain) async {
    final chainInfo = chainInfos[chain];
    if (chainInfo == null) {
      throw Exception("No chain info found for ${chain.toString()}");
    }

    final rpcAddr = chainInfo.rpc;

    final baseUri = Uri.parse(rpcAddr);
    final rpcStatusUri = baseUri.replace(path: baseUri.path + '/status');
    final statusResp = await http.get(rpcStatusUri);

    if (statusResp.statusCode != 200) {
      throw Exception(
          "Error connecting to rpc server ($rpcAddr): status code ${statusResp.statusCode}");
    }

    return statusFromJson(statusResp.body);
  }

  /// This function working status of a chain:
  /// - is it's rpc endpoint online?
  /// - is it's rpc endpoint active?
  static Future<Tuple2<bool, String>> isChainWorking(Chain chain) async {
    late final bool isWorking;
    late final String message;

    if (chain == Chain.ethereum) {
      throw Exception("RPC check for Ethereum chain is not neccessary");
    } else {
      final chainInfo = chainInfos[chain];
      if (chainInfo == null) {
        throw Exception("No ChainInfo for $chain");
      }
      if (chain == Chain.impacthub ||
          chain == Chain.shentu ||
          chain == Chain.fetchai ||
          chain == Chain.lum ||
          chain == Chain.bostrom ||
          chain == Chain.sifchain) {
        isWorking = false;
        message = S.current.CHAIN_RPC_URL_INACTIVE;
      } else {
        final String rpcUrl = chainInfo.rpc;
        final url = Uri.parse(rpcUrl);
        try {
          final response = await http.get(url);
          dlog(
              "Respose from $rpcUrl: ${response.statusCode}", "isChainWorking");
          if (response.statusCode != 200) {
            isWorking = false;
            message = S.current.CHAIN_RPC_URL_OFFLINE;
          } else {
            isWorking = true;
            message = S.current.CHAIN_RPC_URL_SUCCESS;
          }
        } on http.ClientException catch (e) {
          dlogError(
              message: "Respose from $rpcUrl",
              error: e,
              prefix: "isChainWorking");
          isWorking = false;
          message = S.current.CHAIN_RPC_URL_OFFLINE;
        }
      }
    }
    return Tuple2(isWorking, message);
  }

  // This function adapts the keplr wallet logic for versions
  static ChainVersion getVersionFromChainID(String chainID) {
    final li = chainID.lastIndexOf("-");
    if (li < 0) {
      return ChainVersion(chainID, 0);
    }

    final digitSubStr = chainID.substring(li + 1);
    final version = int.tryParse(digitSubStr);
    if (version != null) {
      return ChainVersion(chainID.substring(0, li), version);
    }
    return ChainVersion(chainID, 0);
  }
}

class ChainVersion {
  String identifier;
  int version;

  ChainVersion(this.identifier, this.version);
}

// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  final String jsonrpc;
  final int id;
  final Result result;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.nodeInfo,
    required this.syncInfo,
    required this.validatorInfo,
  });

  final NodeInfo nodeInfo;
  final SyncInfo syncInfo;
  final ValidatorInfo validatorInfo;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        nodeInfo: NodeInfo.fromJson(json["node_info"]),
        syncInfo: SyncInfo.fromJson(json["sync_info"]),
        validatorInfo: ValidatorInfo.fromJson(json["validator_info"]),
      );

  Map<String, dynamic> toJson() => {
        "node_info": nodeInfo.toJson(),
        "sync_info": syncInfo.toJson(),
        "validator_info": validatorInfo.toJson(),
      };
}

class NodeInfo {
  NodeInfo({
    required this.protocolVersion,
    required this.id,
    required this.listenAddr,
    required this.network,
    required this.version,
    required this.channels,
    required this.moniker,
    required this.other,
  });

  final ProtocolVersion protocolVersion;
  final String id;
  final String listenAddr;
  final String network;
  final String version;
  final String channels;
  final String moniker;
  final Other other;

  factory NodeInfo.fromJson(Map<String, dynamic> json) => NodeInfo(
        protocolVersion: ProtocolVersion.fromJson(json["protocol_version"]),
        id: json["id"],
        listenAddr: json["listen_addr"],
        network: json["network"],
        version: json["version"],
        channels: json["channels"],
        moniker: json["moniker"],
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "protocol_version": protocolVersion.toJson(),
        "id": id,
        "listen_addr": listenAddr,
        "network": network,
        "version": version,
        "channels": channels,
        "moniker": moniker,
        "other": other.toJson(),
      };
}

class Other {
  Other({
    required this.txIndex,
    required this.rpcAddress,
  });

  final String txIndex;
  final String rpcAddress;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        txIndex: json["tx_index"],
        rpcAddress: json["rpc_address"],
      );

  Map<String, dynamic> toJson() => {
        "tx_index": txIndex,
        "rpc_address": rpcAddress,
      };
}

class ProtocolVersion {
  ProtocolVersion({
    required this.p2P,
    required this.block,
    required this.app,
  });

  final String p2P;
  final String block;
  final String app;

  factory ProtocolVersion.fromJson(Map<String, dynamic> json) =>
      ProtocolVersion(
        p2P: json["p2p"],
        block: json["block"],
        app: json["app"],
      );

  Map<String, dynamic> toJson() => {
        "p2p": p2P,
        "block": block,
        "app": app,
      };
}

class SyncInfo {
  SyncInfo({
    required this.latestBlockHash,
    required this.latestAppHash,
    required this.latestBlockHeight,
    required this.latestBlockTime,
    required this.earliestBlockHash,
    required this.earliestAppHash,
    required this.earliestBlockHeight,
    required this.earliestBlockTime,
    required this.catchingUp,
  });

  final String latestBlockHash;
  final String latestAppHash;
  final String latestBlockHeight;
  final DateTime latestBlockTime;
  final String earliestBlockHash;
  final String earliestAppHash;
  final String earliestBlockHeight;
  final DateTime earliestBlockTime;
  final bool catchingUp;

  factory SyncInfo.fromJson(Map<String, dynamic> json) => SyncInfo(
        latestBlockHash: json["latest_block_hash"],
        latestAppHash: json["latest_app_hash"],
        latestBlockHeight: json["latest_block_height"],
        latestBlockTime: DateTime.parse(json["latest_block_time"]),
        earliestBlockHash: json["earliest_block_hash"],
        earliestAppHash: json["earliest_app_hash"],
        earliestBlockHeight: json["earliest_block_height"],
        earliestBlockTime: DateTime.parse(json["earliest_block_time"]),
        catchingUp: json["catching_up"],
      );

  Map<String, dynamic> toJson() => {
        "latest_block_hash": latestBlockHash,
        "latest_app_hash": latestAppHash,
        "latest_block_height": latestBlockHeight,
        "latest_block_time": latestBlockTime.toIso8601String(),
        "earliest_block_hash": earliestBlockHash,
        "earliest_app_hash": earliestAppHash,
        "earliest_block_height": earliestBlockHeight,
        "earliest_block_time": earliestBlockTime.toIso8601String(),
        "catching_up": catchingUp,
      };
}

class ValidatorInfo {
  ValidatorInfo({
    required this.address,
    required this.pubKey,
    required this.votingPower,
  });

  final String address;
  final PubKey pubKey;
  final String votingPower;

  factory ValidatorInfo.fromJson(Map<String, dynamic> json) => ValidatorInfo(
        address: json["address"],
        pubKey: PubKey.fromJson(json["pub_key"]),
        votingPower: json["voting_power"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "pub_key": pubKey.toJson(),
        "voting_power": votingPower,
      };
}

class PubKey {
  PubKey({
    required this.type,
    required this.value,
  });

  final String type;
  final String value;

  factory PubKey.fromJson(Map<String, dynamic> json) => PubKey(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
