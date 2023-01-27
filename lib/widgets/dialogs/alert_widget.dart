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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

AlertDialog customAlertDialog({
  required BuildContext context,
  final List<Widget>? actions,
  required final Widget content,
  required final Widget title,
  final bool dismisable = true,
  final EdgeInsets insetPadding =
      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  final BoxConstraints? constraints,
  final MainAxisAlignment? actionsAlignment,
}) {
  return AlertDialog(
    scrollable: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius)),
    contentPadding: isMobile(context)
        ? const EdgeInsets.only(left: 16.0, right: 24.0, top: 16.0)
        : const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
    titlePadding: isMobile(context)
        ? const EdgeInsets.only(left: 16.0, right: 24.0, top: 16.0)
        : const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
    buttonPadding: isMobile(context)
        ? const EdgeInsets.only(left: 16.0, right: 24.0, top: 16.0)
        : const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
    actionsPadding: EdgeInsets.zero,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        if (dismisable)
          IconButton(
            splashRadius: Sizes.buttonSplashRadius,
            icon: ImageNetworkOrAssetWidget(
              svgAssetAsString: true,
              imageUrl: SvgAssetsAsString.uiIconsClose,
              color: Theme.of(context).colorScheme.onPrimary,
              width: Sizes.iconSizeMedium,
              height: Sizes.iconSizeMedium,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ],
    ),
    insetPadding: isMobile(context)
        ? const EdgeInsets.only(left: 8, top: 136, right: 8, bottom: 32)
        : insetPadding,
    content: ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(maxWidth: 600),
      child: SingleChildScrollView(
        child: content,
      ),
    ),
    actionsAlignment: actionsAlignment ?? MainAxisAlignment.center,
    actionsOverflowButtonSpacing: 8.0,
    actions: actions,
  );
}
