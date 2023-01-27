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

import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';
import 'package:gravity_bridge_flutter/services/signing/cancel_send_to_eth_amino.dart';
import 'package:gravity_bridge_flutter/services/signing/ibc_transfer_amino.dart';
import 'package:gravity_bridge_flutter/services/signing/send_to_eth_amino.dart';

String stdSignDocToAminoJson(StdSignDoc ssd) {
  ssd.account_number;
  ssd.chain_id;
  ssd.fee;
  ssd.memo;
  ssd.msgs;
  ssd.sequence;

  String msgs = '[';
  for (var i = 0; i < ssd.msgs.length; i++) {
    if (i > 0) {
      msgs += ',';
    }
    msgs += _baseMsgToAminoJson(ssd.msgs[i]);
  }
  msgs += ']';

  return '{"account_number":"${ssd.account_number}","chain_id":"${ssd.chain_id}","fee":${_stdFeeToAminoJson(ssd.fee)},"memo":"${ssd.memo}","msgs":$msgs,"sequence":"${ssd.sequence}"}';
}

String _baseMsgToAminoJson(BaseMsg msg) {
  String msgJson;
  switch (msg.type) {
    case msgCancelSendToEthTypeAmino:
      msgJson = _msgCancelSendToToAminoJson(msg.value);
      break;
    case msgTransferTypeAmino:
      msgJson = _msgTransferToAminoJson(msg.value);
      break;
    case msgSendToEthTypeAmino:
      msgJson = _msgSendToEthToAminoJson(msg.value);
      break;
    default:
      throw UnsupportedMessageTypeException(msg.type);
  }

  return '{"type":"${msg.type}","value":$msgJson}';
}

String _stdFeeToAminoJson(StdFee fee) {
  String fees = '[';
  for (var i = 0; i < fee.amount.length; i++) {
    if (i > 0) {
      fees += ',';
    }
    fees += _coinToAminoJson(fee.amount[i]);
  }
  fees += ']';
  return '{"amount":$fees,"gas":"${fee.gas}"}';
}

String _coinToAminoJson(Coin c) {
  return '{"amount":"${c.amount}","denom":"${c.denom}"}';
}

String _msgTransferToAminoJson(IbcTransferMsgAmino msg) {
  String json = '{"receiver":"${msg.receiver}",';
  json +=
      '"sender":"${msg.sender}","source_channel":"${msg.source_channel}","source_port":"${msg.source_port}",';
  json +=
      '"timeout_height":${_timeoutHeightToAminoJson(msg.timeout_height)},"token":${_tokenToAminoJson(msg.token)}}';
  return json;
}

String _msgCancelSendToToAminoJson(CancelSendToEthMsgAmino msg) {
  return '{"sender":"${msg.sender}","transaction_id":"${msg.transaction_id}"}';
}

String _msgSendToEthToAminoJson(SendToEthMsgAmino msg) {
  return '{"amount":${_amountToAminoJson(msg.amount)},"bridge_fee":${_amountToAminoJson(msg.bridge_fee)},"eth_dest":"${msg.eth_dest}","sender":"${msg.sender}"}';
}

String _amountToAminoJson(AmountAmino a) {
  return '{"amount":"${a.amount}","denom":"${a.denom}"}';
}

String _timeoutHeightToAminoJson(TimeoutHeight th) {
  String json = '{"revision_height":"${th.revision_height}"';

  if (th.revision_number != null) {
    json += ',"revision_number":"${th.revision_number}"';
  }

  json += '}';
  return json;
}

String _tokenToAminoJson(Token tk) {
  return '{"amount":"${tk.amount}","denom":"${tk.denom}"}';
}

class UnsupportedMessageTypeException implements Exception {
  String type;

  UnsupportedMessageTypeException(this.type);

  @override
  String toString() {
    return "message type $type is not supported for native browser ledger signing";
  }
}
