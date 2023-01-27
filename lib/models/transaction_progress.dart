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

abstract class TransactionProgress {}

class TransactionInitialValue extends TransactionProgress {}

/// Transaction was rejected by user, i.e clicked "Reject" in the pop-up
class TransactionRejectedByUser extends TransactionProgress {}

/// Transaction could not be created and no Hash was given, b/c of an Error.
class TransactionCreationError extends TransactionProgress {
  final String errorMessage;
  TransactionCreationError({required this.errorMessage});
}

/// Transaction was created successfully, i.e Hash was given.
class TransactionStarted extends TransactionProgress {
  final String hash;
  final String tokenContract;
  TransactionStarted(this.hash, this.tokenContract);
}

/// Transaction is being executed, i.e tokens are being transferred.
class TransactionInProgress extends TransactionProgress {
  final String hash;
  final String tokenContract;
  final String transactionIndex;
  TransactionInProgress(this.transactionIndex, this.hash, this.tokenContract);
}

/// Transaction status request threw an error.
class TransactionStatusError extends TransactionProgress {
  final String hash;
  final String errorMessage;
  TransactionStatusError(this.hash, this.errorMessage);
}

/// Transaction status request returned "completed", i.e tokens were transferred.
class TransactionComplete extends TransactionProgress {
  final String hash;
  TransactionComplete(this.hash);
}

/// Transaction status request returned "failed", i.e tokens could not be transferred.
class TransactionError extends TransactionProgress {
  final String hash;
  final String errorMessage;
  TransactionError(this.hash, this.errorMessage);
}
