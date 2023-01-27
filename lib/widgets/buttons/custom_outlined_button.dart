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

/// OutlinedButton with the actual appearance of one.
/// Implemented b/c modifying the ThemeData is for now too costly (when it _is_ modified, this button should be deleted).
/// Based on Philip's design: https://philipp722480.invisionapp.com/console/share/6S2MA5PUGZR/948991998/play.
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = style ?? Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton(
      style: buttonStyle!.copyWith(
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).backgroundColor),
        shadowColor:
            MaterialStateProperty.all(Theme.of(context).backgroundColor),
        side: MaterialStateProperty.all(
          BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
      onPressed: onPressed,
    );
  }
}
