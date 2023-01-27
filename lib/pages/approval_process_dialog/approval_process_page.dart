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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';

import '../../assets.dart';
import '../../generated/l10n.dart';
import '../../models/enums/erc20_approval_state.dart';
import '../../widgets/buttons/alert_dialog_outlined_button.dart';

import '../gravity_bridge/type_metamask/metamask_provider.dart';
import 'approval_process_service.dart';

class ApprovalProcessDialogWidget extends ConsumerWidget {
  const ApprovalProcessDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(metamaskProvider);
    String content = '';
    String title = S.current.PENDING_APPROVAL;
    bool closeButton = false;

    switch (state.ec20approvalState) {
      case Ec20ApprovalState.start:
        ref.read(approvalProcessProvider).initApprovalTimerCheck(state.token!);
        title = S.current.APPROVAL_START_TITLE;
        content = S.current.APPROVAL_START;
        break;

      case Ec20ApprovalState.pending:
        title = S.current.PENDING_APPROVAL;
        content = S.current.PENDING_APPROVAL;
        break;

      case Ec20ApprovalState.pendingLong:
        title = S.current.PENDING_APPROVAL;
        content = S.current.PENDING_APPROVAL_LONG;
        closeButton = true;
        break;

      case Ec20ApprovalState.complete:
        title = S.current.APPROVAL_COMPLETE_TITLE;
        content = S.current.APPROVAL_COMPLETE;
        closeButton = true;
        break;

      case Ec20ApprovalState.error:
        title = S.current.ERROR_DIALOG_TITLE;
        content = S.current.ERROR_APPROVAL;
        closeButton = true;
        break;

      case Ec20ApprovalState.init:
      default:
        debugPrint("Initstate reached.");
        break;
    }

    return AlertDialog(
      actions: closeButton ? [_cancelButton(context, ref)] : null,
      title: Text(title),
      content: Container(
          constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ..._showStatusIcon(context, state.ec20approvalState!),
              SizedBox(
                width: double.infinity,
                child: Text(content),
              ),
            ],
          )),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.radius)),
    );
  }

  static showApprovalProcessDialog(BuildContext context, WidgetRef ref) {
    if (ref.read(approvalProcessProvider).isDialogOpen()) {
      return;
    }

    ref.read(approvalProcessProvider).setDialogState();

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const ApprovalProcessDialogWidget(),
    ).then((_) => ref.read(approvalProcessProvider).resetApprovalData());
  }

  List<Widget> _showStatusIcon(
      BuildContext context, Ec20ApprovalState approvalState) {
    Widget icon;
    List<Widget> result;
    if (approvalState == Ec20ApprovalState.error) {
      icon = Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.onError,
        size: 64.0,
      );
    } else if (approvalState == Ec20ApprovalState.complete) {
      icon = Icon(
        Icons.check_circle,
        color: Theme.of(context).colorScheme.inverseSurface,
        size: 64.0,
      );
    } else if (approvalState == Ec20ApprovalState.start) {
      icon = const Image(image: AssetImage(Assets.logoMetamask));
    } else {
      icon = const Center(child: CircularProgressIndicator());
    }

    result = [
      icon,
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
    ];

    return result;
  }

  Widget _cancelButton(BuildContext context, WidgetRef ref) {
    return AlertDialogOutlinedButton(
      child: Text(
        S.current.OK,
        style: Theme.of(context).textTheme.button,
      ),
      onPressed: () async {
        _closeDialog(context, ref);
      },
    );
  }

  void _closeDialog(BuildContext context, WidgetRef ref) {
    final metamaskProviderNotifier = ref.read(metamaskProvider.notifier);
    metamaskProviderNotifier.updateTokenApprovalAmount();
    Navigator.of(context).pop();
  }
}
