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

import '../../models/token_info.dart';

class Currency {
  final String baseDenom;
  final String name;
  final String symbol;
  final String iconUrl;
  final int decimals;
  final String? coinGeckoId;

  const Currency({
    required this.baseDenom,
    required this.name,
    required this.symbol,
    required this.iconUrl,
    required this.decimals,
    required this.coinGeckoId,
  });
}

class CurrencyRegistry {
  final List<Currency> currencies;

  const CurrencyRegistry(this.currencies);

  TokenInfo getTokenInfo(String baseDenom) {
    try {
      final cur =
          currencies.firstWhere((element) => element.baseDenom == baseDenom);
      return TokenInfo(
        symbol: cur.symbol,
        name: cur.name,
        address: cur.baseDenom,
        walletType: null,
        decimals: cur.decimals,
        iconUrl: cur.iconUrl,
        denom: cur.baseDenom,
      );
    } catch (e) {
      throw Exception("Unknown Currency");
    }
  }

  String? getCoinGeckoId({
    required final String tokenName,
    required final String tokenSymbol,
  }) {
    try {
      final currency = currencies.firstWhere((element) =>
          element.name.toLowerCase() == tokenName.toLowerCase() &&
          element.symbol.toLowerCase() == tokenSymbol.toLowerCase());
      return currency.coinGeckoId;
    } catch (e) {
      return null;
    }
  }
}
