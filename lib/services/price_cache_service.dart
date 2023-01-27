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

import '../models/enums/money.dart';

class PriceCacheService {
  PriceCacheService._();
  static final PriceCacheService instance = PriceCacheService._();
  final Map<String, PriceCache> _cacheMap = {};

  String _getKey({
    required final String tokenName,
    required final String tokenSymbol,
    required final Money money,
  }) {
    return "${tokenName.toLowerCase()}-${tokenSymbol.toLowerCase()}-${money.coingeckoDenom.toLowerCase()}";
  }

  PriceCache? getPriceCache({
    required final String tokenName,
    required final String tokenSymbol,
    required final Money money,
  }) {
    final String key =
        _getKey(tokenName: tokenName, tokenSymbol: tokenSymbol, money: money);
    return _cacheMap[key];
  }

  void setPrice({
    required final tokenName,
    required final tokenSymbol,
    required final Money money,
    required final double price,
  }) {
    final String key =
        _getKey(tokenName: tokenName, tokenSymbol: tokenSymbol, money: money);
    final int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    _cacheMap[key] = PriceCache(price: price, timeStampUtc: now);
  }
}

class PriceCache {
  final double price;
  final int timeStampUtc;
  PriceCache({required this.price, required this.timeStampUtc});
}
