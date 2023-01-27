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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_recent_batches.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_recent_transactions.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/custom_dropdown_button.dart';
import 'package:gravity_bridge_flutter/widgets/custom_switch.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/coming_soon_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/layout_builder_helper_widget.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';
import 'package:url_launcher/link.dart';

const double _rowHeight = 41;
const double _checkBoxHeight = 32;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
      constraints: const BoxConstraints(maxWidth: Sizes.desktopMaxWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilderHelper(
            mobile: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _SettingsPanel(),
            ),
            desktop: _SettingsPageLarge(),
          ),
          const SizedBox(height: Sizes.paddingLarge + Sizes.paddingMedium),
          ..._getPreFooter(context),
        ],
      ),
    );
  }
}

class _SettingsPageLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.5,
          width: double.infinity,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        Padding(
          padding: generatePageHorizontalPadding(context),
          child: LayoutBuilder(builder: (context, constrains) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// SETTINGS PANE
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constrains.maxWidth -
                        (MediaQuery.of(context).size.width >
                                Sizes.desktopMaxWidth1000
                            ? Sizes.padding30
                            : Sizes.padding12) -
                        Sizes.widgetsMaxWidth,
                  ),
                  child: _SettingsPanel(),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width >
                          Sizes.desktopMaxWidth1000
                      ? Sizes.padding30
                      : Sizes.padding12,
                ),

                /// WIDGETS PANE
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: Sizes.widgetsMaxWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Sizes.paddingMedium,
                          bottom: Sizes.paddingXSmall,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            S.current.WIDGETS,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: Sizes.fontSizeLarge,
                                    ),
                          ),
                        ),
                      ),
                      const GravityBridgeRecentTransactions(),
                      const SizedBox(height: Sizes.padding16),
                      const GravityBridgeRecentBatches(),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class _SettingsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline2;
    final sectionTextStyle = textStyle?.copyWith(
      color: Theme.of(context).hintColor,
      fontWeight: FontWeight.bold,
    );
    final String currency = S.current.BASE_CURRENCY_USD;
    final String language = S.current.LANGUAGE_ENGLISH;
    final String network = S.current.NETWORKS_ETHEREUM_MAINNET;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Sizes.paddingMedium,
            bottom: Sizes.paddingXSmall,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              S.current.MENU_ITEM_SETTINGS,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: Sizes.fontSizeLarge,
                  ),
            ),
          ),
        ),
        Card(
          shadowColor: Theme.of(context).backgroundColor,
          color: Theme.of(context).backgroundColor,
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Sizes.padding16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.radius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      children: [
                        Text(S.current.PREFERENCES, style: sectionTextStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.BASE_CURRENCY, style: textStyle),
                        CustomDropdownButton<String>(
                          currentValue: currency,
                          values: [currency],
                          valueLabels: [currency],
                          onChanged: (newValue) {},
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.LANGUAGE, style: textStyle),
                        CustomDropdownButton<String>(
                          currentValue: language,
                          values: [language],
                          valueLabels: [language],
                          onChanged: (newValue) {},
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.THEME, style: textStyle),
                        _ThemeModeButtons(),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.NETWORKS, style: textStyle),
                        CustomDropdownButton<String>(
                          currentValue: network,
                          values: [network],
                          valueLabels: [network],
                          onChanged: (newValue) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: _rowHeight),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.NOTIFICATIONS, style: sectionTextStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.DESKTOP, style: textStyle),
                        FittedBox(
                          child: CustomSwitch(
                            height: _checkBoxHeight,
                            value: false,
                            onChanged: (value) {
                              showDialog(
                                context: context,
                                builder: (_) => const ComingSoonDialog(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.EMAIL, style: textStyle),
                        CustomSwitch(
                          height: _checkBoxHeight,
                          value: false,
                          onChanged: (value) {
                            showDialog(
                              context: context,
                              builder: (_) => const ComingSoonDialog(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: _rowHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.PUSH, style: textStyle),
                        CustomSwitch(
                          height: _checkBoxHeight,
                          value: false,
                          onChanged: (value) {
                            showDialog(
                              context: context,
                              builder: (_) => const ComingSoonDialog(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> _getPreFooter(BuildContext context) {
  return [
    Wrap(
      children: [
        Text(
          S.current.WHAT_IS_HAPPENING,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(width: 4.0),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Link(
            target: LinkTarget.blank,
            uri: Uri.parse(Constants.gravityBridgeHowTo),
            builder: (context, followLink) => GestureDetector(
              onTap: followLink,
              child: Text(S.current.READ_THIS,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 4.0),
    Wrap(
      children: [
        Text(
          S.current.SMART_CONTRACT_USED,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(width: 4.0),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Link(
            target: LinkTarget.blank,
            uri: Uri.parse(Constants.cliGravityBridgeToEthereum),
            builder: (context, followLink) => GestureDetector(
              onTap: followLink,
              child: Text(Config.metamask.gravityContractAddr,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ),
        ),
      ],
    ),
  ];
}

class _ThemeModeButtons extends ConsumerWidget {
  static const double dim = 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ToggleButtons(
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      fillColor: Colors.transparent,
      color: Colors.transparent,
      highlightColor: Colors.transparent,
      selectedColor: Colors.transparent,
      onPressed: (index) {
        if (index == 0) {
          ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark);
        } else if (index == 1) {
          ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.light);
        }
      },
      isSelected: [
        themeMode == ThemeMode.dark,
        themeMode == ThemeMode.light,
      ],
      children: [
        ImageNetworkOrAssetWidget(
          svgAssetAsString: true,
          imageUrl: SvgAssetsAsString.uiIconsNight,
          color: themeMode == ThemeMode.dark
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSecondary,
          width: dim,
          height: dim,
        ),
        ImageNetworkOrAssetWidget(
          svgAssetAsString: true,
          imageUrl: SvgAssetsAsString.uiIconsDay,
          color: themeMode == ThemeMode.light
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSecondary,
          width: dim,
          height: dim,
        ),
      ],
    );
  }
}
