import '../keplr/keplr.dart';

const _chainID = "cheqd-mainnet-1";
const _bech32BasePrefix = "cheqd";
const _coinDenom = "cheq";
const _coinDenomMin = "ncheq";

final cheqdChainInfo = ChainInfo(
    rpc: "https://rpc.cheqd.net",
    rest: "https://api.cheqd.net",
    chainId: _chainID,
    chainName: "Cheqd",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 9,
        coinGeckoId: "cheqd-network"),
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
          coinDecimals: 9,
          coinGeckoId: "cheqd-network"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 9,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "cheqd-network",
        gasPriceStep: GasPriceStep(low: 25, average: 50, high: 100),
      )
    ],
    features: []);
