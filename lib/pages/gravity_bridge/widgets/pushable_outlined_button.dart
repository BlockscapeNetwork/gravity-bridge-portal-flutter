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

/// OutlinedButton that
/// - can have a pushed appearance (same as SelectButton)
/// - can have a fixed width/height
/// - can have a custom fontsize (default is Sizes.fontSizeLarge)
class PushableOutlinedButton extends StatelessWidget {
  const PushableOutlinedButton({
    Key? key,
    required this.text,
    this.isPushed = false,
    this.onPressed,
    this.width,
    this.height,
    this.fontSize = Sizes.fontSizeLarge,
    this.prefix,
  }) : super(key: key);

  final String text;
  final bool isPushed;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double fontSize;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    final color = isPushed && Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).primaryColorLight;
    final TextStyle textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
      inherit: true,
    );
    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.symmetric(
                horizontal: Sizes.paddingSmall + Sizes.paddingPico,
                vertical: Sizes.paddingXSmall + Sizes.paddingPico,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (_) => isPushed
                  ? Theme.of(context).colorScheme.secondary.withOpacity(
                      Theme.of(context).brightness == Brightness.dark ? 0.5 : 1)
                  : Theme.of(context).colorScheme.primary,
            ),
            side: MaterialStateProperty.resolveWith<BorderSide?>((states) {
              if (Theme.of(context).brightness == Brightness.light) {
                if (!states.contains(MaterialState.hovered)) {
                  return BorderSide(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.06));
                }
              }

              return null;
            }),
          ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.button!.merge(textStyle),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (prefix != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: prefix!,
                ),
              Align(
                alignment: Alignment.center,
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
      onPressed: isPushed ? null : onPressed,
    );
  }
}
