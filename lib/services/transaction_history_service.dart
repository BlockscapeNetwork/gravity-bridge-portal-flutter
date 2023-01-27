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
import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transaction_status.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/cosmos_rpc.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/common_query_tx_resp.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/keplr_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/transaction_progress_dialog/transaction_progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bin/config.dart';

final transactionHistoryProvider =
    ChangeNotifierProvider<TransactionHistoryNotifier>(
        (ref) => TransactionHistoryNotifier());

class TransactionHistoryNotifier extends ChangeNotifier {
  static const _kPrefsKey = "transaction_history";
  static const _kPrefsKeyViewed = "transaction_history_v";

  /// Future used for wait for json-reading to finish
  late final Future<void> _readFromDiskFuture;
  List<Transaction> transactions = [];
  Set<String> _viewedIds = {};

  TransactionHistoryNotifier() {
    _readFromDiskFuture = _loadFromPrefs();
    _readFromDiskFuture.then((_) {
      if (transactions.isNotEmpty) {
        notifyListeners();
      }
    });
  }

  int get newTransactions => transactions
      .where((transaction) => !_viewedIds.contains(transaction.id))
      .length;

  int get transactionCount => transactions.length;

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    notifyListeners();
    _saveToPrefs();
  }

  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
    notifyListeners();
    _saveToPrefs();
  }

  void setViewed(Set<String> idList) {
    _viewedIds.addAll(idList);
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _kPrefsKey, jsonEncode([for (final t in transactions) t.toJson()]));
    await prefs.setStringList(_kPrefsKeyViewed, _viewedIds.toList());
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint(prefs.getKeys().toString());
    if (!prefs.containsKey(_kPrefsKey)) return;
    String result = prefs.getString(_kPrefsKey)!;

    transactions = [for (Map t in jsonDecode(result)) Transaction.fromJson(t)];
    _viewedIds = (prefs.getStringList(_kPrefsKeyViewed) ?? []).toSet();
  }

  bool get areAllTransactionsFinished => transactions.every((t) =>
      t.status == TransactionStatus.completed ||
      t.status == TransactionStatus.failed ||
      t.status == TransactionStatus.canceled);

  bool get areTransactionStatusRequestsRunning =>
      transactions.any((t) => t.isRequestRunning);

  /// If there are unfinished transactions and cancellation transactions (both with status preparing/pending),
  /// sends status requests and notifies the UI
  void checkForAndUpdateUnfinishedTransactionStatuses() async {
    /// IMPORTANT: wait for json content to be loaded
    await _readFromDiskFuture;

    const prefix = "checkForAndUpdateUnfinishedTransactionStatuses";
    dlog("Start", prefix);

    final unfinishedTransactions = transactions
        .where((t) =>
            t.status == TransactionStatus.preparing ||
            t.status == TransactionStatus.pending)
        .toList();
    dlog("Unfinished transactions: ${unfinishedTransactions.map((e) => e.id)}",
        prefix);

    if (unfinishedTransactions.isNotEmpty) {
      for (var t in unfinishedTransactions) {
        t.isRequestRunning = true;
      }
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 500));

      {
        final unfinishedCancelationTs = unfinishedTransactions.where(
            (element) =>
                element.cancelation != null &&
                element.status == TransactionStatus.preparing);
        await _updateUnfinishedCancelationTransactions(unfinishedCancelationTs);
        for (var t in unfinishedCancelationTs) {
          t.isRequestRunning = false;
        }
        notifyListeners();
      }

      {
        final unfinishedToMetamasktTs = unfinishedTransactions.where((t) =>
            isMetamaskWalletAddress(t.toAddress) &&
            (t.status == TransactionStatus.preparing ||
                t.status == TransactionStatus.pending));
        await _updateUnfinishedToEthereumTransactions(unfinishedToMetamasktTs);
        for (var u in unfinishedToMetamasktTs) {
          u.isRequestRunning = false;
        }
        notifyListeners();
      }

      {
        final unfinishedToCosmosTs = unfinishedTransactions
            .where((element) => isKeplrWalletAddress(element.toAddress));
        await _updateUnfinishedToCosmosTransactionStatuses(
          unfinishedToCosmosTs,
          0,
          5,
        );
        for (var t in unfinishedToCosmosTs) {
          t.isRequestRunning = false;
        }
        notifyListeners();
      }

      _saveToPrefs();
    }
    dlog("End", prefix);
  }

  /// Request status updates for every Grav2Eth transactions.
  Future<void> _updateUnfinishedToEthereumTransactions(
      final Iterable<Transaction> unfinishedToMetamaskTransactions) async {
    const prefix = "_updateUnfinishedToMetamaskTransactions";
    dlog(
        "Unfinished Transactions to Metamask: ${unfinishedToMetamaskTransactions.map((e) => e.id)}",
        prefix);

    final unbatchedTransactions = <Int64>[];
    final batchedButNotRelayedTransactions = <Int64>[];

    /// Send status requests for each of the sender-addresses.
    /// Get unbatched/batched-but-not-relayed transactions
    final fromAddresses =
        unfinishedToMetamaskTransactions.map((e) => e.fromAddress).toSet();
    dlog("List of wallet addresses that sent coins to Metamask: $fromAddresses",
        prefix);

    for (final addr in fromAddresses) {
      try {
        final query =
            await GravityService().checkBridgeTransactionsOfWallet(addr);
        for (var otx in query.unbatchedTransfers) {
          unbatchedTransactions.add(otx.id);
        }

        for (var otx in query.transfersInBatches) {
          batchedButNotRelayedTransactions.add(otx.id);
        }
      } on Exception catch (_) {}
    }

    for (final t in unfinishedToMetamaskTransactions) {
      final id64 = await GravityService().getTransactionIdByTxHash(t.id);
      if (unbatchedTransactions.contains(id64)) {
        t.status = TransactionStatus.preparing;
      } else if (batchedButNotRelayedTransactions.contains(id64)) {
        t.status = TransactionStatus.pending;
      } else {
        t.status = TransactionStatus.completed;
      }
      t.isRequestRunning = false;
      dlog("Update: ${t.id} is ${t.status}", prefix);
    }
  }

  /// - Takes the first [count] unfinished transactions starting from [start]
  /// - Calls status update requests for those transactions
  /// - Waits for all requests to finish
  /// - Calls itself with the next [start]-[count] range
  Future _updateUnfinishedToCosmosTransactionStatuses(
    final Iterable<Transaction> unfinishedToCosmosTransactions,
    int start,
    int count,
  ) {
    int end = start + count;
    if (end > unfinishedToCosmosTransactions.length) {
      end = unfinishedToCosmosTransactions.length;
    }

    return Future.wait(
      unfinishedToCosmosTransactions.toList().getRange(start, end).map((t) {
        return _maybeUpdateToCosmosTransactionStatus(t);
      }),
    ).then((value) {
      if (unfinishedToCosmosTransactions.length > end) {
        return _updateUnfinishedToCosmosTransactionStatuses(
            unfinishedToCosmosTransactions, end, count);
      }
    });
  }

  /// - Checks transaction status
  /// - If it is not completed/failed/canceled it sends a status request
  /// - The new status is persisted and returned
  Future<TransactionStatus> _maybeUpdateToCosmosTransactionStatus(
      final Transaction transaction) async {
    if (transaction.status == TransactionStatus.preparing ||
        transaction.status == TransactionStatus.pending) {
      final TransactionStatus? updatedStatus =
          await _requestToCosmosTransactionStatus(transaction);
      transaction.status = updatedStatus ?? transaction.status;
      transaction.isRequestRunning = false;
      return transaction.status;
    } else {
      return transaction.status;
    }
  }

  Future<TransactionStatus?> _requestToCosmosTransactionStatus(
    final Transaction transaction,
  ) async {
    try {
      final qTxRes =
          await CosmosRPCService.queryTx(Uri.parse(transaction.statusUrl));

      // [TESTING]
      // final qTxRes =
      //     await _TransactionStatusRequestMockerFactory.getStatus(transaction.id);

      dlog(
          "T-hash: ${transaction.id}, found: ${qTxRes.found}, success: ${qTxRes.success}",
          "_requestToCosmosTransactionStatus");
      TransactionStatus tsStatus = translateTxResponseToTransactionStatus(
          response: qTxRes, toAddress: transaction.toAddress);
      return tsStatus;
    } catch (e, s) {
      dlogError(
          error: e, stackTrace: s, prefix: "_requestToCosmosTransactionStatus");
      return null;
    }
  }

  /// Request status updates for cancelation transactions that are not finished yet.
  /// Practically rare but just in case.
  Future<void> _updateUnfinishedCancelationTransactions(
      final Iterable<Transaction> unfinishedCancelationTransactions) async {
    dlog(
        "Unfinished cancelation trannsactions: ${unfinishedCancelationTransactions.map((e) => e.id)}",
        "_updateUnfinishedCancelationTransactions");

    if (unfinishedCancelationTransactions.isNotEmpty) {
      await Future.wait(unfinishedCancelationTransactions
          .map((e) => _updateCancelationStatus(e)));
    }
  }

  Future<void> _updateCancelationStatus(final Transaction t) async {
    // only GRA>ETH transactions are cancellable
    if (!isMetamaskWalletAddress(t.toAddress) || t.cancelation == null) {
      return;
    }

    final cancelationStatusUrl =
        CosmosRPCService.rpcUrlFromHash(Config.keplr.rpc, t.cancelation!.hash);
    final cancelationStatusResponse = await KeplrService.pollForTransaction(
        t.cancelation!.hash, Config.keplr.rpc);

    if (cancelationStatusResponse.found) {
      if (cancelationStatusResponse.success) {
        t.status = TransactionStatus.canceled;
        dlog(
            "Response: Cancelation-Success for Transaction ${t.id}, cancel-status-url: $cancelationStatusUrl");
      } else {
        t.cancelation!.errorMessage = cancelationStatusResponse.message;
        dlogError(
            message:
                "Response: Cancelation-FAIL for Transaction ${t.id}, found=TRUE/success=FALSE, cancel-status-url: $cancelationStatusUrl");
      }
    } else //if (!cancelationStatusResponse.found)
    {
      // Should practically never happen.
      // After at most 30s a cancelation transaction should be done.
      // Nevertheless, here the status is left to [TransactionStatus.preparing] so that later a request is sent again.
      dlogError(
        message:
            "Response: Cancelation-FAIL for Transaction ${t.id}, found=FALSE, cancel-status-url: $cancelationStatusUrl",
      );
    }
  }

  /// Cancel transactions of type Grav2Eth and that are not batched yet ([TransactionStatus.preparing]).
  /// For other transactions it does nothing.
  Future<void> cancelNonbatchedTransaction(
    BuildContext context,
    final Transaction t, {
    required WalletType fromWalletType,
    required Chain fromChain,
    required String transferAmount,
    required WidgetRef ref,
  }) async {
    // only GRA>ETH transactions with status preparing are cancellable
    if (t.status != TransactionStatus.preparing ||
        !isMetamaskWalletAddress(t.toAddress) ||
        t.cancelation != null) {
      return;
    }
    t.isRequestRunning = true;
    notifyListeners();

    try {
      /// send cancelation request, which returns the cancelation-transaction hash
      final id64 = await GravityService().getTransactionIdByTxHash(t.id);
      final cancelTxHash = await KeplrService.signCancelSendToEthTxAmino(
        id64,
        t.fromAddress,
        fromWalletType,
        fromChain,
        transferAmount,
        ref,
      );
      dlog("Cancelation registered successfully for Transaction ${t.id}");

      /// Check cancelation status. Can be only completed, or failed (unknown error).
      t.cancelation = TransactionCancelation(cancelTxHash);
      await _updateCancelationStatus(t);
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) => getTransactionProgressDialog(
          context: context,
          title: S.current.TRANSACTION_HISTORY_CANCEL_ERROR_DIALOG_TITLE,
          content: Column(
            children: [
              ImageNetworkOrAssetWidget(
                svgAssetAsString: true,
                imageUrl: SvgAssetsAsString.uiIconsStateCanceled,
                width: Sizes.iconSize64,
                height: Sizes.iconSize64,
                color: Theme.of(context).colorScheme.onError,
              ),
              const SizedBox(height: Sizes.padding16),
              Text(
                e.toString(),
              ),
              const SizedBox(height: Sizes.padding16),
            ],
          ),
          importButton: null,
        ),
      );
    }

    _saveToPrefs();

    t.isRequestRunning = false;
    notifyListeners();
  }

  void startConfirmationUpdates({
    required final Transaction transaction,
    final Duration every = const Duration(seconds: 60),
    final int untilConfirmations = 96,
  }) async {
    final Transaction savedTransaction =
        transactions.firstWhere((t) => t.id == transaction.id);
    int? confirmations =
        await (MetamaskService.getTransactionByHash(hash: transaction.id)
            .then((value) => value?.confirmations));
    savedTransaction.confirmations = confirmations;
    notifyListeners();

    if (savedTransaction.confirmations != null &&
        savedTransaction.confirmations! < untilConfirmations &&
        (savedTransaction._periodicConfirmationUpdateTimer == null ||
            !savedTransaction._periodicConfirmationUpdateTimer!.isActive)) {
      savedTransaction._periodicConfirmationUpdateTimer = Timer.periodic(
        every,
        (timer) async {
          confirmations = await (MetamaskService.getTransactionByHash(
                  hash: savedTransaction.id)
              .then((value) => value?.confirmations));
          savedTransaction.confirmations = confirmations;
          notifyListeners();
          if (savedTransaction.confirmations == null ||
              savedTransaction.confirmations! >= untilConfirmations) {
            timer.cancel();
          }
        },
      );
    }
  }

  void stopConfirmationUpdates({
    required final Transaction transaction,
  }) {
    final Transaction savedTransaction =
        transactions.firstWhere((t) => t.id == transaction.id);
    savedTransaction._periodicConfirmationUpdateTimer?.cancel();
  }
}

class Transaction {
  final String id;

  /// Time of transaction creation in local time
  final DateTime timeStamp;

  /// token amount in double format
  final String amount;
  final String fee; // data type of the fee is int
  final String fromAddress;
  final String toAddress;
  final String symbol;
  final String iconUrl;
  final int decimals;
  final String tokenName;
  TransactionStatus status;
  final double durationInHours;
  int? confirmations;
  Timer? _periodicConfirmationUpdateTimer;

  /// is a http-request running for this transaction
  bool isRequestRunning = false;

  /// url used to request status updates
  final String statusUrl;

  TransactionCancelation? cancelation;

  double get remainingHours => _getRemainingHours(
      transactionStatus: status,
      transactionTimeStamp: timeStamp,
      transactionDurationInHours: durationInHours);

  bool get isFromEth => isMetamaskWalletAddress(fromAddress);

  bool get isFromCosmos => isKeplrWalletAddress(fromAddress);

  bool get isInProgress =>
      ((fromAddress.isEmpty || isFromCosmos) &&
          status != TransactionStatus.completed &&
          status != TransactionStatus.failed &&
          status != TransactionStatus.canceled) ||
      (isFromEth &&
          status != TransactionStatus.failed &&
          (confirmations ?? 0) < 96);

  Transaction({
    required this.id,
    required this.amount,
    required this.fee,
    required this.fromAddress,
    required this.toAddress,
    required this.statusUrl,
    required this.symbol,
    required this.iconUrl,
    required this.decimals,
    required this.tokenName,
    this.durationInHours = 0.0,
    TransactionStatus? status,
    this.confirmations,
  })  : status = status ?? TransactionStatus.preparing,
        timeStamp = DateTime.now();

  Transaction.fromJson(Map json)
      : id = json["id"] ?? "",
        timeStamp = DateTime.fromMillisecondsSinceEpoch(json["timeStamp"]),
        amount = json["amount"] ?? "", // data type of the amount is double
        fee = json["fee"] ?? "", // data type of the fee is int
        fromAddress = json["fromAddress"] ?? "",
        toAddress = json["address"] ?? "",
        statusUrl = json["statusUrl"] ?? "",
        symbol = json["symbol"] ?? "MAX",
        iconUrl = json["iconUrl"] ?? "",
        decimals = json["decimals"] ?? 0,
        tokenName = json["tokenName"] ?? "",
        status = json["status"] != null
            ? TransactionStatus.values.byName(json["status"])
            : TransactionStatus.preparing,
        cancelation = (json["cancelTransactionHash"] != null)
            ? TransactionCancelation(json["cancelTransactionHash"])
            : null,
        durationInHours = json["durationInHours"] ?? 0.0;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "timeStamp": timeStamp.millisecondsSinceEpoch,
      "amount": amount,
      "fee": fee,
      "fromAddress": fromAddress,
      "address": toAddress,
      "statusUrl": statusUrl,
      "symbol": symbol,
      "iconUrl": iconUrl,
      "decimals": decimals,
      "tokenName": tokenName,
      "status": status.name,
      "cancelTransactionHash": cancelation?.hash,
      "durationInHours": durationInHours,
    };
  }

  Transaction copyWith({
    final double? durationInHours,
  }) {
    return Transaction(
      id: id,
      amount: amount,
      fee: fee,
      fromAddress: fromAddress,
      toAddress: toAddress,
      statusUrl: statusUrl,
      symbol: symbol,
      iconUrl: iconUrl,
      decimals: decimals,
      tokenName: tokenName,
      durationInHours: durationInHours ?? this.durationInHours,
    );
  }
}

class TransactionCancelation {
  /// Hash of the cancelation-transaction for this transaction.
  /// Used to build a url and request updates on the cancelation status.
  final String hash;

  /// If non-null an error happened during cancelation with message [errorMessage]
  String? errorMessage;
  TransactionCancelation(this.hash);
}

/// Mocker of a transaction-status request.
///
/// Each time [getStatus()] is called, it returns a response with the next code for that [transactionId]; so for each call for a transactionId it iterates through the TransactionStatus values.
// ignore: unused_element
class _TransactionStatusRequestMockerFactory {
  static const _key = "test_request_history";

  /// Each time this method is called, it returns a response with the next code for that [transactionId]
  // ignore: unused_element
  static Future<CommonQueryTxResponse> getStatus(
      final String transactionId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? ser = prefs.getString(_key);
    late Map<String, dynamic> transactionStatusCodes;
    if (ser != null && ser.isNotEmpty) {
      final desMap = jsonDecode(ser) as Map<String, dynamic>;
      transactionStatusCodes = desMap;
    } else {
      transactionStatusCodes = {};
    }

    int code = transactionStatusCodes.putIfAbsent(transactionId, () => -1);
    code++;
    if (code == TransactionStatus.values.length) code--;
    transactionStatusCodes[transactionId] = code;

    await prefs.setString(_key, jsonEncode(transactionStatusCodes));

    await Future.delayed(const Duration(seconds: 3));

    switch (code) {
      case 0:
        return CommonQueryTxResponse(false, false, "", "");
      default:
        return CommonQueryTxResponse(true, true, "", "");
    }
  }
}

double _getRemainingHours({
  required final TransactionStatus transactionStatus,
  required final DateTime transactionTimeStamp,
  required final double transactionDurationInHours,
}) {
  if (transactionDurationInHours == 0.0 ||
      transactionStatus == TransactionStatus.completed ||
      transactionStatus == TransactionStatus.failed ||
      transactionStatus == TransactionStatus.canceled) {
    return 0.0;
  } else {
    final Duration durationSinceTransaction =
        DateTime.now().difference(transactionTimeStamp);
    final double hoursSinceTransaction =
        durationSinceTransaction.inMinutes / 60;
    return (transactionDurationInHours - hoursSinceTransaction)
        .clamp(0.0, double.infinity);
  }
}

String getRemainingBatchTimeString(final Transaction transaction) {
  return "~ ${transaction.remainingHours.floor()}:${((transaction.remainingHours - transaction.remainingHours.floor()) * 60).round().toString().padLeft(2, '0')} hrs";
}
