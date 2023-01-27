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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/bridge_fee_state.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/keplr_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_service.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/services/route_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/custom_outlined_button.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/open_link_icon_button.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/select_button.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/shortened_text_copy_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'transaction_progress_service.dart';

/// Shows the self-updating transfer progress dialog
showTransferProgressDialog(
  BuildContext context,
  WidgetRef ref,
  final TransferType transferType,
) {
  if (ref.read(transactionProgressProvider).isDialogOpen()) {
    return;
  }

  ref.read(transactionProgressProvider).setIsDialogIsOpen();

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => _TransferProgressDialogWrapper(transferType: transferType),
  ).then((_) {
    ref.read(transactionProgressProvider).resetTransactionData();
    _updateSelectedTokenBalance(ref);
  });
}

/// ConsumerWidget that listens to Metmask/Keplr-Provider and returns an updated [TransferProgressDialog]
class _TransferProgressDialogWrapper extends ConsumerWidget {
  final TransferType transferType;
  const _TransferProgressDialogWrapper({
    Key? key,
    required this.transferType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TransactionProgress? transactionProgress;
    BridgeFeeType? selectedBridgeFeeType;
    if (transferType == TransferType.eth2fwd) {
      transactionProgress = ref
          .watch(metamaskProvider.select((value) => value.transactionProgress));
    } else {
      transactionProgress =
          ref.watch(keplrProvider.select((value) => value.transactionProgress));
      if (transferType == TransferType.gra2eth) {
        selectedBridgeFeeType = ref.watch(
            keplrProvider.select((value) => value.selectedBridgeFee?.type));
      }
    }

    if (transactionProgress != null) {
      return TransferProgressDialog(
        transactionProgress: transactionProgress,
        transferType: transferType,
        fromAddress: ref.read(gravityBridgeProvider).fromAddress,
        selectedBridgeFeeType: selectedBridgeFeeType,
        fromWallet: ref.read(gravityBridgeProvider).fromWalletType,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

/// The simple TransferProgressDialog-Widget.
/// Useful for testing changes to its UI without using [showTransferProgressDialog].
/// returns an AlertDialog-Widget.
class TransferProgressDialog extends ConsumerWidget {
  /// If it not [TransactionRejectedByUser] or [TransactionCreationError], the other parameters must not be null
  final TransactionProgress transactionProgress;
  final TransferType? transferType;
  final String? fromAddress;
  final WalletType fromWallet;

  /// - Must not be null when [transferType] is [TransferType.gra2eth]
  /// - Otherwise must be null
  final BridgeFeeType? selectedBridgeFeeType;

  const TransferProgressDialog({
    Key? key,
    required this.transactionProgress,
    this.transferType,
    this.fromAddress,
    this.selectedBridgeFeeType,
    required this.fromWallet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if ((transactionProgress is! TransactionRejectedByUser &&
            transactionProgress is! TransactionCreationError) &&
        (transferType == null || fromAddress == null || fromAddress!.isEmpty)) {
      throw Exception(
        "Wrong parameters: transferType/fromAddress have invalid value (null/\"\")",
      );
    }
    if (transactionProgress is TransactionComplete &&
        transferType == TransferType.gra2eth &&
        selectedBridgeFeeType == null) {
      throw Exception(
          "Wrong parameters: transactionProgress = TransactionComplete, transferType = gra2eth, but selectedBridgeFeeType = null");
    }

    if (transactionProgress is TransactionRejectedByUser) {
      return getTransactionProgressDialog(
        title: S.current.TRANSACTION_TITLE_REJECTED,
        content: const SizedBox.shrink(),
        context: context,
        importButton: null,
      );
    } else if (transactionProgress is TransactionStarted) {
      if (transferType == TransferType.eth2fwd ||
          transferType == TransferType.ibc2gra) {
        ref.read(transactionProgressProvider).initTransactionTimerCheck(
            transactionProgress as TransactionStarted);
      }
      return getTransactionProgressDialog(
        context: context,
        title: S.current.TRANSACTION_TITLE_STARTED,
        content: _transactionStartedWidget(fromWallet),
        importButton: null,
      );
    } else if (transactionProgress is TransactionInProgress) {
      return getTransactionProgressDialog(
        context: context,
        title: S.current.TRANSACTION_TITLE_PROGRESS,
        content: _transactionInProgressWidget(
          context: context,
          hash: (transactionProgress as TransactionInProgress).hash,
          fromAddress: fromAddress!,
        ),
        importButton: null,
      );
    } else if (transactionProgress is TransactionError) {
      return getTransactionProgressDialog(
        context: context,
        title: S.current.TRANSACTION_TITLE_ERROR,
        content: _transactionErrorWidget(
          context: context,
          transaction: transactionProgress as TransactionError,
          fromAddress: fromAddress!,
        ),
        importButton: null,
      );
    } else if (transactionProgress is TransactionComplete) {
      /// The transaction completed dialog includes the import button,
      /// which depends on some async methods.
      /// So at first the transaction in progress dialog is shown while [_getImportTokenButton] does its work
      return FutureBuilder(
        future: _getImportTokenButton(
          transferType!,
          ref.read(selectTokenProvider.notifier).getSelectedToken(),
        ),
        builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // if chain name exist in mintscan, then we show scanButton
            // this information statically typed in the chain infos of every ibc chain
            return getTransactionProgressDialog(
              context: context,
              title: (transferType == TransferType.gra2eth &&
                      selectedBridgeFeeType != BridgeFeeType.premium)
                  ? S.current.BATCH_TRANSACTION_CREATED_TITLE
                  : S.current.TRANSACTION_TITLE_COMPLETE,
              content: _transactionCompleteWidget(
                context: context,
                transaction: transactionProgress as TransactionComplete,
                transferType: transferType!,
                fromAddress: fromAddress!,
                selectedBridgeFee: selectedBridgeFeeType,
              ),
              importButton: snapshot.data,
              scanButton: generateScanButton(
                context: context,
                hash: (transactionProgress as TransactionComplete).hash,
                fromAddress: fromAddress!,
                width: double.infinity,
              ),
            );
          } else {
            return getTransactionProgressDialog(
              context: context,
              title: S.current.TRANSACTION_TITLE_PROGRESS,
              content: _transactionInProgressWidget(
                context: context,
                hash: "",
                fromAddress: "",
              ),
              importButton: null,
            );
          }
        },
      );
    } else /*if (transactionProgress is TransactionStarted)*/ {
      return getTransactionProgressDialog(
        context: context,
        title: S.current.TRANSACTION_TITLE_PENDING,
        content: Text(S.current.TRANSACTION_TITLE_PENDING),
        importButton: null,
      );
    }
  }
}

Widget getTransactionProgressDialog({
  required final BuildContext context,
  required final String title,
  required final Widget content,
  required final Widget? importButton,
  final Widget? scanButton,
}) {
  return AlertDialog(
    title: Text(title),
    insetPadding: const EdgeInsets.all(0),
    content: SizedBox(
      width: isMobile(context) ? double.infinity : 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: content,
          ),
          _actions(
            context: context,
            importButton: importButton,
            scanButton: scanButton,
          ),
        ],
      ),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius)),
  );
}

Widget _transactionInProgressWidget({
  required BuildContext context,
  required final String hash,
  required final String fromAddress,
}) {
  return Column(
    children: [
      const Center(child: CircularProgressIndicator()),
      const SizedBox(height: 16),
      const Divider(),
      if (hash.isNotEmpty) ...[
        const SizedBox(height: 16),
        _hashRow(hash: hash, fromAddress: fromAddress, context: context),
      ]
    ],
  );
}

Widget _transactionCompleteWidget({
  required BuildContext context,
  required TransactionComplete transaction,
  required TransferType transferType,
  required final String fromAddress,
  required final BridgeFeeType? selectedBridgeFee,
}) {
  assert((transferType == TransferType.gra2eth && selectedBridgeFee != null) ||
      (transferType != TransferType.gra2eth && selectedBridgeFee == null));

  late final String description;
  if (transferType == TransferType.gra2eth &&
      selectedBridgeFee! != BridgeFeeType.premium) {
    description = S.current.BATCHED_TRANSACTION_CREATED_TEXT_DESCRIPTION(
      selectedBridgeFee.maxDuration.inHours,
    );
  } else {
    description = S.current.TRANSACTION_COMPLETE_TEXT_DESCRIPTION;
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Icon(
        Icons.check_circle,
        color: Theme.of(context).colorScheme.inverseSurface,
        size: 64.0,
      ),
      const SizedBox(height: 16),
      const Divider(),
      Text(description),
      if (transaction.hash.isNotEmpty) ...[
        const SizedBox(height: 16),
        _hashRow(
          hash: transaction.hash,
          fromAddress: fromAddress,
          context: context,
        ),
        const SizedBox(height: 16),
        _transactionHistoryTextWithLink(context),
      ]
    ],
  );
}

Widget _transactionErrorWidget({
  required BuildContext context,
  required TransactionError transaction,
  required final String fromAddress,
}) {
  return Column(
    children: [
      Icon(
        Icons.error_sharp,
        color: Theme.of(context).colorScheme.onError,
        size: 64.0,
      ),
      const SizedBox(height: 16),
      const Divider(),
      Text(transaction.errorMessage),
      if (transaction.hash.isNotEmpty) ...[
        const SizedBox(height: 16),
        _hashRow(
            hash: transaction.hash, fromAddress: fromAddress, context: context),
        const SizedBox(height: 16),
        _transactionHistoryTextWithLink(context),
      ]
    ],
  );
}

Widget _transactionStartedWidget(final WalletType fromWallet) {
  return Text(
    (fromWallet == WalletType.ledger)
        ? S.current.PLEASE_CONFIRM_IN_THE_LEDGER
        : S.current.PLEASE_CONFIRM_IN_THE_POPUP(
            (fromWallet == WalletType.keplr) ? "Keplr" : "Metamask",
          ),
  );
}

Widget _hashRow({
  required final BuildContext context,
  required final String hash,
  required final String fromAddress,
}) {
  return isMobile(context)
      ? Wrap(
          children: [
            Text("${S.current.TRANSACTION_HASH}: "),
            CopyButtonWithShortenedText(
              text: hash,
              toolTip: S.current.COPY,
            ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.current.TRANSACTION_HASH),
            const SizedBox(width: 32),
            const Spacer(),
            const SizedBox(width: 32),
            CopyButtonWithShortenedText(
              text: hash,
              toolTip: S.current.COPY,
              textStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(width: 10),
            OpenLinkIconButton(
              url: scanLinkGenerator(accountHash: fromAddress, txHash: hash),
              size: 20,
            ),
          ],
        );
}

/// Text that hints at the user to check the transaction history page, and which has a clickable part that opens said page.
Widget _transactionHistoryTextWithLink(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: S.current.TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT1,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextSpan(
          text: S.current.TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT2,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushNamed(RouteService.transactionHistoryPage);
            },
        )
      ],
    ),
  );
}

Widget _actions({
  required final BuildContext context,
  required final Widget? importButton,
  final Widget? scanButton,
}) {
  const double verPadding = 10;
  return Padding(
    padding: const EdgeInsets.only(top: verPadding),
    child: isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (importButton != null)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: verPadding),
                      child: importButton,
                    )
                  : const SizedBox.shrink(),
              (scanButton != null)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: verPadding),
                      child: scanButton,
                    )
                  : const SizedBox.shrink(),
              SelectButton(
                height: Sizes.fixedButtonHeight,
                width: double.infinity,
                text: S.current.OK,
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (importButton != null)
                  ? Expanded(
                      flex: 2,
                      child: importButton,
                    )
                  : const SizedBox.shrink(),
              const Spacer(),
              SelectButton(
                height: Sizes.fixedButtonHeight,
                width: Sizes.fixedButtonWidthMedium,
                text: S.current.OK,
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
  );
}

void _updateSelectedTokenBalance(WidgetRef ref) {
  final fromAddress = ref.read(gravityBridgeProvider).fromAddress;
  if (isMetamaskWalletAddress(fromAddress)) {
    final token = ref.read(metamaskProvider).token;
    if (token != null) {
      ref.read(metamaskProvider.notifier).setSelectedToken(token);
    }
  }
}

// scanButton opens etherscan/mintscan in a new tab
// if tx hash is not empty it generates a link for etherscan or mintscan depends on TransferType
Widget generateScanButton({
  required final BuildContext context,
  required final String hash,
  required final String fromAddress,
  final double? width,
}) {
  final String scanLink = scanLinkGenerator(
    accountHash: fromAddress,
    txHash: hash,
  );
  return hash.isEmpty || scanLink.isEmpty
      ? const SizedBox.shrink()
      : CustomOutlinedButton(
          height: Sizes.fixedButtonHeight,
          width: width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ImageNetworkOrAssetWidget(
                  width: Sizes.iconSizeMedium,
                  height: Sizes.iconSizeMedium,
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsLaunch,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isMetamaskWalletAddress(fromAddress)
                      ? S.current.ETHERSCAN_TEXT
                      : S.current.MINTSCAN_TEXT,
                ),
              ),
            ],
          ),
          onPressed: () async {
            await launchUrl(Uri.parse(scanLink));
          },
        );
}

Future<Widget?> _getImportTokenButton(
  final TransferType transferType,
  final TokenInfo? selectedToken,
) async {
  Widget? widget;

  // if gra2eth && token originates from cosmos && token has an erc20Address (just to be sure)
  if (selectedToken != null && transferType == TransferType.gra2eth) {
    final erc20Addr = await selectedToken.erc20Address;
    final tokenOrigin = await selectedToken.origin;
    if (tokenOrigin == TokenOrigin.cosmos && erc20Addr.isNotEmpty) {
      widget = Tooltip(
        message: S.current.IMPORT_TOKEN_INTO_METAMASK_TOOLTIP,
        child: CustomOutlinedButton(
          height: Sizes.fixedButtonHeight,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const ImageNetworkOrAssetWidget(
                    imageUrl: Assets.logoMetamask,
                    width: Sizes.iconSizeMedium,
                    height: Sizes.iconSizeMedium,
                  ),
                ),
              ),
              Text(S.current.IMPORT_TOKEN_INTO_METAMASK(selectedToken.symbol)),
              const Spacer(),
            ],
          ),
          onPressed: () {
            MetamaskService.importToken(
              address: erc20Addr,
              symbol: selectedToken.symbol,
              decimals: selectedToken.decimals,
              iconUrl: selectedToken.iconUrl,
            );
          },
        ),
      );
    }
  }
  return widget;
}
