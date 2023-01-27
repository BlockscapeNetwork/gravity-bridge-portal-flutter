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

class CustomPageTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomPageTitle({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.5,
          width: double.infinity,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        isMobile(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Sizes.paddingXSmall,
                      bottom: Sizes.paddingXSmall,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: Sizes.fontSizeLarge,
                            ),
                      ),
                    ),
                  ),
                  subTitle != ""
                      ? Padding(
                          padding: const EdgeInsets.only(
                            bottom: Sizes.padding16,
                          ),
                          child: Text(
                            subTitle,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: Sizes.fontSizeMedium,
                            ),
                          ),
                        )
                      : Container()
                ],
              )
            : Padding(
                padding: generatePageHorizontalPadding(context),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: Sizes.paddingMedium,
                    bottom: Sizes.paddingXSmall,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: Sizes.fontSizeLarge,
                            ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: Sizes.fontSizeMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        Padding(
          padding: generatePageHorizontalPadding(context),
          child: Container(
            height: 0.5,
            width: double.infinity,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
