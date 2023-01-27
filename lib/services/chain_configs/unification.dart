import '../keplr/keplr.dart';

const _chainID = "FUND-MainNet-2";
const _bech32BasePrefix = "und";
const _coinDenom = "FUND";
const _coinDenomMin = "nund";

final unificationChainInfo = ChainInfo(
    rpc: "https://rpc1.unification.io:443",
    rest: "https://rest.unification.io",
    chainId: _chainID,
    chainName: "Unification",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 9,
        coinGeckoId: "unification"),
    bip44: BIP44(coinType: 5555),
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
          coinDecimals: 9,
          coinGeckoId: "unification"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 9,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
          gasPriceStep: GasPriceStep(low: 25.0, average: 50.0, high: 100.0),
          coinGeckoId: "unification")
    ],
    features: []);
