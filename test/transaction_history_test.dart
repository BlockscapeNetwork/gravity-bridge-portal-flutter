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

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_bridge_flutter/models/enums/transaction_status.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';

/// This test must be run from the CLI with 'flutter test -r expanded --platform chrome test/transaction_history_test.dart'
void main() {
  test("construct remaining batch time string", () {
    var transaction = Transaction(
      id: "",
      amount: "1000000",
      fee: "2000000",
      fromAddress: "gravity1fe9nn5529tzlm0ttse3fu5we2jv86ulvukwcjz",
      toAddress: "0xa2b286a781233432204a573d6f40fbd2252cbbd4",
      statusUrl: "statusUrl",
      symbol: "symbol",
      iconUrl: "iconUrl",
      decimals: 6,
      tokenName: "tokenName",
      durationInHours: 12,
      status: TransactionStatus.preparing,
    );
    debugPrint(getRemainingBatchTimeString(transaction));

    transaction = transaction.copyWith(durationInHours: 12.01666666667);
    debugPrint(getRemainingBatchTimeString(transaction));

    transaction = transaction.copyWith(durationInHours: 12.1666666667);
    debugPrint(getRemainingBatchTimeString(transaction));

    transaction = transaction.copyWith(durationInHours: 12.1833333333);
    debugPrint(getRemainingBatchTimeString(transaction));

    transaction = transaction.copyWith(durationInHours: 12.5);
    debugPrint(getRemainingBatchTimeString(transaction));
  });
}
