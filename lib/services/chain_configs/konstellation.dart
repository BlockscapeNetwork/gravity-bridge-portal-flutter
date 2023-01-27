import '../keplr/keplr.dart';

const _chainID = "darchub";
const _bech32BasePrefix = "darc";
const _coinDenom = "darc";
const _coinDenomMin = "udarc";

final konstellationChainInfo = ChainInfo(
    rpc: "https://node1.konstellation.tech:26657",
    rest: "https://api-konstellation-ia.cosmosia.notional.ventures",
    chainId: _chainID,
    chainName: "Konstellation Network",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "darcmatter-coin"),
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
          coinGeckoId: "darcmatter-coin"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "darcmatter-coin",
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.01, average: 0.025, high: 0.04),
      )
    ],
    features: []);
