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

import 'package:gravity_bridge_flutter/services/currency_registry/currency_registry.dart';

import '../services/chain_configs/chain_configs.dart';

abstract class KeplrConfig {
  final String rpc;
  final String webGRPC;
  final String lcd;
  final String chainID;
  final String bech32BasePrefix;
  final String coinDenomStake;
  final String coinDenomStakeMin;
  final String coinDenomFee;
  final String coinDenomFeeMin;
  final List<GravityToken> gravityTokens;
  final List<ForwardChain> forwardChains;
  final List<IbcChain> ibcChains;
  final CurrencyRegistry currencyRegistry;

  const KeplrConfig({
    required this.rpc,
    required this.webGRPC,
    required this.lcd,
    required this.chainID,
    required this.bech32BasePrefix,
    required this.coinDenomStake,
    required this.coinDenomStakeMin,
    required this.coinDenomFee,
    required this.coinDenomFeeMin,
    required this.gravityTokens,
    required this.forwardChains,
    required this.ibcChains,
    required this.currencyRegistry,
  });
}

class GravityToken {
  final String name;
  final String symbol;
  final int decimals;
  final String coinGeckoName;
  final String denom;
  //final String gravityIbcChannelId;
  //final String nativeIbcChannelId;

  const GravityToken({
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.coinGeckoName,
    required this.denom,
    //required this.gravityIbcChannelId,
    //required this.nativeIbcChannelId,
  });
}

class ForwardChain {
  final String addressPrefix;
  final Chain chainName;
  final String label;
  final bool isDefault;

  String get iconUri => getAsset(chainName);

  const ForwardChain({
    required this.addressPrefix,
    required this.chainName,
    required this.label,
    this.isDefault = false,
  });
}

class IbcChain {
  final Chain chainName;
  final String addressPrefix;
  final String channelGravity;
  final String channelNative;
  final String channelID;

  String get label => chainInfos[chainName]?.chainName ?? chainName.toString();
  String get iconUri => getAsset(chainName);

  const IbcChain({
    required this.addressPrefix,
    required this.chainName,
    required this.channelNative,
    required this.channelGravity,
    required this.channelID,
  });
}

abstract class MetamaskConfig {
  final String gravityContractAddr;
  final String networkName;
  final String networkID;

  const MetamaskConfig({
    required this.gravityContractAddr,
    required this.networkName,
    required this.networkID,
  });
}

class Config {
  static late final KeplrConfig keplr;
  static late final MetamaskConfig metamask;
  static late final bool isDebug;
  static late final String title;
  static late final String feeServerAddress;

  static const int kFeeDecimals = 5;

  static init({
    required KeplrConfig keplr,
    required MetamaskConfig metamask,
    bool isDebug = false,
    String title = '',
    required String feeServerAddress,
  }) {
    Config.keplr = keplr;
    Config.metamask = metamask;
    Config.isDebug = isDebug;
    Config.title = title;
    Config.feeServerAddress = feeServerAddress;
  }
}
