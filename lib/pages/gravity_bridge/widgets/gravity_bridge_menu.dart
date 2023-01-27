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

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_version.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/route_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/three_dot_menu_widget.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

// This is the type used by the popup menu below.
enum _MenuItems {
  transfer,
  about,
  howTo,
  themeMode,
  transactions,
  batches,
  whatsNew,
  settings,
}

class GravityBridgeMenu extends StatefulWidget {
  const GravityBridgeMenu({Key? key}) : super(key: key);

  @override
  State<GravityBridgeMenu> createState() => _GravityBridgeMenuState();
}

class _GravityBridgeMenuState extends State<GravityBridgeMenu> {
  bool popupMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    final double viewHeight = MediaQuery.of(context).size.height;
    const double heightOffset = 75;
    return isMobile(context)
        ?
        // Below is the mobile view of the popup
        _HistoryBadge(
            badgePositionRightAligned: false,
            child: PopupMenuButton<_MenuItems>(
              tooltip: "", // removes default tooltip "Show menu"
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: viewHeight - heightOffset,
              ),
              offset: const Offset(0, heightOffset),
              onCanceled: () {
                setState(() {
                  popupMenuOpen = false;
                });
              },
              onSelected: (_MenuItems result) async {
                switch (result) {
                  case _MenuItems.transfer:
                    setState(() {
                      popupMenuOpen = false;
                    });
                    Navigator.of(context).popUntil(
                        ModalRoute.withName(RouteService.gravityBridgePage));
                    break;
                  case _MenuItems.about:
                    setState(() {
                      popupMenuOpen = false;
                    });
                    _showDialogForAbout(context);
                    break;
                  case _MenuItems.transactions:
                    setState(() {
                      popupMenuOpen = false;
                    });
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteService.transactionHistoryPage,
                      ModalRoute.withName(RouteService.gravityBridgePage),
                    );
                    break;
                  case _MenuItems.batches:
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteService.batchesPage,
                      ModalRoute.withName(RouteService.gravityBridgePage),
                    );
                    break;
                  case _MenuItems.howTo:
                    setState(() {
                      popupMenuOpen = false;
                    });
                    await launchUrl(Uri.parse(Constants.gravityBridgeHowTo));
                    break;
                  case _MenuItems.whatsNew:
                    setState(() {
                      popupMenuOpen = false;
                    });
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteService.whatsNewPage,
                      ModalRoute.withName(RouteService.gravityBridgePage),
                    );
                    break;
                  default:
                }
              },
              itemBuilder: (_) {
                setState(() {
                  popupMenuOpen = true;
                });
                return <PopupMenuEntry<_MenuItems>>[
                  customPopupMenuItem(
                    context,
                    _MenuItems.transfer,
                    RouteService.gravityBridgePage,
                    S.current.MENU_ITEM_TRANSFER,
                    false,
                    false,
                    false,
                  ),
                  customPopupMenuItem(
                    context,
                    _MenuItems.transactions,
                    RouteService.transactionHistoryPage,
                    S.current.MENU_ITEM_TRANSACTIONS,
                    false,
                    false,
                    true,
                  ),
                  customPopupMenuItem(
                    context,
                    _MenuItems.batches,
                    RouteService.batchesPage,
                    S.current.MENU_ITEM_BATCHES,
                    false,
                    false,
                    false,
                  ),
                  // TODO: delete comments when "Settings" page is ready for first release
                  // customPopupMenuItem(
                  //   context,
                  //   _MenuItems.settings,
                  //   RouteService.settingsPage,
                  //   S.current.MENU_ITEM_SETTINGS,
                  //   false,
                  //   false,
                  //   false,
                  // ),
                  customPopupMenuItem(
                    context,
                    _MenuItems.whatsNew,
                    RouteService.whatsNewPage,
                    S.current.MENU_ITEM_WHATS_NEW,
                    false,
                    false,
                    false,
                  ),
                  PopupMenuItem<_MenuItems>(
                    value: _MenuItems.about,
                    padding: const EdgeInsets.all(0),
                    child: popupMenuItemContainer(
                      context,
                      false,
                      Text(
                        S.current.MENU_ITEM_ABOUT,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: Sizes.fontSizeMedium,
                        ),
                      ),
                    ),
                  ),
                  customPopupMenuLink(
                    context,
                    _MenuItems.howTo,
                    Constants.gravityBridgeHowTo,
                    S.current.MENU_ITEM_HOW_TO,
                    false,
                    false,
                  ),
                  PopupMenuItem<_MenuItems>(
                    value: _MenuItems.themeMode,
                    padding: const EdgeInsets.all(0),
                    enabled: false,
                    child: popupMenuItemContainer(
                      context,
                      false,
                      const _ThemeModeSwitcher(),
                    ),
                  ),
                  const PopupMenuItem(
                    enabled: false,
                    padding: EdgeInsets.all(0),
                    child: GravityBridgeVersion(),
                  ),
                ];
              },
              child: ThreeDotMenuWidget(
                child: ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: popupMenuOpen
                      ? SvgAssetsAsString.uiIconsClose
                      : SvgAssetsAsString.uiIconsBurger,
                  height: Sizes.iconSizeLarge,
                  width: Sizes.iconSizeLarge,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          )
        :
        // Below is the desktop view of the popup and the menu
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customMenuItem(
                context,
                RouteService.gravityBridgePage,
                S.current.MENU_ITEM_TRANSFER,
              ),
              const SizedBox(width: Sizes.padding44),
              _HistoryBadge(
                badgePositionRightAligned: true,
                child: customMenuItem(
                  context,
                  RouteService.transactionHistoryPage,
                  S.current.MENU_ITEM_TRANSACTIONS,
                ),
              ),
              const SizedBox(width: Sizes.padding44),
              customMenuItem(
                context,
                RouteService.batchesPage,
                S.current.MENU_ITEM_BATCHES,
              ),
              // TODO: delete comments when "Settings" page is ready for first release
              // const SizedBox(width: Sizes.padding44),
              // customMenuItem(
              //   context,
              //   RouteService.settingsPage,
              //   S.current.MENU_ITEM_SETTINGS,
              // ),
              const SizedBox(width: Sizes.padding44),
              PopupMenuButton(
                color: Theme.of(context).colorScheme.tertiary,
                tooltip: "", // removes default tooltip "Show menu"
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.radius),
                ),
                offset: Offset.fromDirection(1.5708, 38.0),
                onCanceled: () {
                  setState(() {
                    popupMenuOpen = false;
                  });
                },
                onSelected: (_MenuItems result) async {
                  switch (result) {
                    case _MenuItems.about:
                      setState(() {
                        popupMenuOpen = false;
                      });
                      _showDialogForAbout(context);
                      break;
                    case _MenuItems.howTo:
                      setState(() {
                        popupMenuOpen = false;
                      });
                      await launchUrl(Uri.parse(Constants.gravityBridgeHowTo));
                      break;
                    case _MenuItems.whatsNew:
                      setState(() {
                        popupMenuOpen = false;
                      });
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteService.whatsNewPage,
                        ModalRoute.withName(RouteService.gravityBridgePage),
                      );
                      break;
                    default:
                  }
                },
                itemBuilder: (_) {
                  setState(() {
                    popupMenuOpen = true;
                  });
                  return <PopupMenuEntry<_MenuItems>>[
                    customPopupMenuItem(
                      context,
                      _MenuItems.whatsNew,
                      RouteService.whatsNewPage,
                      S.current.MENU_ITEM_WHATS_NEW,
                      true,
                      false,
                      false,
                    ),
                    PopupMenuItem<_MenuItems>(
                      value: _MenuItems.about,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.padding16),
                      child: popupMenuItemContainer(
                        context,
                        false,
                        Text(
                          S.current.MENU_ITEM_ABOUT,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Sizes.fontSizeMedium,
                          ),
                        ),
                      ),
                    ),
                    customPopupMenuLink(
                        context,
                        _MenuItems.howTo,
                        Constants.gravityBridgeHowTo,
                        S.current.MENU_ITEM_HOW_TO,
                        true,
                        true),
                    const PopupMenuItem<_MenuItems>(
                      value: _MenuItems.themeMode,
                      padding: EdgeInsets.symmetric(vertical: Sizes.padding16),
                      enabled: false,
                      child: _ThemeModeSwitcher(),
                    ),
                  ];
                },
                child: ThreeDotMenuWidget(
                  child: ImageNetworkOrAssetWidget(
                    svgAssetAsString: true,
                    imageUrl: SvgAssetsAsString.uiIconsMore,
                    height: Sizes.iconSizeMedium,
                    width: Sizes.iconSizeMedium,
                    color: popupMenuOpen
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          );
  }
}

Future _showDialogForAbout(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: Theme.of(context).dialogTheme.copyWith(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.radius),
                  ),
                ),
          ),
          child: AboutDialog(
            applicationIcon: SizedBox(
              height: 50,
              width: 50,
              child: ImageNetworkOrAssetWidget(
                svgAssetAsString: true,
                imageUrl: SvgAssetsAsString.logoMobile,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            applicationName: S.current.TITLE,
            applicationVersion: getVersion(),
            applicationLegalese: S.current.LEGALESE,
            children: [
              const SizedBox(height: 24),
              Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(S.current.ABOUT_INFO),
                  )),
            ],
          ),
        );
      });
}

Widget customMenuItem(BuildContext context, String route, String text) {
  return InkWell(
    onTap: ModalRoute.of(context)?.settings.name != route
        ? () {
            if (route == RouteService.gravityBridgePage) {
              Navigator.of(context).popUntil(
                  ModalRoute.withName(RouteService.gravityBridgePage));
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                route,
                ModalRoute.withName(RouteService.gravityBridgePage),
              );
            }
          }
        : null,
    child: Text(
      text,
      style: TextStyle(
        color: ModalRoute.of(context)?.settings.name == route
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.onPrimary,
        fontSize: Sizes.fontSize16,
      ),
    ),
  );
}

Widget popupMenuItemContainer(
    BuildContext context, bool removeBottomBorder, Widget child) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
        vertical: isMobile(context) ? Sizes.padding24 : Sizes.padding16),
    decoration: removeBottomBorder
        ? null
        : BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
    child: child,
  );
}

PopupMenuEntry<_MenuItems> customPopupMenuLink(
    BuildContext context,
    _MenuItems value,
    String route,
    String text,
    bool hasPadding,
    bool removeBottomBorder) {
  return PopupMenuItem<_MenuItems>(
    value: value,
    padding: hasPadding
        ? const EdgeInsets.symmetric(horizontal: Sizes.padding16)
        : const EdgeInsets.all(0),
    child: popupMenuItemContainer(
      context,
      removeBottomBorder,
      Link(
        uri: Uri.parse(route),
        builder: (context, _) {
          return Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Sizes.fontSizeMedium,
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

PopupMenuEntry<_MenuItems> customPopupMenuItem(
  BuildContext context,
  _MenuItems value,
  String route,
  String text,
  bool hasPadding,
  bool removeBottomBorder,
  bool hasHistoryBadge,
) {
  return PopupMenuItem<_MenuItems>(
    value: value,
    enabled: ModalRoute.of(context)?.settings.name != route,
    padding: hasPadding
        ? const EdgeInsets.symmetric(horizontal: Sizes.padding16)
        : const EdgeInsets.all(0),
    child: popupMenuItemContainer(
      context,
      removeBottomBorder,
      InkWell(
        onTap: ModalRoute.of(context)?.settings.name != route
            ? () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  route,
                  ModalRoute.withName(RouteService.gravityBridgePage),
                );
              }
            : null,
        child: hasHistoryBadge
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _HistoryBadge(
                    badgePositionRightAligned: true,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: ModalRoute.of(context)?.settings.name == route
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.onPrimary,
                        fontSize: Sizes.fontSizeMedium,
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  color: ModalRoute.of(context)?.settings.name == route
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onPrimary,
                  fontSize: Sizes.fontSizeMedium,
                ),
              ),
      ),
    ),
  );
}

class _ThemeModeSwitcher extends ConsumerWidget {
  const _ThemeModeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return isMobile(context)
        ? Center(
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(8.0),
              onPressed: (index) {
                if (index == 0) {
                  Navigator.pop(context);
                  ref
                      .read(themeModeProvider.notifier)
                      .setThemeMode(ThemeMode.dark);
                } else if (index == 1) {
                  Navigator.pop(context);
                  ref
                      .read(themeModeProvider.notifier)
                      .setThemeMode(ThemeMode.system);
                } else if (index == 2) {
                  Navigator.pop(context);
                  ref
                      .read(themeModeProvider.notifier)
                      .setThemeMode(ThemeMode.light);
                }
              },
              isSelected: [
                themeMode == ThemeMode.dark,
                themeMode == ThemeMode.system,
                themeMode == ThemeMode.light,
              ],
              children: [
                ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsNight,
                  color: themeMode == ThemeMode.dark
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                  width: 20,
                  height: 20,
                ),
                ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsSettings,
                  color: themeMode == ThemeMode.system
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                  width: 20,
                  height: 20,
                ),
                ImageNetworkOrAssetWidget(
                  svgAssetAsString: true,
                  imageUrl: SvgAssetsAsString.uiIconsDay,
                  color: themeMode == ThemeMode.light
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          )
        : Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16),
              child: ToggleButtons(
                direction: Axis.horizontal,
                borderRadius: BorderRadius.circular(8.0),
                onPressed: (index) {
                  if (index == 0) {
                    Navigator.pop(context);
                    ref
                        .read(themeModeProvider.notifier)
                        .setThemeMode(ThemeMode.dark);
                  } else if (index == 1) {
                    Navigator.pop(context);
                    ref
                        .read(themeModeProvider.notifier)
                        .setThemeMode(ThemeMode.system);
                  } else if (index == 2) {
                    Navigator.pop(context);
                    ref
                        .read(themeModeProvider.notifier)
                        .setThemeMode(ThemeMode.light);
                  }
                },
                isSelected: [
                  themeMode == ThemeMode.dark,
                  themeMode == ThemeMode.system,
                  themeMode == ThemeMode.light,
                ],
                children: [
                  SizedBox(
                    width: 62,
                    child: ImageNetworkOrAssetWidget(
                      svgAssetAsString: true,
                      imageUrl: SvgAssetsAsString.uiIconsNight,
                      color: themeMode == ThemeMode.dark
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 62,
                    child: ImageNetworkOrAssetWidget(
                      svgAssetAsString: true,
                      imageUrl: SvgAssetsAsString.uiIconsSettings,
                      color: themeMode == ThemeMode.system
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 62,
                    child: ImageNetworkOrAssetWidget(
                      svgAssetAsString: true,
                      imageUrl: SvgAssetsAsString.uiIconsDay,
                      color: themeMode == ThemeMode.light
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class _HistoryBadge extends ConsumerWidget {
  const _HistoryBadge(
      {Key? key, required this.badgePositionRightAligned, required this.child})
      : super(key: key);

  final Widget child;
  final bool badgePositionRightAligned;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int newTransactions =
        ref.watch(transactionHistoryProvider).newTransactions;
    return Badge(
      showBadge: ModalRoute.of(context)?.settings.name !=
              RouteService.transactionHistoryPage &&
          newTransactions > 0,
      badgeContent: Text(
        newTransactions.toString(),
        style: TextStyle(
          fontSize: 10,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      position: badgePositionRightAligned
          ? BadgePosition.topEnd(end: -6, top: -10)
          : BadgePosition.topStart(start: -6, top: -10),
      padding: const EdgeInsets.all(3),
      child: child,
    );
  }
}
