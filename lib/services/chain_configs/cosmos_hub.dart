import '../keplr/keplr.dart';

const _chainID = "cosmoshub-4";
const _bech32BasePrefix = "cosmos";
const _coinDenom = "atom";
const _coinDenomMin = "uatom";

final cosmosHubChainInfo = ChainInfo(
    // all RPC-Urls in https://github.com/cosmos/chain-registry/blob/master/cosmoshub/chain.json except these listed here, do not work, i.e they throw CORS-errors already during transaction creation
    // rpc: "https://rpc-cosmoshub-ia.notional.ventures", // Transaction creation works; status check works after multiple tries (throws CORS)
    // rpc: "https://rpc.cosmoshub.strange.love", // Transaction creation works; status check works (does not throw CORS)
    rpc:
        "https://node.cosmoshub-4-1.fullnodes.location1.blockscape.network/rpc",
    rest:
        "https://node.cosmoshub-4-1.fullnodes.location1.blockscape.network/lightclient",
    chainId: _chainID,
    chainName: "Cosmos Hub",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "cosmos"),
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
          coinGeckoId: "cosmos"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "cosmos",
        gasPriceStep: GasPriceStep(low: 0.0008, average: 0.002, high: 0.0032),
      )
    ],
    features: []);
