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

import 'dart:math' as math;

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
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/confirmation_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';

class TransactionDetailPageWidget extends ConsumerWidget {
  final Transaction transaction;
  const TransactionDetailPageWidget({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainBody(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                bottom: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            padding: const EdgeInsets.only(
              top: Sizes.padding24,
              bottom: Sizes.padding24,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: Sizes.paddingPico / 2),
                  child: InkWell(
                    splashColor: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      width: Sizes.padding32,
                      height: Sizes.padding32,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.radius),
                      ),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: ImageNetworkOrAssetWidget(
                          svgAssetAsString: true,
                          imageUrl: SvgAssetsAsString.uiIconsChevronRight,
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: Sizes.iconSizeMedium,
                          height: Sizes.iconSizeMedium,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: Sizes.padding16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.MENU_ITEM_TRANSACTION_DETAIL,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: Sizes.fontSizeLarge,
                            ),
                      ),
                      const SizedBox(height: Sizes.paddingMicro),
                      Text(
                        transaction.id,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: Sizes.fontSizeXSmall,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.DATE_AND_TIME,
            Text(
              generateLocaleDateTimeFormat(transaction.timeStamp),
              style: TextStyle(
                fontSize: Sizes.fontSize16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.TOKEN.toUpperCase(),
            Row(
              children: [
                transaction.iconUrl == ""
                    ? Container(
                        width: Sizes.iconSize32,
                        height: Sizes.iconSize32,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          shape: BoxShape.circle,
                        ),
                      )
                    : ImageNetworkOrAssetWidget(
                        imageUrl: transaction.iconUrl,
                        width: Sizes.iconSize32,
                        height: Sizes.iconSize32,
                      ),
                const SizedBox(width: Sizes.paddingMicro),
                Text(
                  transaction.tokenName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.STATUS,
            Row(
              children: [
                Container(
                  width: Sizes.iconSize32,
                  height: Sizes.iconSize32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: ImageNetworkOrAssetWidget(
                    svgAssetAsString: true,
                    imageUrl: transaction.status == TransactionStatus.completed
                        ? SvgAssetsAsString.uiIconsStateDone
                        : transaction.status == TransactionStatus.failed
                            ? SvgAssetsAsString.uiIconsStateCanceled
                            : SvgAssetsAsString.uiIconsStateRunning,
                    color: transaction.status == TransactionStatus.completed
                        ? Theme.of(context).colorScheme.inverseSurface
                        : transaction.status == TransactionStatus.failed
                            ? Theme.of(context).colorScheme.onError
                            : Theme.of(context).colorScheme.onPrimary,
                    width: Sizes.iconSizeSmall,
                    height: Sizes.iconSizeSmall,
                  ),
                ),
                const SizedBox(width: Sizes.paddingMicro),
                Text(
                  transaction.status.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Expanded(child: Container()),
                transaction.status == TransactionStatus.completed ||
                        transaction.status == TransactionStatus.failed
                    ? Container()
                    : InkWell(
                        splashColor: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: Sizes.fixedButtonHeight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(Sizes.radius),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.padding12,
                            vertical: Sizes.paddingMicro,
                          ),
                          child: Center(
                            child: Text(
                              S.current.CANCEL,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Sizes.fontSize16,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Future.microtask(
                            () => showDialog(
                              context: context,
                              builder: (BuildContext _) {
                                return ConfirmationDialog(
                                  title: S.current
                                      .TRANSACTION_HISTORY_CANCEL_DIALOG_TITLE(
                                          transaction.id.truncateDots()),
                                  content: Text(S.current
                                      .TRANSACTION_HISTORY_CANCEL_DIALOG_DESC),
                                  isConfirmDestructive: true,
                                  onConfirm: () {
                                    Navigator.pop(context);
                                    context
                                        .read(transactionHistoryProvider)
                                        .cancelNonbatchedTransaction(
                                          context,
                                          transaction,
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
                                          ref: ref,
                                        );
                                  },
                                  onReject: () => Navigator.pop(context),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.AMOUNT,
            Row(
              children: [
                Text(
                  formatTokenAmountUsingLocale(tokenAmount: transaction.amount),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Sizes.fontSize16,
                  ),
                ),
                const SizedBox(width: Sizes.paddingPico),
                Text(
                  transaction.symbol,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Sizes.fontSize16,
                  ),
                ),
                const SizedBox(width: Sizes.padding16),
                FutureBuilder(
                    future: CoinGeckoService.requestUsDollarPriceForToken(
                      tokenName: transaction.tokenName,
                      tokenSymbol: transaction.symbol,
                      tryFromCache: true,
                    ),
                    builder: (BuildContext context,
                        AsyncSnapshot<double?> snapshotDouble) {
                      double dollarPrice = 0;

                      if (snapshotDouble.hasData &&
                          snapshotDouble.data != null) {
                        dollarPrice = snapshotDouble.data!;
                      }
                      return Text(
                        formatDollarValue(
                          dollarValue: dollarPrice,
                          tokenAmount: transaction.amount,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: Sizes.fontSize16,
                        ),
                      );
                    }),
              ],
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.SELECT_TYPE_FROM,
            Padding(
              padding: const EdgeInsets.only(right: Sizes.padding16),
              child: Column(
                children: [
                  Row(
                    children: [
                      getChainIconFromWalletAddress(
                        context: context,
                        walletAddress: transaction.fromAddress,
                      ),
                      const SizedBox(width: Sizes.paddingMicro),
                      Text(
                        getChainFromWalletAddress(transaction.fromAddress)
                                ?.chainName ??
                            "",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: Sizes.fontSize16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.padding16),
                  Text(
                    transaction.fromAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Sizes.fontSize16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.SELECT_TYPE_TO,
            Padding(
              padding: const EdgeInsets.only(right: Sizes.padding16),
              child: Column(
                children: [
                  Row(
                    children: [
                      getChainIconFromWalletAddress(
                        context: context,
                        walletAddress: transaction.toAddress,
                      ),
                      const SizedBox(width: Sizes.paddingMicro),
                      Text(
                        getChainFromWalletAddress(transaction.toAddress)
                                ?.chainName ??
                            "",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: Sizes.fontSize16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.padding16),
                  Text(
                    transaction.toAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Sizes.fontSize16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _transactionDetailRow(
            context,
            S.current.FEE,
            Row(
              children: [
                Text(
                  transaction.fee == "" || transaction.fee.startsWith("nat")
                      ? formatTokenAmountUsingLocale(tokenAmount: "0")
                      : formatTokenAmountUsingLocale(
                          tokenAmount: convertIntToDecimalAmount(
                              transaction.fee, transaction.decimals)),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Sizes.fontSize16,
                  ),
                ),
                const SizedBox(width: Sizes.paddingPico),
                Text(
                  transaction.symbol,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Sizes.fontSize16,
                  ),
                ),
                const SizedBox(width: Sizes.padding16),
                FutureBuilder(
                  future: CoinGeckoService.requestUsDollarPriceForToken(
                    tokenName: transaction.tokenName,
                    tokenSymbol: transaction.symbol,
                    tryFromCache: true,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<double?> snapshotDouble) {
                    double dollarPrice = 0;

                    if (snapshotDouble.hasData && snapshotDouble.data != null) {
                      dollarPrice = snapshotDouble.data!;
                    }
                    return Text(
                      formatDollarValue(
                        dollarValue: dollarPrice,
                        tokenAmount: transaction.fee,
                        tokenDecimals: transaction.decimals,
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: Sizes.fontSize16,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: Sizes.padding24),
            child: InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: transaction.id))
                    .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      content: Text(
                        S.current
                            .TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH_SUCCESS,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: Container(
                width: double.infinity,
                height: Sizes.fixedButtonHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.radius),
                ),
                child: Center(
                  child: Text(
                    S.current
                        .TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_ID,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Sizes.fontSize16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: Sizes.padding24),
            child: InkWell(
              onTap: () {
                Future.microtask(
                  () => showDialog(
                    context: context,
                    builder: (BuildContext _) {
                      return ConfirmationDialog(
                        title: S.current
                            .TRANSACTION_HISTORY_REMOVE_DIALOG_TITLE(
                                transaction.id.truncateDots()),
                        onConfirm: () async {
                          Navigator.pop(context);
                          // wait a bit so that the user sees the change in ui
                          await Future.delayed(
                            const Duration(milliseconds: 200),
                            () => context
                                .read(transactionHistoryProvider.notifier)
                                .removeTransaction(transaction),
                          ).then((_) => Navigator.pop(context));
                        },
                        onReject: () => Navigator.pop(context),
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: Sizes.fixedButtonHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.radius),
                ),
                child: Center(
                  child: Text(
                    S.current.TRANSACTION_HISTORY_REMOVE_MENU_TEXT,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Sizes.fontSize16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

Widget _transactionDetailRow(BuildContext context, String title, Widget child) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: Sizes.padding24),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 0.5,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: Sizes.fontSizeSmall,
            ),
          ),
        ),
        Expanded(
          child: child,
        ),
      ],
    ),
  );
}
