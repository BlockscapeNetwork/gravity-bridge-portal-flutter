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
import 'package:gravity_bridge_flutter/pages/swap_eth/swap_eth_provider.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/main_page_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/transaction_progress_dialog/transaction_progress_dialog.dart';

import '../../assets.dart';
import '../../constants.dart';
import '../../generated/l10n.dart';
import '../../services/metamask_service.dart';
import '../../widgets/dialogs/alert_widget.dart';
import '../../widgets/disabled_widget.dart';
import '../../widgets/dialogs/main_page_dialog.dart';
import '../../widgets/dialogs/multi_page_dialog.dart';
import '../../widgets/buttons/select_button.dart';
import '../gravity_bridge/gravity_bridge_provider.dart';
import '../gravity_bridge/widgets/amount_of_transfer_field.dart';
import '../gravity_bridge/widgets/image_network_or_asset_widget.dart';
import '../gravity_bridge/widgets/pushable_outlined_button.dart';

class SwapEthPage extends ConsumerWidget {
  const SwapEthPage({Key? key}) : super(key: key);

  reactToStatusChange(SwapEthState state, WidgetRef ref, BuildContext context) {
    final bool waiting = state.step == SwapStep.awaitingConfirmation ||
        state.step == SwapStep.created;
    final multiPageDialogNotifier = ref.read(multiPageDialogProvider.notifier);
    if (waiting) {
      multiPageDialogNotifier.setShowBackButton(false);
      multiPageDialogNotifier.setShowCloseButton(false);
    } else {
      multiPageDialogNotifier.setShowBackButton(true);
      multiPageDialogNotifier.setShowCloseButton(true);
    }

    switch (state.step) {
      case SwapStep.userRejected:
        break;
      case SwapStep.insufficientFunds:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => customAlertDialog(
            context: context,
            title: Text(S.current.SWAP_INSUFFICIENT_FUNDS_TITLE),
            content: Text(S.current.SWAP_INSUFFICIENT_FUNDS_DESC),
            actions: [_OKButton()],
          ),
        );
        break;
      case SwapStep.creationError:
        showMainPageErrorDialog(
          context,
          onCancel: () {},
          title: Text(S.current.SWAP_CREATE_ERROR_TITLE),
          content: Text(S.current.SWAP_CREATE_ERROR_DESC(state.error!)),
          actions: [_OKButton()],
        );
        break;
      case SwapStep.successful:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return customAlertDialog(
              context: context,
              title: Text(S.current.SWAP_SUCCESS_TITLE),
              content: Text(S.current.SWAP_SUCCESS_DESC),
              actions: [_OKButton()],
            );
          },
        );
        break;
      case SwapStep.unSuccessful:
        showMainPageErrorDialog(
          context,
          onCancel: () {},
          title: Text(S.current.SWAP_FAIL_TITLE),
          content: Text(S.current.SWAP_FAIL_DESC),
          actions: [_OKButton()],
        );
        break;
      case SwapStep.successUnknown:
        showMainPageErrorDialog(
          context,
          onCancel: () {},
          title: Text(S.current.SWAP_STATUS_UNKNOWN_TITLE),
          content: Text(S.current.SWAP_STATUS_UNKNOWN_DESC),
          actions: [_OKButton()],
        );
        break;
      case SwapStep.statusRequestError:
        showMainPageErrorDialog(
          context,
          onCancel: () {},
          title: Text(S.current.SWAP_STATUS_REQUEST_ERROR_TITLE),
          content: Text(S.current.SWAP_STATUS_REQUEST_ERROR_DESC(state.error!)),
          actions: [_OKButton()],
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      swapEthProvider,
      (SwapEthState? previous, SwapEthState next) {
        if (previous?.step != next.step) {
          reactToStatusChange(next, ref, context);
        }
      },
    );
    return Center(
      child: FutureBuilder(
        future: MetamaskService.requestEthBalanceInWei(),
        builder: (context, AsyncSnapshot<BigInt?> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: AmountOfTransferField(
                    // this selectedTokenExist is required for KeplrContainer, so set it default to true
                    selectedTokenExist: true,
                    currentBalance:
                        snapshot.data != null ? "${snapshot.data}" : null,
                    decimals: 18,
                    controller: ref
                        .read(swapEthProvider.notifier)
                        .textEditingController,
                    disabledInput: false,
                    inputFillColor: Theme.of(context).colorScheme.tertiary,
                    textStyle: Theme.of(context).textTheme.headline6,
                    action: SizedBox(
                      width: isMobile(context)
                          ? double.infinity
                          : Sizes.fixedButtonWidthLarge,
                      child: SelectButton(
                        text: isMobile(context) ? "Ethereum" : "ETH",
                        isSelected: true,
                        prefix: const Padding(
                          padding: EdgeInsets.only(right: Sizes.paddingMicro),
                          child: ImageNetworkOrAssetWidget(
                            imageUrl: Assets.logoEthereum,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                _StatusMessage(),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _EtherScanButton(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: _SwapButton(),
                    ),
                  ],
                ),
              ],
            );
          }
          // sometimes Metamask throws an RPC-error
          else if (snapshot.hasError) {
            return Text("Please re-open this page."
                "\nMetamask threw Error:\n${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class _StatusMessage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(swapEthProvider.select((value) => value.step));
    String message = "";
    switch (step) {
      case SwapStep.created:
        message = "Transaction created, waiting for its completion...";
        break;
      default:
        message = "";
        break;
    }
    return Text(message);
  }
}

class _SwapButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(swapEthProvider.select((value) => value.step));
    final bool waiting =
        step == SwapStep.awaitingConfirmation || step == SwapStep.created;

    return DisabledWidget(
      disabled: step == SwapStep.notReady,
      child: PushableOutlinedButton(
        text: S.current.SWAP,
        width: double.infinity,
        prefix: waiting
            ? SizedBox.square(
                dimension: 25,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
              )
            : null,
        isPushed: waiting,
        onPressed: waiting
            ? null
            : () => ref
                .read(swapEthProvider.notifier)
                .transferEtherToErc20Contract(Constants.wethContractAddress),
      ),
    );
  }
}

class _EtherScanButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(swapEthProvider.select((value) => value.step));
    final String txHash =
        ref.watch(swapEthProvider.select((value) => value.txHash));

    if (step.index > SwapStep.awaitingConfirmation.index) {
      return generateScanButton(
        context: context,
        hash: txHash,
        fromAddress: ref.read(gravityBridgeProvider).fromAddress,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _OKButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("OK"),
      onPressed: () => Navigator.maybePop(context),
    );
  }
}
