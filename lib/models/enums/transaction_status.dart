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

/// See also  [CommonQueryTxResponse]

enum TransactionStatus {
  /// Transaction is in the process of being constructed, and registered into the blockchain.
  /// For a Grav2Eth-transaction it means that it is unbatched.
  preparing,

  /// Transaction has been registered in a block, and is being executed, tokens have not been received yet.
  /// For a Grav2Eth-transaction it means that it is batched but not relayed
  pending,

  /// Tokens have been received.
  completed,

  /// Something went wrong:
  /// - E.g: Transaction did not include enough fees.
  failed,

  /// transaction was canceled (if it was cancelable, i.e transactions Gravity > ETH)
  canceled;

  factory TransactionStatus.fromIndex(final int index) {
    assert(TransactionStatus.values.length > index,
        "TransactionStatus.from() - $index > ${TransactionStatus.values.length}");
    return TransactionStatus.values.elementAt(index);
  }
}
