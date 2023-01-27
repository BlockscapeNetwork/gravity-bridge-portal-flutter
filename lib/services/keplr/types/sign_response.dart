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
//     final signResponse = signResponseFromMap(jsonString);
import 'dart:convert';

SignResponse signResponseFromMap(String str) =>
    SignResponse.fromMap(json.decode(str));

String signResponseToMap(SignResponse data) => json.encode(data.toMap());

class SignResponse {
  SignResponse({
    required this.signed,
    required this.signature,
  });

  Signed signed;
  Signature signature;

  factory SignResponse.fromMap(Map<String, dynamic> json) => SignResponse(
        signed: Signed.fromMap(json["signed"]),
        signature: Signature.fromMap(json["signature"]),
      );

  Map<String, dynamic> toMap() => {
        "signed": signed.toMap(),
        "signature": signature.toMap(),
      };
}

class Signature {
  Signature({
    required this.pubKey,
    required this.signature,
  });

  PubKey pubKey;
  String signature;

  factory Signature.fromMap(Map<String, dynamic> json) => Signature(
        pubKey: PubKey.fromMap(json["pub_key"]),
        signature: json["signature"],
      );

  Map<String, dynamic> toMap() => {
        "pub_key": pubKey.toMap(),
        "signature": signature,
      };
}

class PubKey {
  PubKey({
    required this.type,
    required this.value,
  });

  String type;
  String value;

  factory PubKey.fromMap(Map<String, dynamic> json) => PubKey(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "value": value,
      };
}

class Signed {
  Signed({
    required this.chainId,
    required this.accountNumber,
    required this.memo,
    required this.squence,
    required this.fee,
    required this.msgs,
  });

  String chainId;
  String accountNumber;
  String memo;
  String squence;
  Fee fee;
  List<Msg> msgs;

  factory Signed.fromMap(Map<String, dynamic> json) => Signed(
        chainId: json["chain_id"],
        accountNumber: json["account_number"],
        memo: json["memo"],
        squence: json["squence"],
        fee: Fee.fromMap(json["fee"]),
        msgs: List<Msg>.from(json["msgs"].map((x) => Msg.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "chain_id": chainId,
        "account_number": accountNumber,
        "memo": memo,
        "squence": squence,
        "fee": fee.toMap(),
        "msgs": List<dynamic>.from(msgs.map((x) => x.toMap())),
      };
}

class Fee {
  Fee({
    required this.gas,
    required this.amount,
  });

  String gas;
  List<Amount> amount;

  factory Fee.fromMap(Map<String, dynamic> json) => Fee(
        gas: json["gas"],
        amount: List<Amount>.from(json["amount"].map((x) => Amount.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "gas": gas,
        "amount": List<dynamic>.from(amount.map((x) => x.toMap())),
      };
}

class Amount {
  Amount({
    required this.denom,
    required this.amount,
  });

  String denom;
  String amount;

  factory Amount.fromMap(Map<String, dynamic> json) => Amount(
        denom: json["denom"],
        amount: json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "denom": denom,
        "amount": amount,
      };
}

class Msg {
  Msg({
    required this.type,
    required this.value,
  });

  String type;
  List<Value> value;

  factory Msg.fromMap(Map<String, dynamic> json) => Msg(
        type: json["type"],
        value: List<Value>.from(json["value"].map((x) => Value.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "value": List<dynamic>.from(value.map((x) => x.toMap())),
      };
}

class Value {
  Value({
    required this.sender,
    required this.ethDest,
    required this.amount,
    required this.bridgeFee,
  });

  String sender;
  String ethDest;
  Amount amount;
  Amount bridgeFee;

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        sender: json["sender"],
        ethDest: json["ethDest"],
        amount: Amount.fromMap(json["amount"]),
        bridgeFee: Amount.fromMap(json["bridgeFee"]),
      );

  Map<String, dynamic> toMap() => {
        "sender": sender,
        "ethDest": ethDest,
        "amount": amount.toMap(),
        "bridgeFee": bridgeFee.toMap(),
      };
}
