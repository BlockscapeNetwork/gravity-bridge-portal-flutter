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

import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

/// Displays the markdown-content contained in [Paths.changeLog] file.
/// This widget is not a scrollable, so it should be wrapped in one if the content is too big.
class ChangeLogWidget extends StatelessWidget {
  const ChangeLogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(Assets.changeLog),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          final List<String> splittedSingleLineLogs =
              snapshot.data!.split("\n");

          return SizedBox(
            width: double.infinity,
            height: splittedSingleLineLogs.length * Sizes.fontSize16,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var log in splittedSingleLineLogs)
                    generateWidgetFromSingleLogLine(
                      context,
                      log,
                    ),
                ],
              ),
            ),
          );

          // return SelectionArea(
          //   child: SizedBox(
          //     width: double.infinity,
          //     height: splittedSingleLineLogs.length * Sizes.fontSize16,
          //     child: SingleChildScrollView(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           for (var log in splittedSingleLineLogs)
          //             generateWidgetFromSingleLogLine(
          //               context,
          //               log,
          //             ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget generateWidgetFromSingleLogLine(BuildContext context, String text) {
  return text == ""
      ? const SizedBox(
          width: Sizes.paddingMicro,
          height: Sizes.paddingMicro,
          child: Text("\n"),
        )
      :
      // subtitle
      text.startsWith("#")
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.padding2),
              child: Text(
                text.substring(4),
                style: TextStyle(
                  fontSize: Sizes.fontSize16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          :
          // text lines
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                      isMobile(context) ? Sizes.paddingPico : Sizes.padding2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.padding12),
                    child: SelectableText(
                      "\u2022",
                      enableInteractiveSelection: false,
                      style: TextStyle(
                        fontSize: Sizes.fontSize16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      text.substring(2),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: Sizes.fontSizeSmall,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            );
}
