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
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:tuple/tuple.dart';

import '../../generated/l10n.dart';
import '../../services/themedata_service.dart';
import 'main_page_dialog.dart';

/// Like a drop-down menu, only that the options are shown in a small dialog.
/// Every option has the appaerance of a button.
/// When an option is clicked the [onSelectionChanged] callback is fired.
void showChainSelectionDialog({
  required BuildContext context,

  /// Title at the top of the dialog.
  required String dialogTitle,

  /// Texts of the options.
  required List<String> options,

  /// Icons of each option.
  required List<Widget> icons,

  /// Status of each option.
  required List<Future<Tuple2<bool, String>>> chainHealthChecks,

  /// Index of the already selected option when the button is shown.
  required int selectedOptionIndex,

  /// Callback that is fired with an updated [selectedOptionIndex] when an option is clicked.
  required Function(int selectedOptionIndex) onSelectionChanged,
}) {
  showMainPageDialog(
    context,
    onCancel: () {},
    title: const SizedBox.shrink(),
    content: const SizedBox.shrink(),
    customDialog: Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.radius)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth:
              isMobile(context) ? double.infinity : Sizes.desktopDialogWidth,
          maxHeight: Sizes.dialogHeight,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: Sizes.buttonSplashRadius,
                icon: ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsClose,
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: Sizes.iconSizeMedium,
                  height: Sizes.iconSizeMedium,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                dialogTitle,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile(context)
                    ? Sizes.paddingSmall
                    : Sizes.paddingMedium),
                child: GridView.builder(
                  itemCount: options.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile(context) ? 1 : 2,
                    childAspectRatio: 4 / 1,
                    crossAxisSpacing: Sizes.paddingMicro,
                    mainAxisSpacing: Sizes.paddingMicro,
                  ),
                  itemBuilder: (context, index) => FutureBuilder(
                    future: chainHealthChecks[index],
                    builder: (BuildContext context,
                        AsyncSnapshot<Tuple2<bool, String>> snapshot) {
                      // default color is grey and text is waiting response
                      Color color = Theme.of(context).colorScheme.onSecondary;
                      String message = S.current.CHAIN_RPC_URL_WAITING_RESPONSE;
                      bool? isChainClientWorking;

                      if (snapshot.hasData && snapshot.data != null) {
                        isChainClientWorking = snapshot.data!.item1;
                        message = snapshot.data!.item2;
                        if (isChainClientWorking == true) {
                          color = Theme.of(context).colorScheme.inverseSurface;
                        } else {
                          color = Theme.of(context).colorScheme.onError;
                        }
                      }

                      return OutlinedButton(
                        style: Theme.of(context)
                            .outlinedButtonTheme
                            .style
                            ?.copyWith(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>((_) {
                            if (index == selectedOptionIndex) {
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.6);
                            } else {
                              return Theme.of(context).backgroundColor;
                            }
                          }),
                          side: MaterialStateProperty.resolveWith<BorderSide?>(
                              (states) {
                            if (Theme.of(context).brightness ==
                                Brightness.light) {
                              if (!states.contains(MaterialState.hovered)) {
                                return BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  width: 1,
                                );
                              }
                            }

                            return null;
                          }),
                        ),
                        onPressed: index != selectedOptionIndex &&
                                isChainClientWorking == true
                            ? () {
                                Navigator.pop(context);
                                onSelectionChanged(index);
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: _chainStatus(
                                  color,
                                  message,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (icons.length > index)
                                      SizedBox(
                                        width: 60,
                                        child: icons.isNotEmpty
                                            ? icons[index]
                                            : const SizedBox.shrink(),
                                      ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        options[index],
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  index == selectedOptionIndex
                                                      ? Theme.of(context)
                                                          .primaryColorLight
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _chainStatus(Color color, String message) {
  return Tooltip(
    message: message,
    child: Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    ),
  );
}
