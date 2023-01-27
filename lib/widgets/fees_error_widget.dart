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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/keplr_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';

class FeesErrorWidget extends ConsumerStatefulWidget {
  const FeesErrorWidget({Key? key}) : super(key: key);

  @override
  _FeesErrorWidget createState() => _FeesErrorWidget();
}

class _FeesErrorWidget extends ConsumerState<FeesErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return _feeErrorContainer(
      context,
      ref.watch(keplrProvider.notifier).isCoingeckoFeesError == true
          ? "Coingecko "
          : ref.watch(keplrProvider.notifier).isMiddlewareFeesError == true
              ? "Middleware "
              : "",
    );
  }
}

Widget _feeErrorContainer(BuildContext context, String error) {
  return ListTile(
    title: RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        children: [
          TextSpan(
            text: error + "Fees Fetching Error.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          const TextSpan(
            text:
                ' Price service is temporarily unavailable, please try again in a few minutes.',
          ),
        ],
      ),
    ),
    leading: SizedBox(
        height: double.infinity,
        child: ImageNetworkOrAssetWidget(
          svgAssetAsString: true,
          imageUrl: SvgAssetsAsString.uiIconsAttention,
          color: Theme.of(context).colorScheme.error,
          height: Sizes.iconSizeMedium,
          width: Sizes.iconSizeMedium,
        )),
  );
}
