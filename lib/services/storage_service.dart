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
import 'package:shared_preferences/shared_preferences.dart';

final storageServiceProvider = Provider((ref) => StorageService.instance);

class StorageService {
  static const String _licenseAcceptedKey = "licenseAcceptedKey";
  static const String _themeModeKey = "themeModeKey";
  static const String _importedMetamaskTokensKey = "importedMetamaskTokens";
  static const String _uniswapTokenListKey = "uniswapTokens";
  static const String _uniswapTokenListTimeStampKey = "uniswapTokensTimestamp";
  static const String _supplyInfoWidgetVisibilityKey =
      "supplyInfoWidgetVisibility";
  static const String _volumeInfoWidgetVisibilityKey =
      "volumeInfoWidgetVisibility";
  static const String _transactionQueueWidgetVisibilityKey =
      "transactionQueueWidgetVisibility";

  final Future<SharedPreferences> _sharedPreferences;
  StorageService._() : _sharedPreferences = SharedPreferences.getInstance();
  static final StorageService _instance = StorageService._();
  static StorageService get instance => _instance;

  Future<bool?> getLicenseAccepted() async {
    try {
      final isLicenseAccepted =
          (await _sharedPreferences).getBool(_licenseAcceptedKey);
      return isLicenseAccepted;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setLicenseAccepted(bool value) async {
    return (await _sharedPreferences).setBool(_licenseAcceptedKey, value);
  }

  Future<ThemeMode?> getThemeMode() async {
    try {
      final mode = (await _sharedPreferences).getString(_themeModeKey);
      switch (mode) {
        case "dark":
          return ThemeMode.dark;
        case "light":
          return ThemeMode.light;
        case "system":
          return ThemeMode.system;
        default:
          return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> setThemeMode(ThemeMode mode) async {
    switch (mode) {
      case ThemeMode.dark:
        return (await _sharedPreferences).setString(_themeModeKey, "dark");
      case ThemeMode.light:
        return (await _sharedPreferences).setString(_themeModeKey, "light");
      case ThemeMode.system:
        return (await _sharedPreferences).setString(_themeModeKey, "system");
    }
  }

  Future<bool> setImportedMetamaskTokens(
    final List<String> tokenAddresses,
  ) async {
    assert(
        tokenAddresses.isNotEmpty && tokenAddresses.every((e) => e.isNotEmpty));
    return (await _sharedPreferences)
        .setStringList(_importedMetamaskTokensKey, tokenAddresses);
  }

  Future<List<String>?> getImportedMetamaskTokens() async {
    final List<String>? tokens =
        (await _sharedPreferences).getStringList(_importedMetamaskTokensKey);
    return tokens;
  }

  /// Write the uniswap tokens json
  Future<bool> setUniswapTokenList(final String listAsJson) async {
    final bool isSuccessful = await (await _sharedPreferences)
        .setString(_uniswapTokenListKey, listAsJson);
    if (isSuccessful) {
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      // update write timestamp
      (await _sharedPreferences).setString(_uniswapTokenListTimeStampKey, ts);
    }
    return isSuccessful;
  }

  /// Get timestamp of last uniswap tokens write, as a local DateTime
  Future<DateTime?> getUniswapTokensWriteTimestamp() async {
    final String? millisecondsSinceEpoch =
        (await _sharedPreferences).getString(_uniswapTokenListTimeStampKey);
    if (millisecondsSinceEpoch != null && millisecondsSinceEpoch.isNotEmpty) {
      final timeStamp = DateTime.fromMillisecondsSinceEpoch(
          int.parse(millisecondsSinceEpoch));
      return timeStamp;
    }
    return null;
  }

  /// Get Uniswap token list as json
  Future<String?> getUniswapTokens() async {
    return (await _sharedPreferences).getString(_uniswapTokenListKey);
  }

  Future<bool?> getSupplyInfoWidgetVisibility() async {
    try {
      final isSupplyInfoWidgetVisible =
          (await _sharedPreferences).getBool(_supplyInfoWidgetVisibilityKey);
      return isSupplyInfoWidgetVisible;
    } catch (e) {
      return null;
    }
  }

  Future<void> setSupplyInfoWidgetVisibility(bool value) async {
    (await _sharedPreferences).setBool(_supplyInfoWidgetVisibilityKey, value);
  }

  Future<bool?> getVolumeInfoWidgetVisibility() async {
    try {
      final isVolumeInfoWidgetVisible =
          (await _sharedPreferences).getBool(_volumeInfoWidgetVisibilityKey);
      return isVolumeInfoWidgetVisible;
    } catch (e) {
      return null;
    }
  }

  Future<void> setVolumeInfoWidgetVisibility(bool value) async {
    (await _sharedPreferences).setBool(_volumeInfoWidgetVisibilityKey, value);
  }

  Future<bool?> getTransactionQueueWidgetVisibility() async {
    try {
      final isTransactionQueueWidgetVisible = (await _sharedPreferences)
          .getBool(_transactionQueueWidgetVisibilityKey);
      return isTransactionQueueWidgetVisible;
    } catch (e) {
      return null;
    }
  }

  Future<void> setTransactionQueueWidgetVisibility(bool value) async {
    (await _sharedPreferences)
        .setBool(_transactionQueueWidgetVisibilityKey, value);
  }
}
