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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/bridge_fee_selector.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/keplr_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/amount_of_transfer_field.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/pushable_outlined_button.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/transfer_address_field.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/alert_field.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_service.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_state.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils/bridge_fee_type_translation.dart';
import 'package:gravity_bridge_flutter/utils/debouncer.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/alert_dialog_outlined_button.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/transaction_progress_dialog/transaction_progress_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/main_page_dialog.dart';

import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_page.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_state.dart';

final _debouncer = Debouncer();
final _formKey = GlobalKey<FormState>();

class KeplrContainerWidget extends ConsumerWidget {
  const KeplrContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void _listenForGBProviderChanges(
      GravityBridgeState? oldState,
      GravityBridgeState currentState,
    ) {
      if (oldState?.toAddress != currentState.toAddress) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _formKey.currentState!.validate();
        });
      }
    }

    void _listenForKeplrProviderChanges(
      KeplrState? oldState,
      KeplrState currentState,
    ) {
      if (currentState.transactionProgress is TransactionStarted) {
        showTransferProgressDialog(
          context,
          ref,
          ref.read(gravityBridgeProvider).transferType,
        );
      }
    }

    dlog("build()", "KeplrContainer");
    final transferType =
        ref.watch(gravityBridgeProvider.select((value) => value.transferType));
    ref.listen(gravityBridgeProvider, _listenForGBProviderChanges);
    ref.listen<KeplrState>(keplrProvider, _listenForKeplrProviderChanges);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _AmountTokenSelector(),
          const SizedBox(height: Sizes.padding32),
          _TransferAddressSelector(),
          if (transferType == TransferType.gra2eth ||
              transferType == TransferType.eth2fwd)
            const SizedBox(height: Sizes.padding32),
          if (transferType == TransferType.gra2eth) _BridgeFeeSelector(),
          const SizedBox(height: Sizes.padding32),
          AlertField(
            text: TextSpan(text: S.current.WARNING_MESSAGE),
          ),
          const SizedBox(height: Sizes.padding32),
          _ConfirmButton(),
        ],
      ),
    );
  }
}

class _AmountTokenSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferType =
        ref.watch(gravityBridgeProvider.select((value) => value.transferType));
    final fromAddress =
        ref.watch(gravityBridgeProvider.select((value) => value.fromAddress));
    final keplrState = ref.watch(keplrProvider);
    final isMetamaskConnected = ref.watch(
        metamaskProvider.select((value) => value.isMetamaskCardConnected));
    final bool isEnabled = fromAddress.isNotEmpty &&
        ((transferType == TransferType.ibc2gra && isMetamaskConnected) ||
            keplrState.isKeplrCardConnected);

    return AmountOfTransferField(
      selectedTokenExist: keplrState.token != null
          ? ref
              .read(selectTokenProvider.notifier)
              .keplrTokenExistInWallet(keplrState.token)
          : false,
      controller: ref.read(keplrProvider.notifier).transferAmountController,
      decimals: keplrState.decimals,
      disabledInput: !isEnabled,
      currentBalance: keplrState.availableAmountAndHintText![0],
      balanceHint: keplrState.availableAmountAndHintText![1],
      validatorMessage: keplrState.validatorMessage,
      action: SelectTokenButton(
        defaultText: S.current.SELECT_TOKEN,
      ),
    );
  }
}

class _BridgeFeeSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TokenInfo? token =
        ref.watch(keplrProvider.select((value) => value.token));
    final selectedBridgeFee =
        ref.watch(keplrProvider.select((value) => value.selectedBridgeFee));
    final bridgeFeeOptions =
        ref.watch(keplrProvider.select((value) => value.bridgeFeeOptions));

    return BridgeFeeSelector(
      onOptionSelected: (selectedOption) {
        ref
            .read(keplrProvider.notifier)
            .setSelectedBridgeFeeOption(selectedOption);
      },
      disabled: token == null,
      selected: selectedBridgeFee,
      options: bridgeFeeOptions,
    );
  }
}

class _TransferAddressSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferType =
        ref.watch(gravityBridgeProvider.select((value) => value.transferType));
    final isKeplrConnected =
        ref.watch(keplrProvider.select((value) => value.isKeplrCardConnected));
    final fromAddress =
        ref.watch(gravityBridgeProvider.select((value) => value.fromAddress));
    final isMetamaskConnected = ref.watch(
        metamaskProvider.select((value) => value.isMetamaskCardConnected));
    final toChain =
        ref.watch(gravityBridgeProvider.select((value) => value.toChain));
    final bool isWidgetEnabled = (toChain == Chain.canto) ||
        (fromAddress.isNotEmpty &&
            ((transferType == TransferType.ibc2gra && isMetamaskConnected) ||
                isKeplrConnected));

    return TransferAddressField(
      isWidgetDisabled: !isWidgetEnabled,
      isInputEnabled: toChain == Chain.canto,
      controller: ref.read(gravityBridgeProvider.notifier).toAddressController,
      transferType: transferType,
      onChanged: (val) {
        _debouncer.run(
            () => ref.read(gravityBridgeProvider.notifier).setToAddress(val));
      },
      transferChain: ref.watch(gravityBridgeProvider.select((s) => s.toChain)),
    );
  }
}

class _ConfirmButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readyToConfirm =
        ref.watch(keplrProvider.select((value) => value.readyToConfirm));

    return DisabledWidget(
      disabled: !readyToConfirm,
      child: PushableOutlinedButton(
        width: double.infinity,
        height: Sizes.beginTransferButtonHeight,
        text: S.current.BEGIN_TRANSFER,
        onPressed: () async {
          _showApproveTransferDialog(context, ref);
        },
      ),
    );
  }

  void _showApproveTransferDialog(BuildContext context, WidgetRef ref) {
    final keplrState = ref.read(keplrProvider);
    final IbcChain? ibcChain = ref.read(gravityBridgeProvider).ibcChain;

    Widget title;
    if (ibcChain != null) {
      title = Text(S.current.IBC_TRANSFER_DIALOG_TITLE);
    } else {
      title = RichText(
        text: TextSpan(
          text: keplrState.selectedBridgeFee!.type.typeTranslation(),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
          children: [
            const TextSpan(text: " "),
            TextSpan(
                text: keplrState.selectedBridgeFee!.type.typeDescription(),
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      );
    }

    showMainPageDialog(
      context,
      onCancel: () {},
      title: title,
      content: _KeplrApprovalDialogContent(context: context),
      actionsAlignment: MainAxisAlignment.end,
      constraints: const BoxConstraints(maxWidth: 660, minWidth: 660),
      actions: [
        AlertDialogOutlinedButton(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child:
              Text(S.current.CANCEL, style: Theme.of(context).textTheme.button),
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
              ImageNetworkOrAssetWidget(
                svgAssetAsString: true,
                imageUrl: SvgAssetsAsString.uiIconsChevronRight,
                color: Theme.of(context).textTheme.button!.color,
                width: Sizes.iconSizeMedium,
                height: Sizes.iconSizeMedium,
              )
            ],
          ),
          onPressed: () {
            //get symbol of selected token. used for the transaction history
            final selectTokenState = ref.read(selectTokenProvider);
            final token = (selectTokenState is SelectTokenSuccessState)
                ? selectTokenState.selectedToken
                : null;
            Navigator.pop(context);

            if (token != null) {
              ref.read(keplrProvider.notifier).confirm(
                    context,
                    token: token,
                    transferType: ref.read(gravityBridgeProvider).transferType,
                    fromAddress: ref.read(gravityBridgeProvider).fromAddress,
                    fromWalletType:
                        ref.read(gravityBridgeProvider).fromWalletType,
                    fromChain: ref.read(gravityBridgeProvider).fromChain,
                    toChain: ref.read(gravityBridgeProvider).toChain,
                    chainInfo:
                        chainInfos[ref.read(gravityBridgeProvider).fromChain]!,
                    ref: ref,
                  );
            }
          },
        ),
      ],
    );
  }
}

class _KeplrApprovalDialogContent extends ConsumerWidget {
  const _KeplrApprovalDialogContent({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferType =
        ref.watch(gravityBridgeProvider.select((value) => value.transferType));
    final IbcChain? ibcChain =
        ref.watch(gravityBridgeProvider.select((s) => s.ibcChain));
    final ForwardChain? forwardChain =
        ref.watch(gravityBridgeProvider.select((s) => s.forwardChain));

    if (ibcChain != null) {
      String chain1, chain2;
      if (transferType == TransferType.eth2fwd ||
          transferType == TransferType.ibc2gra) {
        chain1 = ibcChain.label;
        chain2 = forwardChain!.label;
      } else {
        chain1 = forwardChain!.label;
        chain2 = ibcChain.label;
      }
      return Text(S.current.IBC_TRANSFER_DIALOG_CONTENT(chain1, chain2));
    }

    return Padding(
      padding: const EdgeInsets.only(top: Sizes.paddingMicro),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(Sizes.radius),
        ),
        padding: const EdgeInsets.all(Sizes.paddingSmall),
        child: Column(
          children: [
            Row(
              children: [
                Text(S.current.BRIDGE_FEE_TRANSFER_AMOUNT,
                    overflow: TextOverflow.ellipsis),
                const Spacer(),
                Text(
                  "${formatTokenAmountUsingLocale(
                    tokenAmount: ref.read(keplrProvider).transferAmount,
                  )}"
                  " ${ref.read(keplrProvider).token?.symbol ?? ''}",
                ),
              ],
            ),
            // TransactionFeesDisabled <- search this to find related codes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.current.CHAIN_FEE_COST, overflow: TextOverflow.ellipsis),
                const Spacer(),
                Text(
                  formatTokenAmountUsingLocale(
                          tokenAmount: ref
                              .read(keplrProvider.notifier)
                              .getTransactionFeeCost()) +
                      " ${ref.read(keplrProvider).token?.symbol ?? ''}",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.current.BRIDGE_FEE_TRANSFER_BRIDGE_FEE_COST,
                    overflow: TextOverflow.ellipsis),
                const Spacer(),
                Text(
                  "${formatTokenAmountUsingLocale(
                    tokenAmount: ref
                        .read(keplrProvider.notifier)
                        .getShortenedBridgeFeeCost(),
                  )}"
                  " ${ref.read(keplrProvider).token?.symbol ?? ''}",
                ),
              ],
            ),
            const SizedBox(height: Sizes.paddingMicro),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.BRIDGE_FEE_TRANSFER_TOTAL_COST,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  "${formatTokenAmountUsingLocale(
                    tokenAmount: ref
                        .read(keplrProvider.notifier)
                        .getTotalTransferCostAsStringDouble(),
                  )}"
                  " ${ref.read(keplrProvider).token?.symbol ?? ""}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                FutureBuilder(
                  future: _getTotalTransferCostInDollars(ref),
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Text(snapshot.data!);
                    } else {
                      final textSize = getDisplayedTextSize(
                        context: context,
                        text: "~\$XXXX",
                      );
                      return SizedBox(
                        width: 50,
                        height: textSize.height,
                        child: Center(
                          child: SizedBox(
                            height: 1,
                            child: LinearProgressIndicator(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> _getTotalTransferCostInDollars(WidgetRef ref) async {
    // await Future.delayed(const Duration(seconds: 3)); // TESTING
    const logPrefix = "_getTotalTransferCostInDollars";
    final TokenInfo? token = ref.read(keplrProvider).token;
    if (token != null) {
      final double? dollarPrice =
          await CoinGeckoService.requestUsDollarPriceForToken(
        tokenName: token.name,
        tokenSymbol: token.symbol,
        tryFromCache: false,
      );
      dlog("Dollar price for ${token.name}: $dollarPrice", logPrefix);
      if (dollarPrice != null) {
        final String totalTransferCostStr = ref
            .read(keplrProvider.notifier)
            .getTotalTransferCostAsStringDouble();
        final double totalTransferCost =
            double.tryParse(totalTransferCostStr) ?? 0;
        return formatDollarValue(
          dollarValue: dollarPrice * totalTransferCost,
          decimalDigits: 3,
          additionalSymbol: "~",
        );
      }
    }
    return "\$-";
  }
}
