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

import 'package:gravity_bridge_flutter/services/chain_configs/agoric.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/bitcanna.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/cheqd.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/crescent.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/evmos.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/fetch_ai.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/gravity.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/impacthub.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/iris.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/juno.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/ki_chain.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/konstellation.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/lum.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/nym.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/osmosis.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/persistence.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/regen.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/rizon.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/secret.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/shentu.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/sifchain.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/stargaze.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/terra_classic.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/umee.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/unification.dart';

import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/assetmantle.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/bostrom.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/canto.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chihuahua.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/cosmos_hub.dart';

const fallBackChainAsset = Assets.logoGravityBridge;

// If you ad a chain here please also add it to the forwardChains in the keplrConfig in main.dart
enum Chain {
  agoric(chainName: "Agoric", chainPrefix: "agoric1"),
  assetmantle(
    chainName: "AssetMantle",
    chainPrefix: "mantle",
    mintscan: "asset-mantle",
    isBetaInKeplr: true,
    feeUpdateDate: "2023-01-26",
  ),
  bitcanna(chainName: "BitCanna", chainPrefix: "bcna", mintscan: "bitcanna"),
  bostrom(chainName: "Bostrom", chainPrefix: "bostrom"),
  canto(chainName: "Canto", chainPrefix: "canto"),
  cheqd(
    chainName: "Cheqd",
    chainPrefix: "cheqd",
    isBetaInKeplr: true,
    feeUpdateDate: "2023-01-13",
  ),
  chihuahua(
    chainName: "Chihuahua",
    chainPrefix: "chihuahua1",
    isBetaInKeplr: true,
    feeUpdateDate: "2022-12-02",
    mintscan: "chihuahua",
  ),
  cosmosHub(
      chainName: "Cosmos Hub", chainPrefix: "cosmos1", mintscan: "cosmos"),
  crescent(chainName: "Crescent", chainPrefix: "cre1", mintscan: "crescent"),
  evmos(
      chainName: "Evmos",
      chainPrefix: "evmos1",
      feeUpdateDate: "2023-01-13",
      mintscan: "evmos"),
  fetchai(
    chainName: "Fetch Hub",
    chainPrefix: "fetch",
    isBetaInKeplr: true,
    feeUpdateDate: "2023-01-13",
    mintscan: "fetchai",
  ),
  gravity(
    chainName: "Gravity Bridge",
    chainPrefix: "gravity",
    mintscan: "gravity-bridge",
  ),
  impacthub(chainName: "Impact Hub", chainPrefix: "ixo", mintscan: "ixo"),
  iris(chainName: "IRISnet", chainPrefix: "iaa1", mintscan: "iris"),
  juno(
    chainName: "Juno",
    chainPrefix: "juno",
    feeUpdateDate: "2023-01-13",
    mintscan: "juno",
  ),
  kichain(
    chainName: "Ki",
    chainPrefix: "ki",
    mintscan: "ki-chain",
    isBetaInKeplr: true,
    feeUpdateDate: "2023-01-26",
  ),
  konstellation(
    chainName: "Konstellation Network",
    chainPrefix: "darc",
    mintscan: "konstellation",
  ),
  lum(chainName: "Lum Network", chainPrefix: "lum", mintscan: "lum"),
  nyx(chainName: "Nyx Mainnet", chainPrefix: "n1", mintscan: "nyx"),
  osmosis(
    chainName: "Osmosis",
    chainPrefix: "osmo1",
    feeUpdateDate: "2023-01-13",
    mintscan: "osmosis",
  ),
  persistence(
    chainName: "Persistence",
    chainPrefix: "persistence",
    feeUpdateDate: "2023-01-13",
    mintscan: "persistence",
  ),
  regen(chainName: "Regen", chainPrefix: "regen", mintscan: "regen"),
  rizon(
    chainName: "RIZON",
    chainPrefix: "rizon",
    isBetaInKeplr: true,
    feeUpdateDate: "2023-01-13",
    mintscan: "rizon",
  ),
  secret(
    chainName: "Secret Network",
    chainPrefix: "secret",
    mintscan: "secret",
  ),
  shentu(chainName: "Shentu", chainPrefix: "certik", mintscan: "shentu"),
  sifchain(chainName: "Sifchain", chainPrefix: "sif", mintscan: "sifchain"),
  stargaze(chainName: "Stargaze", chainPrefix: "stars1", mintscan: "stargaze"),
  terraclassic(
    chainName: "Terra Classic",
    chainPrefix: "terra",
    isBetaInKeplr: true,
    feeUpdateDate: "2023-01-26",
  ),
  umee(chainName: "Umee", chainPrefix: "umee", mintscan: "umee"),
  unification(chainName: "Unification", chainPrefix: "und"),

  ethereum(chainName: "Ethereum", chainPrefix: "0x");

  final String chainName;
  final String chainPrefix;
  bool get isSupportedByLedger => chainInfos[this]?.bip44.coinType == 118;
  final bool isBetaInKeplr;
  final String feeUpdateDate;
  final String mintscan;
  const Chain({
    required this.chainName,
    required this.chainPrefix,
    this.isBetaInKeplr = false,
    this.feeUpdateDate = "",
    this.mintscan = "",
  });
}

Map<Chain, ChainInfo> chainInfos = {
  Chain.gravity: gravityChainInfo,
  Chain.chihuahua: chihuahuaChainInfo,
  Chain.cosmosHub: cosmosHubChainInfo,
  Chain.crescent: crescentChainInfo,
  Chain.iris: irisChainInfo,
  Chain.osmosis: osmosisChainInfo,
  Chain.stargaze: stargazeChainInfo,
  Chain.nyx: nyxChainInfo,
  Chain.bitcanna: bitcannaChainInfo,
  Chain.juno: junoChainInfo,
  Chain.shentu: shentuChainInfo,
  Chain.persistence: persistenceChainInfo,
  Chain.bostrom: bostromChainInfo,
  Chain.kichain: kiChainInfo,
  Chain.cheqd: cheqdChainInfo,
  Chain.terraclassic: terraClassicChainInfo,
  Chain.umee: umeeChainInfo,
  Chain.impacthub: impactHubChainInfo,
  Chain.fetchai: fetchChainInfo,
  Chain.rizon: rizonChainInfo,
  Chain.lum: lumChainInfo,
  Chain.sifchain: sifChainInfo,
  Chain.konstellation: konstellationChainInfo,
  Chain.evmos: evmosChainInfo,
  Chain.secret: secretChainInfo,
  Chain.canto: cantoChainInfo,
  Chain.assetmantle: assetmantleChainInfo,
  Chain.regen: regenChainInfo,
  Chain.agoric: agoricChainInfo,
  Chain.unification: unificationChainInfo,
};

final Map<Chain, String> chainAssets = {
  Chain.ethereum: Assets.logoEthereum,
  Chain.gravity: Assets.logoGravityBridge,
  Chain.chihuahua:
      'https://github.com/cosmos/chain-registry/raw/master/chihuahua/images/huahua.png',
  Chain.cosmosHub:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/cosmoshub/images/atom.svg',
  Chain.crescent:
      'https://raw.githubusercontent.com/crescent-network/asset/main/images/coin/CRE.svg',
  Chain.iris:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/irisnet/images/iris.svg',
  Chain.osmosis:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/osmo.png',
  Chain.stargaze:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/stargaze/images/stars.png',
  Chain.nyx:
      'https://assets.coingecko.com/coins/images/22174/small/NYX-logo-medium-size.png',
  Chain.bitcanna:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/bitcanna/images/bcna.svg',
  Chain.juno:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/juno/images/juno.svg',
  Chain.shentu:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/shentu/images/ctk.png',
  Chain.persistence:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/persistence/images/pstake.svg',
  Chain.bostrom:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/bostrom/images/boot.png',
  Chain.kichain:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/kichain/images/xki.svg',
  Chain.cheqd:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/cheqd/images/cheq.svg',
  Chain.terraclassic:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/terra/images/luna.svg',
  Chain.umee:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/umee/images/umee.png',
  Chain.impacthub:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/impacthub/images/ixo.png',
  Chain.fetchai:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/fetchhub/images/fet.svg',
  Chain.rizon:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/rizon/images/atolo.svg',
  Chain.lum:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/lumnetwork/images/lum.svg',
  Chain.sifchain:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/sifchain/images/rowan.svg',
  Chain.konstellation:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/konstellation/images/darc.svg',
  Chain.evmos:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/evmos/images/evmos.svg',
  Chain.secret:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/secretnetwork/images/scrt.svg',
  Chain.canto:
      'https://raw.githubusercontent.com/Canto-Network/list/1874f1113a7e0cc9acf44c64ba9d72b48c650b46/logos/token-logos/token/canto.png',
  Chain.assetmantle:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/assetmantle/images/mntl.png',
  Chain.regen:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/regen/images/regen.png',
  Chain.agoric:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/agoric/images/bld.png',
  Chain.unification:
      'https://raw.githubusercontent.com/cosmos/chain-registry/master/unification/images/fund.png'
};

String getAsset(Chain chain) {
  if (chainAssets.containsKey(chain)) {
    return chainAssets[chain]!;
  } else {
    return fallBackChainAsset;
  }
}
