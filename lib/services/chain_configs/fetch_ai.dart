import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _chainID = "fetchhub-4";
const _bech32BasePrefix = "fetch";
const _coinDenom = "fet";
const _coinDenomMin = "afet";

final fetchChainInfo = ChainInfo(
    rpc: "https://node.fetchhub-1.fullnodes.location3.blockscape.network/rpc",
    rest:
        "https://node.fetchhub-1.fullnodes.location3.blockscape.network/lightclient",
    chainId: _chainID,
    chainName: "Fetch Hub",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 18,
        coinGeckoId: "fetch-ai"),
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
          coinDecimals: 18,
          coinGeckoId: "fetch-ai"),
      Currency(
          coinDenom: "mobx",
          coinMinimalDenom: "nanomobx",
          coinDecimals: 9,
          coinGeckoId: ""),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 18,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "fetch-ai",
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.025, average: 0.025, high: 0.035),
      )
    ],
    features: []);
