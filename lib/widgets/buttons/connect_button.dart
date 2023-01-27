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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';

import 'package:gravity_bridge_flutter/services/themedata_service.dart';

// button used for the connect and disconnect wallets
class ConnectButton extends StatelessWidget {
  const ConnectButton({
    Key? key,
    this.isSelected = false,
    this.isIconComesBeforeText = false,
    required this.text,
    required this.onPressed,
    required this.iconUrl,
    required this.svgAssetAsString,
    this.iconSizeWidth = Sizes.iconSizeMedium,
    this.iconSizeHeight = Sizes.iconSizeMedium,
    this.width,
    this.height,
    this.spaceBetween = true,
  }) : super(key: key);

  //controls the backgroundColor
  final bool isSelected;
  final bool isIconComesBeforeText;

  final String text;
  final String iconUrl;
  final bool svgAssetAsString;

  final double iconSizeWidth;
  final double iconSizeHeight;

  final VoidCallback onPressed;

  // used to limit connect button sizes
  final double? width;
  final double? height;

  final bool spaceBetween;

  @override
  Widget build(BuildContext context) {
    final color =
        !isSelected && Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).colorScheme.onBackground;

    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (_) => isSelected
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).colorScheme.primary,
            ),
            side: MaterialStateProperty.resolveWith<BorderSide?>(
              (states) {
                if (isSelected) {
                  return BorderSide(
                      color: Theme.of(context).colorScheme.primary);
                } else {
                  return BorderSide(color: Theme.of(context).backgroundColor);
                }
              },
            ),
          ),
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: isIconComesBeforeText
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: ImageNetworkOrAssetWidget(
                      svgAssetAsString: svgAssetAsString,
                      imageUrl: iconUrl,
                      color: color,
                      width: iconSizeWidth,
                      height: iconSizeHeight,
                    ),
                  ),
                  Text(
                    text,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: spaceBetween
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: ImageNetworkOrAssetWidget(
                      svgAssetAsString: svgAssetAsString,
                      imageUrl: iconUrl,
                      color: color,
                      width: iconSizeWidth,
                      height: iconSizeHeight,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
