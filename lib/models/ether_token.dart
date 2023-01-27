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

import '../assets.dart';
import '../services/currency_registry/currency_registry.dart';
import 'enums/transfer_type.dart';
import 'token_info.dart';

const String _name = "Ethereum";
const String _denom = "ether";
const String _symbol = "ETH";
const String _address = "";
const int _decimals = 18;

final TokenInfo ETHER_TOKEN = TokenInfo(
  name: _name,
  denom: _denom,
  symbol: _symbol,
  address: _address,
  iconUrl: Assets.logoEthereum,
  walletType: WalletType.metamask,
  decimals: 18,
);

const Currency ETHER_CURRENCY = Currency(
  coinGeckoId: "ethereum",
  baseDenom: _denom,
  name: _name,
  symbol: _symbol,
  iconUrl: "",
  decimals: _decimals,
);
