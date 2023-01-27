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

const msgTransferTypeAmino = "cosmos-sdk/MsgTransfer";
const msgTransferType = "/ibc.applications.transfer.v1.MsgTransfer";

@JS()
@anonymous
class IbcTransferMsgAmino {
  external factory IbcTransferMsgAmino({
    required source_port,
    required source_channel,
    required token,
    required sender,
    required receiver,
    required timeout_height,
  });

  external String source_port;
  external String source_channel;
  external Token token;
  external String sender;
  external String receiver;
  external TimeoutHeight timeout_height;
  // ignore: todo
  // external String timeoutTimestamp; //TODO: Check if timeout timestamp is required
}

@JS()
@anonymous
class TimeoutHeight {
  external factory TimeoutHeight({
    revision_number,
    required revision_height,
  });

  external String? revision_number;
  external String revision_height;
}

@JS()
@anonymous
class Token {
  external factory Token({
    required denom,
    required amount,
  });

  external String denom;
  external String amount;
}
