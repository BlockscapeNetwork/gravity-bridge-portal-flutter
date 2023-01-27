import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _chainID = "kichain-2";
const _bech32BasePrefix = "ki";
const _coinDenom = "xki";
const _coinDenomMin = "uxki";

final kiChainInfo = ChainInfo(
    rpc: "https://rpc-mainnet.blockchain.ki",
    rest: "https://api-mainnet.blockchain.ki",
    chainId: _chainID,
    chainName: "Ki",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "ki"),
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
          coinGeckoId: "ki"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "ki",
        // from chain registry: "fixed_min_gas_price": 0.025
        gasPriceStep: GasPriceStep(low: 0.025, average: 0.025, high: 0.04),
      )
    ],
    features: []);
