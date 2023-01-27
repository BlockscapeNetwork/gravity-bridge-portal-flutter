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

import 'package:gravity_bridge_flutter/models/ether_token.dart';
import 'package:gravity_bridge_flutter/services/currency_registry/currency_registry.dart';

// ignore: unnecessary_const
const mainnetRegistry = const CurrencyRegistry(
  [
    ETHER_CURRENCY,
    Currency(
      baseDenom: "uhuahua",
      name: "Chihuahua",
      symbol: "HUAHUA",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/chihuahua/images/huahua.png",
      decimals: 6,
      coinGeckoId: "chihuahua-token",
    ),
    Currency(
      baseDenom: "ugraviton",
      name: "Graviton",
      symbol: "GRAV",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/gravitybridge/images/grav.svg",
      decimals: 6,
      coinGeckoId: "graviton",
    ),
    Currency(
      baseDenom: "ujuno",
      name: "Juno",
      symbol: "JUNO",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/juno/images/juno.svg",
      decimals: 6,
      coinGeckoId: "juno-network",
    ),
    Currency(
      baseDenom: "aevmos",
      name: "Evmos",
      symbol: "EVMOS",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/evmos/images/evmos.svg",
      decimals: 18,
      coinGeckoId: "evmos",
    ),
    Currency(
      baseDenom: "ucre",
      name: "Crescent",
      symbol: "CRE",
      iconUrl:
          "https://raw.githubusercontent.com/crescent-network/asset/main/images/coin/CRE.svg",
      decimals: 6,
      coinGeckoId: "crescent-network",
    ),
    Currency(
      baseDenom: "ubcre",
      name: "Bonded Crescent",
      symbol: "bCRE",
      iconUrl:
          "https://raw.githubusercontent.com/crescent-network/asset/main/images/coin/bCRE.svg",
      decimals: 6,
      coinGeckoId: null, // not found in coin-gecko coin list
    ),
    Currency(
      baseDenom: "uatom",
      name: "Atom",
      symbol: "ATOM",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/cosmoshub/images/atom.svg",
      decimals: 6,
      coinGeckoId: "cosmos",
    ),
    Currency(
      baseDenom: "ucmdx",
      name: "Comdex",
      symbol: "CMDX",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/comdex/images/cmdx.png",
      decimals: 6,
      coinGeckoId: "comdex",
    ),
    Currency(
      baseDenom: "ustars",
      name: "Stargaze",
      symbol: "STARS",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/stargaze/images/stars.png",
      decimals: 6,
      coinGeckoId: "stargaze",
    ),
    Currency(
      baseDenom: "uiris",
      name: "IRISnet",
      symbol: "IRIS",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/irisnet/images/iris.svg",
      decimals: 6,
      coinGeckoId: "iris-network",
    ),
    Currency(
      baseDenom: "uosmo",
      name: "Osmosis",
      symbol: "OSMO",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/osmo.svg",
      decimals: 6,
      coinGeckoId: "osmosis",
    ),
    Currency(
      baseDenom: "uion",
      name: "Ion",
      symbol: "ION",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/ion.svg",
      decimals: 6,
      coinGeckoId: "ion",
    ),
    Currency(
      baseDenom: "ubcna",
      name: "BitCanna",
      symbol: "BCNA",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/bitcanna/images/bcna.svg",
      decimals: 6,
      coinGeckoId: "bitcanna",
    ),
    Currency(
      baseDenom: "uctk",
      name: "Shentu",
      symbol: "CTK",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/shentu/images/ctk.png",
      decimals: 6,
      coinGeckoId: "certik",
    ),
    Currency(
      baseDenom: "uxprt",
      name: "Persistence",
      symbol: "XPRT",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/persistence/images/xprt.svg",
      decimals: 6,
      coinGeckoId: "persistence",
    ),
    Currency(
      baseDenom: "boot",
      name: "Bostrom",
      symbol: "BOOT",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/bostrom/images/boot.png",
      decimals: 0,
      coinGeckoId: "bostrom",
    ),
    Currency(
      baseDenom: "uxki",
      name: "Ki",
      symbol: "XKI",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/kichain/images/xki.svg",
      decimals: 6,
      coinGeckoId: "ki",
    ),
    Currency(
      baseDenom: "ncheq",
      name: "cheqd",
      symbol: "CHEQ",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/cheqd/images/cheq.svg",
      decimals: 9,
      coinGeckoId: "cheqd-network",
    ),
    Currency(
      baseDenom: "uluna",
      name: "Luna Classic",
      symbol: "LUNC",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/terra/images/luna.svg",
      decimals: 6,
      coinGeckoId: "terra-luna",
    ),
    Currency(
      baseDenom: "uumee",
      name: "Umee",
      symbol: "UMEE",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/umee/images/umee.png",
      decimals: 6,
      coinGeckoId: "umee",
    ),
    Currency(
      baseDenom: "uixo",
      name: "IXO",
      symbol: "IXO",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/impacthub/images/ixo.png",
      decimals: 6,
      coinGeckoId: "ixo",
    ),
    Currency(
      baseDenom: "afet",
      name: "fetch-ai",
      symbol: "FET",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/fetchhub/images/fet.svg",
      decimals: 18,
      coinGeckoId: "fetch-ai",
    ),
    Currency(
      baseDenom: "uatolo",
      name: "Rizon Chain",
      symbol: "ATOLO",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/rizon/images/atolo.svg",
      decimals: 6,
      coinGeckoId: "rizon",
    ),
    Currency(
      baseDenom: "ulum",
      name: "Lum",
      symbol: "LUM",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/lumnetwork/images/lum.svg",
      decimals: 6,
      coinGeckoId: "lum-network",
    ),
    Currency(
      baseDenom: "rowan",
      name: "Sifchain Rowan",
      symbol: "EROWAN",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/sifchain/images/rowan.svg",
      decimals: 18,
      coinGeckoId: "sifchain",
    ),
    Currency(
      baseDenom: "udarc",
      name: "DARC",
      symbol: "DARC",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/konstellation/images/darc.svg",
      decimals: 6,
      coinGeckoId: "darcmatter-coin",
    ),
    Currency(
      baseDenom: "uscrt",
      name: "Secret",
      symbol: "SCRT",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/secretnetwork/images/scrt.svg",
      decimals: 6,
      coinGeckoId: "secret",
    ),
    Currency(
      baseDenom: "acanto",
      name: "Canto",
      symbol: "CANTO",
      iconUrl:
          "https://raw.githubusercontent.com/Canto-Network/list/1874f1113a7e0cc9acf44c64ba9d72b48c650b46/logos/token-logos/token/canto.png",
      decimals: 18,
      coinGeckoId: null,
    ),
    Currency(
      baseDenom: "umntl",
      name: "AssetMantle",
      symbol: "MNTL",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/assetmantle/images/mntl.png",
      decimals: 6,
      coinGeckoId: "assetmantle",
    ),
    Currency(
      baseDenom: "uaxl",
      name: "Axelar",
      symbol: "AXL",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/axl.svg",
      decimals: 6,
      coinGeckoId: "axelar-network",
    ),
    Currency(
      baseDenom: "uusdc",
      name: "USD Coin [Axelar]",
      symbol: "USDC.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/usdc.svg",
      decimals: 6,
      coinGeckoId: "usd-coin",
    ),
    Currency(
      baseDenom: "frax-wei",
      name: "Frax [Axelar]",
      symbol: "FRAX.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/frax.svg",
      decimals: 18,
      coinGeckoId: "frax",
    ),
    Currency(
      baseDenom: "dai-wei",
      name: "Dai Stablecoin [Axelar]",
      symbol: "DAI.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/dai.svg",
      decimals: 18,
      coinGeckoId: "dai",
    ),
    Currency(
      baseDenom: "uusdt",
      name: "Tether USD [Axelar]",
      symbol: "USDT.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/usdt.svg",
      decimals: 6,
      coinGeckoId: "tether",
    ),
    Currency(
      baseDenom: "weth-wei",
      name: "Wrapped Ether [Axelar]",
      symbol: "WETH.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/weth.png",
      decimals: 18,
      coinGeckoId: "weth",
    ),
    Currency(
      baseDenom: "wbtc-satoshi",
      name: "Wrapped Bitcoin [Axelar]",
      symbol: "WBTC.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/axelar/images/wbtc.png",
      decimals: 8,
      coinGeckoId: "wrapped-bitcoin",
    ),
    Currency(
      baseDenom: "aave-wei",
      name: "Aave [Axelar]",
      symbol: "AAVE.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/aave.svg",
      decimals: 18,
      coinGeckoId: "aave",
    ),
    Currency(
      baseDenom: "ape-wei",
      name: "ApeCoin [Axelar]",
      symbol: "APE.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/ape.svg",
      decimals: 18,
      coinGeckoId: "apecoin",
    ),
    Currency(
      baseDenom: "axs-wei",
      name: "Axie Infinity Shard [Axelar]",
      symbol: "AXS.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/axs.svg",
      decimals: 18,
      coinGeckoId: "axie-infinity",
    ),
    Currency(
      baseDenom: "link-wei",
      name: "Chainlink [Axelar]",
      symbol: "LINK.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/link.svg",
      decimals: 18,
      coinGeckoId: "chainlink",
    ),
    Currency(
      baseDenom: "mkr-wei",
      name: "Maker [Axelar]",
      symbol: "MKR.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/mkr.svg",
      decimals: 18,
      coinGeckoId: "maker",
    ),
    Currency(
      baseDenom: "rai-wei",
      name: "Rai Reflex Index [Axelar]",
      symbol: "RAI.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/rai.svg",
      decimals: 18,
      coinGeckoId: "rai",
    ),
    Currency(
      baseDenom: "shib-wei",
      name: "Shiba Inu [Axelar]",
      symbol: "SHIB.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/shib.svg",
      decimals: 18,
      coinGeckoId: "shiba-inu",
    ),
    Currency(
      baseDenom: "steth-wei",
      name: "Lido Staked Ether [Axelar]",
      symbol: "stETH.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/steth.svg",
      decimals: 18,
      coinGeckoId: "staked-ether",
    ),
    Currency(
      baseDenom: "uni-wei",
      name: "Uniswap [Axelar]",
      symbol: "UNI.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/uni.svg",
      decimals: 18,
      coinGeckoId: "uniswap",
    ),
    Currency(
      baseDenom: "xcn-wei",
      name: "Chain [Axelar]",
      symbol: "XCN.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/ethereum/images/xcn.svg",
      decimals: 18,
      coinGeckoId: "chain-2",
    ),
    Currency(
      baseDenom: "dot-planck",
      name: "Wrapped Polkadot [Axelar]",
      symbol: "DOT.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/polkadot/images/dot.svg",
      decimals: 10,
      coinGeckoId: "polkadot",
    ),
    Currency(
      baseDenom: "wglmr-wei",
      name: "Wrapped Moonbeam [Axelar]",
      symbol: "WGLMR.axl",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/_non-cosmos/moonbeam/images/glmr.svg",
      decimals: 18,
      coinGeckoId: "wrapped-moonbeam",
    ),
    Currency(
      baseDenom: "uregen",
      name: "Regen",
      symbol: "REGEN",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/regen/images/regen.png",
      decimals: 6,
      coinGeckoId: "regen",
    ),
    Currency(
      baseDenom: "ubld",
      name: "Agoric",
      symbol: "BLD",
      iconUrl:
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/agoric/images/bld.png",
      decimals: 6,
      coinGeckoId: "agoric",
    ),
    Currency(
        baseDenom: "nund",
        name: "FUND",
        symbol: "FUND",
        iconUrl:
            "https://raw.githubusercontent.com/cosmos/chain-registry/master/unification/images/fund.png",
        decimals: 9,
        coinGeckoId: "unification"),
    Currency(
      baseDenom: "unym",
      name: "Nym",
      symbol: "NYM",
      iconUrl:
          "https://assets.coingecko.com/coins/images/24488/large/NYM_Token.png",
      decimals: 6,
      coinGeckoId: "nym",
    )
  ],
);
