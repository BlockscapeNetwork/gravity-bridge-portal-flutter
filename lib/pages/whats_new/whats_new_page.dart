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
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/change_log_widget.dart';
import 'package:gravity_bridge_flutter/widgets/custom_page_title.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';

// see: https://support.mwaysolutions.com/browse/BLCS-1277
class WhatsNewPage extends StatelessWidget {
  const WhatsNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      constraints: const BoxConstraints(maxWidth: Sizes.desktopMaxWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPageTitle(
            title: S.current.MENU_ITEM_WHATS_NEW,
            subTitle: "",
          ),
          Card(
            shadowColor: Theme.of(context).backgroundColor,
            color: Theme.of(context).backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.padding16,
                horizontal: generatePageHorizontalPadding(context).horizontal,
              ),
              child: const ChangeLogWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
