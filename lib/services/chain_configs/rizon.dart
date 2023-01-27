import '../keplr/keplr.dart';

const _chainID = "titan-1";
const _bech32BasePrefix = "rizon";
const _coinDenom = "atolo";
const _coinDenomMin = "uatolo";

final rizonChainInfo = ChainInfo(
    rpc: "https://rpc.rizon.chaintools.tech",
    rest: "https://api.rizon.chaintools.tech",
    chainId: _chainID,
    chainName: "RIZON",
    stakeCurrency: Currency(
      coinDenom: _coinDenom,
      coinMinimalDenom: _coinDenomMin,
      coinDecimals: 6,
      coinGeckoId: "rizon",
    ),
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
        coinGeckoId: "rizon",
      ),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.025, average: 0.025, high: 0.035),
        coinGeckoId: "rizon",
      )
    ],
    features: []);
