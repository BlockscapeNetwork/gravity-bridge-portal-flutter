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

// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/msgs.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/ibc/applications/transfer/v1/tx.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/ibc/core/client/v1/client.pb.dart';
import 'package:gravity_bridge_flutter/services/keplr/keplr.dart' as keplrJS;

import '../../generated/proto/cosmos/base/v1beta1/coin.pb.dart';
import 'cancel_send_to_eth_amino.dart';
import 'ibc_transfer_amino.dart';
import 'send_to_eth_amino.dart';
import 'package:fixnum/fixnum.dart';

dynamic fromAmino(keplrJS.BaseMsg msg) {
  debugPrint(keplrJS.stringify(msg));
  switch (msg.type) {
    case msgCancelSendToEthTypeAmino:
      final cancelMsg = msg.value as CancelSendToEthMsgAmino;
      //return
      var m = MsgCancelSendToEth(
          transactionId: Int64.parseInt(cancelMsg.transaction_id),
          sender: cancelMsg.sender);
      return m.writeToBuffer();

    case msgSendToEthTypeAmino:
      final sendMsg = msg.value as SendToEthMsgAmino;
      final m = MsgSendToEth(
          sender: sendMsg.sender,
          ethDest: sendMsg.eth_dest,
          amount:
              Coin(amount: sendMsg.amount.amount, denom: sendMsg.amount.denom),
          bridgeFee: Coin(
              amount: sendMsg.bridge_fee.amount,
              denom: sendMsg.bridge_fee.denom),
          chainFee: Coin(amount: sendMsg.chain_fee.amount, denom: sendMsg.chain_fee.denom));
      return m.writeToBuffer();

    case msgTransferTypeAmino:
      final transferMsg = msg.value as IbcTransferMsgAmino;
      final m = MsgTransfer(
          receiver: transferMsg.receiver,
          sender: transferMsg.sender,
          sourceChannel: transferMsg.source_channel,
          sourcePort: transferMsg.source_port,
          timeoutHeight: Height(
              revisionHeight:
                  Int64.parseInt(transferMsg.timeout_height.revision_height),
              revisionNumber: Int64.parseInt(
                  transferMsg.timeout_height.revision_number ??
                      "0")), // a 0 value is not signed
          //and therefore not part of the amino message, but needs to be included in the proto message
          token: Coin(
              amount: transferMsg.token.amount,
              denom: transferMsg.token.denom));
      return m.writeToBuffer();
    default:
      throw Exception("unknown message type: ${msg.type}");
  }
}

String aminoTypeToProto(String aminoType) {
  switch (aminoType) {
    case msgSendToEthTypeAmino:
      return msgSendToEthType;
    case msgCancelSendToEthTypeAmino:
      return msgCancelSendToEthType;
    case msgTransferTypeAmino:
      return msgTransferType;
    default:
      return "unrecognized amino type";
  }
}
