import '../keplr/keplr.dart';

const _chainID = "osmosis-1";
const _bech32BasePrefix = "osmo";
const _coinDenom = "osmo";
const _coinDenomMin = "uosmo";

final osmosisChainInfo = ChainInfo(
    rpc: "https://rpc-osmosis-ia.cosmosia.notional.ventures",
    rest: "https://api-osmosis-ia.cosmosia.notional.ventures",
    chainId: _chainID,
    chainName: "Osmosis",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "osmosis"),
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
          coinGeckoId: "osmosis"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 6,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          gasPriceStep: GasPriceStep(low: 0.0, average: 0.025, high: 0.04),
          coinGeckoId: "osmosis")
    ],
    features: []);
