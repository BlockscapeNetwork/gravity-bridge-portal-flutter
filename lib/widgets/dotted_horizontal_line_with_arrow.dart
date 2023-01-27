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
import 'package:gravity_bridge_flutter/services/themedata_service.dart';

class DottedHorizontalLineWithArrow extends StatelessWidget {
  final double width;
  final Color color;
  const DottedHorizontalLineWithArrow({
    required this.width,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 32,
      child: Stack(
        children: [
          SizedBox(
            height: width,
            child: Row(
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: DottedHorizontalLine(
                      color,
                      context,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -9,
            top: 4,
            child: Icon(
              Icons.arrow_right,
              color: color,
              size: Sizes.iconSizeMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class DottedHorizontalLine extends CustomPainter {
  final Color color;
  final BuildContext context;

  const DottedHorizontalLine(this.color, this.context);

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
