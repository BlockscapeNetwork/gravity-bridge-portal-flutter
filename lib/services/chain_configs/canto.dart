import '../keplr/keplr.dart';

const _chainID = "canto_7700-1";
const _bech32BasePrefix = "canto";
const _coinDenom = "canto";
const _coinDenomMin = "acanto";
const _decimals = 18;

final cantoChainInfo = ChainInfo(
    rpc: "https://canto.rpc.chandrastation.com",
    rest: "https://canto.api.chandrastation.com",
    chainId: _chainID,
    chainName: "Canto",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: _decimals,
        coinGeckoId: "canto"),
    bip44: BIP44(coinType: 60),
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
          coinDecimals: _decimals,
          coinGeckoId: "canto"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: _decimals,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "canto",
        gasPriceStep: GasPriceStep(
            low: 10000000000, average: 25000000000, high: 40000000000),
      )
    ],
    features: []);
