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
import 'package:gravity_bridge_flutter/widgets/dialogs/alert_widget.dart';

Future<void> showMainPageErrorDialog(
  BuildContext context, {
  required Function onCancel,
  required Widget title,
  required Widget content,
  final MouseCursor? cursor,
  final List<Widget>? actions,
  final Widget? icon,
}) {
  return showMainPageDialog(
    context,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: icon ??
              const Icon(
                Icons.error_outline,
                size: 64,
              ),
        ),
        content,
      ],
    ),
    onCancel: onCancel,
    dismisable: true,
    title: title,
    actions: actions,
    cursor: cursor,
  );
}

Future<void> showMainPageDialog(
  BuildContext context, {
  required final Function onCancel,
  required final Widget title,
  required final Widget content,
  final MouseCursor? cursor,
  final bool dismisable = true,
  final List<Widget>? actions,
  final BoxConstraints? constraints,
  final Widget? customDialog,
  final MainAxisAlignment? actionsAlignment,
}) async {
  Widget dialog = customDialog ??
      customAlertDialog(
        context: context,
        actions: actions,
        content: content,
        title: title,
        constraints: constraints,
        dismisable: dismisable,
        actionsAlignment: actionsAlignment,
      );

  if (cursor != null) {
    dialog = MouseRegion(
      cursor: cursor,
      child: dialog,
    );
  }
  await showDialog(
    context: context,
    barrierDismissible: cursor == null && dismisable,
    builder: (_) => dialog,
  );
  onCancel();
}
