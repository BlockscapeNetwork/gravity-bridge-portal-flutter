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

class DottedHorizontalLineWithArrowAndImage extends StatelessWidget {
  final bool svgAssetAsString;
  final String imageUrl;
  final Color? iconColor;
  final Color? iconBorderColor;
  final double? iconSize;
  const DottedHorizontalLineWithArrowAndImage({
    required this.svgAssetAsString,
    required this.imageUrl,
    this.iconColor,
    this.iconBorderColor,
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 32,
      child: Stack(
        children: [
          SizedBox(
            height: 32,
            child: Row(
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: _DottedHorizontalLine(
                      color: Theme.of(context).colorScheme.surface,
                      context: context,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -8,
            top: 4.5,
            child: Icon(
              Icons.arrow_right,
              color: Theme.of(context).colorScheme.surface,
              size: Sizes.iconSizeMedium,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconWithCircle(
              svgAssetAsString: svgAssetAsString,
              imageUrl: imageUrl,
              iconSize: iconSize,
              borderColor: iconBorderColor,
              iconColor: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}

class IconWithCircle extends StatelessWidget {
  final bool svgAssetAsString;
  final String imageUrl;
  final Color? iconColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? iconSize;
  const IconWithCircle({
    required this.svgAssetAsString,
    required this.imageUrl,
    this.iconColor,
    this.borderColor,
    this.backgroundColor,
    this.iconSize,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize ?? Sizes.iconSize32,
      height: iconSize ?? Sizes.iconSize32,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.background,
        border: Border.all(
          color: borderColor ?? Theme.of(context).colorScheme.primary,
          width: 1,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ImageNetworkOrAssetWidget(
          svgAssetAsString: svgAssetAsString,
          imageUrl: imageUrl,
          color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class _DottedHorizontalLine extends CustomPainter {
  final Color color;
  final BuildContext context;
  const _DottedHorizontalLine({
    required this.color,
    required this.context,
  });

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
    const double dashWidth = 1;
    const double dashSpace = 3;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double y = size.height / 2;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (startX < size.width) {
      // Draw a small line.
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
  }
}

class DottedLineWithArrow extends StatelessWidget {
  final Color color;
  final bool showRightArrow;
  final double arrowSize;
  const DottedLineWithArrow({
    super.key,
    required this.color,
    this.showRightArrow = true,
    this.arrowSize = Sizes.iconSizeMedium,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: arrowSize,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _DottedHorizontalLine(
                color: color,
                context: context,
              ),
            ),
          ),
          if (showRightArrow)
            Positioned(
              right: -9,
              child: Icon(
                Icons.arrow_right,
                color: color,
                size: arrowSize,
              ),
            ),
        ],
      ),
    );
  }
}
