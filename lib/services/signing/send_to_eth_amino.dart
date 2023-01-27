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

const msgSendToEthTypeAmino = "gravity/MsgSendToEth";
const msgSendToEthType = "/gravity.v1.MsgSendToEth";

@JS()
@anonymous
class SendToEthMsgAmino {
  external String sender;
  external String eth_dest;
  external AmountAmino amount;
  external AmountAmino bridge_fee;
  external AmountAmino chain_fee;

  external factory SendToEthMsgAmino({
    required String sender,
    required String eth_dest,
    required AmountAmino amount,
    required AmountAmino bridge_fee,
    required AmountAmino chain_fee,
  });
}

@JS()
@anonymous
class AmountAmino {
  external String denom;
  external String amount;

  external factory AmountAmino({
    required String denom,
    required String amount,
  });
}
