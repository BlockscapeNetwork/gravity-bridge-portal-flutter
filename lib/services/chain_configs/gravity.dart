import '../../bin/config.dart';
import '../keplr/keplr.dart';

final _rpc = Config.keplr.rpc;
final _lcd = Config.keplr.lcd;
final _chainID = Config.keplr.chainID;
final _bech32BasePrefix = Config.keplr.bech32BasePrefix;
final _coinDenomStake = Config.keplr.coinDenomStake;
final _coinDenomStakeMin = Config.keplr.coinDenomStakeMin;
final _coinDenomFee = Config.keplr.coinDenomFee;
final _coinDenomFeeMin = Config.keplr.coinDenomFeeMin;

final gravityChainInfo = ChainInfo(
    rpc: _rpc,
    rest: _lcd,
    chainId: _chainID,
    chainName: _chainID,
    stakeCurrency: Currency(
        coinDenom: _coinDenomStake,
        coinMinimalDenom: _coinDenomStakeMin,
        coinDecimals: 6,
        coinGeckoId: "graviton"),
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
          coinGeckoId: "graviton"),
      Currency(
          coinDenom: _coinDenomStake,
          coinMinimalDenom: _coinDenomStakeMin,
          coinDecimals: 6,
          coinGeckoId: "graviton"),
      Currency(
          coinDenom: "wETH",
          coinMinimalDenom: "gravity0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2",
          coinDecimals: 18,
          coinGeckoId: ""),
      Currency(
          coinDenom: "DAI",
          coinMinimalDenom: "gravity0x6B175474E89094C44Da98b954EedeAC495271d0F",
          coinDecimals: 18,
          coinGeckoId: ""),
      Currency(
          coinDenom: "USDT",
          coinMinimalDenom: "gravity0xdac17f958d2ee523a2206206994597c13d831ec7",
          coinDecimals: 6,
          coinGeckoId: ""),
      Currency(
          coinDenom: "USDC",
          coinMinimalDenom: "gravity0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48",
          coinDecimals: 6,
          coinGeckoId: "")
    ],
    feeCurrencies: [
      FeeCurrency(
        coinDecimals: 6,
        coinDenom: _coinDenomFee,
        coinMinimalDenom: _coinDenomFeeMin,
        coinGeckoId: "graviton",
        gasPriceStep: GasPriceStep(low: 0, average: 0, high: 0.035),
      )
    ],
    features: []);
