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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_menu.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_widgets_mobile.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/logo.dart';
import '../gravity_bridge_provider.dart';

class GravityBridgeHeader extends ConsumerWidget {
  const GravityBridgeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(gravityBridgeProvider).loading ?? false;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: isMobile(context)
                        ? const Logo()
                        : SizedBox(
                            height: constrains.maxHeight * 0.55,
                            child: const Logo(),
                          ),
                  ),
                  isMobile(context)
                      ? const GravityBridgeWidgetsMobile()
                      : Container(),
                  const SizedBox(width: 10),
                  const GravityBridgeMenu(),
                ],
              ),
              SizedBox(
                height: 8,
                child: isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: LinearProgressIndicator(minHeight: 2),
                      )
                    : Container(),
              ),
            ],
          );
        },
      ),
    );
  }
}
