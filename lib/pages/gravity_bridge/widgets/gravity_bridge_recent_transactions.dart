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

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/pages/transaction_history/transaction_progress_widget.dart';
import 'package:gravity_bridge_flutter/services/route_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

class GravityBridgeRecentTransactions extends ConsumerWidget {
  const GravityBridgeRecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Transaction> transactions = ref
        .watch(transactionHistoryProvider)
        .transactions
        .sorted((a, b) => b.timeStamp.compareTo(a.timeStamp));

    final int totalTransactionsListLength = transactions.length;
    if (transactions.length > 3) {
      transactions.length = 3;
    }
    return GravityBridgeWidget(
      title: Text(
        S.current.RECENT_TRANSACTIONS,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Sizes.fontSize16,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          transactions.isEmpty
              ? Text(
                  S.current.NO_RECENT_TRANSACTION,
                  style: TextStyle(
                    fontSize: Sizes.fontSizeSmall,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: transactions
                            .map(
                              (t) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: Sizes.paddingNano),
                                child: _transactionRow(context, t),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteService.transactionHistoryPage,
                            ModalRoute.withName(RouteService.gravityBridgePage),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              totalTransactionsListLength <= 3
                                  ? S.current.SHOW_DETAILS_FOR_WIDGETS
                                  : S.current.VIEW_ALL_TRANSACTIONS,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Sizes.fontSizeXSmall,
                              ),
                            ),
                            const SizedBox(width: Sizes.paddingPico),
                            ImageNetworkOrAssetWidget(
                              svgAssetAsString: true,
                              imageUrl: SvgAssetsAsString.uiIconsChevronRight,
                              color: Theme.of(context).colorScheme.onPrimary,
                              width: Sizes.iconSizeXSmall,
                              height: Sizes.iconSizeXSmall,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}

Widget _transactionRow(BuildContext context, Transaction transaction) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteService.transactionHistoryPage,
            ModalRoute.withName(RouteService.gravityBridgePage),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            transaction.iconUrl == ""
                ? Container(
                    width: Sizes.iconSizeMedium,
                    height: Sizes.iconSizeMedium,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      shape: BoxShape.circle,
                    ),
                  )
                : ImageNetworkOrAssetWidget(
                    imageUrl: transaction.iconUrl,
                    width: Sizes.iconSizeMedium,
                    height: Sizes.iconSizeMedium,
                  ),
            const SizedBox(width: Sizes.paddingPico),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatTokenAmountUsingLocale(
                        tokenAmount: transaction.amount),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: transaction.isInProgress
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    transaction.symbol,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: Sizes.fontSize8),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            getChainIconFromWalletAddress(
              context: context,
              walletAddress: transaction.fromAddress,
              width: Sizes.iconSizeMedium,
              height: Sizes.iconSizeMedium,
            ),
            const SizedBox(width: Sizes.paddingPico),
            SizedBox(
              width: 90,
              child: SelfUpdatingTransactionProgressWidget(
                transaction: transaction,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(width: Sizes.paddingPico),
            getChainIconFromWalletAddress(
              context: context,
              walletAddress: transaction.toAddress,
              width: Sizes.iconSizeMedium,
              height: Sizes.iconSizeMedium,
            ),
          ],
        ),
      ),
      const SizedBox(height: Sizes.paddingNano),
      const Divider(),
    ],
  );
}
