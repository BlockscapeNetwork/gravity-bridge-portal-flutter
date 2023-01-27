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

//button used for the selectTokenButton and the transferTypeButton
class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    this.isSelected = false,
    required this.text,
    this.onPressed,
    this.prefix,
    this.suffixIconUrl,
    this.svgAssetAsString = false,
    this.width,
    this.height,
    this.spaceBetween = false,
  }) : super(key: key);

  //controls the backgroundColor
  final bool isSelected;

  final String text;

  //used to display a token icon on th selectTokenButton
  final Widget? prefix;

  //used to display the arrow button on th selectTokenButton
  final String? suffixIconUrl;
  final bool? svgAssetAsString;
  final VoidCallback? onPressed;

  // used to limit select button sizes
  final double? width;
  final double? height;

  final bool spaceBetween;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColorLight;

    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (_) => Theme.of(context).colorScheme.primary,
            ),
            side: MaterialStateProperty.resolveWith<BorderSide?>((states) {
              if (Theme.of(context).brightness == Brightness.light) {
                if (!states.contains(MaterialState.hovered)) {
                  return BorderSide(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.06));
                }
              }

              return null;
            }),
          ),
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: spaceBetween
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          mainAxisSize: spaceBetween ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (prefix != null) prefix!,
            Text(
              text,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w200,
              ),
            ),
            if (suffixIconUrl != null && spaceBetween)
              Expanded(child: Container()),
            if (suffixIconUrl != null)
              ImageNetworkOrAssetWidget(
                svgAssetAsString: svgAssetAsString,
                imageUrl: suffixIconUrl!,
                color: color,
                width: Sizes.iconSizeMedium,
                height: Sizes.iconSizeMedium,
              ),
          ],
        ),
      ),
    );
  }
}
