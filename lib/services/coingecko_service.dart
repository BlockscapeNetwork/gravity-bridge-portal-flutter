// /*
//     Gravity Bridge is a UI for interacting with the gravity chain.
//     Copyright (C) 2023  blockscape Finance AG, Switzerland
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
// */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gravity_bridge_flutter/generated/swagger/coingecko_swagger.swagger.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/enums/money.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/services/price_cache_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bin/config.dart';
import '../constants.dart';
import '../utils.dart';

class CoinGeckoService {
  /// ERC20 coins(tokens) populated by 1) data from the Uniswap-Exchange list (a list of 4800 of the most exchanged tokens) 2) and from custom tokens (added by the user) not in Uniswap (practically rare)
  static Coinlist? _erc20CoinList;

  static bool isInit = false;

  static Future<void> init() async {
    _erc20CoinList = await _getUniswapTokens();
    if (_erc20CoinList == null) {
      throw Exception(
          "Couldn't download Uniswap tokens from coingecko OR find them on disk");
    }

    // get customTokens contract addresses in the localstorage via shared preferences
    final List<String> tempStoredCustomTokens =
        await loadFromPrefs("customTokens");

    // if stored custom tokens exist,
    // then create tokens and add uniswapCoinList
    // when app initializes
    if (tempStoredCustomTokens.isNotEmpty) {
      for (var i = 0; i < tempStoredCustomTokens.length; ++i) {
        var tokenAddress = tempStoredCustomTokens[i];

        // set temp token decimal to check if it returns null
        // we check decimals instead of name, because Erc20 and Erc721 contracts can have names
        // but Erc721 tokens (NFT's) can't have decimals
        var tempTokenDecimal =
            await MetamaskService.erc20GetDecimalsWithoutWalletConnect(
                tokenAddress);
        if (tempTokenDecimal != null) {
          Token token = Token(
            address: tokenAddress,
            name: await MetamaskService.erc20GetNameWithoutWalletConnect(
                tokenAddress),
            symbol: await MetamaskService.erc20GetSymbolWithoutWalletConnect(
                tokenAddress),
            logoUri: "https://cdn.worldvectorlogo.com/logos/ethereum-1.svg",
            chainId: 1, // default - ethereum chainId
            decimals:
                (await MetamaskService.erc20GetDecimalsWithoutWalletConnect(
                        tokenAddress))!
                    .toInt(),
          );
          _erc20CoinList!.tokens!.add(token);
        }
      }
    }

    isInit = true;
  }

  /// Load uniswap tokens from disk OR download them from Coingecko
  static Future<Coinlist?> _getUniswapTokens() async {
    const String logPrefix = "getUniswapTokens";
    String? uniswapTokensJson;

    final DateTime? uniswapTokensWriteTimestamp =
        await StorageService.instance.getUniswapTokensWriteTimestamp();
    if (uniswapTokensWriteTimestamp == null ||
        (DateTime.now()
                .toUtc()
                .difference(uniswapTokensWriteTimestamp)
                .inMinutes >
            (24 * 60))) {
      try {
        dlog("Uniswap tokens not found on disk or older than 24h", logPrefix);
        final response = await http
            .get(Uri.parse('https://tokens.coingecko.com/uniswap/all.json'));
        if (response.statusCode == 200) {
          dlog("Uniswap tokens downloaded from Coingecko", logPrefix);
          uniswapTokensJson = response.body;
          StorageService.instance.setUniswapTokenList(uniswapTokensJson);
        }
      } catch (e) {
        dlogError(
          message: "ERROR while downloading Uniswap tokens",
          error: e,
          prefix: logPrefix,
        );
      }
    } else {
      dlog("Uniswap tokens read from disk", logPrefix);
    }
    uniswapTokensJson ??= await StorageService.instance.getUniswapTokens();

    if (uniswapTokensJson != null) {
      return coinlistFromMap(uniswapTokensJson);
    } else {
      return null;
    }
  }

  // will search for contract addresses, denoms and token names and will return matching tokens
  static Set<TokenInfo> searchToken(String name) {
    Set<TokenInfo> results = {};

    if (_erc20CoinList == null || _erc20CoinList!.tokens == null) {
      debugPrint("Coinlist wasn't fetched before trying to search");
      return results;
    }

    // if name starts with '0x' we will only check addresses otherwise we will only check names and denoms
    if (name.startsWith("0x")) {
      final address = name.toLowerCase();
      for (final token in _erc20CoinList!.tokens!) {
        if (token.name != null &&
            token.symbol != null &&
            token.address != null &&
            token.address!.startsWith(address)) {
          results.add(TokenInfo(
            symbol: token.symbol!,
            name: token.name!,
            address: token.address!,
            walletType: WalletType.metamask,
            iconUrl: token.logoUri!,
            decimals: token.decimals!,
          ));
        }
      }
    } else {
      final upperName = name.toUpperCase();
      for (final token in _erc20CoinList!.tokens!) {
        if (!(token.address != null &&
            token.symbol != null &&
            token.name != null)) {
          break;
        }
        if (token.symbol!.toUpperCase().contains(upperName) ||
            token.name!.toUpperCase().contains(upperName)) {
          if (token.logoUri != null) {
            results.add(
              TokenInfo(
                symbol: token.symbol!,
                name: token.name!,
                address: token.address!,
                walletType: WalletType.metamask,
                iconUrl: token.logoUri!,
                decimals: token.decimals!,
              ),
            );
          } else {
            results.add(
              TokenInfo(
                symbol: token.symbol!,
                name: token.name!,
                address: token.address!,
                walletType: WalletType.metamask,
                decimals: token.decimals!,
              ),
            );
          }
        }
      }
    }

    return results;
  }

  static bool _tokenExistsInUniswapCoinList(String tokenAddress) {
    bool tokenFound = false;
    for (var i = 0; i < _erc20CoinList!.tokens!.length; i++) {
      if (_erc20CoinList!.tokens![i].address == tokenAddress) {
        tokenFound = true;
      }
    }
    return tokenFound;
  }

  static Set<TokenInfo> getDefaultTokens() {
    Set<TokenInfo> results = {};

    if (_erc20CoinList == null || _erc20CoinList!.tokens == null) {
      debugPrint("Coinlist wasn't fetched before trying to find defaults");
      return results;
    }

    final defaultAddresses = {
      "0x6b175474e89094c44da98b954eedeac495271d0f", // DAI
      "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48", // USDC
      //  "0x2260fac5e5542a773aa44fbcfedf7c193bc2c599", // WBTC
      "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2", // WETH
      "0xdac17f958d2ee523a2206206994597c13d831ec7" // USDT
    };

    for (final token in _erc20CoinList!.tokens!) {
      if (token.address != null && defaultAddresses.contains(token.address)) {
        if (token.address != null &&
            token.symbol != null &&
            token.name != null) {
          results.add(
            TokenInfo(
              symbol: token.symbol!,
              name: token.name!,
              address: token.address!,
              walletType: WalletType.metamask,
              iconUrl: token.logoUri!,
            ),
          );
        }
      }
    }
    return results;
  }

  /// Helper method, which based on the parameters calls [_requestUsDollarPriceForId] or [_requestUsDollarPriceForErc20Token].
  static Future<double?> requestUsDollarPriceForToken({
    required final String tokenName,
    required final String tokenSymbol,
    required final bool tryFromCache,
  }) async {
    const logPrefix = "requestUsDollarPriceForToken";

    final PriceCache? cachedPrice = PriceCacheService.instance.getPriceCache(
        tokenName: tokenName, tokenSymbol: tokenSymbol, money: Money.usDollar);
    if (tryFromCache &&
        cachedPrice != null &&
        (DateTime.now().toUtc().millisecondsSinceEpoch -
                cachedPrice.timeStampUtc <=
            Constants.maxPriceCacheStaleness.inMilliseconds)) {
      dlog("$tokenName - Fresh Cache Hit: ${cachedPrice.price}", logPrefix);
      return cachedPrice.price;
    } else {
      double? dollarPrice;
      final String? coinGeckoId = Config.keplr.currencyRegistry.getCoinGeckoId(
        tokenName: tokenName,
        tokenSymbol: tokenSymbol,
      );
      if (coinGeckoId != null) {
        dollarPrice = await CoinGeckoService._requestUsDollarPriceForId(
            coinGeckoId: coinGeckoId);
      } else {
        final String? erc20Address =
            getErc20AddressBy(name: tokenName, symbol: tokenSymbol);
        if (erc20Address != null) {
          dollarPrice =
              await CoinGeckoService._requestUsDollarPriceForErc20Token(
            erc20Address: erc20Address,
          );
        }
      }
      if (dollarPrice != null) {
        PriceCacheService.instance.setPrice(
            tokenName: tokenName,
            tokenSymbol: tokenSymbol,
            money: Money.usDollar,
            price: dollarPrice);
      }
      dlog("Name: $tokenName, Symbol: $tokenSymbol: $dollarPrice\$", logPrefix);
      return dollarPrice;
    }
  }

  /// Query the Coingecko-API for the US-dollar exchange rate for the Token with [coinGeckoId].
  static Future<double?> _requestUsDollarPriceForId({
    required final String coinGeckoId,
  }) async {
    const _logPrefix = "requestUsDollarPriceForId";
    try {
      final data = await CoinGeckoService.getPrice(coinGeckoId);
      final currentPrice = data.marketData?.currentPrice;
      final double? dollarValue = currentPrice?[Money.usDollar.coingeckoDenom];
      dlog("Dollar-Price for Coingecko-Id $coinGeckoId: $dollarValue",
          _logPrefix);
      return dollarValue;
    } catch (e) {
      rlog("Caught Error: $e", _logPrefix);
      return null;
    }
  }

  static Future<CoinFullData> getPrice(String coingeckoID) async {
    // https://api.coingecko.com/api/v3/coins/stargaze?localization=false&tickers=false&community_data=false&developer_data=false

    final cgClient =
        CoingeckoSwagger.create(baseUrl: "https://api.coingecko.com/api/v3");
    final resp = await cgClient.coinsIdGet(
        id: coingeckoID,
        communityData: false,
        developerData: false,
        sparkline: false,
        tickers: false,
        localization: "false");
    if (resp.isSuccessful) {
      return resp.body!;
    } else {
      throw (resp.error ?? resp.body ?? "${resp.statusCode}");
    }
  }

  /// Query the Coingecko-API for the US-dollar exchange rate for an ERC20-Token (Ethereum-based).
  static Future<double?> _requestUsDollarPriceForErc20Token({
    required final String erc20Address,
  }) async {
    const _logPrefix = "requestUsDollarPriceForErc20Token";
    if (erc20Address.isEmpty) {
      throw ArgumentError.value(
          erc20Address, "contractAddress", "must not be empty");
    }

    final String url =
        "https://api.coingecko.com/api/v3/simple/token_price/ethereum?contract_addresses=$erc20Address&vs_currencies=${Money.usDollar.coingeckoDenom}";
    final parsedUrl = Uri.parse(url);
    try {
      final res = await http.get(parsedUrl);
      if (res.statusCode == 200) {
        final resBody = jsonDecode(res.body) as Map<String, dynamic>;
        final double? dollarValue = (resBody.values.first
            as Map<String, dynamic>)[Money.usDollar.coingeckoDenom];
        return dollarValue;
      } else {
        dlog("Status ${res.statusCode}, Response $res", _logPrefix);
        return null;
      }
    } catch (e) {
      rlog("Caught Error: $e", _logPrefix);
      return null;
    }
  }

  static bool isUniswapToken(final String tokenAddress) {
    return _erc20CoinList?.tokens
            ?.any((token) => token.address == tokenAddress) ??
        false;
  }

  static String? getErc20AddressBy({
    required final String name,
    required final String symbol,
  }) {
    try {
      return _erc20CoinList?.tokens
          ?.firstWhere((token) =>
              token.name?.toLowerCase() == name.toLowerCase() &&
              token.symbol?.toLowerCase() == symbol.toLowerCase())
          .address;
    } on StateError catch (_) {
      return null;
    }
  }

  // check token addresses if it has an Erc20 token
  // if so, check if it is already in uniswap erc20 tokens list
  // if not in the uniswap tokens list, then we define that token as a custom token
  // save custom erc20 tokens to local storage
  static void saveCustomErc20Tokens(String tokenAddress) async {
    if (tokenAddress.startsWith("0x")) {
      List<String> storedCustomTokens;
      // get customTokens contract addresses in the localstorage via shared preferences
      final List<String> customAddedErc20TokensAddresses =
          await loadFromPrefs("customTokens");

      // if stored custom tokens exist, then fetch it
      if (customAddedErc20TokensAddresses.isNotEmpty) {
        storedCustomTokens = customAddedErc20TokensAddresses;
      } else {
        storedCustomTokens = [];
      }

      if (_tokenExistsInUniswapCoinList(tokenAddress) == false &&
          storedCustomTokens.contains(tokenAddress) == false) {
        storedCustomTokens.add(tokenAddress);
        saveToPrefs("customTokens", storedCustomTokens);
      }
    }
  }

  Future<Token> getTokenFromTokenContractAddress(String contractAddress) async {
    if (isInit == false) {
      await init();
    }
    final List<Token> allTokensList = _erc20CoinList!.tokens!;

    Token token = Token(
      chainId: 0,
      address: "",
      name: "",
      symbol: "",
      decimals: 0,
      logoUri: "",
    );
    if (contractAddress.isNotEmpty) {
      try {
        token = allTokensList.firstWhere((element) =>
            element.address!.toLowerCase() == contractAddress.toLowerCase());
      } on StateError catch (_) {
        if (MetamaskService.isMetamaskInstalled() == true) {
          final int? decimals =
              (await MetamaskService.erc20GetDecimalsWithoutWalletConnect(
                  contractAddress)) as int?;
          if (decimals != null) token.decimals = decimals;
          final String? symbol =
              await MetamaskService.erc20GetSymbolWithoutWalletConnect(
                  contractAddress);
          if (symbol != null) token.symbol = symbol;
          final String? name =
              await MetamaskService.erc20GetNameWithoutWalletConnect(
                  contractAddress);
          if (name != null) token.name = name;
        }
      }
    }
    return token;
  }
}

// To parse this JSON data, do
//
//     final coinlist = coinlistFromMap(jsonString);

Coinlist coinlistFromMap(String str) => Coinlist.fromMap(json.decode(str));

String coinlistToMap(Coinlist data) => json.encode(data.toMap());

class Coinlist {
  Coinlist({
    this.name,
    this.logoUri,
    this.keywords,
    this.timestamp,
    this.tokens,
    this.version,
  });

  String? name;
  String? logoUri;
  List<String>? keywords;
  DateTime? timestamp;
  List<Token>? tokens;
  Version? version;

  factory Coinlist.fromMap(Map<String, dynamic> json) => Coinlist(
        name: json["name"],
        logoUri: json["logoURI"],
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        tokens: json["tokens"] == null
            ? null
            : List<Token>.from(json["tokens"].map((x) => Token.fromMap(x))),
        version:
            json["version"] == null ? null : Version.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "logoURI": logoUri,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords!.map((x) => x)),
        "timestamp": timestamp == null ? null : timestamp!.toIso8601String(),
        "tokens": tokens == null
            ? null
            : List<dynamic>.from(tokens!.map((x) => x.toMap())),
        "version": version == null ? null : version!.toMap(),
      };
}

class Token {
  Token({
    this.chainId,
    this.address,
    this.name,
    this.symbol,
    this.decimals,
    this.logoUri,
  });

  int? chainId;
  String? address;
  String? name;
  String? symbol;
  int? decimals;
  String? logoUri;

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        chainId: json["chainId"],
        address: json["address"],
        name: json["name"],
        symbol: json["symbol"],
        decimals: json["decimals"],
        logoUri: json["logoURI"],
      );

  Map<String, dynamic> toMap() => {
        "chainId": chainId,
        "address": address,
        "name": name,
        "symbol": symbol,
        "decimals": decimals,
        "logoURI": logoUri,
      };
}

class Version {
  Version({
    this.major,
    this.minor,
    this.patch,
  });

  int? major;
  int? minor;
  int? patch;

  factory Version.fromMap(Map<String, dynamic> json) => Version(
        major: json["major"],
        minor: json["minor"],
        patch: json["patch"],
      );

  Map<String, dynamic> toMap() => {
        "major": major,
        "minor": minor,
        "patch": patch,
      };
}
