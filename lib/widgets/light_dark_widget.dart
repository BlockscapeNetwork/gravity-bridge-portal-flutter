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

class LightDarkWidget extends StatelessWidget {
  final Widget lightWidget;
  final Widget darkWidget;

  const LightDarkWidget({
    Key? key,
    required this.lightWidget,
    required this.darkWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return darkWidget;
    } else {
      return lightWidget;
    }
  }
}
