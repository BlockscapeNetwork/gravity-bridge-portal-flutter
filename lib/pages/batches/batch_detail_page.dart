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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/batches_service.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/batch_remaining_time_text.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';

class BatchDetailPageWidget extends StatelessWidget {
  Batch batch;
  Token token;
  BatchDetailPageWidget({
    required this.batch,
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      child: FutureBuilder(
          future: CoinGeckoService.requestUsDollarPriceForToken(
            tokenName: token.name!,
            tokenSymbol: token.symbol!,
            tryFromCache: true,
          ),
          builder: (BuildContext context, AsyncSnapshot<double?> snapshot) {
            double dollarPrice = 0;

            if (snapshot.hasData && snapshot.data != null) {
              dollarPrice = snapshot.data!;
            }
            return Column(
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
                        padding:
                            const EdgeInsets.only(top: Sizes.paddingPico / 2),
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
                        child: Text(
                          S.current.BATCH + " #" + batch.nonce.toString(),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: Sizes.fontSizeLarge,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.TOKEN.toUpperCase(),
                  Row(
                    children: [
                      token.logoUri == ""
                          ? Container(
                              width: Sizes.iconSize32,
                              height: Sizes.iconSize32,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                shape: BoxShape.circle,
                              ),
                            )
                          : ImageNetworkOrAssetWidget(
                              imageUrl: token.logoUri!,
                              width: Sizes.iconSize32,
                              height: Sizes.iconSize32,
                            ),
                      const SizedBox(width: Sizes.paddingMicro),
                      Text(
                        token.name!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: Sizes.fontSize16,
                        ),
                      ),
                    ],
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.AMOUNT,
                  Padding(
                    padding: const EdgeInsets.only(right: Sizes.padding16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              formatTokenAmountUsingLocale(
                                      tokenAmount: convertIntToDecimalAmount(
                                          batch.amount, token.decimals!)) +
                                  " " +
                                  token.symbol!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Sizes.fontSize16,
                              ),
                            ),
                            const SizedBox(width: Sizes.padding16),
                            dollarPrice != 0
                                ? Text(
                                    formatDollarValue(
                                      dollarValue: dollarPrice,
                                      tokenAmount: batch.amount,
                                      tokenDecimals: token.decimals!,
                                    ),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: Sizes.fontSize16,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        const SizedBox(height: Sizes.paddingMicro),
                        Text(
                          batch.tokenContractAddress,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Sizes.fontSize16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.FEE,
                  Padding(
                    padding: const EdgeInsets.only(right: Sizes.padding16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              batch.fee.startsWith("nat")
                                  ? formatTokenAmountUsingLocale(
                                      tokenAmount: "0")
                                  : formatTokenAmountUsingLocale(
                                          tokenAmount:
                                              convertIntToDecimalAmount(
                                                  batch.fee, token.decimals!)) +
                                      " " +
                                      token.symbol!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Sizes.fontSize16,
                              ),
                            ),
                            const SizedBox(width: Sizes.padding16),
                            dollarPrice != 0
                                ? Text(
                                    formatDollarValue(
                                      dollarValue: dollarPrice,
                                      tokenAmount: batch.fee,
                                      tokenDecimals: token.decimals!,
                                    ),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: Sizes.fontSize16,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        const SizedBox(height: Sizes.paddingMicro),
                        Text(
                          batch.tokenContractAddress,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Sizes.fontSize16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.REMAINING,
                  BatchRemainingTimeText(
                    batch: batch,
                    fontSize: Sizes.fontSize16,
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.STARTED_AT,
                  FutureBuilder(
                      future: generateDatetimeFromGravityTimestamp(batch.block),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        String text = "";

                        if (snapshot.hasData) {
                          text = snapshot.data!;
                        }
                        return Text(
                          text,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Sizes.fontSize16,
                          ),
                        );
                      }),
                ),
                _batchDetailRow(
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
                              walletAddress: batch.sender,
                            ),
                            const SizedBox(width: Sizes.paddingMicro),
                            Text(
                              getChainFromWalletAddress(batch.sender)
                                      ?.chainName ??
                                  "",
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: Sizes.fontSize16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Sizes.padding16),
                        Text(
                          batch.sender,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Sizes.fontSize16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _batchDetailRow(
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
                              walletAddress: batch.destAddress,
                            ),
                            const SizedBox(width: Sizes.paddingMicro),
                            Text(
                              getChainFromWalletAddress(batch.destAddress)
                                      ?.chainName ??
                                  "",
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: Sizes.fontSize16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Sizes.padding16),
                        Text(
                          batch.destAddress,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Sizes.fontSize16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.NONCE,
                  Text(
                    batch.nonce.toString(),
                    style: TextStyle(
                      fontSize: Sizes.fontSize16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                _batchDetailRow(
                  context,
                  S.current.BLOCK,
                  Text(
                    batch.block.toString(),
                    style: TextStyle(
                      fontSize: Sizes.fontSize16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            );
          }),
    );
  }
}

Widget _batchDetailRow(BuildContext context, String title, Widget child) {
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
