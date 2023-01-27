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
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_version.dart';
import 'package:gravity_bridge_flutter/services/fee_middleware_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:url_launcher/link.dart';

import '../../../generated/l10n.dart';

class GravityBridgeFooter extends StatelessWidget {
  const GravityBridgeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: isMobile(context) ? Sizes.paddingNano : 12.0,
        bottom: isMobile(context) ? Sizes.paddingNano : 12.0,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _FooterIcons(),
            Expanded(
              child: Center(
                child: priceServerActivity(),
              ),
            ),
            isMobile(context) ? Container() : const GravityBridgeVersion(),
            Text(
              " by",
              style: TextStyle(
                fontSize: isMobile(context)
                    ? Sizes.fontSizeXSmall
                    : Sizes.fontSizeSmall,
              ),
            ),
            const _FooterLogo(),
          ],
        ),
      ),
    );
  }
}

class _FooterIcons extends StatelessWidget {
  const _FooterIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _FooterItem(
          url: Constants.blockscapeTwitterURL,
          child: ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            imageUrl: SvgAssetsAsString.smIconsTwitter,
            color: Theme.of(context).colorScheme.onPrimary,
            width:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
            height:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
          ),
        ),
        _FooterItem(
          url: Constants.blockscapeMediumURL,
          child: ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            imageUrl: SvgAssetsAsString.smIconsMedium,
            color: Theme.of(context).colorScheme.onPrimary,
            width:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
            height:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
          ),
        ),
        _FooterItem(
          url: Constants.blockscapeGitHubURL,
          child: ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            imageUrl: SvgAssetsAsString.smIconsGithub,
            color: Theme.of(context).colorScheme.onPrimary,
            width:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
            height:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
          ),
        ),
        _FooterItem(
          url: Constants.discordURL,
          child: ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            imageUrl: SvgAssetsAsString.smIconsDiscord,
            color: Theme.of(context).colorScheme.onPrimary,
            width:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
            height:
                isMobile(context) ? Sizes.iconSizeSmall : Sizes.iconSizeMedium,
          ),
        ),
      ],
    );
  }
}

// this widgets shows current network activity with a text and a tooltip
// it has also a dot with grey, red and green colors, depending on the network status
Widget priceServerActivity() {
  return StreamBuilder<Object>(
      stream: FeeMiddlewareService.pingPriceServer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Tooltip(
            message: S.current.PRICE_SERVER_WAITING_TOOLTIP,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.current.WAITING_RESPONSE,
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: isMobile(context)
                            ? Sizes.fontSizeXSmall
                            : Sizes.fontSizeSmall,
                      ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          );
        }
        bool isNetworkActive;
        if (snapshot.data.toString() == "true") {
          isNetworkActive = true;
        } else {
          isNetworkActive = false;
        }
        return Tooltip(
          message: S.current.PRICE_SERVER_TOOLTIP +
              (isNetworkActive == true
                  ? S.current.PRICE_SERVER_STATUS_ONLINE
                  : S.current.PRICE_SERVER_STATUS_OFFLINE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price Server",
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: isMobile(context)
                          ? Sizes.fontSizeXSmall
                          : Sizes.fontSizeSmall,
                    ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isNetworkActive == true
                      ? Theme.of(context).colorScheme.inverseSurface
                      : Theme.of(context).colorScheme.onError,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        );
      });
}

class _FooterLogo extends StatelessWidget {
  const _FooterLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FooterItem(
      url: Constants.blockscapeNetworkURL,
      child: ImageNetworkOrAssetWidget(
        svgAssetAsString: true,
        imageUrl: SvgAssetsAsString.logoBlockscapeMono,
        color: Theme.of(context).colorScheme.onPrimary,
        width: isMobile(context) ? 100 : 150,
      ),
    );
  }
}

class _FooterItem extends StatelessWidget {
  final Widget child;
  final String url;
  final bool disabled;
  final bool hide;

  const _FooterItem({
    Key? key,
    required this.child,
    required this.url,
    // ignore: unused_element
    this.disabled = false,
    this.hide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: Uri.parse(url),
      builder: (BuildContext context, FollowLink? followLink) => hide
          ? const SizedBox.shrink()
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile(context) ? 2 : Sizes.paddingMicro,
              ),
              alignment: Alignment.center,
              child: disabled
                  ? child
                  : InkWell(
                      onTap: followLink,
                      child: child,
                    ),
            ),
    );
  }
}
