import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

// https://github.com/AssetMantle/webApp/blob/48ff506245e6312aed096f346b2e2a8e55bd7958/src/utilities/Helpers/kelplr.js

const _chainID = "mantle-1";
const _bech32BasePrefix = "mantle";
const _coinDenom = "mntl";
const _coinDenomMin = "umntl";

final assetmantleChainInfo = ChainInfo(
    // rpc: "https://node.mantle-1-1.fullnodes.location1.blockscape.network/rpc",
    // rest:
    // "https://node.mantle-1-1.fullnodes.location1.blockscape.network/lightclient",
    rpc: "https://rpc.assetmantle.one",
    rest: "https://rest.assetmantle.one",
    chainId: _chainID,
    chainName: "AssetMantle",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "assetmantle"),
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
          coinGeckoId: "assetmantle"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "assetmantle",
        // these fees are for our rpc-node, the low fee is the important one (minimum that our rpc-node accepts), the others are just 2x/4x that
        gasPriceStep: GasPriceStep(
          low: 0.67,
          average: 1.34,
          high: 2.68,
        ),
      )
    ],
    features: []);
