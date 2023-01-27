import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _chainID = "lum-network-1";
const _bech32BasePrefix = "lum";
const _coinDenom = "lum";
const _coinDenomMin = "ulum";

final lumChainInfo = ChainInfo(
    rpc:
        "https://node.lum-network-1-1.fullnodes.location1.blockscape.network/rpc",
    rest:
        "https://node.lum-network-1-1.fullnodes.location1.blockscape.network/lightclient",
    chainId: _chainID,
    chainName: "Lum Network",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "lum-network"),
    bip44: BIP44(coinType: 880),
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
          coinGeckoId: "lum-network"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "lum-network",
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.001, average: 0.0025, high: 0.004),
      )
    ],
    features: []);
