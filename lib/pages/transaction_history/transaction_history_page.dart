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

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transaction_status.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/keplr_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/pages/transaction_history/transaction_detail_page.dart';
import 'package:gravity_bridge_flutter/pages/transaction_history/transaction_progress_widget.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/open_link_icon_button.dart';
import 'package:gravity_bridge_flutter/widgets/custom_page_title.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/confirmation_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/dotted_horizontal_line_with_arrow_and_image.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';

class TransactionHistoryPage extends ConsumerWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionHistoryProvider).transactions;
    return MainBody(
      constraints: const BoxConstraints(maxWidth: Sizes.desktopMaxWidth),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPageTitle(
              title: S.current.TRANSACTION_HISTORY,
              subTitle: "${transactions.length} transactions",
            ),
            Card(
              shadowColor: Theme.of(context).backgroundColor,
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.zero,
              child: const _TransactionList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionList extends ConsumerStatefulWidget {
  const _TransactionList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionListState();
}

class _TransactionListState extends ConsumerState<_TransactionList> {
  // take the first from the languages set in chrome
  // Intl.systemLocale returns always "en_US"
  final String locale =
      WidgetsBinding.instance.window.locales.first.languageCode;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = context.read(transactionHistoryProvider.notifier);
      if (notifier.newTransactions > 0) {
        notifier.setViewed(notifier.transactions.map((e) => e.id).toSet());
      }

      notifier.checkForAndUpdateUnfinishedTransactionStatuses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactions = ref
        .watch(transactionHistoryProvider)
        .transactions
        .sorted((a, b) => b.timeStamp.compareTo(a.timeStamp));

    return isMobile(context)
        ? _transactionsListMobile(transactions)
        : Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: Sizes.desktopMaxWidth1000,
                  maxWidth: MediaQuery.of(context).size.width >
                              Sizes.desktopMaxWidth1000 &&
                          MediaQuery.of(context).size.width <
                              Sizes.desktopMaxWidth
                      ? MediaQuery.of(context).size.width
                      : Sizes.desktopMaxWidth,
                ),
                child: Container(
                  width: double.infinity,
                  padding: generatePageHorizontalPadding(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _desktopHeaderRow(),
                      Container(
                        height: 0.5,
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: transactions.length * 96 + 100,
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              return _desktopTransactionRow(
                                transactions[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget _transactionsListMobile(List<Transaction> transactions) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: transactions.length * (152 + Sizes.padding16),
          child: ListView.builder(
            itemCount: transactions.length,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 152,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(Sizes.radius),
                ),
                margin: const EdgeInsets.only(bottom: Sizes.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.padding16,
                        top: Sizes.padding16,
                        right: Sizes.padding16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            generateLocaleDateTimeFormat(
                                transactions[index].timeStamp),
                            style: const TextStyle(
                              fontSize: Sizes.fontSizeMedium,
                            ),
                          ),
                          if (getChainFromWalletAddress(
                                      transactions[index].fromAddress) ==
                                  Chain.gravity &&
                              getChainFromWalletAddress(
                                      transactions[index].toAddress) ==
                                  Chain.ethereum &&
                              transactions[index].remainingHours > 0.0)
                            Text(
                              "( ${getRemainingBatchTimeString(transactions[index])} remaining )",
                              style: const TextStyle(
                                fontSize: Sizes.fontSizeSmall,
                              ),
                            ),
                        ],
                      ),
                    ),
                    _mobileTransactionRow(transactions[index]),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(Sizes.radius),
                          bottomRight: Radius.circular(Sizes.radius),
                        ),
                      ),
                      child: transactions[index].status ==
                                  TransactionStatus.completed ||
                              transactions[index].status ==
                                  TransactionStatus.failed
                          ? InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TransactionDetailPageWidget(
                                            transaction: transactions[index]),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.paddingMicro),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: Sizes.iconSizeLarge,
                                      height: Sizes.iconSizeLarge,
                                    ),
                                    Text(
                                      S.current.SHOW_DETAILS,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: Sizes.fontSizeMedium,
                                      ),
                                    ),
                                    ImageNetworkOrAssetWidget(
                                      svgAssetAsString: true,
                                      imageUrl:
                                          SvgAssetsAsString.uiIconsChevronRight,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      width: Sizes.iconSizeLarge,
                                      height: Sizes.iconSizeLarge,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Future.microtask(
                                        () => showDialog(
                                          context: context,
                                          builder: (BuildContext _) {
                                            return ConfirmationDialog(
                                              title: S.current
                                                  .CANCEL_THE_FOLLOWING_TRANSACTION,
                                              content:
                                                  _txConfirmationDialogContent(
                                                context,
                                                transactions[index],
                                              ),
                                              isConfirmDestructive: true,
                                              onConfirm: () {
                                                Navigator.pop(context);
                                                context
                                                    .read(
                                                        transactionHistoryProvider)
                                                    .cancelNonbatchedTransaction(
                                                      context,
                                                      transactions[index],
                                                      fromWalletType: context
                                                          .read(
                                                              gravityBridgeProvider)
                                                          .fromWalletType,
                                                      fromChain: context
                                                          .read(
                                                              gravityBridgeProvider)
                                                          .fromChain,
                                                      transferAmount: context
                                                                  .read(
                                                                      gravityBridgeProvider)
                                                                  .fromChain ==
                                                              Chain.ethereum
                                                          ? context
                                                              .read(
                                                                  metamaskProvider)
                                                              .transferAmount
                                                          : context
                                                              .read(
                                                                  keplrProvider)
                                                              .transferAmount,
                                                      ref: ref,
                                                    );
                                              },
                                              onReject: () =>
                                                  Navigator.pop(context),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.current.CANCEL,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: Sizes.fontSizeMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: Sizes.paddingMicro),
                                        ImageNetworkOrAssetWidget(
                                          imageUrl: SvgAssetsAsString
                                              .uiIconsStateCanceled,
                                          svgAssetAsString: true,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          width: Sizes.iconSizeXSmall,
                                          height: Sizes.iconSizeXSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: 2,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TransactionDetailPageWidget(
                                                  transaction:
                                                      transactions[index]),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.current.DETAILS,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: Sizes.fontSizeMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: Sizes.paddingMicro),
                                        ImageNetworkOrAssetWidget(
                                          imageUrl: SvgAssetsAsString
                                              .uiIconsChevronRight,
                                          svgAssetAsString: true,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          width: Sizes.iconSizeSmall,
                                          height: Sizes.iconSizeSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _desktopHeaderRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.padding32),
      child: Row(
        children: [
          /// AMOUNT
          Expanded(
            flex: 20,
            child: Text(
              S.current.AMOUNT,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),

          const SizedBox(width: Sizes.paddingMedium),

          /// STARTED AT
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.STARTED_AT,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Text(
                  S.current.REMAINING,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: Sizes.fontSizeXSmall,
                  ),
                ),
              ],
            ),
          ),

          /// FROM -> STATUS -> TO
          Expanded(
            flex: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// FROM
                SizedBox(
                  width: 170,
                  child: Text(
                    S.current.SELECT_TYPE_FROM,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: Sizes.padding16),

                /// STATUS
                SizedBox(
                  width: 100,
                  child: Text(
                    S.current.STATUS,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: Sizes.padding16),

                /// TO
                SizedBox(
                  width: 170,
                  child: Text(
                    S.current.SELECT_TYPE_TO,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                )
              ],
            ),
          ),

          /// BRIDGE FEE
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.current.BRIDGE_FEE,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),

          /// MENU
          const SizedBox(
            width: 100, // same width with _CustomTxPopupMenu
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _desktopTransactionRow(Transaction transaction) {
    return FutureBuilder(
      future: CoinGeckoService.requestUsDollarPriceForToken(
        tokenName: transaction.tokenName,
        tokenSymbol: transaction.symbol,
        tryFromCache: true,
      ),
      builder: (BuildContext context, AsyncSnapshot<double?> snapshotDouble) {
        double dollarPrice = 0;

        if (snapshotDouble.hasData && snapshotDouble.data != null) {
          dollarPrice = snapshotDouble.data!;
        }
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: Sizes.padding32),
          child: Row(
            children: [
              Expanded(
                flex: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    transaction.iconUrl == ""
                        ? Container(
                            width: Sizes.iconSize32,
                            height: Sizes.iconSize32,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSecondary,
                              borderRadius:
                                  BorderRadius.circular(Sizes.iconSize32),
                            ),
                          )
                        : ImageNetworkOrAssetWidget(
                            imageUrl: transaction.iconUrl,
                            width: Sizes.iconSize32,
                            height: Sizes.iconSize32,
                          ),
                    const SizedBox(width: Sizes.paddingMicro),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${formatTokenAmountUsingLocale(tokenAmount: transaction.amount)} ${transaction.symbol.toUpperCase()}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Sizes.fontSizeSmall,
                              color: transaction.isInProgress
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          Text(
                            formatDollarValue(
                              dollarValue: dollarPrice,
                              tokenAmount: transaction.amount,
                            ),
                            style: TextStyle(
                              fontSize: Sizes.fontSizeSmall,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Sizes.paddingMedium),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      generateLocaleDateTimeFormat(transaction.timeStamp),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Sizes.fontSizeSmall,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    if (getChainFromWalletAddress(transaction.fromAddress) ==
                            Chain.gravity &&
                        getChainFromWalletAddress(transaction.toAddress) ==
                            Chain.ethereum &&
                        transaction.remainingHours > 0.0)
                      Text(
                        getRemainingBatchTimeString(transaction),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: Sizes.fontSizeSmall,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// FROM
                    SizedBox(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getChainIconFromWalletAddress(
                            context: context,
                            walletAddress: transaction.fromAddress,
                          ),
                          const SizedBox(width: 5),
                          Tooltip(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.paddingXSmall,
                                vertical: Sizes.paddingPico),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius:
                                  BorderRadius.circular(Sizes.radius4),
                            ),
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: Sizes.fontSizeXSmall,
                            ),
                            message: transaction.fromAddress,
                            child: InkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                        text: transaction.fromAddress))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      content: Text(
                                          S.current
                                              .COPY_TO_CLIPBOARD_CONFIRMATION,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          )),
                                    ),
                                  );
                                });
                              },
                              child: Text(
                                transaction.fromAddress.isNotEmpty
                                    ? transaction.fromAddress.truncateDots()
                                    : "",
                                style: TextStyle(
                                  color: transaction.isInProgress
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                  fontSize: Sizes.fontSize16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: Sizes.paddingMicro),
                          OpenLinkIconButton(
                            url: scanLinkGenerator(
                              accountHash: transaction.fromAddress,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: Sizes.padding16),

                    /// STATUS
                    SizedBox(
                      width: 100,
                      child: SelfUpdatingTransactionProgressWidget(
                        transaction: transaction,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      ),
                    ),
                    const SizedBox(width: Sizes.padding16),

                    /// TO
                    SizedBox(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getChainIconFromWalletAddress(
                            context: context,
                            walletAddress: transaction.toAddress,
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                      text: transaction.toAddress))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    content: Text(
                                        S.current
                                            .COPY_TO_CLIPBOARD_CONFIRMATION,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        )),
                                  ),
                                );
                              });
                            },
                            child: Tooltip(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.paddingXSmall,
                                  vertical: Sizes.paddingPico),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius:
                                    BorderRadius.circular(Sizes.radius4),
                              ),
                              textStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: Sizes.fontSizeXSmall,
                              ),
                              message: transaction.toAddress,
                              child: Text(
                                transaction.toAddress.truncateDots(),
                                style: TextStyle(
                                  color: transaction.isInProgress
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                  fontSize: Sizes.fontSize16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: Sizes.paddingMicro),
                          OpenLinkIconButton(
                            url: scanLinkGenerator(
                              accountHash: transaction.toAddress,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.fee == "" || transaction.fee.startsWith("nat")
                          ? formatTokenAmountUsingLocale(tokenAmount: "0")
                          : formatTokenAmountUsingLocale(
                              tokenAmount: convertIntToDecimalAmount(
                                  transaction.fee, transaction.decimals)),
                      style: TextStyle(
                        fontSize: Sizes.fontSize16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    if ((double.tryParse(transaction.fee) ?? 0.0) > 0.0)
                      Text(
                        transaction.fee.startsWith("nat")
                            ? formatDollarValue(dollarValue: 0)
                            : formatDollarValue(
                                dollarValue: dollarPrice,
                                tokenAmount: transaction.fee,
                                tokenDecimals: transaction.decimals,
                              ),
                        style: TextStyle(
                          fontSize: Sizes.fontSizeXSmall,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              _CustomTxPopupMenu(
                transaction: transaction,
                ref: ref,
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _mobileTransactionRow(Transaction transaction) {
  return FutureBuilder(
    future: CoinGeckoService.requestUsDollarPriceForToken(
      tokenName: transaction.tokenName,
      tokenSymbol: transaction.symbol,
      tryFromCache: true,
    ),
    builder: (BuildContext context, AsyncSnapshot<double?> snapshotDouble) {
      double dollarPrice = 0;

      if (snapshotDouble.hasData && snapshotDouble.data != null) {
        dollarPrice = snapshotDouble.data!;
      }
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.padding16,
            right: Sizes.padding16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              transaction.iconUrl == ""
                  ? Container(
                      width: Sizes.iconSizeXLarge,
                      height: Sizes.iconSizeXLarge,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        shape: BoxShape.circle,
                      ),
                    )
                  : ImageNetworkOrAssetWidget(
                      imageUrl: transaction.iconUrl,
                      width: Sizes.iconSizeXLarge,
                      height: Sizes.iconSizeXLarge,
                    ),
              const SizedBox(width: Sizes.paddingMicro),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "${formatTokenAmountUsingLocale(tokenAmount: transaction.amount)} ${transaction.symbol.toUpperCase()}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Text(
                        formatDollarValue(
                          dollarValue: dollarPrice,
                          tokenAmount: transaction.amount,
                        ),
                        style: TextStyle(
                          fontSize: Sizes.fontSizeSmall,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              getChainIconFromWalletAddress(
                context: context,
                walletAddress: transaction.fromAddress,
                width: Sizes.iconSizeXLarge,
                height: Sizes.iconSizeXLarge,
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 3,
                child: SelfUpdatingTransactionProgressWidget(
                  transaction: transaction,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 5),
              getChainIconFromWalletAddress(
                context: context,
                walletAddress: transaction.toAddress,
                width: Sizes.iconSizeXLarge,
                height: Sizes.iconSizeXLarge,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _txConfirmationDialogContent(
  BuildContext context,
  Transaction transaction,
) {
  return Container(
    width: 342,
    height: 112,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.tertiary,
      borderRadius: BorderRadius.circular(Sizes.radius),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mobileTransactionRow(transaction),
        Padding(
          padding: const EdgeInsets.only(
              bottom: Sizes.padding16, left: Sizes.padding16),
          child: Text(
            generateLocaleDateTimeFormat(transaction.timeStamp),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Sizes.fontSizeMedium,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget dottedHorizontalLineWithArrowAndImage({
  required final BuildContext context,
  required final Transaction transaction,
  required final Color backgroundColor,
}) {
  return Tooltip(
    message: _getTooltipForTransactionStatus(transaction.status),
    child: DottedHorizontalLineWithArrowAndImage(
      svgAssetAsString: true,
      imageUrl: getTransactionStatusIconUrl(transaction),
      iconBorderColor: backgroundColor,
      iconColor: transaction.status == TransactionStatus.completed
          ? Theme.of(context).colorScheme.inverseSurface
          : transaction.status == TransactionStatus.failed
              ? Theme.of(context).colorScheme.onError
              : null,
    ),
  );
}

class _CustomTxPopupMenu extends StatefulWidget {
  final Transaction transaction;
  final WidgetRef ref;
  const _CustomTxPopupMenu({required this.transaction, required this.ref});

  @override
  State<_CustomTxPopupMenu> createState() => _CustomTxPopupMenuState();
}

class _CustomTxPopupMenuState extends State<_CustomTxPopupMenu> {
  bool popupMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          popupMenuOpen &&
                  widget.transaction.status == TransactionStatus.preparing &&
                  widget.transaction.cancelation == null
              ? Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(Sizes.radius4),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 24,
                  height: 24,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          widget.transaction.status == TransactionStatus.preparing &&
                  widget.transaction.cancelation == null
              ? Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    popupMenuOpen
                        ? Container(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            width: 24,
                            height: 24,
                          )
                        : Container(),
                    Container(
                      width: 52,
                      height: 24,
                      decoration: BoxDecoration(
                        color: popupMenuOpen
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).backgroundColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                        borderRadius: popupMenuOpen
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(Sizes.radius4),
                                bottomRight: Radius.circular(Sizes.radius4),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(Sizes.radius4),
                                bottomLeft: Radius.circular(Sizes.radius4),
                              ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Future.microtask(
                              () => showDialog(
                                context: context,
                                builder: (BuildContext _) {
                                  return ConfirmationDialog(
                                    title: S.current
                                        .CANCEL_THE_FOLLOWING_TRANSACTION,
                                    content: _txConfirmationDialogContent(
                                        context, widget.transaction),
                                    isConfirmDestructive: true,
                                    onConfirm: () {
                                      Navigator.pop(context);
                                      context
                                          .read(transactionHistoryProvider)
                                          .cancelNonbatchedTransaction(
                                            context,
                                            widget.transaction,
                                            fromWalletType: context
                                                .read(gravityBridgeProvider)
                                                .fromWalletType,
                                            fromChain: context
                                                .read(gravityBridgeProvider)
                                                .fromChain,
                                            transferAmount: context
                                                        .read(
                                                            gravityBridgeProvider)
                                                        .fromChain ==
                                                    Chain.ethereum
                                                ? context
                                                    .read(metamaskProvider)
                                                    .transferAmount
                                                : context
                                                    .read(keplrProvider)
                                                    .transferAmount,
                                            ref: widget.ref,
                                          );
                                    },
                                    onReject: () => Navigator.pop(context),
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            S.current.CANCEL,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                          Brightness.light &&
                                      popupMenuOpen == false
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).primaryColorLight,
                              fontSize: Sizes.fontSizeXSmall,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: popupMenuOpen
                      ? Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(Sizes.radius4),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: 24,
                          height: 24,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                ),
          SizedBox(
            width: 24,
            height: 24,
            child: PopupMenuButton(
              tooltip: "",
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.radius),
                  topLeft: Radius.circular(Sizes.radius),
                  bottomRight: Radius.circular(Sizes.radius),
                ),
              ),
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              position: PopupMenuPosition.under,
              elevation: 0,
              padding: EdgeInsets.zero,
              onCanceled: () {
                setState(() {
                  popupMenuOpen = false;
                });
              },
              itemBuilder: (BuildContext context) {
                setState(() {
                  popupMenuOpen = true;
                });
                return [
                  PopupMenuItem(
                    height: 0,
                    padding: const EdgeInsets.only(
                      left: Sizes.paddingMicro,
                      top: Sizes.paddingNano,
                      right: Sizes.paddingMicro,
                      bottom: Sizes.padding12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageNetworkOrAssetWidget(
                          svgAssetAsString: true,
                          imageUrl: SvgAssetsAsString.uiIconsCopy,
                          color: Theme.of(context).primaryColorLight,
                          width: Sizes.iconSizeXSmall,
                          height: Sizes.iconSizeXSmall,
                        ),
                        const SizedBox(width: Sizes.paddingPico),
                        Text(
                          S.current
                              .TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_ID,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: Sizes.fontSizeXSmall,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Clipboard.setData(
                              ClipboardData(text: widget.transaction.id))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            content: Text(
                              S.current
                                  .TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH_SUCCESS,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        );
                      });
                      setState(() {
                        popupMenuOpen = false;
                      });
                    },
                  ),
                  PopupMenuItem(
                    height: 0,
                    padding: const EdgeInsets.only(
                      left: Sizes.paddingMicro,
                      top: Sizes.padding12,
                      right: Sizes.paddingMicro,
                      bottom: Sizes.paddingNano,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.remove_circle_outline,
                          color: Theme.of(context).primaryColorLight,
                          size: Sizes.iconSizeXSmall,
                        ),
                        const SizedBox(width: Sizes.paddingPico),
                        Text(
                          S.current.TRANSACTION_HISTORY_REMOVE_MENU_TEXT,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: Sizes.fontSizeXSmall,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Future.microtask(
                        () => showDialog(
                          context: context,
                          builder: (BuildContext _) {
                            return ConfirmationDialog(
                              title: S.current
                                  .TRANSACTION_HISTORY_REMOVE_DIALOG_TITLE(
                                      widget.transaction.id.truncateDots()),
                              onConfirm: () async {
                                Navigator.pop(context);
                                await Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => context
                                      .read(transactionHistoryProvider.notifier)
                                      .removeTransaction(widget.transaction),
                                );
                              },
                              onReject: () => Navigator.pop(context),
                            );
                          },
                        ),
                      );
                      setState(() {
                        popupMenuOpen = false;
                      });
                    },
                  ),
                ];
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: popupMenuOpen
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).backgroundColor,
                  border: Border.all(
                    color: popupMenuOpen
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  borderRadius: widget.transaction.status ==
                              TransactionStatus.preparing &&
                          widget.transaction.cancelation == null
                      ? (popupMenuOpen
                          ? const BorderRadius.only(
                              topRight: Radius.circular(Sizes.radius4),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(Sizes.radius4),
                              bottomRight: Radius.circular(Sizes.radius4),
                            ))
                      : (popupMenuOpen
                          ? const BorderRadius.only(
                              topRight: Radius.circular(Sizes.radius4),
                              topLeft: Radius.circular(Sizes.radius4),
                            )
                          : BorderRadius.circular(Sizes.radius4)),
                ),
                child: ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsMore,
                  color: Theme.of(context).brightness == Brightness.light &&
                          popupMenuOpen == false
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).primaryColorLight,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getTooltipForTransactionStatus(final TransactionStatus status) {
  String message;
  switch (status) {
    case TransactionStatus.completed:
      message = S.current.TRANSACTION_HISTORY_STATUS_TOOLTIP_COMPLETED;
      break;
    case TransactionStatus.failed:
      message = S.current.TRANSACTION_HISTORY_STATUS_TOOLTIP_FAILED;
      break;
    case TransactionStatus.pending:
      message = S.current.TRANSACTION_HISTORY_STATUS_TOOLTIP_PENDING;
      break;
    case TransactionStatus.preparing:
      message = S.current.TRANSACTION_HISTORY_STATUS_TOOLTIP_PREPARING;
      break;
    case TransactionStatus.canceled:
      message = S.current.TRANSACTION_HISTORY_STATUS_TOOLTIP_CANCELED;
      break;
    default:
      message = "";
      break;
  }
  return message;
}
