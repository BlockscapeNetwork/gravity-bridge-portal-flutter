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
import 'package:gravity_bridge_flutter/services/currency_registry/cr_mainnet.dart';
import 'package:gravity_bridge_flutter/services/currency_registry/currency_registry.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:gravity_bridge_flutter/app.dart';

class KeplrProd implements KeplrConfig {
  @override
  final String rpc =
      "https://node.gravity-bridge-3-1.fullnodes.location3.blockscape.network/rpc";
  @override
  final String lcd =
      "https://node.gravity-bridge-3-1.fullnodes.location3.blockscape.network/lightclient";
  @override
  final String webGRPC = "https://gravity-webgrpc-1.blockscape.network:443";
  @override
  final String chainID = "gravity-bridge-3";
  @override
  final String bech32BasePrefix = "gravity";
  @override
  final String coinDenomStake = "GRAV";
  @override
  final String coinDenomStakeMin = "ugraviton";
  @override
  final String coinDenomFee = "GRAV";
  @override
  final String coinDenomFeeMin = "ugraviton";
  @override
  final List<GravityToken> gravityTokens = const [
    // GravityToken(           // NOT READY YET: NO ERC20 CONTRACT DEPLOYED
    //   coinGeckoName: "certik",
    //   decimals: 6,
    //   name: "Shentu",
    //   symbol: "CTK",
    //   denom:
    //       "ibc/1250DF5455D8208B8E23C2DB1BD7B6D90CC898F4E3D8708F229AF5547E6674A6",
    // ),
    GravityToken(
      coinGeckoName: "nym",
      decimals: 6,
      name: "Nym",
      symbol: "NYM",
      denom:
          "ibc/0C273962C274B2C05B22D9474BFE5B84D6A6FCAD198CB9B0ACD35EA521A36606",
    ),
    GravityToken(
      coinGeckoName: "cosmos",
      decimals: 6,
      name: "Atom",
      symbol: "ATOM",
      denom:
          "ibc/2E5D0AC026AC1AFA65A23023BA4F24BB8DDF94F118EDC0BAD6F625BFC557CDED",
    ),
    GravityToken(
      coinGeckoName: "comdex",
      decimals: 6,
      name: "Comdex",
      symbol: "CMDX",
      denom:
          "ibc/29A7122D024B5B8FA8A2EFBB4FA47272C25C8926AA005A96807127208082DAB3",
    ),
    GravityToken(
      coinGeckoName: "stargaze",
      decimals: 6,
      name: "Stargaze Stars",
      symbol: "STARS",
      denom:
          "ibc/4F393C3FCA4190C0A6756CE7F6D897D5D1BE57D6CCB80D0BC87393566A7B6602",
    ),
    GravityToken(
      coinGeckoName: "chihuahua-token",
      decimals: 6,
      name: "Chihuahua",
      symbol: "HUAHUA",
      denom:
          "ibc/048BE20AE2E6BFD4142C547E04F17E5F94363003A12B7B6C084E08101BFCF7D1",
    ),
    GravityToken(
      coinGeckoName: "secret",
      decimals: 6,
      name: "Secret",
      symbol: "SCRT",
      denom:
          "ibc/7907EA1A11FD4FC2A815FCAA54948C42F08E3F3C874EE48861386286FEB80160",
    ),
    GravityToken(
      coinGeckoName: "assetmantle",
      decimals: 6,
      name: "AssetMantle",
      symbol: "MNTL",
      denom:
          "ibc/00F2B62EB069321A454B708876476AFCD9C23C8C9C4A5A206DDF1CD96B645057",
    ),
    GravityToken(
        coinGeckoName: "unification",
        decimals: 9,
        name: "FUND",
        symbol: "FUND",
        denom:
            "ibc/D157AD8A50DAB0FC4EB95BBE1D9407A590FA2CDEE04C90A76C005089BF76E519"),
    GravityToken(
        coinGeckoName: "terrausd",
        decimals: 6,
        name: "UST Classic",
        symbol: "USTC",
        denom:
            "ibc/50896BE248180B0341B4A679CF49249ECF70032AF1307BFAF0233D35F0D25665"),
    GravityToken(
        coinGeckoName: "terra-luna",
        decimals: 6,
        name: "Luna Classic",
        symbol: "LUNC",
        denom:
            "ibc/7F04F5D641285808E1C6A01D266C3D9BE1C23473BF3D01AC31E621CFF72DBF24"),
    // GravityToken(
    //   coinGeckoName: "agoric",
    //   decimals: 6,
    //   name: "Agoric",
    //   symbol: "BLD",
    //   denom: "", // denom is missing for Agoric
    // ),
    GravityToken(
      coinGeckoName: "cheqd-network",
      decimals: 9,
      name: "cheqd",
      symbol: "CHEQ",
      denom:
          "ibc/5012B1C96F286E8A6604A87037CE51241C6F1CA195B71D1E261FCACB69FB6BC2",
    ),
    // ),
    // GravityToken( // NOT READY YET: NO ERC20 CONTRACT DEPLOYED
    //   coinGeckoName: "graviton",
    //   decimals: 9,
    //   name: "Graviton",
    //   symbol: "GRAV",
    //   denom: "graviton",
    //   // gravityIbcChannelId: "",
    //   // nativeIbcChannelId: ""),
    // ),
  ];

  @override
  final List<ForwardChain> forwardChains = const [
    ForwardChain(
      addressPrefix: "gravity",
      chainName: Chain.gravity,
      label: "Gravity Bridge",
      isDefault: true,
    ),
    ForwardChain(
      addressPrefix: "n1",
      chainName: Chain.nyx,
      label: "Nyx",
    ),
    ForwardChain(
      addressPrefix: "cosmos1",
      chainName: Chain.cosmosHub,
      label: "Cosmos Hub",
    ),
    ForwardChain(
      addressPrefix: "osmo1",
      chainName: Chain.osmosis,
      label: "Osmosis",
    ),
    ForwardChain(
      addressPrefix: "iaa1",
      chainName: Chain.iris,
      label: "Iris",
    ),
    ForwardChain(
      addressPrefix: "cre1",
      chainName: Chain.crescent,
      label: "Crescent",
    ),
    ForwardChain(
      addressPrefix: "chihuahua1",
      chainName: Chain.chihuahua,
      label: "Chihuahua",
    ),
    ForwardChain(
      addressPrefix: "stars1",
      chainName: Chain.stargaze,
      label: "Stargaze",
    ),
    ForwardChain(
      addressPrefix: "secret",
      chainName: Chain.secret,
      label: "Secret",
    ),
    ForwardChain(
      addressPrefix: "canto",
      chainName: Chain.canto,
      label: "Canto",
    ),
    ForwardChain(
      addressPrefix: "mantle",
      chainName: Chain.assetmantle,
      label: "AssetMantle",
    ),
    ForwardChain(
      addressPrefix: "evmos1",
      chainName: Chain.evmos,
      label: "Evmos",
    ),
    ForwardChain(
      addressPrefix: "regen",
      chainName: Chain.regen,
      label: "Regen",
    ),
    ForwardChain(
      addressPrefix: "agoric",
      chainName: Chain.agoric,
      label: "Agoric",
    ),
    ForwardChain(
      addressPrefix: "und",
      chainName: Chain.unification,
      label: "Unification",
    ),
    ForwardChain(
      addressPrefix: "terra",
      chainName: Chain.terraclassic,
      label: "Terra Classic",
    ),
  ];

  @override
  final List<IbcChain> ibcChains = const [
    IbcChain(
      addressPrefix: "chihuahua1",
      chainName: Chain.chihuahua,
      channelNative: "channel-15",
      channelGravity: "channel-34",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "cosmos1",
      chainName: Chain.cosmosHub,
      channelNative: "channel-281",
      channelGravity: "channel-17",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "cre1",
      chainName: Chain.crescent,
      channelNative: "channel-2",
      channelGravity: "channel-62",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "iaa1",
      chainName: Chain.iris,
      channelNative: "channel-29",
      channelGravity: "channel-47",
      channelID: "transfer",
    ),
    // IbcChain(
    //   addressPrefix: "n1",
    //   chainName: Chain.nyx,
    //   channelNative: "channel-0",
    //   channelGravity: "channel-18",
    //   channelID: "transfer",
    // ),
    IbcChain(
      addressPrefix: "osmo1",
      chainName: Chain.osmosis,
      channelNative: "channel-144",
      channelGravity: "channel-10",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "stars1",
      chainName: Chain.stargaze,
      channelNative: "channel-6",
      channelGravity: "channel-7",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "bcna",
      chainName: Chain.bitcanna,
      channelNative: "channel-8",
      channelGravity: "channel-0",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "juno",
      chainName: Chain.juno,
      channelNative: "channel-31",
      channelGravity: "channel-8",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "certik",
      chainName: Chain.shentu,
      channelNative: "channel-6",
      channelGravity: "channel-12",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "persistence",
      chainName: Chain.persistence,
      channelNative: "channel-38",
      channelGravity: "channel-24",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "bostrom",
      chainName: Chain.bostrom,
      channelNative: "channel-6",
      channelGravity: "channel-33",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "ki",
      chainName: Chain.kichain,
      channelNative: "channel-11",
      channelGravity: "channel-37",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "cheqd",
      chainName: Chain.cheqd,
      channelNative: "channel-2",
      channelGravity: "channel-43",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "terra",
      chainName: Chain.terraclassic,
      channelNative: "channel-64",
      channelGravity: "channel-101",
      channelID: "transfer",
    ),
    IbcChain(
        addressPrefix: "umee",
        chainName: Chain.umee,
        channelNative: "channel-9",
        channelGravity: "channel-28",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "ixo",
        chainName: Chain.impacthub,
        channelNative: "channel-16",
        channelGravity: "channel-26",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "fetch",
        chainName: Chain.fetchai,
        channelNative: "channel-7",
        channelGravity: "channel-30",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "rizon",
        chainName: Chain.rizon,
        channelNative: "channel-4",
        channelGravity: "channel-53",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "lum",
        chainName: Chain.lum,
        channelNative: "channel-6",
        channelGravity: "channel-55",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "sif",
        chainName: Chain.sifchain,
        channelNative: "channel-60",
        channelGravity: "channel-66",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "darc",
        chainName: Chain.konstellation,
        channelNative: "channel-2",
        channelGravity: "channel-57",
        channelID: "transfer"),
    IbcChain(
        addressPrefix: "evmos",
        chainName: Chain.evmos,
        channelNative: "channel-8",
        channelGravity: "channel-65",
        channelID: "transfer"),
    IbcChain(
      addressPrefix: "secret",
      chainName: Chain.secret,
      channelNative: "channel-17",
      channelGravity: "channel-79",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "mantle",
      chainName: Chain.assetmantle,
      channelNative: "channel-8",
      channelGravity: "channel-82",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "canto",
      chainName: Chain.canto,
      channelNative: "channel-0",
      channelGravity: "channel-88",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "regen",
      chainName: Chain.regen,
      channelNative: "channel-45",
      channelGravity: "channel-89",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "agoric",
      chainName: Chain.agoric,
      channelNative: "channel-4",
      channelGravity: "channel-91",
      channelID: "transfer",
    ),
    IbcChain(
      addressPrefix: "und",
      chainName: Chain.unification,
      channelNative: "channel-2",
      channelGravity: "channel-98",
      channelID: "transfer",
    ),
  ];

  @override
  final CurrencyRegistry currencyRegistry = mainnetRegistry;

  const KeplrProd();
}

class MetamaskProd implements MetamaskConfig {
  @override
  final String gravityContractAddr =
      '0xa4108aA1Ec4967F8b52220a4f7e94A8201F2D906';
  @override
  final String networkID = "0x1"; // mainnet
  @override
  final String networkName = "Ethereum Mainnet";

  const MetamaskProd();
}

void main() async {
  Config.init(
    keplr: const KeplrProd(),
    metamask: const MetamaskProd(),
    feeServerAddress: "https://price-server.blockscape.network",
  );

  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}
