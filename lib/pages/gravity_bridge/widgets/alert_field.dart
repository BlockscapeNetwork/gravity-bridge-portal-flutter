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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';

class AlertField extends StatelessWidget {
  final TextSpan text;
  final double fontSize;
  final Color? textColor;
  final Color? iconAndBorderColor;
  const AlertField({
    required this.text,
    this.fontSize = Sizes.fontSizeSmall,
    this.textColor,
    this.iconAndBorderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GravityBridgeContainer(
      padding: const EdgeInsets.all(Sizes.paddingNano),
      color: Theme.of(context).backgroundColor,
      borderColor: iconAndBorderColor ?? Theme.of(context).colorScheme.error,
      child: ListTile(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: textColor ?? Theme.of(context).colorScheme.onPrimary,
              fontSize: fontSize,
            ),
            children: [text],
          ),
        ),
        leading: SizedBox(
          height: double.infinity,
          child: ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            imageUrl: SvgAssetsAsString.uiIconsAttention,
            color: iconAndBorderColor ?? Theme.of(context).colorScheme.error,
            height: Sizes.iconSizeMedium,
            width: Sizes.iconSizeMedium,
          ),
        ),
      ),
    );
  }
}
