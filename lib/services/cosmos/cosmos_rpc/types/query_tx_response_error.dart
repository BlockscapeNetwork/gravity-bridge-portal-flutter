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
//     final queryTxResponseError = queryTxResponseErrorFromMap(jsonString);

import 'dart:convert';

QueryTxResponseError queryTxResponseErrorFromMap(String str) =>
    QueryTxResponseError.fromMap(json.decode(str));

String queryTxResponseErrorToMap(QueryTxResponseError data) =>
    json.encode(data.toMap());

class QueryTxResponseError {
  QueryTxResponseError({
    required this.jsonrpc,
    required this.id,
    required this.error,
  });

  String jsonrpc;
  int id;
  Error error;

  factory QueryTxResponseError.fromMap(Map<String, dynamic> json) =>
      QueryTxResponseError(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        error: Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "error": error.toMap(),
      };
}

class Error {
  Error({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  String data;

  factory Error.fromMap(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
