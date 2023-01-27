import '../keplr/keplr.dart';

const _chainID = "sifchain-1";
const _bech32BasePrefix = "sif";
const _coinDenom = "ROWAN";
const _coinDenomMin = "rowan";

final sifChainInfo = ChainInfo(
    rpc: "https://rpc-sifchain-ia.cosmosia.notional.ventures",
    rest: "https://api-sifchain-ia.cosmosia.notional.ventures",
    chainId: _chainID,
    chainName: "Sifchain",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 18,
        coinGeckoId: "sifchain"),
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
          coinDecimals: 18,
          coinGeckoId: "sifchain"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 18,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
          gasPriceStep: GasPriceStep(low: 0.01, average: 0.025, high: 0.04),
          coinGeckoId: "sifchain")
    ],
    features: []);
