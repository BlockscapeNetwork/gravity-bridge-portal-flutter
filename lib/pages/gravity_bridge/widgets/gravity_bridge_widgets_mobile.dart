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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_recent_batches.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_recent_transactions.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_supply_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_transaction_queue.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_volume_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';

class GravityBridgeWidgetsMobile extends StatefulWidget {
  const GravityBridgeWidgetsMobile({Key? key}) : super(key: key);

  @override
  State<GravityBridgeWidgetsMobile> createState() =>
      _GravityBridgeWidgetsMobileState();
}

class _GravityBridgeWidgetsMobileState
    extends State<GravityBridgeWidgetsMobile> {
  bool popupMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    final double viewHeight = MediaQuery.of(context).size.height;
    const double heightOffset = 75;
    return PopupMenuButton(
      tooltip: "", // removes default tooltip "Show menu"
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: viewHeight - heightOffset,
      ),
      offset: const Offset(0, heightOffset),
      onCanceled: () {
        setState(() {
          popupMenuOpen = false;
        });
      },
      itemBuilder: (_) {
        setState(() {
          popupMenuOpen = true;
        });
        return <PopupMenuEntry>[
          PopupMenuItem(
            enabled: false,
            padding: const EdgeInsets.all(0),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: viewHeight - heightOffset,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: Sizes.padding16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.current.WIDGETS,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: Sizes.fontSizeLarge,
                                    ),
                          ),
                          // Container(
                          //   width: Sizes.iconSize32,
                          //   height: Sizes.iconSize32,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Theme.of(context).colorScheme.primary,
                          //       width: 1,
                          //     ),
                          //     borderRadius:
                          //         BorderRadius.circular(Sizes.radius4),
                          //   ),
                          //   child: ImageNetworkOrAssetWidget(
                          //     svgAssetAsString: true,
                          //     imageUrl: SvgAssetsAsString.uiIconsSettings,
                          //     color: Theme.of(context).colorScheme.onPrimary,
                          //     width: Sizes.iconSizeMedium,
                          //     height: Sizes.iconSizeMedium,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: Sizes.padding24),
                      const GravityBridgeRecentTransactions(),
                      const SizedBox(height: Sizes.padding16),
                      const GravityBridgeRecentBatches(),
                      const SizedBox(height: Sizes.padding16),
                      const GravityBridgeTransactionQueue(),
                      const SizedBox(height: Sizes.padding16),
                      const GravityBridgeVolumeInfo(),
                      const SizedBox(height: Sizes.padding16),
                      const GravityBridgeSupplyInfo(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // following empty SizedBox PopupMenuItem will change the popup menu open behaviour
          // now it acts similar to GravityBridgeMenu
          const PopupMenuItem(
            enabled: false,
            height: 0,
            padding: EdgeInsets.all(0),
            child: SizedBox(
              width: double.infinity,
              height: 0,
            ),
          ),
        ];
      },
      child: ImageNetworkOrAssetWidget(
        svgAssetAsString: true,
        imageUrl: popupMenuOpen
            ? SvgAssetsAsString.uiIconsClose
            : SvgAssetsAsString.uiIconsAssessment,
        height: Sizes.iconSizeLarge,
        width: Sizes.iconSizeLarge,
        color: popupMenuOpen
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
