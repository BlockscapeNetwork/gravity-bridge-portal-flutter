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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

class GravityBridgeTransactionQueue extends ConsumerWidget {
  const GravityBridgeTransactionQueue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GravityBridgeWidget(
      title: Row(
        children: [
          Text(
            S.current.TRANSACTION_QUEUE,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.fontSize16,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(width: Sizes.paddingPico),
          Tooltip(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.paddingXSmall,
              vertical: Sizes.paddingPico,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(Sizes.radius4),
            ),
            textStyle: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: Sizes.fontSizeXSmall,
            ),
            message: S.current.TRANSACTION_QUEUE_INFO_WIDGET_TOOLTIP_MESSAGE,
            child: ImageNetworkOrAssetWidget(
              svgAssetAsString: true,
              imageUrl: SvgAssetsAsString.uiIconsInfo,
              width: Sizes.iconSizeXSmall,
              height: Sizes.iconSizeXSmall,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
      isVisible: ref.watch(gravityBridgeProvider
          .select((s) => s.isTransactionQueueWidgetVisible)),
      onVisibleChanged: ((val) {
        ref
            .read(gravityBridgeProvider.notifier)
            .setTransactionQueueWidgetVisibility(val);
      }),
      hasVisibleSwitch: true,
      child: FutureBuilder(
        future: GravityService().getGravityChainTransactionQueueInfo(),
        builder: (BuildContext context,
            AsyncSnapshot<List<TransactionQueue>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Column(
              children: [
                _transactionQueueHeaderRow(context),
                const Divider(height: Sizes.paddingMicro),
                for (var i = 0; i < snapshot.data!.length; ++i)
                  _transactionQueueRow(
                    context,
                    snapshot.data![i].tokenContractAddress,
                    snapshot.data![i].txCount,
                    snapshot.data![i].totalFees,
                  )
              ],
            );
          } else {
            return Text(
              S.current.GRAVITY_TRANSACTION_QUEUE_INFO_FETCHING,
              style: TextStyle(
                fontSize: Sizes.fontSizeSmall,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          }
        },
      ),
    );
  }
}

Widget _transactionQueueHeaderRow(
  BuildContext context,
) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(
          S.current.TOKEN,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: Sizes.fontSizeSmall,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          S.current.NUM_OF_TXS,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Sizes.fontSizeSmall,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          S.current.TOTAL_FEES,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: Sizes.fontSizeSmall,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    ],
  );
}

Widget _transactionQueueRow(
  BuildContext context,
  String tokenContractAddress,
  String numOfTxs,
  String totalFees,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: FutureBuilder<String?>(
          future: MetamaskService.erc20GetSymbolWithoutWalletConnect(
              tokenContractAddress),
          builder: (context, snapshot) {
            String tokenName = "";
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              tokenName = snapshot.data!;
            } else {
              tokenName = tokenContractAddress.truncateDots();
            }
            return Text(
              tokenName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Sizes.fontSizeSmall,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          numOfTxs,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Sizes.fontSizeSmall,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: FutureBuilder(
            future: CoinGeckoService()
                .getTokenFromTokenContractAddress(tokenContractAddress),
            builder:
                (BuildContext context, AsyncSnapshot<Token> snapshotToken) {
              Token token = Token(
                chainId: 0,
                address: "",
                name: "",
                symbol: "",
                decimals: 0,
                logoUri: "",
              );

              if (snapshotToken.hasData &&
                  snapshotToken.connectionState == ConnectionState.done) {
                token = snapshotToken.data!;
              }
              return FutureBuilder<double?>(
                  future: CoinGeckoService.requestUsDollarPriceForToken(
                    tokenName: token.name!,
                    tokenSymbol: token.symbol!,
                    tryFromCache: true,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<double?> snapshotDouble) {
                    double dollarPrice = 0;

                    if (snapshotDouble.hasData && snapshotDouble.data != null) {
                      dollarPrice = snapshotDouble.data!;
                    }
                    return FutureBuilder<num?>(
                      future:
                          MetamaskService.erc20GetDecimalsWithoutWalletConnect(
                              tokenContractAddress),
                      builder: (BuildContext context,
                          AsyncSnapshot<num?> snapshotNum) {
                        String totalFeesText = totalFees;

                        if (snapshotNum.connectionState ==
                                ConnectionState.done &&
                            snapshotNum.hasData) {
                          if (token.decimals != 0 && dollarPrice != 0) {
                            totalFeesText = formatDollarValue(
                              dollarValue: dollarPrice,
                              tokenAmount: totalFees,
                              tokenDecimals: token.decimals!,
                            );
                          } else if (snapshotNum.data != null &&
                              (dollarPrice == 0 || token.decimals == 0)) {
                            totalFeesText = (double.parse(totalFees) /
                                    pow(10, snapshotNum.data!))
                                .toString();
                          }
                        }
                        return Text(
                          totalFeesText,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: Sizes.fontSizeSmall,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        );
                      },
                    );
                  });
            }),
      ),
    ],
  );
}
