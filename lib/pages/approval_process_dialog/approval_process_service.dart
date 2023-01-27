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
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';

import '../../models/enums/erc20_approval_state.dart';
import '../../models/token_info.dart';

final approvalProcessProvider = Provider(
    (ref) => ApprovalProcessService(ref.read(metamaskProvider.notifier)));

class ApprovalProcessService {
  final MetamaskNotifier metamaskProvider;

  ApprovalProcessService(this.metamaskProvider);

  bool _isDialogOpen = false;
  bool _approvalInProgress = false;

  void setDialogState({bool open = true}) {
    _isDialogOpen = open;
  }

  bool isDialogOpen() {
    return _isDialogOpen;
  }

  void initApprovalTimerCheck(TokenInfo tokenInfo) async {
    if (_approvalInProgress) {
      debugPrint("Transaction already in progress");
      return;
    }

    debugPrint("starting approval check");

    _approvalInProgress = true;
    String _progress;
    int _checked = 0;

    try {
      await MetamaskService.erc20Approve(tokenInfo.address,
          BigInt.parse(Constants.erc20MaxApprovableTransferTotal));
    } catch (e) {
      metamaskProvider.updateApprovalState(Ec20ApprovalState.error);
      return;
    }

    while (_approvalInProgress) {
      debugPrint("checking approval status $_checked");
      try {
        _checked++;
        _progress = await MetamaskService.erc20CheckApproval(tokenInfo.address);

        metamaskProvider.updateApprovalState(Ec20ApprovalState.pending);

        if (_progress != '0') {
          metamaskProvider.updateApprovalState(Ec20ApprovalState.complete);
          _approvalInProgress = false;
          debugPrint('Approval complete');
          break;
        }

        if (_checked > 4) {
          metamaskProvider.updateApprovalState(Ec20ApprovalState.pendingLong);
        }

        await Future.delayed(const Duration(seconds: 2));
      } catch (e) {
        _approvalInProgress = false;

        metamaskProvider.updateApprovalState(Ec20ApprovalState.error);
      }
    }
  }

  void resetApprovalData() {
    metamaskProvider.updateApprovalState(Ec20ApprovalState.init);
    _approvalInProgress = false;
    setDialogState(open: false);
  }
}
