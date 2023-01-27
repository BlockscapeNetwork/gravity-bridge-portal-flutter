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
//     final balance = balanceFromMap(jsonString);

import 'dart:convert';

Balance balanceFromMap(String str, [bool v1Beta1 = false]) =>
    Balance.fromMap(json.decode(str), v1Beta1);

String balanceToMap(Balance data) => json.encode(data.toMap());

class Balance {
  Balance({
    required this.height,
    required this.result,
  });

  String height;
  List<Result> result;

  factory Balance.fromMap(Map<String, dynamic> json, [bool v1Beta1 = false]) {
    if (v1Beta1) {
      return Balance(
          height: "",
          result: List<Result>.from(
              json["balances"].map((x) => Result.fromMap(x))));
    } else {
      return Balance(
        height: json["height"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );
    }
  }

  Map<String, dynamic> toMap() => {
        "height": height,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };

  Map<String, String> toDenomAmountMap() {
    Map<String, String> m = {};
    for (var i in result) {
      m[i.denom] = i.amount;
    }
    return m;
  }
}

class Result {
  Result({
    required this.denom,
    required this.amount,
  });

  String denom;
  String amount;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        denom: json["denom"],
        amount: json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "denom": denom,
        "amount": amount,
      };
}
