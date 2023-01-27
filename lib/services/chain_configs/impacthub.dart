import '../keplr/keplr.dart';

const _chainID = "impacthub-3";
const _bech32BasePrefix = "ixo";
const _coinDenom = "ixo";
const _coinDenomMin = "uixo";

final impactHubChainInfo = ChainInfo(
    rpc:
        "https://rpc-ixo-ia.cosmosia.notional.ventures", // Transaction-Creation works; Status-Check works
    // rpc: "https://impacthub.ixo.world/rpc", // Transaction-Creation fails with a CORS-error
    rest: "https://api-ixo-ia.cosmosia.notional.ventures",
    chainId: _chainID,
    chainName: "Impact Hub",
    stakeCurrency: Currency(
      coinDenom: _coinDenom,
      coinMinimalDenom: _coinDenomMin,
      coinDecimals: 6,
      coinGeckoId: "ixo",
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
        coinGeckoId: "ixo",
      ),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "ixo",
        // set the default gas price as (low: 0.01, average: 0.025, high: 0.04).
        gasPriceStep: GasPriceStep(low: 0.025, average: 0.025, high: 0.025),
      )
    ],
    features: []);
