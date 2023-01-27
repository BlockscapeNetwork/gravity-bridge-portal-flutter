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
import 'package:url_launcher/url_launcher.dart';

import '../../assets.dart';
import '../../pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';

/// Clickable icon which opens [url] in new tab
class OpenLinkIconButton extends StatelessWidget {
  final String url;
  final double size;
  const OpenLinkIconButton({
    super.key,
    required this.url,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    Uri? uri;
    try {
      uri = Uri.parse(url);
    } on FormatException catch (_) {}
    if (uri == null) {
      return SizedBox(width: size, height: size);
    } else {
      return InkWell(
        onTap: () => launchUrl(uri!),
        child: ImageNetworkOrAssetWidget(
          imageUrl: SvgAssetsAsString.uiIconsLaunch,
          svgAssetAsString: true,
          color: Theme.of(context).colorScheme.primary,
          width: size,
          height: size,
        ),
      );
    }
  }
}
