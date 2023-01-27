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

//ignore: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/gravity_error.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/bridge_fee_state.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_service.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_state.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/cosmos_rpc.dart';
import 'package:gravity_bridge_flutter/services/fee_middleware_service.dart';
import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';
import 'package:gravity_bridge_flutter/services/keplr_service.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/models/exceptions.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';

//ignore: avoid_web_libraries_in_flutter
import 'package:js/js_util.dart' as js;

final keplrProvider = StateNotifierProvider<KeplrNotifier, KeplrState>((ref) {
  final gravityBridgeNotifier = ref.read(gravityBridgeProvider.notifier);
  final provider = KeplrNotifier(
    gravityBridgeNotifier,
    ref.read(selectTokenProvider.notifier),
    ref.read(transactionHistoryProvider.notifier),
  );

  try {
    // copy initial GravityBridgeProvider-state,
    // and make sure it is copied automatically every time it changes
    gravityBridgeNotifier
        .addListener((state) => provider._onGravityBridgeStateChange());

    StreamSubscription? keplrSub;
    try {
      keplrSub = KeplrService.listenForAccountChange().listen(
          (accountString) => provider._onKeplrAccountChange(accountString));
    } catch (e) {
      dlogError(message: "Subscribing to Keplr went wrong", error: e);
    }

    ref.read(selectTokenProvider.notifier).addListener((newState) {
      provider._onSelectedTokenChange(newState);
    });

    ref.onDispose(() {
      keplrSub?.cancel();
    });
  } catch (e) {
    // We won't do anything right now, because keplr isn't necessarily required. An error will pop up as soon as 'connect is clicked on Keplr.
    debugPrint("caught exception in keplrProvider init: " + e.toString());
  }
  return provider;
});

class KeplrNotifier extends StateNotifier<KeplrState> {
  static const _logPrefix = "KeplrProvider";

  // ignore: unused_field
  final GravityBridgeNotifier _gravityBridgeService;
  final SelectTokenService _selectTokenService;
  final TransactionHistoryNotifier _transactionHistoryNotifier;

  late TextEditingController transferAmountController;
  late TextEditingController feeAmountController;

  // fees fetching errors are initially set to false
  // if price server is down or there is an error about bridge fee
  // we will use this bools to show user an error message
  bool isMiddlewareFeesError = false;
  bool isCoingeckoFeesError = false;

  KeplrNotifier(
    this._gravityBridgeService,
    this._selectTokenService,
    this._transactionHistoryNotifier,
  ) : super(KeplrState()) {
    transferAmountController = TextEditingController();
    feeAmountController = TextEditingController();

    transferAmountController.addListener(() {
      state = state.copyWith(
        transferAmount: transferAmountController.text,
      );
    });
  }

  Future<String> connectKeplr({required Chain chain}) async {
    String walletAddress = "";
    try {
      await KeplrService.requestConnectionToExperimentalChain(chain);
      walletAddress = await KeplrService.getAddress(chain);
    } catch (e, s) {
      final knownException = convertKeplrJsException(e);
      if (knownException is! UserRejectedRequestException) {
        _gravityBridgeService
            .showError(GravityError(GravityErrorType.other, e, s));
        rethrow;
      }
    }
    return walletAddress;
  }

  /// reset
  /// - selected token
  /// - balance
  /// - transfer amount
  /// - decimals
  /// - selected fee
  void resetTransferPayload() {
    transferAmountController.text = '';
    state.decimals = null;
    state.token = null;
    state.selectedBridgeFee = null;
    state = state.copyWith(
      transferDenom: "",
      transferAmount: "",
      currentBalance: "",
      bridgeFeeOptions: const BridgeFeeState(),
    );
  }

  /// Begin transfer of tokens
  Future<void> confirm(
    BuildContext context, {
    required TokenInfo token,
    TransferType? transferType,
    required final String fromAddress,
    required WalletType fromWalletType,
    required Chain fromChain,
    required Chain toChain,
    required ChainInfo chainInfo,
    required WidgetRef ref,
  }) async {
    if (state.transferAmount.isEmpty) {
      _gravityBridgeService.showError(GravityError(GravityErrorType.other,
          "Please input a valid amount to transfer.", null));
      return;
    } else if (state.transferDenom.isEmpty || state.decimals == null) {
      _gravityBridgeService.showError(GravityError(GravityErrorType.other,
          S.current.ERROR_TRANSFER_NO_TOKEN_SELECTED, null));
      return;
    }

    final String transferAmountDoubleString = state.transferAmount;
    final String feeDoubleString = state.selectedBridgeFee?.cost ?? "";
    BigInt? transferAmount;

    try {
      String transferAmountIntString = convertDecimalToIntAmount(
          transferAmountDoubleString, state.decimals!);
      String feeIntString = "";
      if (feeDoubleString.isNotEmpty) {
        feeIntString =
            convertDecimalToIntAmount(feeDoubleString, state.decimals!);
      }
      debugPrint("Amount: $transferAmountDoubleString, Fee: $feeDoubleString");
      transferAmount = BigInt.parse(transferAmountIntString);

      if (transferAmount.compareTo(BigInt.zero) == 0) {
        _gravityBridgeService.showError(GravityError(GravityErrorType.other,
            S.current.ERROR_TRANSFER_AMOUNT_IS_ZERO, null));

        return;
      }

      await _submitTxToKeplr(
        context,
        transferAmount: transferAmountIntString,
        bridgeFeeAmount: feeIntString,
        token: token,
        transferType: transferType,
        fromWalletType: fromWalletType,
        fromChain: fromChain,
        toChain: toChain,
        chainInfo: chainInfo,
        ref: ref,
      );

      // refresh data of selected token (e.g balance)
      _selectTokenService.loadData(ref);
    } catch (e, s) {
      final errorMessage = js.getProperty(e, "message");
      //check if e cames from js and has an error message
      if (errorMessage != null) {
        _gravityBridgeService.showError(
            GravityError(GravityErrorType.other, errorMessage.toString(), s));

        return;
      } else {
        _gravityBridgeService.showError(
            GravityError(GravityErrorType.other, S.current.ERROR_GENERIC, s));
        return;
      }
    }
  }

  Future<void> _submitTxToKeplr(
    BuildContext context, {
    required String transferAmount,
    required String bridgeFeeAmount,
    required TokenInfo token,
    TransferType? transferType,
    required WalletType fromWalletType,
    required Chain fromChain,
    required Chain toChain,
    required ChainInfo chainInfo,
    required WidgetRef ref,
  }) async {
    dlog(
        "_submitTxToKeplr():  destination: ${state._toAddress}, amount: $transferAmount, fee: $bridgeFeeAmount");

    String txHash = "";
    try {
      String? rpc;
      state = state.copyWith(transactionProgress: TransactionStarted("", ""));

      /// Create transaction and register it (with the responsible system, blockchain?)
      /// Important: A transaction is always created and registered,
      /// even if the transfer amount is higher than what is available,
      /// even if the available amount is not enough to pay the fees.
      /// In these cases it will be registered and have an ID (hash) by the system,
      /// but it will be then rejected.

      // COSM > GRAV
      if (state._ibcChain != null && transferType == TransferType.ibc2gra) {
        try {
          txHash = await KeplrService.signIbcTransferToGravityAmino(
            state._toAddress,
            state._fromAddress,
            transferAmount,
            state.token!.denom!,
            state._ibcChain!,
            fromWalletType,
            fromChain,
            toChain,
            ref,
          );
        } catch (e, s) {
          rlogError(
              message: "Error in ibcTransferToGravity",
              error: e,
              stackTrace: s);
          throw BlockchainException(e.toString());
        }

        rpc = chainInfos[state._ibcChain!.chainName]!.rpc;
      }
      // GRAV > COSM
      else if (state._ibcChain != null &&
          transferType == TransferType.gra2ibc) {
        try {
          txHash = await KeplrService.signIbcTransferFromGravityAmino(
            state._toAddress,
            state._fromAddress,
            transferAmount,
            state.token!.denom!,
            state._ibcChain!,
            fromWalletType,
            fromChain,
            chainInfo,
            ref,
          );
        } catch (e, s) {
          rlogError(
              message: "Error in ibcTransferFromGravity",
              error: e,
              stackTrace: s);
          throw BlockchainException(e.toString());
        }
      }
      // GRAV > ETH
      else {
        final chainFee = calculateChainFee(
            BigInt.parse(transferAmount), state.minChainFeeBasisPoints);

        try {
          txHash = await KeplrService.signSendToEthTxAmino(
            state._toAddress,
            state._fromAddress,
            transferAmount,
            state.transferDenom,
            bridgeFeeAmount,
            chainFee.toRadixString(10),
            fromWalletType,
            fromChain,
            ref,
          );
        } catch (e, s) {
          rlogError(
              message: "Error in signTransaction", error: e, stackTrace: s);
          throw BlockchainException(e.toString());
        }
      }

      state = state.copyWith(
          transactionProgress: TransactionInProgress("", "", ""));

      TransactionProgress transactionProgress =
          await KeplrService.checkStartedTxStatus(
        fromAddress: state._fromAddress,
        toAddress: state._toAddress,
        token: token,
        transactionHash: txHash,
        rpc: rpc,
      );

      /// add Transaction to transaction history
      final transactionStatus = translateTransactionProgressToTransactionStatus(
        progress: transactionProgress,
        fromAddress: state._fromAddress,
        toAddress: state._toAddress,
      );
      final url =
          CosmosRPCService.rpcUrlFromHash(rpc ?? Config.keplr.rpc, txHash);
      _transactionHistoryNotifier.addTransaction(
        Transaction(
          id: txHash,
          amount: convertIntToDecimalAmount(transferAmount, token.decimals),
          fee: bridgeFeeAmount,
          fromAddress: state._fromAddress,
          toAddress: state._toAddress,
          statusUrl: url.toString(),
          symbol: token.symbol,
          iconUrl: token.iconUrl,
          decimals: token.decimals,
          tokenName: token.name,
          status: transactionStatus,
          durationInHours: (_gravityBridgeService.state.transferType ==
                      TransferType.gra2eth &&
                  state.selectedBridgeFee != null)
              ? state.selectedBridgeFee!.type.maxDuration.inMinutes / 60
              : 0.0,
        ),
      );

      state = state.copyWith(transactionProgress: transactionProgress);
    } on BlockchainException catch (e) {
      if (e.message == "Error: Request rejected") {
        state =
            state.copyWith(transactionProgress: TransactionRejectedByUser());
      } else {
        state = state.copyWith(
            transactionProgress: TransactionError(txHash, e.message));
      }
    } catch (e, s) {
      // If we land here, it means transaction is rejected in Keplr extension and
      // state of transaction progress has to be its initial value
      state = state.copyWith(transactionProgress: TransactionInitialValue());
      _gravityBridgeService.showError(
          GravityError(GravityErrorType.other, S.current.ERROR_GENERIC, s));
    }
  }

  void setSelectedBridgeFeeOption(BridgeFeeOption option) {
    try {
      option.cost =
          double.parse(option.cost).toStringAsFixed(Config.kFeeDecimals);
      state = state.copyWith(selectedBridgeFee: option);
    } catch (_) {}
  }

  String getTotalTransferCostAsStringDouble() {
    final totalTransferCostAsDoubleString = convertIntToDecimalAmount(
        state.totalTransferCost.toString(), state.token!.decimals);
    return totalTransferCostAsDoubleString;
  }

  String getShortenedBridgeFeeCost({BridgeFeeOption? fee}) {
    fee ??= state.selectedBridgeFee;
    try {
      String shortened =
          double.parse(fee!.cost).toStringAsFixed(Config.kFeeDecimals);
      dlog("Fee: ${fee.cost}, Shortened: $shortened",
          "getShortenedBridgeFeeCost");
      return shortened;
    } catch (e) {
      return "-";
    }
  }

  String getTransactionFeeCost() {
    if (state.transferAmount.isNotEmpty) {
      final amountIntString =
          convertDecimalToIntAmount(state.transferAmount, state.decimals ?? 0);
      final chainFee = calculateChainFee(
          BigInt.parse(amountIntString), state.minChainFeeBasisPoints);
      final String chainFeeWithDecimals = convertIntToDecimalAmount(
          chainFee.toRadixString(10), state.decimals ?? 0);
      return chainFeeWithDecimals;
    }
    return "-";
  }

  void _setNoGasTiles() {
    debugPrint("Disabling gas tiles.");
    var denom = "";
    if (state.transferDenom.isNotEmpty) {
      denom =
          state.transferDenom.substring(0, min(8, state.transferDenom.length));
    }
    state = state.copyWith(bridgeFeeOptions: const BridgeFeeState());
    _setFees("nat", "nat", "nat", denom);
  }

  void setSelectedToken(final TokenInfo selectedToken) async {
    dlog("setSelectTokenState($selectedToken)", _logPrefix);

    //update the balance
    state = state.copyWith(
      bridgeFeeOptions: BridgeFeeLoadingState(),
      token: selectedToken,
      transferDenom: selectedToken.denom,
      currentBalance: selectedToken.balance,
      decimals: selectedToken.decimals,
    );

    if (state.transferType != TransferType.gra2eth) {
      _setNoGasTiles();
      return;
    }

    // ERC20 token like DAI or WETH
    if (state.transferDenom.startsWith("gravity0x")) {
      try {
        isMiddlewareFeesError = false;
        final fees = await FeeMiddlewareService.getAllFees(
            state.transferDenom.replaceFirst("gravity", ""));
        if (fees.length < 3) {
          throw Exception("Couldn't retrieve all 3 fees");
        }
        final denom = fees[0].tokenSymbol ?? "";
        _setFees(fees[0].tokenAmount!, fees[1].tokenAmount!,
            fees[2].tokenAmount!, denom);
      } catch (e) {
        isMiddlewareFeesError = true;
        state =
            state.copyWith(bridgeFeeOptions: BridgeFeeErrorState(e.toString()));
        throw Exception("Middleware Fees error: " + e.toString());
      }
    }
    // IBC-native token like CHI or ATOM
    else if (state.transferDenom.startsWith("ibc/")) {
      try {
        isCoingeckoFeesError = false;
        final result = Config.keplr.gravityTokens
            .where((element) => element.denom == selectedToken.denom);
        final fees = await FeeMiddlewareService.getFeesFromCoinGecko(
            result.first.coinGeckoName);

        _setFees(
          fees.day.tokenFee.toString(),
          fees.hour.tokenFee.toString(),
          fees.instant.tokenFee.toString(),
          selectedToken.symbol,
        );
      } catch (e) {
        isCoingeckoFeesError = true;
        state =
            state.copyWith(bridgeFeeOptions: BridgeFeeErrorState(e.toString()));
        throw Exception("Coingecko Fees error: " + e.toString());
      }
    } else {
      _setNoGasTiles();
    }
  }

  void _setFees(String low, String medium, String high, String symbol) {
    state = state.copyWith(
        bridgeFeeOptions: BridgeFeeLoadedState(
          options: [
            BridgeFeeOption(
              type: BridgeFeeType.slow,
              cost: low,
              symbol: symbol,
            ),
            BridgeFeeOption(
              type: BridgeFeeType.standard,
              cost: medium,
              symbol: symbol,
            ),
            BridgeFeeOption(
              type: BridgeFeeType.premium,
              cost: high,
              symbol: symbol,
            )
          ],
        ),
        selectedBridgeFee: null);
    setSelectedBridgeFeeOption(
      (state.bridgeFeeOptions as BridgeFeeLoadedState)
          .options
          .firstWhere((element) => element.type == BridgeFeeType.slow),
    );
  }

  // duplicate GravityBridgeProvider state which might be useful in this provider's state
  void _onGravityBridgeStateChange() {
    final oldTransferType = state.transferType;
    state._ibcChain = _gravityBridgeService.state.ibcChain;
    state._forwardChain = _gravityBridgeService.state.forwardChain;
    state = state.copyWith(
      transferType: _gravityBridgeService.state.transferType,
      fromAddress: _gravityBridgeService.state.fromAddress,
      toAddress: _gravityBridgeService.state.toAddress,
      isKeplrCardConnected: _gravityBridgeService.state.isKeplrCardConnected,
    );
    // when switching from gra2ibc to gra2eth reset transfer data
    // for the case that the selected token is not ERC20 (e.g Graviton)
    if (oldTransferType == TransferType.gra2ibc &&
        state.transferType == TransferType.gra2eth) {
      resetTransferPayload();
      _selectTokenService.resetState();
    }
  }

  void _onKeplrAccountChange(String accountString) {
    final transferType = _gravityBridgeService.state.transferType;
    final fromAddress = _gravityBridgeService.state.fromAddress;
    final toAddress = _gravityBridgeService.state.toAddress;
    if ((transferType == TransferType.gra2eth ||
            transferType == TransferType.gra2ibc ||
            transferType == TransferType.ibc2gra) &&
        accountString.isNotEmpty &&
        accountString != fromAddress) {
      _gravityBridgeService.resetFromAddress();
      _gravityBridgeService.setIsKeplrCardCardConnected(false);
      resetTransferPayload();
      _selectTokenService.resetState();
    }
    if ((transferType == TransferType.eth2fwd ||
            transferType == TransferType.ibc2gra) &&
        accountString.isNotEmpty &&
        accountString != toAddress) {
      _gravityBridgeService.setIsKeplrCardCardConnected(false);
      _gravityBridgeService.resetToAddress();
    }
  }

  void _onSelectedTokenChange(final SelectTokenState newSelectedTokenState) {
    final transferType = _gravityBridgeService.state.transferType;
    if (transferType == TransferType.gra2eth ||
        transferType == TransferType.gra2ibc ||
        transferType == TransferType.ibc2gra) {
      if (newSelectedTokenState is SelectTokenSuccessState &&
          newSelectedTokenState.selectedToken != null &&
          newSelectedTokenState.selectedToken != state.token) {
        setSelectedToken(newSelectedTokenState.selectedToken!);
      }
    }
  }
}

class KeplrState {
  ForwardChain? _forwardChain;
  IbcChain? _ibcChain;
  final String _fromAddress;
  final String _toAddress;
  final bool isKeplrCardConnected;
  TokenInfo? token;

  /// Token amount inputed into the text field (double format)
  final String transferAmount;
  final String transferDenom;
  int? decimals;

  // gravity chain fee param
  int minChainFeeBasisPoints;

  /// balance of the currently selected token in BigInt format
  final String currentBalance;
  final TransactionProgress? transactionProgress;
  final TransferType transferType;
  BridgeFeeOption? selectedBridgeFee;
  final BridgeFeeState bridgeFeeOptions;

  bool get readyToConfirm =>
      token != null &&
      _toAddress.isNotEmpty &&
      transferAmount.isNotEmpty &&
      isBalanceEnough == true &&
      ((_ibcChain == null &&
              selectedBridgeFee != null &&
              selectedBridgeFee!.cost.isNotEmpty) ||
          _ibcChain != null) &&
      validatorMessage == null;

  BigInt get totalTransferCost {
    final String tAmountIntStr =
        convertDecimalToIntAmount(transferAmount, token?.decimals ?? 0);
    final BigInt amountBI = BigInt.tryParse(tAmountIntStr) ?? BigInt.zero;

    // chain fee
    BigInt chainFee = calculateChainFee(amountBI, minChainFeeBasisPoints);

    final String feeIntStr = convertDecimalToIntAmount(
        selectedBridgeFee?.cost ?? "", token?.decimals ?? 0);
    final BigInt feeBI = BigInt.tryParse(feeIntStr) ?? BigInt.zero;
    final totalBI = amountBI + feeBI + chainFee;
    return totalBI;
  }

  List<String>? get availableAmountAndHintText {
    if (token != null &&
        currentBalance.isNotEmpty &&
        selectedBridgeFee != null &&
        token!.symbol == selectedBridgeFee!.symbol &&
        _ibcChain == null &&
        availableAmountAfterFees > BigInt.zero) {
      return [
        availableAmountAfterFees.toString(),
        S.current.BRIDGE_FEE_DEDUCTED_TEXT,
        // TransactionFeesDisabled <- search this to find related codes
        S.current.CHAIN_FEES_DEDUCTED
      ];
    }
    return [currentBalance, ""];
  }

  bool? get isBalanceEnough {
    if (availableAmountAfterFees < BigInt.zero) {
      return false;
    }

    if (token != null &&
        transferAmount.isNotEmpty &&
        transferAmount.isNotEmpty &&
        availableAmountAndHintText![0].isNotEmpty &&
        availableAmountAndHintText![0] != "") {
      if (BigInt.parse(
              convertDecimalToIntAmount(transferAmount, token!.decimals)) >
          BigInt.parse(availableAmountAndHintText![0])) {
        return false;
      }
    }
    return true;
  }

  String? get validatorMessage {
    return getTransferAmountValidator(
        transferAmount, decimals, isBalanceEnough, transferType);
  }

  /// Get the available token balance after fees have been deducted.
  /// It also could return negative value, because BridgeFee could be bigger than the current balance
  BigInt get availableAmountAfterFees {
    final BigInt balance = BigInt.tryParse(currentBalance) ?? BigInt.zero;

    if (transferType != TransferType.gra2eth ||
        (transferType == TransferType.gra2eth &&
            token?.symbol == selectedBridgeFee?.symbol)) {
      String bridgeFeeStr = convertDecimalToIntAmount(
        (selectedBridgeFee?.cost ?? "0"),
        token?.decimals ?? 0,
      );
      BigInt bridgeFee = BigInt.tryParse(bridgeFeeStr) ?? BigInt.zero;
      BigInt available = balance - bridgeFee;

      // substract maximum chain fee
      BigInt maxTransactionFee =
          calculateChainFee(available, minChainFeeBasisPoints);

      available -= maxTransactionFee;
      return available;
    }
    return balance;
  }

  KeplrState({
    this.transferDenom = "",
    this.transferAmount = "",
    this.decimals,
    this.currentBalance = "",
    this.transactionProgress,
    this.bridgeFeeOptions = const BridgeFeeState(),
    this.selectedBridgeFee,
    this.token,
    this.minChainFeeBasisPoints =
        2, // TODO we don't have to hardcode this, we could fetch the param from chain to be always up to date
    final String fromAddress = "",
    final String toAddress = "",
    this.isKeplrCardConnected = false,
    ForwardChain? forwardChain,
    IbcChain? ibcChain,
    this.transferType = TransferType.eth2fwd,
  })  : _fromAddress = fromAddress,
        _toAddress = toAddress,
        _forwardChain = forwardChain,
        _ibcChain = ibcChain;

  KeplrState copyWith({
    final String? transferDenom,
    final String? transferAmount,
    final String? fromAddress,
    final String? toAddress,
    final int? decimals,
    final String? currentBalance,
    final BridgeFeeOption? selectedBridgeFee,
    final BridgeFeeState? bridgeFeeOptions,
    final TransactionProgress? transactionProgress,
    final TokenInfo? token,
    final int? minChainFeeBasisPoints,
    final bool? isKeplrCardConnected,
    final ForwardChain? forwardChain,
    final IbcChain? ibcChain,
    final TransferType? transferType,
  }) {
    return KeplrState(
      transferDenom: transferDenom ?? this.transferDenom,
      transferAmount: transferAmount ?? this.transferAmount,
      toAddress: toAddress ?? this._toAddress,
      fromAddress: fromAddress ?? this._fromAddress,
      decimals: decimals ?? this.decimals,
      currentBalance: currentBalance ?? this.currentBalance,
      transactionProgress: transactionProgress ?? this.transactionProgress,
      bridgeFeeOptions: bridgeFeeOptions ?? this.bridgeFeeOptions,
      selectedBridgeFee: selectedBridgeFee ?? this.selectedBridgeFee,
      token: token ?? this.token,
      minChainFeeBasisPoints:
          minChainFeeBasisPoints ?? this.minChainFeeBasisPoints,
      isKeplrCardConnected: isKeplrCardConnected ?? this.isKeplrCardConnected,
      forwardChain: forwardChain ?? this._forwardChain,
      ibcChain: ibcChain ?? this._ibcChain,
      transferType: transferType ?? this.transferType,
    );
  }
}

/// calculates chain fee pased on amount and passed minChainFeeBasisPoints param
BigInt calculateChainFee(BigInt amount, int minChainFeeBasisPoints) {
  // fee * (par/100 * 1/100)  = fee  * par / 10000 = par*fee / 10000
  return amount * BigInt.from(minChainFeeBasisPoints) ~/ BigInt.from(10000);
}
