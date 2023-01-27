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
import 'package:gravity_bridge_flutter/utils.dart';

class GravityBridgeVersion extends StatelessWidget {
  const GravityBridgeVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String version = getVersion();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile(context) ? 0 : Sizes.paddingXSmall,
      ),
      child: Text(
        version,
        style: TextStyle(
          fontSize: Sizes.fontSizeSmall,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
