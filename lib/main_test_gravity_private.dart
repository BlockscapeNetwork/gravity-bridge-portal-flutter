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
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'services/currency_registry/currency_registry.dart';

class KeplrTestInternal implements KeplrConfig {
  @override
  String rpc = "http://116.203.110.207:26657";
  @override
  String lcd = "http://116.203.110.207:1317";
  @override
  String webGRPC =
      "http://116.203.110.207:9092"; // 'http://testnet.gravitychain.io:9091'
  @override
  String chainID = "gravity-test";
  @override
  String bech32BasePrefix = "gravity";
  @override
  String coinDenomStake = "STK";
  @override
  String coinDenomStakeMin = "stake";
  @override
  String coinDenomFee = "STK";
  @override
  String coinDenomFeeMin = "stake";
  @override
  List<GravityToken> gravityTokens = [
    const GravityToken(
      coinGeckoName: "-",
      decimals: 6,
      name: "No Meta Data Token",
      symbol: "NMDT",
      denom: "ibc/nometadatatoken",
    ),
  ];
  @override
  List<ForwardChain> forwardChains = const [
    ForwardChain(
        addressPrefix: "gravity",
        chainName: Chain.gravity,
        label: "Gravity Bridge",
        isDefault: true),
  ];

  @override
  final List<IbcChain> ibcChains = const [];

  @override
  CurrencyRegistry currencyRegistry = const CurrencyRegistry([]);
}

class MetamaskTestInternal implements MetamaskConfig {
  @override
  String gravityContractAddr = '0x7580bFE88Dd3d07947908FAE12d95872a260F2D8';
  @override
  String networkName = "Gravity Ethereum";
  @override
  String networkID = "0xf";
}

void main() async {
  Config.init(
      keplr: KeplrTestInternal(),
      metamask: MetamaskTestInternal(),
      isDebug: true,
      title: "Gravity Private Test",
      feeServerAddress: "MOCK");
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}
