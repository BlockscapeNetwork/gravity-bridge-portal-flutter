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

import '../../services/chain_configs/chain_configs.dart';

/*
enum TransferType {
  /// - ETH > Forward-Chains
  /// - IBC-Chains > GRAVITY
  metamask,

  /// - GRAVITY > ETH
  /// - GRAVITY > IBC-Chains
  keplr,
}
*/

enum WalletType {
  metamask,
  keplr,
  ledger,
}

enum TransferType {
  /// ETH > Forward-Chains (including GRA)
  eth2fwd,

  /// IBC-Chains > GRA
  ///
  ibc2gra,

  // <<>> opposite direction

  /// GRA > ETH
  gra2eth,

  /// GRA > IBC-Chains
  /// //0 fee
  gra2ibc;

  // toggle function
  TransferType getOpposite() {
    switch (this) {
      case eth2fwd:
        return TransferType.gra2eth;
      case ibc2gra:
        return TransferType.gra2ibc;
      case gra2eth:
        return TransferType.eth2fwd;
      case gra2ibc:
        return TransferType.ibc2gra;
      default:
        throw UnimplementedError();
    }
  }

  // returns a TransferType which fits [fromChain] and [toChain]
  factory TransferType.fromChains({
    required Chain fromChain,
    required Chain toChain,
  }) {
    late final TransferType transferType;
    if (fromChain == Chain.ethereum) {
      transferType = TransferType.eth2fwd;
    } else if (toChain == Chain.ethereum) {
      transferType = TransferType.gra2eth;
    } else if (fromChain != Chain.ethereum && fromChain != Chain.gravity) {
      transferType = TransferType.ibc2gra;
    } else /*if (fromChain == Chain.gravity &&
        toChain != Chain.ethereum &&
        toChain != Chain.gravity)*/
    {
      transferType = TransferType.gra2ibc;
    }
    return transferType;
  }
}
