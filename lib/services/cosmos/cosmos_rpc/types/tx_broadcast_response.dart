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
//     final txBroadcastResponse = txBroadcastResponseFromJson(jsonString);

import 'dart:convert';

TxBroadcastResponse txBroadcastResponseFromJson(String str) =>
    TxBroadcastResponse.fromJson(json.decode(str));

String txBroadcastResponseToJson(TxBroadcastResponse data) =>
    json.encode(data.toJson());

class TxBroadcastResponse {
  TxBroadcastResponse({
    required this.jsonrpc,
    required this.id,
    required this.error,
    required this.result,
  });

  final String jsonrpc;
  final int id;
  final Error? error;
  final Result? result;

  factory TxBroadcastResponse.fromJson(Map<String, dynamic> json) =>
      TxBroadcastResponse(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "error": error == null ? null : error!.toJson(),
        "result": result == null ? null : result!.toJson(),
      };
}

class Error {
  Error({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final String data;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}

class Result {
  Result({
    required this.code,
    required this.data,
    required this.log,
    required this.codespace,
    required this.hash,
  });

  final int code;
  final String data;
  final String log;
  final String codespace;
  final String hash;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        data: json["data"],
        log: json["log"],
        codespace: json["codespace"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "log": log,
        "codespace": codespace,
        "hash": hash,
      };
}
