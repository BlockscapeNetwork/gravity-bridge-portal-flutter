import '../keplr/keplr.dart';

const _chainID = "core-1";
const _bech32BasePrefix = "persistence";
const _coinDenom = "xprt";
const _coinDenomMin = "uxprt";

final persistenceChainInfo = ChainInfo(
    rpc: "https://rpc.core.persistence.one",
    rest: "https://rest.core.persistence.one",
    chainId: _chainID,
    chainName: "Persistence",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "persistence"),
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
          coinGeckoId: "persistence"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.0, average: 0.0025, high: 0.004),
        coinGeckoId: "persistence",
      )
    ],
    features: []);
