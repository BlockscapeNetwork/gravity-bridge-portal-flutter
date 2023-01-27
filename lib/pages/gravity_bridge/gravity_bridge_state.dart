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

import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/gravity_error.dart';
import 'package:gravity_bridge_flutter/models/enums/severity.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

class GravityBridgeState {
  final GravityError? error;
  final bool? loading;
  final bool? licenceAccepted;
  final bool isSupplyInfoWidgetVisible;
  final bool isVolumeInfoWidgetVisible;
  final bool isTransactionQueueWidgetVisible;
  final Chain fromChain;
  final Chain toChain;
  final String fromAddress;
  final String toAddress;
  final WalletType fromWalletType;
  final WalletType toWalletType;
  final bool isMetamaskCardConnected;
  final bool isKeplrCardConnected;
  final double tweenValue;
  final String ledgerErrorMessage;

  TransferType get transferType =>
      TransferType.fromChains(fromChain: fromChain, toChain: toChain);

  ForwardChain get forwardChain {
    switch (transferType) {
      case TransferType.eth2fwd:
      case TransferType.ibc2gra:
        return Config.keplr.forwardChains
            .firstWhere((e) => e.chainName == toChain);
      case TransferType.gra2eth:
      case TransferType.gra2ibc:
        return Config.keplr.forwardChains
            .firstWhere((e) => e.chainName == fromChain);
      default:
        throw UnimplementedError();
    }
  }

  IbcChain? get ibcChain {
    switch (transferType) {
      case TransferType.eth2fwd:
      case TransferType.gra2eth:
        return null;
      case TransferType.ibc2gra:
        return Config.keplr.ibcChains
            .firstWhere((e) => e.chainName == fromChain);
      case TransferType.gra2ibc:
        return Config.keplr.ibcChains.firstWhere((e) => e.chainName == toChain);
      default:
        throw UnimplementedError();
    }
  }

  String get fwdAddress {
    switch (transferType) {
      case TransferType.gra2ibc:
      case TransferType.gra2eth:
        return fromAddress;
      case TransferType.ibc2gra:
      case TransferType.eth2fwd:
        return toAddress;
    }
  }

  String get ibcOrEthAddress {
    switch (transferType) {
      case TransferType.ibc2gra:
      case TransferType.eth2fwd:
        return fromAddress;
      case TransferType.gra2ibc:
      case TransferType.gra2eth:
        return toAddress;
    }
  }

  bool get isMetamaskCardFirst =>
      transferType == TransferType.eth2fwd ||
      transferType == TransferType.ibc2gra;

  bool get isKeplrCardFirst =>
      transferType == TransferType.gra2eth ||
      transferType == TransferType.gra2ibc;

  Chain get metamaskCardChain {
    switch (transferType) {
      case TransferType.eth2fwd:
      case TransferType.ibc2gra:
        return fromChain;
      case TransferType.gra2ibc:
      case TransferType.gra2eth:
        return toChain;
    }
  }

  Chain get keplrCardChain {
    switch (transferType) {
      case TransferType.eth2fwd:
      case TransferType.ibc2gra:
        return toChain;
      case TransferType.gra2ibc:
      case TransferType.gra2eth:
        return fromChain;
    }
  }

  Tuple2<Severity, String>? get keplrCardValidation {
    if (keplrCardChain == Chain.canto) {
      if (isKeplrCardFirst) {
        return Tuple2(
            Severity.error, S.current.VALIDATOR_MESSAGE_TRANSFERS_FROM_CANTO);
      } else {
        return Tuple2(
            Severity.warning, S.current.VALIDATOR_MESSAGE_TRANSFERS_TO_CANTO);
      }
    } else {
      return null;
    }
  }

  Tuple2<Severity, String>? get metamaskCardValidation {
    if (isMetamaskCardFirst) {
      if (metamaskCardChain == Chain.canto) {
        return Tuple2(
            Severity.error, S.current.VALIDATOR_MESSAGE_TRANSFERS_FROM_CANTO);
      } else if (metamaskCardChain.isBetaInKeplr &&
          metamaskCardChain.feeUpdateDate.isNotEmpty) {
        return Tuple2(
          Severity.warning,
          S.current.FEE_UPDATE_ALERT(
            DateFormat('dd MMMM yyyy')
                .format(DateTime.parse(metamaskCardChain.feeUpdateDate)),
            metamaskCardChain.chainName,
          ),
        );
      }
    } else {
      if (metamaskCardChain == Chain.canto) {
        return Tuple2(
            Severity.warning, S.current.VALIDATOR_MESSAGE_TRANSFERS_TO_CANTO);
      }
    }
    return null;
  }

  GravityBridgeState({
    this.error,
    this.loading = false,
    this.licenceAccepted,
    this.isSupplyInfoWidgetVisible = false,
    this.isVolumeInfoWidgetVisible = false,
    this.isTransactionQueueWidgetVisible = false,
    this.fromChain = Chain.ethereum, // default fromChain
    this.toChain = Chain.gravity, // default toChain
    this.fromAddress = "",
    this.toAddress = "",
    this.fromWalletType = WalletType.metamask,
    this.toWalletType = WalletType.keplr,
    this.isMetamaskCardConnected = false,
    this.isKeplrCardConnected = false,
    this.tweenValue =
        0, // tween value is default to 0. it means first card is _MetamaskCard in gb select type widget
    this.ledgerErrorMessage = "",
  });

  GravityBridgeState copyWith({
    GravityError? error,
    bool? loading,
    bool? licenceAccepted,
    bool? isSupplyInfoWidgetVisible,
    bool? isVolumeInfoWidgetVisible,
    bool? isTransactionQueueWidgetVisible,
    Chain? fromChain,
    Chain? toChain,
    final String? fromAddress,
    final String? toAddress,
    WalletType? fromWalletType,
    WalletType? toWalletType,
    bool? isMetamaskCardConnected,
    bool? isKeplrCardConnected,
    final double? tweenValue,
    final String? ledgerErrorMessage,
  }) {
    return GravityBridgeState(
      error: error,
      loading: loading ?? this.loading,
      licenceAccepted: licenceAccepted ?? this.licenceAccepted,
      isSupplyInfoWidgetVisible:
          isSupplyInfoWidgetVisible ?? this.isSupplyInfoWidgetVisible,
      isVolumeInfoWidgetVisible:
          isVolumeInfoWidgetVisible ?? this.isVolumeInfoWidgetVisible,
      isTransactionQueueWidgetVisible: isTransactionQueueWidgetVisible ??
          this.isTransactionQueueWidgetVisible,
      fromChain: fromChain ?? this.fromChain,
      toChain: toChain ?? this.toChain,
      fromAddress: fromAddress ?? this.fromAddress,
      toAddress: toAddress ?? this.toAddress,
      fromWalletType: fromWalletType ?? this.fromWalletType,
      toWalletType: toWalletType ?? this.toWalletType,
      isMetamaskCardConnected:
          isMetamaskCardConnected ?? this.isMetamaskCardConnected,
      isKeplrCardConnected: isKeplrCardConnected ?? this.isKeplrCardConnected,
      tweenValue: tweenValue ?? this.tweenValue,
      ledgerErrorMessage: ledgerErrorMessage ?? this.ledgerErrorMessage,
    );
  }
}
