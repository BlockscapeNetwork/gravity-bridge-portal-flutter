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

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/pages/approval_process_dialog/approval_process_page.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_state.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/amount_of_transfer_field.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/pushable_outlined_button.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/transfer_address_field.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/alert_field.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils/debouncer.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/alert_dialog_outlined_button.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/alert_widget.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/transaction_progress_dialog/transaction_progress_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/main_page_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/enums/erc20_approval_state.dart';
import '../../../models/token_info.dart';
import '../../../utils.dart';
import '../../select_token_dialog/select_token_page.dart';

final _debouncer = Debouncer();

class MetamaskContainerWidget extends ConsumerStatefulWidget {
  const MetamaskContainerWidget({Key? key}) : super(key: key);

  @override
  _MetamaskContainerWidget createState() => _MetamaskContainerWidget();
}

class _MetamaskContainerWidget extends ConsumerState<MetamaskContainerWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dlog('build()', "MetamaskContainer");
    ref.listen<MetamaskState>(
        metamaskProvider, _listenForMetamaskProviderChanges);
    ref.listen<GravityBridgeState>(
        gravityBridgeProvider, _listenForGBProviderChanges);

    final state = ref.watch(metamaskProvider);
    final fromAddress =
        ref.watch(gravityBridgeProvider.select((value) => value.fromAddress));
    final isWrongNetwork =
        state.network != null && state.network != Config.metamask.networkID;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _amountTokenSelector(state),
          const SizedBox(height: Sizes.padding32),
          _TransferAddressSelector(),
          const SizedBox(height: Sizes.paddingLarge),
          AlertField(
            text: TextSpan(text: S.current.WARNING_MESSAGE),
          ),
          ..._wrongNetworkWarning(isWrongNetwork),
          const SizedBox(height: Sizes.padding32),
          _permissionButton(
            fromAddress: fromAddress,
            readyToConfirm: state.readyToConfirm,
            isRemainingApprovalAmountEnough:
                state.isRemainingApprovalAmountEnough,
            token: state.token,
          ),
          _confirmButton(
            isRemainingApprovalAmountEnough:
                state.isRemainingApprovalAmountEnough,
            readyToConfirm: state.readyToConfirm,
          ),
          isMobile(context)
              ? _permissionHintForMobile(
                  walletAddress: fromAddress,
                  token: state.token,
                )
              : Container()
        ],
      ),
    );
  }

  List<Widget> _wrongNetworkWarning(bool isWrongNetwork) {
    if (!isWrongNetwork) {
      return [
        Container(),
      ];
    }

    return [
      const SizedBox(height: Sizes.paddingMicro),
      GravityBridgeContainer(
          padding: const EdgeInsets.all(Sizes.paddingMicro),
          color: Theme.of(context).backgroundColor,
          borderColor: Theme.of(context).colorScheme.error,
          child: ListTile(
            title: Text(
              S.current.WRONG_NETWORK_WARNING(Config.metamask.networkName),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: Sizes.fontSizeSmall),
            ),
            leading: SizedBox(
                height: double.infinity,
                child: ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsAttention,
                  color: Theme.of(context).colorScheme.error,
                  height: Sizes.iconSizeMedium,
                  width: Sizes.iconSizeMedium,
                )),
          ))
    ];
  }

  Widget _amountTokenSelector(MetamaskState state) {
    return AmountOfTransferField(
      // this selectedTokenExist is required for KeplrContainer, so set it default to true
      selectedTokenExist: true,
      currentBalance: state.currentBalance,
      controller: ref.read(metamaskProvider.notifier).amountController,
      decimals: state.decimals,
      disabledInput:
          ref.watch(gravityBridgeProvider.select((s) => s.fromAddress)).isEmpty,
      action: SelectTokenButton(
        defaultText: S.current.SELECT_TOKEN,
      ),
      validatorMessage: state.validatorMessage,
    );
  }

  Widget _permissionButton({
    required String fromAddress,
    required bool readyToConfirm,
    required bool isRemainingApprovalAmountEnough,
    required TokenInfo? token,
  }) {
    if (isMetamaskWalletAddress(fromAddress) && token != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: Sizes.paddingSmall),
        child: DisabledWidget(
          disabled: !readyToConfirm,
          child: isMobile(context)
              ? PushableOutlinedButton(
                  width: double.infinity,
                  height: Sizes.givePermissionButtonHeight,
                  isPushed: isRemainingApprovalAmountEnough,
                  fontSize: Sizes.fontSizeMedium,
                  text: isRemainingApprovalAmountEnough
                      ? S.current.PERMISSION_GIVEN
                      : S.current.GIVE_PERMISSION_FOR_TOKEN(
                          token.symbol.toUpperCase()),
                  onPressed: isRemainingApprovalAmountEnough
                      ? null
                      : () => context.read(metamaskProvider.notifier).approve(),
                )
              : Badge(
                  badgeColor: Theme.of(context).backgroundColor,
                  elevation: 0,
                  position: const BadgePosition(
                    top: 0,
                    end: 3,
                  ),
                  badgeContent: Tooltip(
                    message: S.current.GIVE_PERMISSION_FOR_TOKEN_HINT,
                    child: ImageNetworkOrAssetWidget(
                      svgAssetAsString: true,
                      imageUrl: SvgAssetsAsString.uiIconsInfo,
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  child: PushableOutlinedButton(
                    width: double.infinity,
                    height: Sizes.givePermissionButtonHeight,
                    isPushed: isRemainingApprovalAmountEnough,
                    fontSize: Sizes.fontSizeMedium,
                    text: isRemainingApprovalAmountEnough
                        ? S.current.PERMISSION_GIVEN
                        : S.current.GIVE_PERMISSION_FOR_TOKEN(
                            token.symbol.toUpperCase()),
                    onPressed: isRemainingApprovalAmountEnough
                        ? null
                        : () =>
                            context.read(metamaskProvider.notifier).approve(),
                  ),
                ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _permissionHintForMobile({
    required String walletAddress,
    required TokenInfo? token,
  }) {
    if (isMetamaskWalletAddress(walletAddress) && token != null) {
      return Column(
        children: [
          const SizedBox(height: Sizes.padding24),
          TextButton(
            child: Row(
              children: [
                Text(
                  S.current.GIVE_PERMISSION_TITLE_FOR_MOBILE,
                  style: TextStyle(
                    fontSize: Sizes.fontSizeMedium,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 5),
                ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsLaunch,
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 16,
                  height: 16,
                ),
              ],
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return customAlertDialog(
                      context: context,
                      title: Text(
                        "${S.current.GIVE_PERMISSION_TITLE_FOR_MOBILE}?",
                        style: const TextStyle(
                          fontSize: Sizes.fontSizeMedium,
                        ),
                      ),
                      content: Text(
                        S.current.GIVE_PERMISSION_FOR_TOKEN_HINT,
                        style: const TextStyle(
                          fontSize: Sizes.fontSizeSmall,
                        ),
                      ),
                      actions: [
                        Expanded(child: Container()),
                        ElevatedButton(
                          child: const Text("OK"),
                          onPressed: () => Navigator.maybePop(context),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _confirmButton({
    required bool readyToConfirm,
    required bool isRemainingApprovalAmountEnough,
  }) {
    return DisabledWidget(
      disabled: !readyToConfirm || !isRemainingApprovalAmountEnough,
      child: PushableOutlinedButton(
        width: double.infinity,
        height: Sizes.beginTransferButtonHeight,
        text: S.current.BEGIN_TRANSFER,
        onPressed: () => _beginTransfer(),
      ),
    );
  }

  void _beginTransfer() async {
    if (_formKey.currentState!.validate()) {
      showMainPageDialog(
        context,
        onCancel: () {},
        title: const Text("Notice"),
        content: Column(
          children: [
            Text(
              S.current.NOTICE,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                    child: Text(
                      "CLI Instructions",
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  onTap: () async {
                    await launchUrl(Uri.parse(Constants.cliInstructions));
                  },
                ),
              ),
            ])
          ],
        ),
        actions: [
          AlertDialogOutlinedButton(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Text(S.current.CANCEL,
                style: Theme.of(context).textTheme.button),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          AlertDialogOutlinedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    S.current.APPROVE_TRANSFER,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Icon(Icons.arrow_right_outlined,
                    color: Theme.of(context).colorScheme.onPrimary)
              ],
            ),
            onPressed: () {
              ref.read(metamaskProvider.notifier).confirm(context);
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
  }

  void _listenForGBProviderChanges(
    GravityBridgeState? oldState,
    GravityBridgeState currentState,
  ) {
    if (oldState?.toAddress != currentState.toAddress &&
        _formKey.currentState != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _formKey.currentState!.validate();
      });
    }
  }

  void _listenForMetamaskProviderChanges(
    MetamaskState? oldState,
    MetamaskState currentState,
  ) {
    if (oldState?.transactionProgress != currentState.transactionProgress &&
        currentState.transactionProgress != null &&
        currentState.transactionProgress is TransactionStarted) {
      showTransferProgressDialog(context, ref, TransferType.eth2fwd);
    } else if (currentState.ec20approvalState == Ec20ApprovalState.start) {
      ApprovalProcessDialogWidget.showApprovalProcessDialog(context, ref);
    }
  }
}

class _TransferAddressSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromAddress =
        ref.watch(gravityBridgeProvider.select((value) => value.fromAddress));
    final transferType =
        ref.watch(gravityBridgeProvider.select((value) => value.transferType));
    final toChain =
        ref.watch(gravityBridgeProvider.select((value) => value.toChain));
    final bool isWidgetDisabled = fromAddress.isEmpty;
    final bool isInputEnabled = toChain == Chain.canto;

    return TransferAddressField(
      isWidgetDisabled: isWidgetDisabled,
      isInputEnabled: isInputEnabled,
      controller: ref.read(gravityBridgeProvider.notifier).toAddressController,
      transferType: transferType,
      onChanged: (val) {
        _debouncer.run(
          () => ref.read(gravityBridgeProvider.notifier).setToAddress(val),
        );
      },
      transferChain: toChain,
    );
  }
}
