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
import 'package:flutter/services.dart';
import 'package:gravity_bridge_flutter/utils.dart';

import '../../generated/l10n.dart';

/// The clickable text widget which copies its text into the clipboard
class CopyButtonWithShortenedText extends StatelessWidget {
  final String text;
  final String toolTip;
  final TextStyle? textStyle;
  const CopyButtonWithShortenedText({
    super.key,
    required this.text,
    this.textStyle,
    required this.toolTip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTip,
      child: InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: text)).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                content: Text(
                  S.current.COPY_TO_CLIPBOARD_CONFIRMATION,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            );
          });
        },
        child: Text(
          text.truncateDots(),
          style: textStyle,
        ),
      ),
    );
  }
}
