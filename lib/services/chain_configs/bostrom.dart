import '../keplr/keplr.dart';

const _chainID = "bostrom";
const _bech32BasePrefix = "bostrom";
const _coinDenomMin = "boot";

final bostromChainInfo = ChainInfo(
    rpc: "https://rpc.bostrom.cybernode.ai",
    rest: "https://lcd.bostrom.cybernode.ai",
    chainId: _chainID,
    chainName: "Bostrom",
    stakeCurrency: Currency(
        coinDenom: _coinDenomMin,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 0,
        coinGeckoId: "bostrom"),
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
          coinDenom: _coinDenomMin,
          coinMinimalDenom: _coinDenomMin,
          coinDecimals: 0,
          coinGeckoId: "bostrom"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 0,
        coinDenom: _coinDenomMin,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "bostrom",
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.001, average: 0.0025, high: 0.004),
      )
    ],
    features: []);
