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

import '../generated/l10n.dart';

class BlockchainException implements Exception {
  final String message;
  BlockchainException(this.message);

  @override
  String toString() => message;
}

class InvalidNumberException implements Exception {
  final String message;
  InvalidNumberException(this.message);

  @override
  String toString() {
    return message;
  }
}

class MissingExtensionException implements Exception {
  final String extensionName;
  MissingExtensionException(this.extensionName);

  @override
  String toString() {
    return S.current.MISSING_EXTENSION(extensionName);
  }
}

/// There are not enough funds in the wallet to complete action
class InsufficientFundsException implements Exception {
  final Object? originalError;
  InsufficientFundsException(this.originalError);
}

/// User rejected the request (clicked "Reject" on the Wallet-popup)
class UserRejectedRequestException implements Exception {
  final Object? originalError;
  UserRejectedRequestException(this.originalError);
}

class MetamaskLoginAlreadyUnderwayException implements Exception {
  final Object? originalError;
  MetamaskLoginAlreadyUnderwayException(this.originalError);
}
