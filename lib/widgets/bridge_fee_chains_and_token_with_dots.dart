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
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/dotted_horizontal_line_with_arrow.dart';

class BridgeFeeChainsAndTokenWithDots extends ConsumerWidget {
  const BridgeFeeChainsAndTokenWithDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: Sizes.paddingMicro),
        SizedBox(
          height: Sizes.padding32,
          width: Sizes.padding32,
          child: CustomPaint(
            painter: DottedVerticalLine(
              Theme.of(context).colorScheme.onPrimary,
              context,
            ),
          ),
        ),
        const SizedBox(height: Sizes.paddingMicro),
        Stack(
          children: [
            Row(
              children: [
                const ImageNetworkOrAssetWidget(
                  imageUrl: Assets.logoGravityBridge,
                  width: Sizes.iconSizeXLarge,
                  height: Sizes.iconSizeXLarge,
                ),
                const SizedBox(width: Sizes.paddingMicro),
                isMobile(context)
                    ? Container()
                    : Row(
                        children: [
                          Text(
                            Chain.gravity.chainName,
                            style: TextStyle(
                              fontSize: Sizes.fontSizeXSmall,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          const SizedBox(width: Sizes.paddingMicro),
                        ],
                      ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constrains) {
                      return DottedHorizontalLineWithArrow(
                        width: constrains.maxWidth,
                        color: Theme.of(context).colorScheme.onPrimary,
                      );
                    },
                  ),
                ),
                isMobile(context)
                    ? Container()
                    : Row(
                        children: [
                          const SizedBox(width: Sizes.paddingMicro),
                          Text(
                            Chain.ethereum.chainName,
                            style: TextStyle(
                              fontSize: Sizes.fontSizeXSmall,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(width: Sizes.paddingMicro),
                const ImageNetworkOrAssetWidget(
                  imageUrl: Assets.logoEthereum,
                  width: Sizes.iconSizeXLarge,
                  height: Sizes.iconSizeXLarge,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: Sizes.paddingMicro),
                child: ImageNetworkOrAssetWidget(
                  imageUrl: ref.read(keplrProvider).token!.iconUrl,
                  width: Sizes.iconSize32,
                  height: Sizes.iconSize32,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DottedVerticalLine extends CustomPainter {
  final Color color;
  final BuildContext context;

  const DottedVerticalLine(this.color, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 1;

    _drawDashedLine(canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    // Chage to your preferred size
    const double dashHeight = 1;
    const double dashSpace = 3;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startY = 0;
    double x = size.width / 2;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (startY < size.height) {
      // Draw a small line.
      canvas.drawLine(Offset(x, startY), Offset(x, startY + dashHeight), paint);

      // Update the starting X
      startY += dashHeight + dashSpace;
    }
  }
}
