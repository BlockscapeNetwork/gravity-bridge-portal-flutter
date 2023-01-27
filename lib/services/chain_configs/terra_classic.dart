import '../keplr/keplr.dart';

const _chainID = "columbus-5";
const _bech32BasePrefix = "terra";
const _coinDenom = "luna";
const _coinDenomMin = "uluna";

final terraClassicChainInfo = ChainInfo(
    rpc: "https://rpc-terra-ia.cosmosia.notional.ventures",
    rest: "https://api-terra-ia.cosmosia.notional.ventures",
    chainId: _chainID,
    chainName: "Terra Classic",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "terra-luna"),
    bip44: BIP44(coinType: 330),
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
          coinGeckoId: "terra-luna"),
    ],
    feeCurrencies: [
      /*
        {"uluna":"28.325",
        "usdr":"0.52469",
        "uusd":"0.75",
        "ukrw":"850.0",
        "umnt":"2142.855",
        "ueur":"0.625",
        "ucny":"4.9",
        "ujpy":"81.85",
        "ugbp":"0.55",
        "uinr":"54.4",
        "ucad":"0.95",
        "uchf":"0.7",
        "uaud":"0.95",
        "usgd":"1.0",
        "uthb":"23.1",
        "usek":"6.25",
        "unok":"6.25",
        "udkk":"4.5",
        "uidr":"10900.0",
        "uphp":"38.0",
        "uhkd":"5.85",
        "umyr":"3.0",
        "utwd":"20.0"}
      */
      FeeCurrency(
          coinDecimals: 6,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
          gasPriceStep:
              GasPriceStep(low: 28.325, average: 70.8125, high: 113.3),
          coinGeckoId: "terra-luna")
    ],
    features: []);
