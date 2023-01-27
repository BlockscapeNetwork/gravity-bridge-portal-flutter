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

// ignore_for_file: non_constant_identifier_names

import 'package:js/js.dart';
import 'dart:convert';

const msgCancelSendToEthTypeAmino = "gravity/MsgCancelSendToEth";
const msgCancelSendToEthType = "/gravity.v1.MsgCancelSendToEth";

@JS()
@anonymous
class CancelSendToEthMsgAmino {
  external String transaction_id;
  external String sender;

  external factory CancelSendToEthMsgAmino({
    required String transaction_id,
    required String sender,
  });
}

CancelSendToEthMsg cancelSendToEthMsgFromJson(String str) =>
    CancelSendToEthMsg.fromJson(json.decode(str));

String cancelSendToEthMsgToJson(CancelSendToEthMsg data) =>
    json.encode(data.toJson());

class CancelSendToEthMsg {
  CancelSendToEthMsg({
    required this.transactionId,
    required this.sender,
  });

  final String transactionId;
  final String sender;

  factory CancelSendToEthMsg.fromJson(Map<String, dynamic> json) =>
      CancelSendToEthMsg(
        transactionId: json["transactionId"],
        sender: json["sender"],
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "sender": sender,
      };
}
