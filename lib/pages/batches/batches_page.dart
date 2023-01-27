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
import 'package:flutter/services.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/batch.pb.dart';
import 'package:gravity_bridge_flutter/pages/batches/batch_detail_page.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/batches_service.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/batch_remaining_time_text.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/open_link_icon_button.dart';
import 'package:gravity_bridge_flutter/widgets/dotted_horizontal_line_with_arrow.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';
import 'package:shimmer/shimmer.dart';

const double _columnPadding = 15;
const int _amountColumnFlex = 3;
const int _remainingTimeColumnFlex = 1;
const int _routeColumnFlex = 4;
const int _nonceColumnFlex = 1;
const int _blockColumnFlex = 1;
const int _feeColumnFlex = 1;

class BatchesPage extends StatelessWidget {
  const BatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      constraints: const BoxConstraints(
        maxWidth: Sizes.desktopMaxWidth,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 0.5,
            width: double.infinity,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          Padding(
            padding: generatePageHorizontalPadding(context),
            child: Padding(
              padding: EdgeInsets.only(
                top: isMobile(context)
                    ? Sizes.paddingXSmall
                    : Sizes.paddingMedium,
                bottom: Sizes.paddingXSmall,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.current.MENU_ITEM_BATCHES,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: Sizes.fontSizeLarge,
                      ),
                ),
              ),
            ),
          ),
          isMobile(context)
              ? Container(height: Sizes.paddingMicro)
              : Padding(
                  padding: generatePageHorizontalPadding(context),
                  child: Container(
                    height: 0.5,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
          Card(
            color: Theme.of(context).backgroundColor,
            margin: EdgeInsets.zero,
            elevation: 0,
            child: const Align(
              alignment: Alignment.center,
              child: _BatchesList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BatchesList extends StatelessWidget {
  const _BatchesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GravityService().getUnrelayedBatches(),
      builder: (BuildContext context,
          AsyncSnapshot<List<OutgoingTxBatch>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Batch> batches = BatchesService()
              .generateBatchesListFromOutgoingTxBatches(snapshot.data!);
          List<String> contractAddresses = BatchesService().contractAddresses;

          return isMobile(context)
              ? _batchesListMobile(batches, contractAddresses)
              : _batchesListDesktop(context, batches, contractAddresses);
        } else {
          return isMobile(context)
              ? SizedBox(
                  width: double.infinity,
                  height: 2 * (120 + Sizes.padding16) + 100,
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
                        child: _batchCardMobileMocked(context),
                      );
                    },
                  ),
                )
              : Column(
                  children: [
                    _desktopHeaderRow(context),
                    SizedBox(
                      width: double.infinity,
                      height: 2 * 96 + 100,
                      child: ListView.builder(
                        itemCount: 2, // default 2 mocked batch row
                        itemBuilder: (context, index) {
                          return _buildMockedDesktopRow(context);
                        },
                      ),
                    )
                  ],
                );
        }
      },
    );
  }
}

Widget _batchesListMobile(List<Batch> batches, List<String> contractAddresses) {
  return SizedBox(
    width: double.infinity,
    height: batches.length * (120 + Sizes.padding16) + 100,
    child: ListView.builder(
      itemCount: batches.length,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder(
          future: CoinGeckoService().getTokenFromTokenContractAddress(
              batches[index].tokenContractAddress),
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
            return FutureBuilder(
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
                return _batchCardMobile(
                    context, batches[index], token, dollarPrice);
              },
            );
          },
        );
      },
    ),
  );
}

Widget _batchCardMobile(
    BuildContext context, Batch batch, Token token, double dollarPrice) {
  return Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(
        Sizes.radius,
      ),
    ),
    margin: const EdgeInsets.only(
      bottom: Sizes.padding16,
    ),
    child: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.padding16,
              right: Sizes.padding16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                token.logoUri == ""
                    ? Container(
                        width: Sizes.iconSizeXLarge,
                        height: Sizes.iconSizeXLarge,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          shape: BoxShape.circle,
                        ),
                      )
                    : ImageNetworkOrAssetWidget(
                        imageUrl: token.logoUri!,
                        width: Sizes.iconSizeXLarge,
                        height: Sizes.iconSizeXLarge,
                      ),
                const SizedBox(width: Sizes.paddingMicro),
                SizedBox(
                  width: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "${formatTokenAmountUsingLocale(tokenAmount: convertIntToDecimalAmount(batch.amount, token.decimals!))} ${token.symbol!.toUpperCase()}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: Sizes.paddingPico),
                      Text(
                        formatDollarValue(
                          dollarValue: dollarPrice,
                          tokenAmount: batch.amount,
                          tokenDecimals: token.decimals!,
                        ),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Sizes.fontSizeXSmall),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                ImageNetworkOrAssetWidget(
                  imageUrl: getAsset(getChainFromWalletAddress(batch.sender)!),
                  width: Sizes.iconSizeXLarge,
                  height: Sizes.iconSizeXLarge,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.paddingPico),
                      child: BatchRemainingTimeText(
                        batch: batch,
                        fontSize: Sizes.fontSizeXSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: Sizes.paddingMicro),
                ImageNetworkOrAssetWidget(
                  imageUrl:
                      getAsset(getChainFromWalletAddress(batch.destAddress)!),
                  width: Sizes.iconSizeXLarge,
                  height: Sizes.iconSizeXLarge,
                ),
              ],
            ),
          ),
        ),
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
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      BatchDetailPageWidget(batch: batch, token: token),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Sizes.paddingMicro),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: Sizes.iconSizeLarge,
                    height: Sizes.iconSizeLarge,
                  ),
                  Text(
                    S.current.SHOW_DETAILS,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Sizes.fontSizeMedium,
                    ),
                  ),
                  ImageNetworkOrAssetWidget(
                    svgAssetAsString: true,
                    imageUrl: SvgAssetsAsString.uiIconsChevronRight,
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: Sizes.iconSizeLarge,
                    height: Sizes.iconSizeLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _batchCardMobileMocked(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(
        Sizes.radius,
      ),
    ),
    margin: const EdgeInsets.only(
      bottom: Sizes.padding16,
    ),
    child: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.padding16,
              right: Sizes.padding16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Sizes.iconSizeXLarge,
                  height: Sizes.iconSizeXLarge,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: Sizes.paddingMicro),
                SizedBox(
                  width: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "${formatTokenAmountUsingLocale(tokenAmount: "100.00")} TKN",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: Sizes.paddingPico),
                      Text(
                        formatDollarValue(dollarValue: 100.00),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: Sizes.fontSizeXSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: Sizes.iconSize32,
                  height: Sizes.iconSize32,
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
                      width: 107,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.paddingPico),
                      child: const Text("02:10 hrs"),
                    ),
                  ],
                ),
                const SizedBox(width: Sizes.paddingMicro),
                Container(
                  width: Sizes.iconSize32,
                  height: Sizes.iconSize32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingMicro),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: Sizes.iconSizeLarge,
                  height: Sizes.iconSizeLarge,
                ),
                Text(
                  S.current.SHOW_DETAILS,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Sizes.fontSizeMedium,
                  ),
                ),
                ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsChevronRight,
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: Sizes.iconSizeLarge,
                  height: Sizes.iconSizeLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _batchesListDesktop(
    BuildContext context, List<Batch> batches, List<String> contractAddresses) {
  return Scrollbar(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: Sizes.desktopMaxWidth1000,
          maxWidth:
              MediaQuery.of(context).size.width > Sizes.desktopMaxWidth1000 &&
                      MediaQuery.of(context).size.width < Sizes.desktopMaxWidth
                  ? MediaQuery.of(context).size.width
                  : Sizes.desktopMaxWidth,
        ),
        child: Container(
          width: double.infinity,
          padding: generatePageHorizontalPadding(context),
          child: Column(
            children: [
              _desktopHeaderRow(context),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              SizedBox(
                width: double.infinity,
                height: batches.length * 96 + 100,
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: batches.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                          future: CoinGeckoService()
                              .getTokenFromTokenContractAddress(
                                  batches[index].tokenContractAddress),
                          builder: (BuildContext context,
                              AsyncSnapshot<Token> snapshot) {
                            Token token = Token(
                              chainId: 0,
                              address: "",
                              name: "",
                              symbol: "",
                              decimals: 0,
                              logoUri: "",
                            );
                            if (snapshot.hasData &&
                                snapshot.data!.logoUri != null) {
                              token = snapshot.data!;
                            }
                            return _desktopContentRow(
                                context, batches[index], token);
                          });
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

Widget _desktopHeaderRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: Sizes.padding32),
    child: Row(
      children: [
        Expanded(
          flex: _amountColumnFlex,
          child: Text(
            S.current.AMOUNT,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        const SizedBox(width: _columnPadding),
        Expanded(
          flex: _remainingTimeColumnFlex,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.REMAINING,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Text(
                S.current.STARTED_AT,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: Sizes.fontSizeXSmall),
              )
            ],
          ),
        ),
        const SizedBox(width: _columnPadding),
        Expanded(
          flex: _routeColumnFlex,
          child: Text(
            S.current.ROUTE,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        const SizedBox(width: _columnPadding),
        Expanded(
          flex: _nonceColumnFlex,
          child: Center(
            child: Text(
              S.current.NONCE,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: _columnPadding),
        Expanded(
          flex: _blockColumnFlex,
          child: Center(
            child: Text(
              S.current.BLOCK,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: _columnPadding),
        Expanded(
          flex: _feeColumnFlex,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              S.current.FEE,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _desktopContentRow(BuildContext context, Batch batch, Token token) {
  return FutureBuilder(
    future: CoinGeckoService.requestUsDollarPriceForToken(
      tokenName: token.name!,
      tokenSymbol: token.symbol!,
      tryFromCache: true,
    ),
    builder: (BuildContext context, AsyncSnapshot<double?> snapshotDouble) {
      double dollarPrice = 0;

      if (snapshotDouble.hasData && snapshotDouble.data != null) {
        dollarPrice = snapshotDouble.data!;
      }
      return Container(
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
            /// AMOUNT COLUMN
            Expanded(
              flex: _amountColumnFlex,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    token.logoUri == ""
                        ? Container(
                            width: Sizes.iconSize32,
                            height: Sizes.iconSize32,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                shape: BoxShape.circle),
                          )
                        : ImageNetworkOrAssetWidget(
                            imageUrl: token.logoUri!,
                            width: Sizes.iconSize32,
                            height: Sizes.iconSize32,
                          ),
                    const SizedBox(width: Sizes.paddingMicro),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formatTokenAmountUsingLocale(
                                tokenAmount: convertIntToDecimalAmount(
                                    batch.amount, token.decimals!),
                              ) +
                              " ${(token.symbol?.toUpperCase() ?? "")}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Sizes.fontSize16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          formatDollarValue(
                            dollarValue: dollarPrice,
                            tokenAmount: batch.amount,
                            tokenDecimals: token.decimals!,
                          ),
                          style: TextStyle(
                            fontSize: Sizes.fontSizeXSmall,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: _columnPadding),

            /// REMAINING TIME COLUMN
            Expanded(
              flex: _remainingTimeColumnFlex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BatchRemainingTimeText(
                    batch: batch,
                    fontSize: Sizes.fontSize16,
                  ),
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
                            fontSize: Sizes.fontSizeXSmall,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(width: _columnPadding),

            /// ROUTE COLUMN
            Expanded(
              flex: _routeColumnFlex,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageNetworkOrAssetWidget(
                    imageUrl:
                        getAsset(getChainFromWalletAddress(batch.sender)!),
                    width: Sizes.iconSizeLarge,
                    height: Sizes.iconSizeLarge,
                  ),
                  const SizedBox(width: Sizes.paddingMicro),
                  Tooltip(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.paddingXSmall,
                        vertical: Sizes.paddingPico),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(Sizes.radius4),
                    ),
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: Sizes.fontSizeXSmall,
                    ),
                    message: batch.sender,
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: batch.sender))
                            .then(
                          (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                content: Text(
                                  S.current.COPY_TO_CLIPBOARD_CONFIRMATION,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        batch.sender.truncateDots(),
                        style: TextStyle(
                          fontSize: Sizes.fontSize16,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Sizes.paddingMicro),
                  OpenLinkIconButton(
                    url: scanLinkGenerator(
                      accountHash: batch.sender,
                    ),
                  ),
                  const SizedBox(width: Sizes.paddingMicro),
                  DottedHorizontalLineWithArrow(
                    width: 32,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(width: Sizes.paddingMicro),
                  ImageNetworkOrAssetWidget(
                    imageUrl:
                        getAsset(getChainFromWalletAddress(batch.destAddress)!),
                    width: Sizes.iconSizeLarge,
                    height: Sizes.iconSizeLarge,
                  ),
                  const SizedBox(width: Sizes.paddingMicro),
                  Tooltip(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.paddingXSmall,
                        vertical: Sizes.paddingPico),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(Sizes.radius4),
                    ),
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: Sizes.fontSizeXSmall,
                    ),
                    message: batch.destAddress,
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                                ClipboardData(text: batch.destAddress))
                            .then(
                          (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                content: Text(
                                  S.current.COPY_TO_CLIPBOARD_CONFIRMATION,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        batch.destAddress.truncateDots(),
                        style: TextStyle(
                          fontSize: Sizes.fontSize16,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Sizes.paddingMicro),
                  OpenLinkIconButton(
                    url: scanLinkGenerator(
                      accountHash: batch.destAddress,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: _columnPadding),

            /// NONCE COLUMN
            Expanded(
              flex: _nonceColumnFlex,
              child: Center(
                child: Text(
                  batch.nonce.toString(),
                  style: TextStyle(
                    fontSize: Sizes.fontSize16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: _columnPadding),

            /// BLOCK COLUMN
            Expanded(
              flex: _blockColumnFlex,
              child: Center(
                child: Text(
                  batch.block.toString(),
                  style: TextStyle(
                    fontSize: Sizes.fontSize16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: _columnPadding),

            /// FEE COLUMN
            Expanded(
              flex: _feeColumnFlex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    batch.fee.startsWith("nat")
                        ? formatTokenAmountUsingLocale(tokenAmount: "0")
                        : formatTokenAmountUsingLocale(
                            tokenAmount: convertIntToDecimalAmount(
                                batch.fee, token.decimals!)),
                    style: TextStyle(
                      fontSize: Sizes.fontSize16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    batch.fee.startsWith("nat")
                        ? formatDollarValue(dollarValue: 0)
                        : formatDollarValue(
                            dollarValue: dollarPrice,
                            tokenAmount: batch.fee,
                            tokenDecimals: token.decimals!,
                          ),
                    style: TextStyle(
                      fontSize: Sizes.fontSizeXSmall,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildMockedDesktopRow(BuildContext context) {
  return Container(
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
            flex: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: Sizes.iconSize32,
                    height: Sizes.iconSize32,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 5),
                  const Text("TKN")
                ],
              ),
            )),
        Expanded(
          flex: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "100.00",
                style: TextStyle(
                  fontSize: Sizes.fontSize16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                "\$100",
                style: TextStyle(
                  fontSize: Sizes.fontSizeXSmall,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("02:10 hrs"),
              Text(
                "01.01.2022 - 15:00",
                style: TextStyle(
                  fontSize: Sizes.fontSizeXSmall,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Sizes.iconSizeLarge,
                height: Sizes.iconSizeLarge,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: Sizes.paddingMicro),
              Text(
                "ibc/E97634A40119F1898989C2A23224ED83FDD0A57EA46B3A094E287288D1672B44"
                    .truncateDots(),
                style: TextStyle(
                  fontSize: Sizes.fontSize16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              const SizedBox(width: Sizes.paddingMicro),
              DottedHorizontalLineWithArrow(
                width: 32,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: Sizes.paddingMicro),
              Container(
                width: Sizes.iconSizeLarge,
                height: Sizes.iconSizeLarge,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: Sizes.paddingMicro),
              Text(
                "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2".truncateDots(),
                style: TextStyle(
                  fontSize: Sizes.fontSize16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Center(
            child: Text(
              "7777",
              style: TextStyle(
                fontSize: Sizes.fontSize16,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Center(
            child: Text(
              "4444444",
              style: TextStyle(
                fontSize: Sizes.fontSize16,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatTokenAmountUsingLocale(tokenAmount: "0"),
                style: TextStyle(
                  fontSize: Sizes.fontSize16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Text(
                formatDollarValue(dollarValue: 0),
                style: TextStyle(
                  fontSize: Sizes.fontSizeXSmall,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
