import '../keplr/keplr.dart';

const _chainID = "secret-4";
const _bech32BasePrefix = "secret";
const _coinDenom = "scrt";
const _coinDenomMin = "uscrt";

final secretChainInfo = ChainInfo(
    rpc: "https://rpc.scrt.network",
    rest: "https://api.scrt.network",
    chainId: _chainID,
    chainName: "Secret Network",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "secret"),
    bip44: BIP44(coinType: 529),
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
          coinGeckoId: "secret"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "secret",
        gasPriceStep: GasPriceStep(low: 0.1, average: 0.2, high: 0.4),
      )
    ],
    features: []);
