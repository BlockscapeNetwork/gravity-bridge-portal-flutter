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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/batch.pb.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/batches_service.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/route_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/batch_remaining_time_text.dart';
import 'package:gravity_bridge_flutter/widgets/dotted_horizontal_line_with_arrow.dart';
import 'package:shimmer/shimmer.dart';

class GravityBridgeRecentBatches extends StatelessWidget {
  const GravityBridgeRecentBatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GravityService().getUnrelayedBatches(),
      builder: (BuildContext context,
          AsyncSnapshot<List<OutgoingTxBatch>> snapshot) {
        List<Batch> batches = [];
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          batches = BatchesService()
              .generateBatchesListFromOutgoingTxBatches(snapshot.data!);
          final int totalBatchesListLength = batches.length;
          if (batches.length > 3) {
            batches.length = 3;
          }
          return _RecentBatchesWidgetContainer(
            child: batches.isEmpty
                ? Text(
                    S.current.NO_RECENT_BATCHES,
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
                          children: batches
                              .map(
                                (batch) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: Sizes.paddingNano),
                                  child: _batchesRow(context, batch),
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
                              RouteService.batchesPage,
                              ModalRoute.withName(
                                  RouteService.gravityBridgePage),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                totalBatchesListLength <= 3
                                    ? S.current.SHOW_DETAILS_FOR_WIDGETS
                                    : S.current.VIEW_ALL_BATCHES,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                      ),
                    ],
                  ),
          );
        } else {
          return _RecentBatchesWidgetContainer(
            child: SizedBox(
              width: double.infinity,
              height: 2 * 56,
              child: ListView.builder(
                itemCount: 2, // default 2 mocked batch row
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Color.alphaBlend(
                      Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.color
                              ?.withOpacity(0.111) ??
                          Theme.of(context).backgroundColor,
                      Theme.of(context).colorScheme.secondary,
                    ),
                    highlightColor: Theme.of(context).colorScheme.secondary,
                    child: _mockedBatchRow(context),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class _RecentBatchesWidgetContainer extends StatelessWidget {
  final Widget child;
  const _RecentBatchesWidgetContainer({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return GravityBridgeWidget(
      title: Text(
        S.current.RECENT_BATCHES,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Sizes.fontSize16,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
        ],
      ),
    );
  }
}

Widget _batchesRow(BuildContext context, Batch batch) {
  return FutureBuilder(
    future: CoinGeckoService()
        .getTokenFromTokenContractAddress(batch.tokenContractAddress),
    builder: (BuildContext context, AsyncSnapshot<Token> snapshotToken) {
      Token token = Token(
        chainId: 0,
        address: "",
        name: "",
        symbol: "",
        decimals: 0,
        logoUri: "",
      );

      if (snapshotToken.hasData && snapshotToken.data!.logoUri != null) {
        token = snapshotToken.data!;
      }
      final String tokenAmount =
          convertIntToDecimalAmount(batch.amount, token.decimals!);
      return Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteService.batchesPage,
                ModalRoute.withName(RouteService.gravityBridgePage),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                token.logoUri == ""
                    ? Container(
                        width: Sizes.iconSizeMedium,
                        height: Sizes.iconSizeMedium,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          shape: BoxShape.circle,
                        ),
                      )
                    : ImageNetworkOrAssetWidget(
                        imageUrl: token.logoUri!,
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
                        formatTokenAmountUsingLocale(tokenAmount: tokenAmount),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Text(
                        token.symbol ?? "",
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: Sizes.fontSize8),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                ImageNetworkOrAssetWidget(
                  imageUrl: getAsset(getChainFromWalletAddress(batch.sender)!),
                  width: Sizes.iconSizeMedium,
                  height: Sizes.iconSizeMedium,
                ),
                const SizedBox(width: Sizes.paddingPico),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    DottedHorizontalLineWithArrow(
                      width: 90,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.paddingPico),
                      child: BatchRemainingTimeText(
                        batch: batch,
                        fontSize: Sizes.fontSizeXSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: Sizes.paddingPico),
                ImageNetworkOrAssetWidget(
                  imageUrl:
                      getAsset(getChainFromWalletAddress(batch.destAddress)!),
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
    },
  );
}

Widget _mockedBatchRow(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 55.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Sizes.iconSizeMedium,
              height: Sizes.iconSizeMedium,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: Sizes.paddingMicro),
            SizedBox(
              width: 120,
              child: Row(
                children: [
                  Text(
                    "100.00",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(width: Sizes.paddingPico),
                  Text(
                    "TKN",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: Sizes.iconSizeMedium,
              height: Sizes.iconSizeMedium,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: Sizes.paddingMicro),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                DottedHorizontalLineWithArrow(
                  width: 90,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.paddingPico),
                  child: const Text("02:10 hrs"),
                ),
              ],
            ),
            const SizedBox(width: Sizes.paddingMicro),
            Container(
              width: Sizes.iconSizeMedium,
              height: Sizes.iconSizeMedium,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 0.5,
        width: double.infinity,
        color: Theme.of(context).colorScheme.tertiary,
      ),
    ],
  );
}
