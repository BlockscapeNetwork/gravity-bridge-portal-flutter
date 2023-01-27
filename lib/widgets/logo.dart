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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/widgets/layout_builder_helper_widget.dart';

class Logo extends ConsumerWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilderHelper(
        mobile: ImageNetworkOrAssetWidget(
          svgAssetAsString: true,
          imageUrl: SvgAssetsAsString.logoGBPMobile,
          color: Theme.of(context).colorScheme.onPrimary,
          width: 250,
        ),
        desktop: ImageNetworkOrAssetWidget(
          svgAssetAsString: true,
          imageUrl: SvgAssetsAsString.logoDesktop,
          color: Theme.of(context).colorScheme.onPrimary,
          width: 400,
          height: 55,
        ),
      ),
    );
  }
}
