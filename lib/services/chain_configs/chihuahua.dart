/*
{
    "$schema": "../chain.schema.json",
    "chain_name": "chihuahua",
    "status": "live",
    "network_type": "mainnet",
    "pretty_name": "Chihuahua",
    "chain_id": "chihuahua-1",
    "bech32_prefix": "chihuahua",
    "daemon_name": "chihuahuad",
    "node_home": "$HOME/.chihuahua",
    "genesis": {
        "genesis_url": "https://raw.githubusercontent.com/ChihuahuaChain/mainnet/main/genesis.json"
    },
    "codebase": {
        "git_repo": "https://github.com/ChihuahuaChain/chihuahua/",
        "recommended_version": "v1.1.1",
        "compatible_versions": [
            "v1.1.1"
        ]
    },
    "peers": {
        "seeds": [
            {
                "id": "4936e377b4d4f17048f8961838a5035a4d21240c",
                "address": "chihuahua-seed-01.mercury-nodes.net:29540"
            }
        ],
        "persistent_peers": [
            {
                "id": "b140eb36b20f3d201936c4757d5a1dcbf03a42f1",
                "address": "216.238.79.138:26656",
                "provider": "artifact"
            },
            {
                "id": "19900e1d2b10be9c6672dae7abd1827c8e1aad1e",
                "address": "161.97.96.253:26656",
                "provider": "StakeLab"
            },
            {
                "id": "c382a9a0d4c0606d785d2c7c2673a0825f7c53b2",
                "address": "88.99.94.120:26656",
                "provider": "Chihuahua"
            },
            {
                "id": "a5dfb048e4ed5c3b7d246aea317ab302426b37a1",
                "address": "137.184.250.180:26656",
                "provider": "CHILL"
            },
            {
                "id": "3bad0326026ca4e29c64c8d206c90a968f38edbe",
                "address": "128.199.165.78:26656",
                "provider": "KingNodes"
            },
            {
                "id": "89b576c3eb72a4f0c66dc0899bec7c21552ea2a5",
                "address": "23.88.7.73:29538",
                "provider": "Mercury"
            },
            {
                "id": "38547b7b6868f93af1664d9ab0e718949b8853ec",
                "address": "54.184.20.240:30758",
                "provider": "0base.vc"
            },
            {
                "id": "a9640eb569620d1f7be018a9e1919b0357a18b8c",
                "address": "38.146.3.160:26656",
                "provider": "RHINO"
            },
            {
                "id": "7e2239a0d4a0176fe4daf7a3fecd15ac663a8eb6",
                "address": "144.91.126.23:26656",
                "provider": "LavenderFive"
            }
        ]
    },
    "apis": {
        "rpc": [
            {
                "address": "https://rpc.chihuahua.wtf/",
                "provider": "Chihuahua"
            },
            {
                "address": "https://rpc-chihuahua.ecostake.com",
                "provider": "ecostake"
            },
            {
                "address": "https://chihuahua-rpc.polkachu.com",
                "provider": "Polkachu"
            },
            {
                "address": "https://rpc-chihuahua-ia.notional.ventures/",
                "provider": "Notional"
            }
        ],
        "rest": [
            {
                "address": "https://api.chihuahua.wtf/",
                "provider": "Chihuahua"
            },
            {
                "address": "https://rest-chihuahua.ecostake.com",
                "provider": "ecostake"
            },
            {
                "address": "https://api-chihuahua-ia.notional.ventures/",
                "provider": "Notional"
            }
        ],
        "grpc": [
            {
                "address": "grpc-chihuahua-ia.notional.ventures:443",
                "provider": "Notional"
            }
        ]
    },
    "explorers": [
        {
            "kind": "ping.pub",
            "url": "https://ping.pub/chihuahua",
            "tx_page": "https://ping.pub/chihuahua/tx/${txHash}"
        },
        {
            "kind": "mintscan",
            "url": "https://mintscan.io/chihuahua",
            "tx_page": "https://mintscan.io/chihuahua/txs/${txHash}"
        }
    ]
}

{
    "$schema": "../assetlist.schema.json",
    "chain_name": "chihuahua",
    "assets": [
      {
        "description": "The native token of Chihuahua Chain",
        "denom_units": [
          {
            "denom": "uhuahua",
            "exponent": 0
          },
          {
            "denom": "huahua",
            "exponent": 6
          }
        ],
        "base": "uhuahua",
        "name": "Chihuahua",
        "display": "huahua",
        "symbol": "HUAHUA",
        "logo_URIs": {
          "png": "https://raw.githubusercontent.com/cosmos/chain-registry/master/chihuahua/images/huahua.png"
        },
        "coingecko_id": "chihuahua-token"
      }
    ]
  }


*/

import '../keplr/keplr.dart';

const _chainID = "chihuahua-1";
const _bech32BasePrefix = "chihuahua";
const _coinDenom = "huahua";
const _coinDenomMin = "uhuahua";

final chihuahuaChainInfo = ChainInfo(
    rpc: "https://rpc.chihuahua.wtf",
    rest: "https://api.chihuahua.wtf",
    chainId: _chainID,
    chainName: "Chihuahua",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "chihuahua-token"),
    bip44: BIP44(coinType: 118),
    bech32Config: Bech32Config(
        bech32PrefixAccAddr: _bech32BasePrefix,
        bech32PrefixAccPub: _bech32BasePrefix + "pub",
        bech32PrefixValAddr: _bech32BasePrefix + "valoper",
        bech32PrefixValPub: _bech32BasePrefix + "valoperpub",
        bech32PrefixConsAddr: _bech32BasePrefix + "valcons",
        bech32PrefixConsPub: _bech32BasePrefix + "valconspub"),
    currencies: [
      Currency(
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          coinDecimals: 6,
          coinGeckoId: "chihuahua-token"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "chihuahua-token",
        gasPriceStep: GasPriceStep(low: 1, average: 5, high: 10),
      )
    ],
    features: []);
