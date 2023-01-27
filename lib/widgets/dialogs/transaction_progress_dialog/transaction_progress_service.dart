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

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';

import 'package:js/js_util.dart' as js;

final transactionProgressProvider = Provider(
    (ref) => TransactionProgressService(ref.read(metamaskProvider.notifier)));

class TransactionProgressService {
  final MetamaskNotifier metamaskNotifier;

  TransactionProgressService(this.metamaskNotifier);

  bool _isDialogOpen = false;
  bool _transactionInProgress = false;

  void setIsDialogIsOpen({bool open = true}) {
    _isDialogOpen = open;
  }

  bool isDialogOpen() {
    return _isDialogOpen;
  }

  void initTransactionTimerCheck(TransactionStarted transaction) async {
    if (_transactionInProgress) {
      debugPrint("Transaction already in progress");
      return;
    }

    _transactionInProgress = true;
    TransactionInProgress _progress;

    while (_transactionInProgress) {
      try {
        _progress = await MetamaskService.getTransactionProgressByHash(
            transaction.tokenContract, transaction.hash);

        metamaskNotifier.updateTransactionState(_progress);

        if (_progress.transactionIndex.isNotEmpty) {
          _transactionInProgress = false;

          metamaskNotifier
              .updateTransactionState(TransactionComplete(transaction.hash));
        }

        await Future.delayed(const Duration(seconds: 5));
      } catch (e) {
        final errorMessage = js.getProperty(e, "message");
        _transactionInProgress = false;

        metamaskNotifier.updateTransactionState(
            TransactionError(transaction.hash, errorMessage));
      }
    }
  }

  void resetTransactionData() {
    metamaskNotifier.updateTransactionState(TransactionInitialValue());
    _transactionInProgress = false;
    setIsDialogIsOpen(open: false);
  }
}
