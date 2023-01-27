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

import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/utils.dart';

import '../services/gravity_service.dart';

class TokenInfo {
  final String symbol;

  final String name;

  /// known as token-address or contract-address
  final String address;

  /// token's erc20 address
  /// if empty, this token is not erc20 compatible
  Future<String>? _erc20Address;
  Future<String> get erc20Address {
    if (walletType == WalletType.metamask) {
      return Future.value(address);
    } else {
      _erc20Address ??= GravityService().getErc20AdressForDenom(denom!);
      return _erc20Address!;
    }
  }

  /// Balance as an integer, so without a decimal point ".".
  /// To get the actual balance (as a double) use also the [decimals] field.
  final String? balance;

  final String iconUrl;

  final WalletType? walletType;

  /// maximal number of decimal places that the balance can have
  final int decimals;

  final String? denom;

  final double? priceInDollars;

  Future<TokenOrigin>? _tokenOrigin;
  Future<TokenOrigin?> get origin async {
    assert(denom != null);
    if (walletType == WalletType.metamask) {
      return TokenOrigin.ethereum;
    } else {
      final String erc20Addr = await erc20Address;
      if (erc20Addr.isEmpty) {
        return TokenOrigin.cosmos;
      } else {
        _tokenOrigin ??= GravityService().getGravityTokenData(erc20Addr).then(
          (value) {
            return value.origin;
          },
          onError: (e) {
            dlogError(error: e, prefix: "TokenInfo.origin");
            return null;
          },
        );
        final TokenOrigin? orig = await _tokenOrigin;
        return orig;
      }
    }
  }

  TokenInfo({
    required this.symbol,
    required this.name,
    required this.address,
    this.walletType,
    this.balance,
    this.decimals = 1,
    this.iconUrl = 'https://cdn.worldvectorlogo.com/logos/ethereum-1.svg',
    this.denom,
    this.priceInDollars,
  });

  TokenInfo copyWith({
    String? denom,
    WalletType? walletType,
    String? balance,
    int? decimals,
    double? priceInDollars,
  }) {
    return TokenInfo(
      name: name,
      address: address,
      symbol: symbol,
      iconUrl: iconUrl,
      denom: denom ?? denom,
      walletType: walletType ?? this.walletType,
      balance: balance ?? this.balance,
      decimals: decimals ?? this.decimals,
      priceInDollars: priceInDollars ?? this.priceInDollars,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! TokenInfo) {
      return false;
    } else {
      return symbol == other.symbol &&
          name == other.name &&
          address == other.address &&
          balance == other.balance &&
          iconUrl == other.iconUrl &&
          walletType == other.walletType &&
          decimals == other.decimals &&
          denom == other.denom &&
          priceInDollars == other.priceInDollars;
    }
  }

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      address.hashCode ^
      balance.hashCode ^
      iconUrl.hashCode ^
      walletType.hashCode ^
      decimals.hashCode ^
      denom.hashCode ^
      priceInDollars.hashCode;

  @override
  String toString() {
    return "TokenInfo {"
        "name: $name"
        ", address: $address"
        ", denom: $denom"
        ", symbol: $symbol"
        ", address: $address"
        ", balance: $balance"
        ", decimals: $decimals"
        ", walletType: $walletType"
        ", iconUrl: $iconUrl"
        ", priceInDollars: $priceInDollars"
        "}";
  }
}
