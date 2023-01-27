import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _chainID = "juno-1";
const _bech32BasePrefix = "juno";
const _coinDenom = "juno";
const _coinDenomMin = "ujuno";

final junoChainInfo = ChainInfo(
    rpc: "https://node.juno-1.fullnodes.location3.blockscape.network/rpc",
    rest:
        "https://node.juno-1.fullnodes.location3.blockscape.network/lightclient",
    chainId: _chainID,
    chainName: "Juno",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "juno-network"),
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
          coinGeckoId: "juno-network"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 6,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
          gasPriceStep: GasPriceStep(low: 0.03, average: 0.04, high: 0.05),
          coinGeckoId: "juno-network")
    ],
    features: []);
