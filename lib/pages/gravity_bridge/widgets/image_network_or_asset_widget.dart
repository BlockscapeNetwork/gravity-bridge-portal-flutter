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
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ImageNetworkOrAssetWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final bool? svgAssetAsString;
  const ImageNetworkOrAssetWidget({
    Key? key,
    required this.imageUrl,
    this.width = 42,
    this.height = 42,
    this.fit = BoxFit.contain,
    this.color,
    this.svgAssetAsString = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Safari has problems with rendering svg assets and coloring them
    // this is a workaround to solve this issue
    // [SvgAssetsAsString] in assets.dart has a list of all Svg's as a string
    // when svgAssetAsString parameter is true, than we will replace string xml codes fill parameter
    // with our custom Dart color
    if (svgAssetAsString == true) {
      final String colorEditedSvg =
          replaceSvgFillColorWithDartColor(imageUrl, color);
      return WebsafeSvg.string(
        colorEditedSvg,
        height: height,
        width: width,
        fit: fit,
      );
    }

    if (imageUrl.startsWith('http') && imageUrl.endsWith('svg')) {
      return WebsafeSvg.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else if (imageUrl.endsWith('svg')) {
      return WebsafeSvg.asset(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.asset(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
      );
    }
    // final browser = Browser.detectOrNull(); // return null if not on web platform

    // if (browser!.browser == "Safari") {
    //   image = ColorFiltered(
    //     colorFilter: ColorFilter.mode(color!, BlendMode.color),
    //     child: image,
    //   );
    // }

    // if safari // todo
    // image = ColorFiltered(colorFilter: ColorFilter.mode(color, blendMode), child: image,)
    // return image;
  }
}
