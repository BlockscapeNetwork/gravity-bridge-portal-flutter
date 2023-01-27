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
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_bridge_flutter/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This test can be run in the editor
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // needed b/c otherwise an exception is thrown
  SharedPreferences.setMockInitialValues({});
  final storSer = StorageService.instance;

  test("licenseAccepted persistence", () async {
    expect(null, (await storSer.getLicenseAccepted()));
    expect(true, (await storSer.setLicenseAccepted(true)));
    expect(true, (await storSer.getLicenseAccepted()));
    expect(true, (await storSer.setLicenseAccepted(false)));
    expect(false, (await storSer.getLicenseAccepted()));
  });

  test("themeMode persistence", () async {
    expect(null, (await storSer.getThemeMode()));
    expect(true, (await storSer.setThemeMode(ThemeMode.dark)));
    expect(ThemeMode.dark, (await storSer.getThemeMode()));
    expect(true, (await storSer.setThemeMode(ThemeMode.light)));
    expect(ThemeMode.light, (await storSer.getThemeMode()));
  });

  test("importedMetamaskTokens persistence", () async {
    expect(null, (await storSer.getImportedMetamaskTokens()));
    final List<String> tokens = ["1"];
    expect(true, (await storSer.setImportedMetamaskTokens(tokens)));
    expect(tokens, (await storSer.getImportedMetamaskTokens()));
    tokens.add("2");
    expect(true, (await storSer.setImportedMetamaskTokens(tokens)));
    expect(tokens, (await storSer.getImportedMetamaskTokens()));
  });

  test("uniswap tokens persistence", () async {
    expect(null, (await storSer.getUniswapTokensWriteTimestamp()));
    expect(null, (await storSer.getUniswapTokens()));

    final now = DateTime.now();
    const json =
        "[{\"chainId\": 1,\"address\": \"0x5a9bf6badcd24fe0d58e1087290c2fe2c728736a\",\"name\": \"Block 18\",\"symbol\": \"18C\",\"decimals\": 18,\"logoURI\": \"https://assets.coingecko.com/coins/images/7605/thumb/block_18.jpg?1548828772\"}]";
    expect(true, (await storSer.setUniswapTokenList(json)));
    expect(json, (await storSer.getUniswapTokens()));

    final ts = await storSer.getUniswapTokensWriteTimestamp();
    debugPrint("Timestamp: $ts");
    assert(ts != null);
    assert(now.hour == ts?.hour && now.minute == ts?.minute);
  });
}
