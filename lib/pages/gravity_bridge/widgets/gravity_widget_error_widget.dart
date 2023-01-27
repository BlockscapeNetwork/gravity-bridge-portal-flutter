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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/custom_outlined_button.dart';

const double _headerPadding = 8;
const double _contentPadding = 24;
const double _iconSize = 48;
const double _buttonPadding = 24;

/// UI for reacting to errors in the REST-requests of the GravityBridgeWidgets
class GravityBridgeErrorWidget extends StatelessWidget {
  final VoidCallback onButtonPress;
  const GravityBridgeErrorWidget({
    super.key,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: _contentPadding),
        Container(
          alignment: Alignment.center,
          width: _iconSize,
          height: _iconSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: const ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            imageUrl: SvgAssetsAsString.uiIconsAttention,
            color: Colors.white,
            height: Sizes.iconSize32,
            width: Sizes.iconSize32,
          ),
        ),
        const SizedBox(height: _headerPadding),
        Align(
          alignment: Alignment.center,
          child: Text(
            S.current.GRAVITY_VOLUME_WIDGET_ERROR_TITLE,
            style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
        const SizedBox(height: _headerPadding),
        Align(
          alignment: Alignment.center,
          child: Text(
            S.current.GRAVITY_VOLUME_WIDGET_ERROR_DESC,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: _buttonPadding),
        FractionallySizedBox(
          widthFactor: 0.45,
          child: CustomOutlinedButton(
            child: Text(
              "Try again now",
              style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            onPressed: onButtonPress,
          ),
        ),
        const SizedBox(height: _contentPadding),
      ],
    );
  }
}
