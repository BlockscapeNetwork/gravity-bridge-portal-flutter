import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _chainID = "crescent-1";
const _bech32BasePrefix = "cre";
const _coinDenom = "cre";
const _coinDenomMin = "ucre";

final crescentChainInfo = ChainInfo(
    rpc: "https://mainnet.crescent.network:26657",
    rest: "https://mainnet.crescent.network:1317",
    chainId: _chainID,
    chainName: "Crescent",
    stakeCurrency: Currency(
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinDecimals: 6,
        coinGeckoId: "crescent-network"),
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
          coinGeckoId: "crescent-network"),
      Currency(
          coinDenom: "bcre",
          coinMinimalDenom: "ubcre",
          coinDecimals: 6,
          coinGeckoId: "liquid-staking-crescent"),
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenom,
        coinMinimalDenom: _coinDenomMin,
        coinGeckoId: "crescent-network",
        gasPriceStep: GasPriceStep(low: 0.0, average: 0.002, high: 0.0024),
      )
    ],
    features: []);
