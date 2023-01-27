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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/services/keplr_service.dart';

import '../../../generated/l10n.dart';
import '../../../models/enums/erc20_approval_state.dart';
import '../../../models/enums/gravity_error.dart';
import '../../../models/exceptions.dart';
import '../../../models/token_info.dart';
import '../../../models/transaction_progress.dart';
import '../../../services/metamask_service.dart';
import '../../../services/transaction_history_service.dart';
import '../../../utils.dart';
import '../../select_token_dialog/select_token_service.dart';
import '../../select_token_dialog/select_token_state.dart';
import '../gravity_bridge_provider.dart';

//ignore: avoid_web_libraries_in_flutter
import 'package:js/js_util.dart' as js;

const String _logPrefix = "MetamaskProvider";

final metamaskProvider =
    StateNotifierProvider<MetamaskNotifier, MetamaskState>((ref) {
  final gravityBridgeNotifier = ref.read(gravityBridgeProvider.notifier);
  final provider = MetamaskNotifier(
    gravityBridgeNotifier,
    ref.read(selectTokenProvider.notifier),
    ref.read(transactionHistoryProvider.notifier),
  );

  try {
    // copy initial GravityBridgeProvider-state,
    // and make sure it is copied automatically every time it changes
    gravityBridgeNotifier
        .addListener((state) => provider._onGravityBridgeStateChange());

    ref.read(selectTokenProvider.notifier).addListener((newState) {
      provider._onSelectedTokenChange(newState);
    });

    StreamSubscription? metaSub;
    try {
      metaSub = MetamaskService.accountChangeStream.listen((accountString) {
        provider._onMetamaskAccountChange(accountString ?? "");
      });
    } catch (e) {
      dlogError(message: "Subscribing to Metamask went wrong", error: e);
    }

    StreamSubscription? keplrSub;
    try {
      keplrSub = KeplrService.listenForAccountChange().listen((accountString) {
        provider._onKeplrAccountChange(accountString);
      });
    } catch (e) {
      dlogError(message: "Subscribing to Keplr went wrong", error: e);
    }

    final networkSub = MetamaskService.networkChangeStream.listen((network) {
      provider._onMetamaskNetworkChange(network);
    });

    ref.onDispose(() {
      metaSub?.cancel();
      keplrSub?.cancel();
      networkSub.cancel();
    });
  } catch (e) {
    // We won't do anything right now, because keplr isn't necessarily required. An error will pop up as soon as 'connect is clicked on Keplr.
    debugPrint("caught Keplr error in metamask provider: " + e.toString());
  }

  return provider;
});

class MetamaskNotifier extends StateNotifier<MetamaskState> {
  static const logPrefix = "MetamaskProvider";
  final GravityBridgeNotifier _gravityBridgeService;
  final SelectTokenService _selectTokenService;
  final TransactionHistoryNotifier _transactionHistoryNotifier;

  late TextEditingController amountController;

  MetamaskNotifier(
    this._gravityBridgeService,
    this._selectTokenService,
    this._transactionHistoryNotifier,
  ) : super(MetamaskState()) {
    amountController = TextEditingController();

    amountController.addListener(() {
      setAmount(amountController.text);
    });
  }

  Future<void> updateTokenApprovalAmount([TokenInfo? token]) async {
    token ??= state.token;
    if (token == null) {
      return;
    }
    try {
      final approvedAmountForCurrentToken =
          await MetamaskService.erc20CheckApproval(token.address);
      setRemainingApprovedAmount(approvedAmountForCurrentToken);
    } on Exception catch (e, stacktrace) {
      dlogError(error: e, stackTrace: stacktrace);
      setRemainingApprovedAmount("0");
    }
  }

  Future<void> setSelectedToken(TokenInfo selectedToken) async {
    dlog("updateToken($selectedToken)", logPrefix);

    if (selectedToken.address.isNotEmpty) {
      _gravityBridgeService.showLoading();
      num? nu;
      String? balance;
      try {
        nu = await MetamaskService.erc20GetDecimals(
          selectedToken.address,
        );
        balance = await MetamaskService.erc20GetBalance(
          selectedToken.address,
        );
        selectedToken = selectedToken.copyWith(
          balance: balance,
          decimals: nu?.toInt(),
        );
      } catch (e, s) {
        final errorMessage = js.getProperty(e, "message");
        //check if e cames from js and has an error message
        if (errorMessage != null) {
          _gravityBridgeService.showError(
              GravityError(GravityErrorType.other, errorMessage.toString(), s));
          return;
        } else {
          _gravityBridgeService
              .showError(GravityError(GravityErrorType.other, e, s));
          return;
        }
      }
      _gravityBridgeService.hideLoading();
    }

    state = state.copyWith(
      token: selectedToken,
      decimals: selectedToken.decimals,
      currentBalance: selectedToken.balance,
    );

    await updateTokenApprovalAmount();

    _gravityBridgeService.hideLoading();
  }

  void _onMetamaskAccountChange(String accountString) {
    final transferType = _gravityBridgeService.state.transferType;
    final fromAddress = _gravityBridgeService.state.fromAddress;
    final toAddress = _gravityBridgeService.state.toAddress;
    if (transferType == TransferType.eth2fwd &&
        accountString.isNotEmpty &&
        accountString != fromAddress) {
      _gravityBridgeService.resetFromAddress();
      _gravityBridgeService.setIsMetamaskCardConnected(false);
      resetTransferPayload();
      _selectTokenService.resetState();
    }
    if (transferType == TransferType.gra2eth &&
        accountString.isNotEmpty &&
        toAddress != accountString) {
      _gravityBridgeService.setIsMetamaskCardConnected(false);
      _gravityBridgeService.resetToAddress();
    }
  }

  void _onKeplrAccountChange(final String accountString) {
    dlog("Keplr-Account: $accountString", _logPrefix);
    final transferType = _gravityBridgeService.state.transferType;
    final fromAddress = _gravityBridgeService.state.fromAddress;
    final toAddress = _gravityBridgeService.state.toAddress;
    if (transferType == TransferType.ibc2gra &&
        accountString.isNotEmpty &&
        accountString != fromAddress) {
      _gravityBridgeService.resetFromAddress();
      _gravityBridgeService.setIsMetamaskCardConnected(false);
      resetTransferPayload();
      _selectTokenService.resetState();
    }
    if (transferType == TransferType.gra2ibc &&
        accountString.isNotEmpty &&
        accountString != toAddress) {
      _gravityBridgeService.resetToAddress();
      _gravityBridgeService.setIsMetamaskCardConnected(false);
    }
  }

  void _onSelectedTokenChange(final SelectTokenState newSelectedTokenState) {
    if (_gravityBridgeService.state.transferType == TransferType.eth2fwd) {
      if (newSelectedTokenState is SelectTokenSuccessState &&
          newSelectedTokenState.selectedToken != null) {
        setSelectedToken(newSelectedTokenState.selectedToken!);
      }
    }
  }

  void _onMetamaskNetworkChange(String network) {
    if (network != state.network) {
      dlog("_updateNetwork($network)", logPrefix);
      if (network != Config.metamask.networkID) {
        state = state.copyWith(network: null);
        _gravityBridgeService.showError(
          GravityError(
            GravityErrorType.metamaskUnsupportedNetwork,
            S.current.CHANGE_NETWORK_REQUEST(
              MetamaskService.getNetworkName(),
              Config.metamask.networkName,
            ),
            null,
          ),
        );
      } else {
        state = state.copyWith(network: network);
      }
    }
  }

  /// reset
  /// - selected token
  /// - balance
  /// - transfer amount
  /// - decimals
  void resetTransferPayload() {
    amountController.text = '';
    state.decimals = null;
    state.token = null;
    state = state.copyWith(
      transferAmount: "",
      currentBalance: "",
    );
  }

  Future<String> connectMetamask() async {
    String walletAddress = "";
    try {
      await MetamaskService.connectWallet();
      MetamaskService.feedAccountChangeStream();
      MetamaskService.feedNetworkChangeStream();
      walletAddress = MetamaskService.getSelectedAddress();
      _gravityBridgeService.setIsMetamaskCardConnected(true);
    } on MissingExtensionException catch (e, s) {
      _gravityBridgeService.showError(GravityError(
          GravityErrorType.metamaskExtensionMissing, e.toString(), s));
    } catch (e, s) {
      final knownException = convertMetamaskJsException(e);
      if (knownException is MetamaskLoginAlreadyUnderwayException) {
        _gravityBridgeService.showError(GravityError(
            GravityErrorType.other, S.current.METAMASK_LOGIN_PROMPT, null));
      } else if (knownException is! UserRejectedRequestException) {
        final message = js.getProperty(e, "message");
        if (message != null) {
          _gravityBridgeService.showError(
              GravityError(GravityErrorType.other, message.toString(), s));
        } else {
          _gravityBridgeService
              .showError(GravityError(GravityErrorType.other, e, s));
        }
      }
    }
    return walletAddress;
  }

  /// Request "approval" for the currently selected Token from the user.
  /// "Approval" means the user gave permission to Metamask to make transfers of the token.
  /// Permissions are given for a max amount of transfer, e.g. if there is permission for 1 ETH, but the user wants to transfer 2 ETH, he needs to give permission again.
  /// We request the permission for the largest possible transfer amount([Constants.erc20MaxApprovableTransferTotal]) from the get-go, so that we do not need to do it a second time.
  void approve() {
    // is listened by [_listenForProviderChanges()] in MetamaskContainer,
    // which fires the approval process with the Widget belonging to it
    updateApprovalState(Ec20ApprovalState.start);
  }

  /// Begin transfer of tokens
  void confirm(BuildContext context) async {
    dlog("", "$_logPrefix.confirm");

    String amountAsString = amountController.text;
    String toAddress = _gravityBridgeService.state.toAddress;
    _gravityBridgeService.showLoading();
    if (state.token == null || state.decimals == null) {
      _gravityBridgeService.showError(GravityError(GravityErrorType.other,
          S.current.ERROR_TRANSFER_NO_TOKEN_SELECTED, null));
      return;
    }

    BigInt? amountWithoutDecimals;
    try {
      String parsedAmountWithoutDecimals =
          convertDecimalToIntAmount(amountAsString, state.decimals!);
      debugPrint("Amount: $amountAsString");
      amountWithoutDecimals = BigInt.parse(parsedAmountWithoutDecimals);

      if (amountWithoutDecimals.compareTo(BigInt.zero) == 0) {
        _gravityBridgeService.showError(GravityError(GravityErrorType.other,
            S.current.ERROR_TRANSFER_AMOUNT_IS_ZERO, null));
        return;
      }

      await _submitToCosmosTransaction(
          context, toAddress, amountAsString, amountWithoutDecimals);
    } catch (e, s) {
      final Object knownException = convertMetamaskJsException(e);
      final errorMessage = js.getProperty(e, "message");
      if (knownException is UserRejectedRequestException) {
        _gravityBridgeService.showError(
          GravityError(
            GravityErrorType.userRejection,
            errorMessage.toString(),
            s,
          ),
        );
      } else if (errorMessage != null) {
        _gravityBridgeService.showError(
            GravityError(GravityErrorType.other, errorMessage.toString(), s));
      } else if (e.toString().isNotEmpty) {
        _gravityBridgeService
            .showError(GravityError(GravityErrorType.other, e, s));
      } else {
        _gravityBridgeService.showError(
            GravityError(GravityErrorType.other, S.current.ERROR_GENERIC, s));
      }
    }
    _gravityBridgeService.hideLoading();
  }

  Future<void> _submitToCosmosTransaction(
    BuildContext context,
    String toAddress,
    String amountAsString,
    BigInt amount,
  ) async {
    dlog(
        "_submitToCosmosTransaction(contract: ${state.token!.address}, destination: $toAddress, amount: $amount)",
        logPrefix);

    TransactionStarted transactionProgress = await MetamaskService.sendToCosmos(
        state.token!.address, toAddress, amount);

    final transactionStatus = translateTransactionProgressToTransactionStatus(
      progress: transactionProgress,
      fromAddress: _gravityBridgeService.state.fromAddress,
      toAddress: _gravityBridgeService.state.toAddress,
    );
    _transactionHistoryNotifier.addTransaction(
      Transaction(
        id: transactionProgress.hash,
        amount: amountAsString,
        fee: "",
        fromAddress: _gravityBridgeService.state.fromAddress,
        toAddress: toAddress,
        statusUrl: "",
        symbol: state.token?.symbol ?? "",
        iconUrl: state.token?.iconUrl ?? "",
        decimals: state.token?.decimals ?? 0,
        tokenName: state.token?.name ?? "",
        status: transactionStatus,
      ),
    );

    state = state.copyWith(
        transactionProgress: transactionProgress,
        toAddress: toAddress,
        transferAmount: amountAsString);
    _gravityBridgeService.hideLoading();

    dlog(
        "_submitToCosmosTransaction() done: $transactionProgress => $transactionStatus",
        logPrefix);
  }

  void updateApprovalState(Ec20ApprovalState approvalState) {
    dlog("updateApprovalState($approvalState)", logPrefix);
    state = state.copyWith(ec20approvalState: approvalState);
  }

  void updateTransactionState(TransactionProgress transactionState) {
    dlog("updateTransactionState($transactionState)", logPrefix);
    state = state.copyWith(transactionProgress: transactionState);
  }

  void resetState() {
    dlog("resetState()", logPrefix);
    state =
        MetamaskState(transferType: _gravityBridgeService.state.transferType);
  }

  void setRemainingApprovedAmount(final String value) {
    dlog("setRemainingApprovedAmount($value)", logPrefix);
    state = state.copyWith(remainingApprovedAmount: value);
  }

  void setAmount(final String value) {
    dlog("setAmount($value)", logPrefix);
    state = state.copyWith(transferAmount: value);
  }

  // duplicate GravityBridgeProvider state which might be useful in this provider's state
  void _onGravityBridgeStateChange() {
    state = state.copyWith(
      transferType: _gravityBridgeService.state.transferType,
      fromAddress: _gravityBridgeService.state.fromAddress,
      toAddress: _gravityBridgeService.state.toAddress,
      isMetamaskCardConnected:
          _gravityBridgeService.state.isMetamaskCardConnected,
    );
    // dlog(
    // "\nTT = ${state.transferType}"
    // "\nfrom = ${state._fromAddress}"
    // "\nto = ${state._toAddress}",
    // "$_logPrefix._onGravityBridgeStateChange",
    // );
  }
}

class MetamaskState {
  static const String _logPrefix = "MetamaskState";
  final String? network;
  final String _fromAddress;
  final String _toAddress;
  final bool isMetamaskCardConnected;
  TokenInfo? token;

  /// transfer amount as string in double format
  final String transferAmount;
  int? decimals;
  final String currentBalance;
  final TransactionProgress? transactionProgress;
  final TransferType transferType;
  final Ec20ApprovalState? ec20approvalState;
  final String remainingApprovedAmount;

  bool get readyToConfirm =>
      token != null &&
      network != null &&
      transferAmount.isNotEmpty &&
      _toAddress.isNotEmpty &&
      isBalanceEnough &&
      validatorMessage == null;

  bool get isBalanceEnough {
    if (token == null) {
      return true;
    }

    final BigInt balanceBI =
        BigInt.tryParse(token!.balance ?? "") ?? BigInt.zero;
    final String transferAmountBIStr =
        convertDecimalToIntAmount(transferAmount, token!.decimals);
    final BigInt transferAmountBI =
        BigInt.tryParse(transferAmountBIStr) ?? BigInt.zero;
    final bool res = balanceBI >= transferAmountBI;
    return res;
  }

  /// Is the remaining approved amount of the current token enough to make a transfer of [transferAmount]?
  bool get isRemainingApprovalAmountEnough {
    bool ret;
    if (remainingApprovedAmount.isEmpty) {
      ret = false;
    } else if (remainingApprovedAmount ==
        Constants.erc20MaxApprovableTransferTotal) {
      ret = true;
    } else {
      try {
        final approvedAmountAsBigInt = BigInt.parse(remainingApprovedAmount);
        if (approvedAmountAsBigInt.compareTo(BigInt.zero) == 0) {
          ret = false;
        } else {
          final amountWithoutDecimals = convertDecimalToIntAmount(
              transferAmount.isEmpty ? "0" : transferAmount, decimals ?? 0);
          final amountAsBigInt = transferAmount.isNotEmpty
              ? BigInt.parse(amountWithoutDecimals)
              : BigInt.zero;
          ret = approvedAmountAsBigInt >= amountAsBigInt;
        }
      } on FormatException catch (_) {
        ret = false;
      }
    }
    return ret;
  }

  String? get validatorMessage {
    // set third bridge fee related parameter default to true for metamask_provider
    String? warningText = getTransferAmountValidator(
        transferAmount, decimals, isBalanceEnough, transferType);
    return warningText;
  }

  MetamaskState({
    this.isMetamaskCardConnected = false,
    this.token,

    /// transfer amount input in the text field (double format)
    this.transferAmount = "",
    this.decimals,
    this.currentBalance = "",
    this.ec20approvalState = Ec20ApprovalState.init,
    this.transactionProgress,
    this.network,
    this.remainingApprovedAmount = "",
    this.transferType = TransferType.eth2fwd,
    final String fromAddress = "",
    final String toAddress = "",
  })  : _fromAddress = fromAddress,
        _toAddress = toAddress;

  MetamaskState copyWith({
    String? transferAmount,
    int? decimals,
    TokenInfo? token,
    String? toAddress,
    String? fromAddress,
    String? currentBalance,
    Ec20ApprovalState? ec20approvalState,
    TransactionProgress? transactionProgress,
    String? network,
    bool? isMetamaskCardConnected,
    String? remainingApprovedAmount,
    TransferType? transferType,
  }) {
    return MetamaskState(
      transferAmount: transferAmount ?? this.transferAmount,
      decimals: decimals ?? this.decimals,
      token: token ?? this.token,
      toAddress: toAddress ?? this._toAddress,
      fromAddress: fromAddress ?? this._fromAddress,
      currentBalance: currentBalance ?? this.currentBalance,
      ec20approvalState: ec20approvalState ?? this.ec20approvalState,
      transactionProgress: transactionProgress ?? this.transactionProgress,
      network: network ?? this.network,
      isMetamaskCardConnected:
          isMetamaskCardConnected ?? this.isMetamaskCardConnected,
      remainingApprovedAmount:
          remainingApprovedAmount ?? this.remainingApprovedAmount,
      transferType: transferType ?? this.transferType,
    );
  }
}
