import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

const _rpc = "https://node.regen-1.fullnodes.location3.blockscape.network/rpc";
const _lcd =
    "https://node.regen-1.fullnodes.location3.blockscape.network/lightclient";
const _chainID = "regen-1";
const _bech32BasePrefix = "regen";
const _coinDenomStake = "regen";
const _coinDenomStakeMin = "uregen";
const _coinDenomFee = "regen";
const _coinDenomFeeMin = "uregen";

final regenChainInfo = ChainInfo(
    rpc: _rpc,
    rest: _lcd,
    chainId: _chainID,
    chainName: "Regen",
    stakeCurrency: Currency(
        coinDenom: _coinDenomStake,
        coinMinimalDenom: _coinDenomStakeMin,
        coinDecimals: 6,
        coinGeckoId: "regen"),
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
          coinDenom: _coinDenomFee,
          coinMinimalDenom: _coinDenomFeeMin,
          coinDecimals: 6,
          coinGeckoId: "regen"),
      Currency(
          coinDenom: _coinDenomStake,
          coinMinimalDenom: _coinDenomStakeMin,
          coinDecimals: 6,
          coinGeckoId: "regen"),
    ],
    feeCurrencies: [
      FeeCurrency(
          coinDecimals: 6,
          coinDenom: _coinDenomFee,
          coinMinimalDenom: _coinDenomFeeMin,
          gasPriceStep: GasPriceStep(low: 0.025, average: 0.030, high: 0.04),
          coinGeckoId: "regen")
    ],
    features: []);
