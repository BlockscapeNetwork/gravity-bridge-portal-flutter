import '../keplr/keplr.dart';

// https://github.com/cosmos/chain-registry/blob/master/agoric/chain.json

const _chainID = "agoric-3";
const _bech32BasePrefix = "agoric";
const _coinDenom = "bld";
const _coinDenomMin = "ubld";

final agoricChainInfo = ChainInfo(
    // rpc: "https://agoric-api.polkachu.com", // status check does not work, throws CORS error
    // rpc: "https://api.agoric.nodestake.top", // status check does not work
    rpc:
        "https://main.rpc.agoric.net:443", // Transaction-Creation works; Status-Check works, but throws an error after accepting a transaction
    rest: "https://main.api.agoric.net:443",
    chainId: _chainID,
    chainName: "Agoric",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "agoric"),
    bip44: BIP44(coinType: 564),
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
        coinGeckoId: "agoric",
      )
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "agoric",
        gasPriceStep: GasPriceStep(low: 0.0, average: 0.0, high: 0.0),
      )
    ],
    features: []);
