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
//     final rpcrequest = rpcrequestFromMap(jsonString);

import 'dart:convert';

RpcRequest rpcRequestFromMap(String str) =>
    RpcRequest.fromMap(json.decode(str));

String rpcRequestToMap(RpcRequest data) => json.encode(data.toMap());

class RpcRequest {
  RpcRequest({
    required this.jsonrpc,
    required this.id,
    required this.params,
    required this.method,
  });

  String jsonrpc;
  int id;
  Params params;
  String method;

  factory RpcRequest.fromMap(Map<String, dynamic> json) => RpcRequest(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        params: Params.fromMap(json["params"]),
        method: json["method"],
      );

  Map<String, dynamic> toMap() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "params": params.toMap(),
        "method": method,
      };
}

class Params {
  Params({
    required this.tx,
  });

  String tx;

  factory Params.fromMap(Map<String, dynamic> json) => Params(
        tx: json["tx"],
      );

  Map<String, dynamic> toMap() => {
        "tx": tx,
      };
}
