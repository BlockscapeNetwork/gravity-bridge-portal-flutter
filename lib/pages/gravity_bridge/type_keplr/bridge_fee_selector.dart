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
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/bridge_fee_state.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/bridge_fee_chains_and_token_with_dots.dart';
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';
import 'package:gravity_bridge_flutter/widgets/fees_error_widget.dart';
import 'package:gravity_bridge_flutter/widgets/layout_builder_helper_widget.dart';
import 'package:gravity_bridge_flutter/utils/bridge_fee_type_translation.dart';
import 'keplr_provider.dart';

class BridgeFeeSelector extends StatefulWidget {
  final BridgeFeeState options;
  final BridgeFeeOption? selected;
  final void Function(BridgeFeeOption)? onOptionSelected;
  final bool disabled;

  const BridgeFeeSelector(
      {Key? key,
      required this.options,
      this.onOptionSelected,
      this.disabled = false,
      this.selected})
      : super(key: key);

  @override
  State<BridgeFeeSelector> createState() => _BridgeFeeSelectorState();
}

class _BridgeFeeSelectorState extends State<BridgeFeeSelector> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if (widget.options is BridgeFeeLoadedState) {
      List<BridgeFeeOption> options =
          (widget.options as BridgeFeeLoadedState).options;

      for (int i = 0; i < options.length; i++) {
        //not the last item
        if (i == 0 && isMobile(context)) {
          children.add(const SizedBox(
            height: Sizes.padding16,
            width: Sizes.padding16,
          ));
        }

        children.add(
          BridgeFeeOptionCard(
            option: options[i],
            selected: widget.selected != null &&
                options[i].type == widget.selected!.type,
            onSelected: () {
              if (widget.onOptionSelected != null) {
                widget.onOptionSelected!(options[i]);
              }
            },
          ),
        );

        //not the last item
        if (i < options.length - 1) {
          children.add(const SizedBox(
            height: 8.0,
            width: 8.0,
          ));
        }
      }
    } else if (widget.options is BridgeFeeLoadingState) {
      // placeholder
    } else if (widget.options is BridgeFeeErrorState) {
      if (widget.disabled) {
        children.add(SizedBox(
          width: double.infinity,
          child: Text(
            S.current.BRIDGE_FEE_ERROR,
            textAlign: TextAlign.start,
          ),
        ));
      } else {
        children.add(const FeesErrorWidget());
      }
    } else {
      children.add(Text(S.current.BRIDGE_FEE_SELECT_TOKEN));
    }

    return GravityBridgeContainer(
      padding: const EdgeInsets.all(0),
      color: Theme.of(context).backgroundColor,
      title: S.current.BRIDGE_FEE,
      child: DisabledWidget(
        disabled: widget.disabled,
        child: Column(
          children: [
            widget.options is BridgeFeeLoadingState
                ? const CircularProgressIndicator()
                : const SizedBox(),
            widget.options is BridgeFeeLoadedState
                ? LayoutBuilderHelper(
                    mobile: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: children,
                      ),
                    ),
                    desktop: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: children
                            .map((e) => e is BridgeFeeOptionCard
                                ? Expanded(child: e)
                                : e)
                            .toList(),
                      ),
                    ),
                  )
                : LayoutBuilderHelper(
                    mobile: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      ),
                    ),
                    desktop: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      ),
                    ),
                  ),
            widget.options is BridgeFeeLoadedState
                ? const BridgeFeeChainsAndTokenWithDots()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class BridgeFeeOptionCard extends ConsumerWidget {
  final BridgeFeeOption option;
  final bool selected;
  final void Function()? onSelected;

  const BridgeFeeOptionCard({
    Key? key,
    required this.option,
    this.onSelected,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TokenInfo? token = ref.watch(keplrProvider).token;

    return InkWell(
      onTap: onSelected,
      child: Container(
        height: isMobile(context) ? 112 : 172,
        width: double.infinity,
        padding: EdgeInsets.all(
          isMobile(context) ? Sizes.padding20 : Sizes.padding24,
        ),
        decoration: BoxDecoration(
          color: selected
              ? (Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.tertiary)
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.radius),
        ),
        child: isMobile(context)
            ?
            // layout for mobile view
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        option.type.typeTranslation(),
                        style: TextStyle(
                          fontSize: Sizes.fontSize16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(width: Sizes.paddingMicro),
                      ImageNetworkOrAssetWidget(
                        svgAssetAsString: true,
                        imageUrl: option.type.typeIcon(),
                        width: Sizes.iconSizeMedium,
                        height: Sizes.iconSizeMedium,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              option.type.typeSpeedDescription(),
                              style: TextStyle(
                                fontSize: Sizes.fontSizeXSmall,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                            FutureBuilder(
                              future:
                                  CoinGeckoService.requestUsDollarPriceForToken(
                                tokenName: ref.read(keplrProvider).token!.name,
                                tokenSymbol:
                                    ref.read(keplrProvider).token!.symbol,
                                tryFromCache: true,
                              ),
                              builder: (BuildContext context,
                                  AsyncSnapshot<double?> snapshot) {
                                double dollarPrice = 0;

                                if (snapshot.hasData && snapshot.data != null) {
                                  dollarPrice = snapshot.data!;
                                }
                                return Text(
                                  formatDollarValue(
                                    dollarValue: dollarPrice,
                                    // getBridgeFeeCost gives a string something like 10 DAI
                                    // but we only need 10, so split it and take the first value part of it
                                    tokenAmount: ref
                                        .read(keplrProvider.notifier)
                                        .getShortenedBridgeFeeCost(fee: option),
                                  ),
                                  style: TextStyle(
                                    fontSize: Sizes.fontSizeXSmall,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // for desktop view, we wrapped following Text widget with Flexible widget
                            // but Flexible widget broke the mobile view
                            Text(
                              // getBridgeFeeCost gives a string something like 10 DAI
                              // but we only need 10, so split it and take the first value part of it
                              "${formatTokenAmountUsingLocale(
                                tokenAmount: ref
                                    .read(keplrProvider.notifier)
                                    .getShortenedBridgeFeeCost(fee: option),
                              )}"
                              " ${ref.read(keplrProvider).token!.symbol}",
                              style: TextStyle(
                                fontSize: Sizes.fontSizeXSmall,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            Text(
                              option.type.typeDescription(),
                              style: TextStyle(
                                fontSize: Sizes.fontSizeXSmall,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            :
            // layout for desktop view
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        option.type.typeTranslation(),
                        style: TextStyle(
                          fontSize: Sizes.fontSize16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(width: Sizes.paddingMicro),
                      ImageNetworkOrAssetWidget(
                        svgAssetAsString: true,
                        imageUrl: option.type.typeIcon(),
                        width: Sizes.iconSizeMedium,
                        height: Sizes.iconSizeMedium,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        option.type.typeSpeedDescription(),
                        style: TextStyle(
                          fontSize: Sizes.fontSizeXSmall,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Text(
                        option.type.typeDescription(),
                        style: TextStyle(
                          fontSize: Sizes.fontSizeXSmall,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          // getBridgeFeeCost gives a string something like "10 DAI"
                          // but we only need 10, so split it and take the first value part of it
                          "${formatTokenAmountUsingLocale(
                            tokenAmount: ref
                                .read(keplrProvider.notifier)
                                .getShortenedBridgeFeeCost(fee: option),
                          )}"
                          " ${ref.read(keplrProvider).token!.symbol}",
                          style: TextStyle(
                            fontSize: Sizes.fontSizeXSmall,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: CoinGeckoService.requestUsDollarPriceForToken(
                          tokenName: ref.read(keplrProvider).token!.name,
                          tokenSymbol: ref.read(keplrProvider).token!.symbol,
                          tryFromCache: true,
                        ),
                        builder: (BuildContext context,
                            AsyncSnapshot<double?> snapshot) {
                          double dollarPrice = 0;

                          if (snapshot.hasData && snapshot.data != null) {
                            dollarPrice = snapshot.data!;
                          }
                          return Text(
                            formatDollarValue(
                              dollarValue: dollarPrice,
                              // getBridgeFeeCost gives a string something like 10 DAI
                              // but we only need 10, so split it and take the first value part of it
                              tokenAmount: ref
                                  .read(keplrProvider.notifier)
                                  .getShortenedBridgeFeeCost(fee: option),
                            ),
                            style: TextStyle(
                              fontSize: Sizes.fontSizeXSmall,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
