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
//     final denomTraceResp = denomTraceRespFromJson(jsonString);

import 'dart:convert';

DenomTraceResp denomTraceRespFromJson(String str) =>
    DenomTraceResp.fromJson(json.decode(str));

String denomTraceRespToJson(DenomTraceResp data) => json.encode(data.toJson());

class DenomTraceResp {
  DenomTraceResp({
    required this.denomTrace,
  });

  final DenomTrace denomTrace;

  factory DenomTraceResp.fromJson(Map<String, dynamic> json) => DenomTraceResp(
        denomTrace: DenomTrace.fromJson(json["denom_trace"]),
      );

  Map<String, dynamic> toJson() => {
        "denom_trace": denomTrace.toJson(),
      };
}

class DenomTrace {
  DenomTrace({
    required this.path,
    required this.baseDenom,
  });

  final String path;
  final String baseDenom;

  factory DenomTrace.fromJson(Map<String, dynamic> json) => DenomTrace(
        path: json["path"],
        baseDenom: json["base_denom"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "base_denom": baseDenom,
      };
}

DenomTraceErrResp denomTraceErrRespFromJson(String str) =>
    DenomTraceErrResp.fromJson(json.decode(str));

String denomTraceErrRespToJson(DenomTraceErrResp data) =>
    json.encode(data.toJson());

class DenomTraceErrResp {
  DenomTraceErrResp({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  factory DenomTraceErrResp.fromJson(Map<String, dynamic> json) =>
      DenomTraceErrResp(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
