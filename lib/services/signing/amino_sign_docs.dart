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

import 'package:fixnum/fixnum.dart';

import '../chain_configs/chain_configs.dart';
import '../chain_info_service.dart';
import '../keplr/keplr.dart';
import 'cancel_send_to_eth_amino.dart';
import 'ibc_transfer_amino.dart';
import 'send_to_eth_amino.dart';

Future<StdSignDoc> createIbcSignDocAmino(
  String fromAddress,
  String toAddress,
  String transferAmount,
  String transferDenom,
  String accountNumber,
  String sequence,
  String sourceChannel,
  String sourcePort,
  String sourceChainID,
  Chain destinationChain,
) async {
  final chainStatus = await ChainInfoService.getStatus(destinationChain);
  if (chainStatus.result.syncInfo.catchingUp) {
    throw Exception(
        "rpc node ${destinationChain.toString()} is currently syncing and can't be used");
  }

  final targetChainID = chainStatus.result.nodeInfo.network;
  final chainHeight = int.parse(chainStatus.result.syncInfo.latestBlockHeight);

  final msg = IbcTransferMsgAmino(
    source_port: sourcePort,
    source_channel: sourceChannel,
    token: Token(amount: transferAmount, denom: transferDenom),
    sender: fromAddress,
    receiver: toAddress,
    timeout_height:
        TimeoutHeight(revision_height: (chainHeight + 150).toRadixString(10)),
  );

  final revNumber = ChainInfoService.getVersionFromChainID(targetChainID)
      .version
      .toRadixString(10);
  // 0 must be excluded for signing, because the cosmos sdk ignores 0 values.
  if (revNumber != "0") {
    msg.timeout_height.revision_number = revNumber;
  }

  return StdSignDoc(
      chain_id: sourceChainID,
      account_number: accountNumber,
      sequence: sequence,
      msgs: [BaseMsg(type: msgTransferTypeAmino, value: msg)],
      fee: StdFee(amount: [], gas: "300000"),
      memo: "");
}

StdSignDoc createCancelSignDocAmino(String fromAddr, Int64 transactionID,
    String accountNumber, String sequence, String chainID) {
  final msg = CancelSendToEthMsgAmino(
      transaction_id: transactionID.toRadixString(10), sender: fromAddr);
  return StdSignDoc(
      account_number: accountNumber,
      chain_id: chainID,
      memo: "",
      sequence: sequence,
      msgs: [BaseMsg(type: msgCancelSendToEthTypeAmino, value: msg)],
      fee: StdFee(amount: [], gas: "300000"));
}

StdSignDoc createSendToEthSignDocAmino(
    String fromAddress,
    String toAddress,
    String transferAmount,
    String transferDenom,
    String bridgeFeeAmount,
    String chainFeeAmount,
    String accountNumber,
    String sequence,
    String chainID) {
  final msg = SendToEthMsgAmino(
    amount: AmountAmino(amount: transferAmount, denom: transferDenom),
    bridge_fee: AmountAmino(amount: bridgeFeeAmount, denom: transferDenom),
    chain_fee: AmountAmino(amount: chainFeeAmount, denom: transferDenom),
    eth_dest: toAddress,
    sender: fromAddress,
  );

  return StdSignDoc(
      chain_id: chainID,
      account_number: accountNumber,
      sequence: sequence,
      msgs: [BaseMsg(type: msgSendToEthTypeAmino, value: msg)],
      fee: StdFee(
        amount: [],
        gas: "300000",
      ),
      memo: "");
}
