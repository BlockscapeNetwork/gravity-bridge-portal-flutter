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

import '../../constants.dart';
import '../../models/exceptions.dart';
import '../../services/metamask_service.dart';

final swapEthProvider =
    StateNotifierProvider.autoDispose<SwapEthNotifier, SwapEthState>(
  (ref) => SwapEthNotifier(),
);

class SwapEthState {
  final SwapStep step;
  final String txHash;
  final Object? error;

  SwapEthState({
    this.txHash = "",
    this.step = SwapStep.notReady,
    this.error,
  });

  SwapEthState copyWith({
    final SwapStep? step,
    final String? txHash,
    final Object? error,
  }) {
    return SwapEthState(
      step: step ?? this.step,
      txHash: txHash ?? this.txHash,
      error: error ?? this.error,
    );
  }
}

class SwapEthNotifier extends StateNotifier<SwapEthState> {
  // ignore: unused_field
  static const String _logPrefix = "SwapEthNotifier";
  SwapEthNotifier() : super(SwapEthState());

  late final TextEditingController _textEditingController =
      TextEditingController()..addListener(_onSwapAmountChanged);
  TextEditingController get textEditingController => _textEditingController;

  void _onSwapAmountChanged() {
    final amount = double.tryParse(_textEditingController.text);
    if (amount == null || amount <= 0.0) {
      state = state.copyWith(step: SwapStep.notReady);
    } else {
      state = state.copyWith(step: SwapStep.ready);
    }
  }

  @override
  void dispose() {
    textEditingController.removeListener(_onSwapAmountChanged);
    textEditingController.dispose();
    super.dispose();
  }

  void resetState() {
    state = SwapEthState();
  }

  void transferEtherToErc20Contract(
    final String contractAddress,
  ) async {
    String swapTxHash = "";
    try {
      state = state.copyWith(
        step: SwapStep.awaitingConfirmation,
        txHash: "",
      );

      final ethAmount = textEditingController.text;
      swapTxHash = await MetamaskService.beginEtherTransferToErc20Contract(
        ethAmount: ethAmount,
        erc20SmartContractAddress: Constants.wethContractAddress,
      );
      state = state.copyWith(step: SwapStep.created, txHash: swapTxHash);
    } catch (e) {
      if (e is UserRejectedRequestException) {
        state = state.copyWith(step: SwapStep.userRejected);
      } else if (e is InsufficientFundsException) {
        state = state.copyWith(step: SwapStep.insufficientFunds);
      } else {
        state = state.copyWith(step: SwapStep.creationError, error: e);
      }
    }

    awaitTransferCompletion();
  }

  void awaitTransferCompletion() async {
    if (state.txHash.isEmpty) {
      throw ArgumentError.value(state.txHash, "txHash", "should not be empty");
    }

    try {
      bool? pollingResult =
          await MetamaskService.pollForEthereumTransaction(hash: state.txHash);
      if (pollingResult == true) {
        state = state.copyWith(step: SwapStep.successful);
      } else if (pollingResult == false) {
        state = state.copyWith(step: SwapStep.unSuccessful);
      } else {
        state = state.copyWith(step: SwapStep.successUnknown);
      }
    }
    // Uknown error during Transaction status polling
    catch (e) {
      state = state.copyWith(step: SwapStep.statusRequestError, error: e);
    }
  }
}

enum SwapStep {
  /// Necessary data to start swap has _not_ been input
  notReady,

  /// Necessary data to start swap has been input
  ready,

  /// Swap is pending user confirmation(or rejection)
  awaitingConfirmation,

  /// User rejected
  userRejected,

  /// User confirmed, swap just started, no hash was created yet
  userConfirmed,

  /// User confirmed but could not be started b/c there are not enough funds
  insufficientFunds,

  /// Swap creation failed
  creationError,

  /// Swap transaction was created and a hash was given, tokens are on the way
  created,

  /// Swap status request: success = true, tokens were received
  successful,

  /// Swap status request: success = false, tokens were _not_ received
  unSuccessful,

  /// Swap status request: success is not set yet
  successUnknown,

  /// Swap status request threw an error
  statusRequestError,
}
