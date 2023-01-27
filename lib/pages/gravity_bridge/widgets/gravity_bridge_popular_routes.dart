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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/currency_registry/cr_mainnet.dart';
import 'package:gravity_bridge_flutter/services/currency_registry/currency_registry.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/dotted_horizontal_line_with_arrow.dart';

// TODO
// This Popular Routes widget is not ready to use
// it will be discussed internally

class GravityBridgePopularRoutes extends ConsumerWidget {
  const GravityBridgePopularRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      // TODO
      // uncomment following padding set - related with 'View all routes >'
      // padding: const EdgeInsets.all(Sizes.padding16),
      padding: const EdgeInsets.only(
          left: Sizes.padding16, top: Sizes.padding16, right: Sizes.padding16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.POPULAR_ROUTES,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.fontSize16,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: Sizes.padding16),
          _routesRow(
            context,
            ref,
            mainnetRegistry.currencies
                .firstWhere((currency) => currency.name == "USD Coin [Axelar]"),
            Chain.gravity,
            Chain.ethereum,
          ),
          _routesRow(
            context,
            ref,
            mainnetRegistry.currencies.firstWhere(
                (currency) => currency.name == "Tether USD [Axelar]"),
            Chain.gravity,
            Chain.ethereum,
          ),
          _routesRow(
            context,
            ref,
            mainnetRegistry.currencies.firstWhere(
                (currency) => currency.name == "Wrapped Ether [Axelar]"),
            Chain.ethereum,
            Chain.gravity,
          ),

          // TODO
          // currently we do not have a layout about 'View all routes >'
          // following lines can be uncomment after finding a purpose for it
          // const SizedBox(height: Sizes.padding16),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: InkWell(
          //     onTap: () {},
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text(
          //           S.current.VIEW_ALL_ROUTES,
          //           style: TextStyle(
          //             color: Theme.of(context).colorScheme.onPrimary,
          //             fontSize: Sizes.fontSizeXSmall,
          //           ),
          //         ),
          //         const SizedBox(width: Sizes.paddingPico),
          //         ImageNetworkOrAssetWidget(
          //           svgAssetAsString: true,
          //           imageUrl: SvgAssetsAsString.uiIconsChevronRight,
          //           color: Theme.of(context).colorScheme.onPrimary,
          //           width: Sizes.iconSizeXSmall,
          //           height: Sizes.iconSizeXSmall,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget _routesRow(
  BuildContext context,
  WidgetRef ref,
  Currency currency,
  Chain fromChain,
  Chain toChain,
) {
  return Column(
    children: [
      SizedBox(
        height: 55.5,
        child: InkWell(
          onTap: () {
            final providerNotifier = ref.read(gravityBridgeProvider.notifier);

            providerNotifier.setFromAndToChain(fromChain, toChain);

            // setting tween value helps us to define which card (_MetamaskCard or _KeplrCard) is on top/bottom
            if (fromChain == Chain.ethereum) {
              providerNotifier.setTweenValue(0);
            } else if (toChain == Chain.ethereum) {
              providerNotifier.setTweenValue(1);
            } else {
              if (fromChain == Chain.gravity) {
                providerNotifier.setTweenValue(1);
              } else {
                providerNotifier.setTweenValue(0);
              }
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageNetworkOrAssetWidget(
                imageUrl: currency.iconUrl,
                width: Sizes.iconSizeMedium,
                height: Sizes.iconSizeMedium,
              ),
              const SizedBox(width: Sizes.paddingMicro),
              Text(
                // if currency is axelar token
                // then format the currency symbol
                // (eg. from DAI.axl to DAI)
                currency.symbol.contains(".")
                    ? currency.symbol.split(".")[0]
                    : currency.symbol,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Sizes.fontSizeXSmall,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: Sizes.iconSizeMedium,
                    child: Transform.rotate(
                      angle: math.pi / 9,
                      child: Container(
                        width: 1,
                        height: double.infinity,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ),
              getChainIconFromChain(
                context: context,
                chain: fromChain,
                width: Sizes.iconSizeMedium,
                height: Sizes.iconSizeMedium,
              ),
              const SizedBox(width: Sizes.paddingMicro),
              Text(
                fromChain.chainName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Sizes.fontSizeXSmall,
                ),
              ),
              const SizedBox(width: Sizes.padding12),
              DottedHorizontalLineWithArrow(
                width: 31,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(width: Sizes.padding12),
              Text(
                toChain.chainName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Sizes.fontSizeXSmall,
                ),
              ),
              const SizedBox(width: Sizes.paddingMicro),
              getChainIconFromChain(
                context: context,
                chain: toChain,
                width: Sizes.iconSizeMedium,
                height: Sizes.iconSizeMedium,
              ),
            ],
          ),
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
