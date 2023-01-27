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

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/models/enums/gravity_error.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_state.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/storage_service.dart';
import 'package:tuple/tuple.dart';

import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/utils.dart';

const String _logPrefix = "GravityBridgeProvider";

final gravityBridgeProvider =
    StateNotifierProvider<GravityBridgeNotifier, GravityBridgeState>((ref) {
  final provider = GravityBridgeNotifier(
    ref.read(storageServiceProvider),
  );

  return provider;
});

class GravityBridgeNotifier extends StateNotifier<GravityBridgeState> {
  final StorageService storageService;
  late TextEditingController toAddressController;

  GravityBridgeNotifier(
    this.storageService,
  ) : super(GravityBridgeState(loading: true)) {
    initService();
    toAddressController = TextEditingController();
  }

  void initService() async {
    state = state.copyWith(loading: true);

    try {
      await CoinGeckoService.init();
    } catch (e, s) {
      state = state.copyWith(
        loading: false,
        error: GravityError(
            GravityErrorType.other, S.current.ERROR_FAILED_TO_GET_TOKENLIST, s),
      );
      return;
    }

    if ((await storageService.getLicenseAccepted()) != true) {
      state = state.copyWith(licenceAccepted: false, loading: false);
    } else {
      state = state.copyWith(licenceAccepted: true, loading: false);
    }

    if ((await storageService.getSupplyInfoWidgetVisibility()) == true) {
      state = state.copyWith(isSupplyInfoWidgetVisible: true);
    } else {
      state = state.copyWith(isSupplyInfoWidgetVisible: false);
    }

    if ((await storageService.getVolumeInfoWidgetVisibility()) == true) {
      state = state.copyWith(isVolumeInfoWidgetVisible: true);
    } else {
      state = state.copyWith(isVolumeInfoWidgetVisible: false);
    }

    if ((await storageService.getTransactionQueueWidgetVisibility()) == true) {
      state = state.copyWith(isTransactionQueueWidgetVisible: true);
    } else {
      state = state.copyWith(isTransactionQueueWidgetVisible: false);
    }
  }

  void acceptLicenceAgreement() async {
    storageService.setLicenseAccepted(true);
    state = state.copyWith(licenceAccepted: true);
  }

  void setSupplyInfoWidgetVisibility(bool val) async {
    storageService.setSupplyInfoWidgetVisibility(val);
    state = state.copyWith(isSupplyInfoWidgetVisible: val);
  }

  void setVolumeInfoWidgetVisibility(bool val) async {
    storageService.setVolumeInfoWidgetVisibility(val);
    state = state.copyWith(isVolumeInfoWidgetVisible: val);
  }

  void setTransactionQueueWidgetVisibility(bool val) async {
    storageService.setTransactionQueueWidgetVisibility(val);
    state = state.copyWith(isTransactionQueueWidgetVisible: val);
  }

  void showError(GravityError error) {
    state = state.copyWith(error: error, loading: false);
  }

  void resetError() async {
    state = state.copyWith(error: null);
  }

  void showLoading() {
    state = state.copyWith(loading: true);
  }

  void hideLoading() {
    state = state.copyWith(loading: false);
  }

  void setFromChain(final Chain chain) {
    final correctChains =
        _getCorrectedChains(fromChain: chain, toChain: state.toChain);
    dlog("fromChain: $chain", _logPrefix);
    state = state.copyWith(
      fromChain: correctChains.item1,
      toChain: correctChains.item2,
    );
  }

  void setToChain(final Chain chain) {
    final correctChains =
        _getCorrectedChains(fromChain: state.fromChain, toChain: chain);
    dlog("toChain: $chain", _logPrefix);
    state = state.copyWith(
      fromChain: correctChains.item1,
      toChain: correctChains.item2,
    );
  }

  void setFromAndToChain(final Chain fromChain, final Chain toChain) {
    final correctChains =
        _getCorrectedChains(fromChain: fromChain, toChain: toChain);
    // dlog("fromChain: $chain", _logPrefix);
    state = state.copyWith(
      fromChain: correctChains.item1,
      toChain: correctChains.item2,
    );
  }

  void toggleToAndFromChains() {
    final correctedChains = _getCorrectedChains(
      fromChain: state.toChain,
      toChain: state.fromChain,
    );
    state = state.copyWith(
      fromChain: correctedChains.item1,
      toChain: correctedChains.item2,
    );
    dlog(
        "fromChain: ${state.fromChain}, toChain: ${state.toChain}", _logPrefix);
  }

  void setTweenValue(final double tweenValue) {
    state = state.copyWith(tweenValue: tweenValue);
  }

  Tuple2<Chain, Chain> _getCorrectedChains({
    required Chain fromChain,
    required Chain toChain,
  }) {
    final fittingTransferType =
        TransferType.fromChains(fromChain: fromChain, toChain: toChain);
    dlog("New TransferType: $fittingTransferType");
    switch (fittingTransferType) {
      case TransferType.ibc2gra:
        toChain = Chain.gravity;
        break;
      case TransferType.gra2eth:
      case TransferType.gra2ibc:
        fromChain = Chain.gravity;
        break;
      default:
        break;
    }
    return Tuple2(fromChain, toChain);
  }

  void setFromAddress(final String text) {
    state = state.copyWith(fromAddress: text);
  }

  void setToAddress(final String text) {
    dlog("setToAddress($text)", _logPrefix);
    toAddressController.text = text;
    toAddressController.selection = TextSelection.fromPosition(
        TextPosition(offset: toAddressController.text.length));
    state = state.copyWith(toAddress: text);
  }

  void resetFromAddress() {
    setFromAddress("");
  }

  void resetToAddress() {
    setToAddress("");
  }

  void toggleAddresses() {
    final from = state.fromAddress;
    final to = state.toAddress;
    setFromAddress(to);
    setToAddress(from);
  }

  void setIsMetamaskCardConnected(final bool isMetamaskCardConnected) {
    state = state.copyWith(isMetamaskCardConnected: isMetamaskCardConnected);
  }

  void setIsKeplrCardCardConnected(final bool isKeplrCardConnected) {
    state = state.copyWith(isKeplrCardConnected: isKeplrCardConnected);
  }

  void setFromWalletType(final WalletType fromWalletType) {
    state = state.copyWith(fromWalletType: fromWalletType);
  }

  void setToWalletType(final WalletType toWalletType) {
    state = state.copyWith(toWalletType: toWalletType);
  }

  void toggleToAndFromWalletTypes() {
    final from = state.fromWalletType;
    final to = state.toWalletType;
    setFromWalletType(to);
    setToWalletType(from);
  }

  void setLedgerErrorMessage(final String text) {
    state = state.copyWith(ledgerErrorMessage: text);
  }
}
