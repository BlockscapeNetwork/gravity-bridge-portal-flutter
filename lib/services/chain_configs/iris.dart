import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _chainID = "irishub-1";
const _bech32BasePrefix = "iaa";
const _coinDenom = "iris";
const _coinDenomMin = "uiris";

final irisChainInfo = ChainInfo(
    rpc: "https://rpc-iris.keplr.app",
    rest: "https://lcd-iris.keplr.app",
    chainId: _chainID,
    chainName: "IRISnet",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "iris-network"),
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
          coinGeckoId: "iris-network"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        gasPriceStep: GasPriceStep(low: 0.0008, average: 0.002, high: 0.0032),
        coinGeckoId: "iris-network",
      )
    ],
    features: []);
