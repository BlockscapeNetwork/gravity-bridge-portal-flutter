import '../keplr/keplr.dart';

const _chainID = "shentu-2.2";
const _bech32BasePrefix = "certik";
const _coinDenom = "ctk";
const _coinDenomMin = "uctk";

final shentuChainInfo = ChainInfo(
    rpc: "https://shenturpc.noopsbycertik.com",
    rest: "https://chainfull.noopsbycertik.com",
    chainId: _chainID,
    chainName: "Shentu",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "certik"),
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
          coinGeckoId: "certik"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 6,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
          gasPriceStep: GasPriceStep(low: 0.01, average: 0.025, high: 0.04),
          coinGeckoId: "certik")
    ],
    features: []);
