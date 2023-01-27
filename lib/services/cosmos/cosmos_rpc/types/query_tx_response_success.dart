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

// To parse this JSON data, do
//
//     final queryTxResponseSuccess = queryTxResponseSuccessFromMap(jsonString);

import 'dart:convert';

QueryTxResponseSuccess queryTxResponseSuccessFromMap(String str) =>
    QueryTxResponseSuccess.fromMap(json.decode(str));

String queryTxResponseSuccessToMap(QueryTxResponseSuccess data) =>
    json.encode(data.toMap());

class QueryTxResponseSuccess {
  QueryTxResponseSuccess({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  String jsonrpc;
  int id;
  Result result;

  factory QueryTxResponseSuccess.fromMap(Map<String, dynamic> json) =>
      QueryTxResponseSuccess(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result.toMap(),
      };
}

class Result {
  Result({
    required this.hash,
    required this.height,
    required this.index,
    required this.txResult,
    required this.tx,
  });

  String hash;
  String height;
  int index;
  TxResult txResult;
  String tx;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        hash: json["hash"],
        height: json["height"],
        index: json["index"],
        txResult: TxResult.fromMap(json["tx_result"]),
        tx: json["tx"],
      );

  Map<String, dynamic> toMap() => {
        "hash": hash,
        "height": height,
        "index": index,
        "tx_result": txResult.toMap(),
        "tx": tx,
      };
}

class TxResult {
  TxResult({
    required this.code,
    required this.data,
    required this.log,
    required this.info,
    required this.gasWanted,
    required this.gasUsed,
    required this.events,
    required this.codespace,
  });

  int code;
  dynamic data;
  String log;
  String info;
  String gasWanted;
  String gasUsed;
  List<dynamic> events;
  String codespace;

  factory TxResult.fromMap(Map<String, dynamic> json) => TxResult(
        code: json["code"],
        data: json["data"],
        log: json["log"],
        info: json["info"],
        gasWanted: json["gas_wanted"],
        gasUsed: json["gas_used"],
        events: List<dynamic>.from(json["events"].map((x) => x)),
        codespace: json["codespace"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "data": data,
        "log": log,
        "info": info,
        "gas_wanted": gasWanted,
        "gas_used": gasUsed,
        "events": List<dynamic>.from(events.map((x) => x)),
        "codespace": codespace,
      };
}
