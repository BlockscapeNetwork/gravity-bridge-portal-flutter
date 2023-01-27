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
import 'package:gravity_bridge_flutter/services/storage_service.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
    (ref) => ThemeModeNotifier(ref.read(storageServiceProvider)));

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeModeNotifier(this.storageService) : super(ThemeMode.dark) {
    _setThemeModeFromStorage();
  }

  void setThemeMode(ThemeMode themeMode) {
    if (state != themeMode) {
      storageService.setThemeMode(themeMode);
      state = themeMode;
    }
  }

  void _setThemeModeFromStorage() async {
    final themeMode = await storageService.getThemeMode();
    if (themeMode != null) {
      state = themeMode;
    }
  }
}

class Sizes {
  static const double kMainPagePadding = 70;
  static const double kRoundedCornerWidth = 2;

  static const double dialogHeight = 500;
  static const double widgetsMaxWidth = 340;
  static const double desktopDialogWidth = 510;
  static const double desktopMaxWidth1000 = 1000;
  static const double desktopMaxWidth = 1220;

  static const double paddingTop = 140 * 0.75;

  static const double buttonSplashRadius = 20;

  static const double iconSize12 = 12;
  static const double iconSizeXSmall = 16;
  static const double iconSizeSmall = 19;
  static const double iconSizeMedium = 24;
  static const double iconSizeLarge = 30;
  static const double iconSize32 = 32;
  static const double iconSize35 = 35;
  static const double iconSizeXLarge = 40;
  static const double iconSize64 = 64;

  static const double padding2 = 2;
  static const double paddingPico = 4;
  static const double paddingNano = 6;
  static const double paddingMicro = 8;
  static const double paddingXSmall = 11;
  static const double padding12 = 12;
  static const double paddingSmall = 15;
  static const double padding16 = 16;
  static const double padding20 = 20;
  static const double padding24 = 24;
  static const double padding30 = 30;
  static const double padding32 = 32;
  static const double paddingMedium = 30;
  static const double padding44 = 44;
  static const double paddingLarge = 45;

  static const double paddingTextField = 17;

  static const double radius4 = 4;
  static const double radius = 8;

  static const EdgeInsets cardPadding = EdgeInsets.symmetric(
    horizontal: paddingMedium,
    vertical: paddingMicro + paddingSmall,
  );

  static const double fontSize8 = 8;
  static const double fontSizeXSmall = 12;
  static const double fontSizeSmall = 14;
  static const double fontSize16 = 16;
  static const double fontSizeMedium = 17;
  static const double fontSizeLarge = 24;
  static const double mainButtonWidth = 300;
  static const double mainButtonHeight = 30;
  static const double fixedButtonHeight = 40;
  static const double fixedButtonWidthMedium = 83;
  static const double fixedButtonWidthLarge = 101;

  static const double beginTransferButtonHeight =
      45; // set 45 temporarily, will be set 56px according to new design
  static const double givePermissionButtonHeight =
      30; // set 30 temporarily, will be set 40px according to new design

  static const double dividerThickness = 1.0;
}

const _kFontFamily = 'Inter';
const _kHeadline1Size = 26.0;
const _kHeadline2Size = 17.0;
const _kHeadline3Size = 37.0;
const _kHeadline4Size = 14.0;

ThemeData themeDataLight() {
  return ThemeData(
    fontFamily: _kFontFamily,
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: _kHeadline4Size,
      ),
      overline: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        letterSpacing: 0,
      ),
      headline1: TextStyle(
        fontSize: _kHeadline1Size,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: _kHeadline2Size,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontSize: _kHeadline3Size,
      ),
      button: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.paddingXSmall,
        vertical: Sizes.paddingPico,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      textStyle: const TextStyle(
        fontSize: Sizes.fontSizeSmall,
      ),
    ),
  );
}

ThemeData themeDataDark() {
  return ThemeData(
    fontFamily: _kFontFamily,
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: _kHeadline4Size,
      ),
      overline: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        letterSpacing: 0,
      ),
      headline1: TextStyle(
        fontSize: _kHeadline1Size,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: _kHeadline2Size,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontSize: _kHeadline3Size,
      ),
      button: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
