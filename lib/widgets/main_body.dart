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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_footer.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_header.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/parallax_layer.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
    required this.child,
    this.constraints,
  }) : super(key: key);

  final Widget child;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: MouseRegion(
        onHover: (e) {
          context.read(mouseDeltaProvider.notifier).state = e.localPosition;
        },
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile(context) ? Sizes.paddingMicro : 0),
              constraints: constraints ??
                  const BoxConstraints(
                    maxWidth: Sizes.desktopMaxWidth,
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        CustomScrollView(
                          scrollBehavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          slivers: <Widget>[
                            SliverAppBar(
                              pinned: false,
                              floating: false,
                              expandedHeight: isMobile(context) ? 50 : 134,
                              collapsedHeight: isMobile(context) ? null : 80,
                              elevation: 0,
                              automaticallyImplyLeading: false,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              flexibleSpace: const FlexibleSpaceBar(
                                centerTitle: true,
                                titlePadding: EdgeInsets.zero,
                                expandedTitleScale: 1,
                                title: GravityBridgeHeader(),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: child,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const GravityBridgeFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
