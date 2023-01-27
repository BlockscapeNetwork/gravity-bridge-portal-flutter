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
import 'package:gravity_bridge_flutter/widgets/custom_switch.dart';

const double _gravityWidgetHeaderHeight = 56;

class GravityBridgeWidget extends StatelessWidget {
  final Widget title;
  final Widget child;
  final bool hasVisibleSwitch;
  final bool isVisible;
  final void Function(bool)? onVisibleChanged;

  const GravityBridgeWidget({
    Key? key,
    required this.title,
    required this.child,
    this.isVisible = true,
    this.hasVisibleSwitch = false,
    this.onVisibleChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _gravityWidgetHeaderHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title,
                const Spacer(),
                if (hasVisibleSwitch)
                  CustomSwitch(
                    value: isVisible,
                    onChanged: onVisibleChanged,
                  ),
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Padding(
              padding: const EdgeInsets.only(bottom: Sizes.padding16),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
