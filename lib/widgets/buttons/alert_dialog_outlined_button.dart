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
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';

class AlertDialogOutlinedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final bool disabled;
  final Color? backgroundColor;
  const AlertDialogOutlinedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      constraints: const BoxConstraints(minWidth: 110),
      child: DisabledWidget(
        disabled: disabled,
        child: OutlinedButton(
          child: child,
          style: OutlinedButton.styleFrom(
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.primary,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
