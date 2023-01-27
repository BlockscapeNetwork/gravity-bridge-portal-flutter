import '../keplr/keplr.dart';

const _chainID = "evmos_9001-2";
const _bech32BasePrefix = "evmos";
const _coinDenom = "evmos";
const _coinDenomMin = "aevmos";

final evmosChainInfo = ChainInfo(
    rpc: "https://rpc-evmos-ia.cosmosia.notional.ventures:443",
    rest: "https://api-evmos-ia.cosmosia.notional.ventures",
    chainId: _chainID,
    chainName: "Evmos",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 18,
        coinGeckoId: "evmos"),
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
          coinDecimals: 18,
          coinGeckoId: "evmos"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 18,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          coinGeckoId: "evmos",
          // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
          gasPriceStep: GasPriceStep(
              low: 20000000000, average: 25000000000, high: 40000000000))
    ],
    features: []);
