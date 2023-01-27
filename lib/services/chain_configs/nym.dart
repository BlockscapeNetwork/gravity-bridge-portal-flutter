import '../keplr/keplr.dart';

// data from https://blog.nymtech.net/transfering-nym-erc20-to-nym-cosmos-for-bonding-or-delegating-in-nym-mainnet-introducing-gravity-821e417cb0ab

/*
  await window.keplr.experimentalSuggestChain({
    chainId: "nyx",
    chainName: "Nyx Mainnet",
    rpc: "https://rpc.nyx.nodes.guru",
    rest: "https://api.nyx.nodes.guru",
    bip44: {
        coinType: 118,
    },
    bech32Config: {
        bech32PrefixAccAddr: "n",
        bech32PrefixAccPub: "n" + "pub",
        bech32PrefixValAddr: "n" + "valoper",
        bech32PrefixValPub: "n" + "valoperpub",
        bech32PrefixConsAddr: "n" + "valcons",
        bech32PrefixConsPub: "n" + "valconspub",
    },
    currencies: [ 
        { 
            coinDenom: "nym", 
            coinMinimalDenom: "unym", 
            coinDecimals: 6, 
            coinGeckoId: "nym", 
        },
    ],
    feeCurrencies: [
        {
            coinDenom: "nym",
            coinMinimalDenom: "unym",
            coinDecimals: 6,
            coinGeckoId: "nym",
        },
    ],
    //in the future this will be updated accordingly
    //once staking is available
    //in the interim pass in the nym values as placeholders
    //do not attempt to stake, as we cant validate it will be successful
    stakeCurrency: {
        coinDenom: "nym",
        coinMinimalDenom: "unym",
        coinDecimals: 6,
        coinGeckoId: "nym",
    },
    coinType: 118,
    gasPriceStep: {
        low: 0.01,
        average: 0.025,
        high: 0.03,
    },
    features: [ 
        "cosmwasm", "ibc-transfer", "ibc-go", "wasmd_0.24+"
    ],
});

*/

const _chainID = "nyx";
const _bech32BasePrefix = "n";
const _coinDenom = "nym";
const _coinDenomMin = "unym";

final nyxChainInfo = ChainInfo(
    rpc: "https://rpc.nyx.nodes.guru",
    rest: "https://api.nyx.nodes.guru",
    chainId: _chainID,
    chainName: "Nyx Mainnet",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "nym"),
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
          coinGeckoId: "nym"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 6,
          coinDenom: _coinDenom,
          coinMinimalDenom: _coinDenomMin,
          gasPriceStep: GasPriceStep(low: 0.01, average: 0.025, high: 0.03),
          coinGeckoId: "nym")
    ],
    features: []);
