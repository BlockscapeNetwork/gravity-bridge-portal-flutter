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

class CommonQueryTxResponse {
  /// True: transaction is recognized by the blockchain (node?),
  /// so it was created successfully and registered into the blockchain.
  bool found;

  /// - True: Transaction completed succcessfully.
  /// - False: Transaction completed unsuccessfully, b/c e.g. a condition was not met (not enough fees), or an error happened in the chain somewhere.
  bool success;

  String message;

  String height;

  CommonQueryTxResponse(this.found, this.success, this.message, this.height);
}
