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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final double height;
  final void Function(bool)? onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    this.height = 24,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: CupertinoSwitch(
          activeColor: Theme.of(context).colorScheme.primary,
          trackColor: Theme.of(context).colorScheme.onSecondary,
          thumbColor: Theme.of(context).colorScheme.secondary,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
