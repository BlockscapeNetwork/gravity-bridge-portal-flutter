import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;

part 'coingecko_swagger.swagger.chopper.dart';
part 'coingecko_swagger.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class CoingeckoSwagger extends ChopperService {
  static CoingeckoSwagger create({ChopperClient? client, String? baseUrl}) {
    if (client != null) {
      return _$CoingeckoSwagger(client);
    }

    final newClient = ChopperClient(
        services: [_$CoingeckoSwagger()],
        converter: $JsonSerializableConverter(),
        baseUrl: baseUrl ?? 'http://api.coingecko.com/api/v3');
    return _$CoingeckoSwagger(newClient);
  }

  ///Check API server status
  Future<chopper.Response<Ping>> pingGet() {
    generatedMapping.putIfAbsent(Ping, () => Ping.fromJsonFactory);

    return _pingGet();
  }

  ///Check API server status
  @Get(path: '/ping')
  Future<chopper.Response<Ping>> _pingGet();

  ///List all supported coins id, name and symbol (no pagination required)
  ///@param include_platform flag to include platform contract addresses (eg. 0x.... for Ethereum based tokens).   valid values: true, false
  Future<chopper.Response<List<CoinsListItem>>> coinsListGet(
      {bool? includePlatform}) {
    generatedMapping.putIfAbsent(
        CoinsListItem, () => CoinsListItem.fromJsonFactory);

    return _coinsListGet(includePlatform: includePlatform);
  }

  ///List all supported coins id, name and symbol (no pagination required)
  ///@param include_platform flag to include platform contract addresses (eg. 0x.... for Ethereum based tokens).   valid values: true, false
  @Get(path: '/coins/list')
  Future<chopper.Response<List<CoinsListItem>>> _coinsListGet(
      {@Query('include_platform') bool? includePlatform});

  ///Get current data (name, price, market, ... including exchange tickers) for a coin
  ///@param id pass the coin id (can be obtained from /coins) eg. bitcoin
  ///@param localization Include all localized languages in response (true/false) <b>[default: true]</b>
  ///@param tickers Include tickers data (true/false) <b>[default: true]</b>
  ///@param market_data Include market_data (true/false) <b>[default: true]</b>
  ///@param community_data Include community_data data (true/false) <b>[default: true]</b>
  ///@param developer_data Include developer_data data (true/false) <b>[default: true]</b>
  ///@param sparkline Include sparkline 7 days data (eg. true, false) <b>[default: false]</b>
  Future<chopper.Response<CoinFullData>> coinsIdGet(
      {required String? id,
      String? localization,
      bool? tickers,
      bool? marketData,
      bool? communityData,
      bool? developerData,
      bool? sparkline}) {
    generatedMapping.putIfAbsent(
        CoinFullData, () => CoinFullData.fromJsonFactory);

    return _coinsIdGet(
        id: id,
        localization: localization,
        tickers: tickers,
        marketData: marketData,
        communityData: communityData,
        developerData: developerData,
        sparkline: sparkline);
  }

  ///Get current data (name, price, market, ... including exchange tickers) for a coin
  ///@param id pass the coin id (can be obtained from /coins) eg. bitcoin
  ///@param localization Include all localized languages in response (true/false) <b>[default: true]</b>
  ///@param tickers Include tickers data (true/false) <b>[default: true]</b>
  ///@param market_data Include market_data (true/false) <b>[default: true]</b>
  ///@param community_data Include community_data data (true/false) <b>[default: true]</b>
  ///@param developer_data Include developer_data data (true/false) <b>[default: true]</b>
  ///@param sparkline Include sparkline 7 days data (eg. true, false) <b>[default: false]</b>
  @Get(path: '/coins/{id}')
  Future<chopper.Response<CoinFullData>> _coinsIdGet(
      {@Path('id') required String? id,
      @Query('localization') String? localization,
      @Query('tickers') bool? tickers,
      @Query('market_data') bool? marketData,
      @Query('community_data') bool? communityData,
      @Query('developer_data') bool? developerData,
      @Query('sparkline') bool? sparkline});
}

@JsonSerializable(explicitToJson: true)
class Ping {
  Ping({
    this.geckoSays,
  });

  factory Ping.fromJson(Map<String, dynamic> json) => _$PingFromJson(json);

  @JsonKey(name: 'gecko_says')
  final String? geckoSays;
  static const fromJsonFactory = _$PingFromJson;
  static const toJsonFactory = _$PingToJson;
  Map<String, dynamic> toJson() => _$PingToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Ping &&
            (identical(other.geckoSays, geckoSays) ||
                const DeepCollectionEquality()
                    .equals(other.geckoSays, geckoSays)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(geckoSays) ^ runtimeType.hashCode;
}

extension $PingExtension on Ping {
  Ping copyWith({String? geckoSays}) {
    return Ping(geckoSays: geckoSays ?? this.geckoSays);
  }
}

@JsonSerializable(explicitToJson: true)
class CoinsListItem {
  CoinsListItem({
    this.id,
    this.symbol,
    this.name,
    this.platforms,
  });

  factory CoinsListItem.fromJson(Map<String, dynamic> json) =>
      _$CoinsListItemFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'symbol')
  final String? symbol;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'platforms')
  final Map<String, dynamic>? platforms;
  static const fromJsonFactory = _$CoinsListItemFromJson;
  static const toJsonFactory = _$CoinsListItemToJson;
  Map<String, dynamic> toJson() => _$CoinsListItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CoinsListItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.platforms, platforms) ||
                const DeepCollectionEquality()
                    .equals(other.platforms, platforms)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(platforms) ^
      runtimeType.hashCode;
}

extension $CoinsListItemExtension on CoinsListItem {
  CoinsListItem copyWith(
      {String? id,
      String? symbol,
      String? name,
      Map<String, dynamic>? platforms}) {
    return CoinsListItem(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        platforms: platforms ?? this.platforms);
  }
}

@JsonSerializable(explicitToJson: true)
class CoinFullData {
  CoinFullData({
    this.id,
    this.symbol,
    this.name,
    this.blockTimeInMinutes,
    this.marketCapRank,
    this.marketData,
    this.lastUpdated,
    this.image,
  });

  factory CoinFullData.fromJson(Map<String, dynamic> json) =>
      _$CoinFullDataFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'symbol')
  final String? symbol;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'block_time_in_minutes')
  final int? blockTimeInMinutes;
  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;
  @JsonKey(name: 'market_data')
  final MarketData? marketData;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  @JsonKey(name: 'image')
  final Image? image;
  static const fromJsonFactory = _$CoinFullDataFromJson;
  static const toJsonFactory = _$CoinFullDataToJson;
  Map<String, dynamic> toJson() => _$CoinFullDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CoinFullData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.blockTimeInMinutes, blockTimeInMinutes) ||
                const DeepCollectionEquality()
                    .equals(other.blockTimeInMinutes, blockTimeInMinutes)) &&
            (identical(other.marketCapRank, marketCapRank) ||
                const DeepCollectionEquality()
                    .equals(other.marketCapRank, marketCapRank)) &&
            (identical(other.marketData, marketData) ||
                const DeepCollectionEquality()
                    .equals(other.marketData, marketData)) &&
            (identical(other.lastUpdated, lastUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdated, lastUpdated)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(blockTimeInMinutes) ^
      const DeepCollectionEquality().hash(marketCapRank) ^
      const DeepCollectionEquality().hash(marketData) ^
      const DeepCollectionEquality().hash(lastUpdated) ^
      const DeepCollectionEquality().hash(image) ^
      runtimeType.hashCode;
}

extension $CoinFullDataExtension on CoinFullData {
  CoinFullData copyWith(
      {String? id,
      String? symbol,
      String? name,
      int? blockTimeInMinutes,
      int? marketCapRank,
      MarketData? marketData,
      DateTime? lastUpdated,
      Image? image}) {
    return CoinFullData(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        blockTimeInMinutes: blockTimeInMinutes ?? this.blockTimeInMinutes,
        marketCapRank: marketCapRank ?? this.marketCapRank,
        marketData: marketData ?? this.marketData,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        image: image ?? this.image);
  }
}

@JsonSerializable(explicitToJson: true)
class Image {
  Image({
    this.thumb,
    this.small,
    this.large,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @JsonKey(name: 'thumb')
  final String? thumb;
  @JsonKey(name: 'small')
  final String? small;
  @JsonKey(name: 'large')
  final String? large;
  static const fromJsonFactory = _$ImageFromJson;
  static const toJsonFactory = _$ImageToJson;
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Image &&
            (identical(other.thumb, thumb) ||
                const DeepCollectionEquality().equals(other.thumb, thumb)) &&
            (identical(other.small, small) ||
                const DeepCollectionEquality().equals(other.small, small)) &&
            (identical(other.large, large) ||
                const DeepCollectionEquality().equals(other.large, large)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(thumb) ^
      const DeepCollectionEquality().hash(small) ^
      const DeepCollectionEquality().hash(large) ^
      runtimeType.hashCode;
}

extension $ImageExtension on Image {
  Image copyWith({String? thumb, String? small, String? large}) {
    return Image(
        thumb: thumb ?? this.thumb,
        small: small ?? this.small,
        large: large ?? this.large);
  }
}

@JsonSerializable(explicitToJson: true)
class MarketData {
  MarketData({
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.lastUpdated,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  @JsonKey(name: 'current_price')
  final Map<String, dynamic>? currentPrice;
  @JsonKey(name: 'market_cap')
  final Map<String, dynamic>? marketCap;
  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;
  @JsonKey(name: 'fully_diluted_valuation')
  final Map<String, dynamic>? fullyDilutedValuation;
  @JsonKey(name: 'total_volume')
  final Map<String, dynamic>? totalVolume;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  static const fromJsonFactory = _$MarketDataFromJson;
  static const toJsonFactory = _$MarketDataToJson;
  Map<String, dynamic> toJson() => _$MarketDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MarketData &&
            (identical(other.currentPrice, currentPrice) ||
                const DeepCollectionEquality()
                    .equals(other.currentPrice, currentPrice)) &&
            (identical(other.marketCap, marketCap) ||
                const DeepCollectionEquality()
                    .equals(other.marketCap, marketCap)) &&
            (identical(other.marketCapRank, marketCapRank) ||
                const DeepCollectionEquality()
                    .equals(other.marketCapRank, marketCapRank)) &&
            (identical(other.fullyDilutedValuation, fullyDilutedValuation) ||
                const DeepCollectionEquality().equals(
                    other.fullyDilutedValuation, fullyDilutedValuation)) &&
            (identical(other.totalVolume, totalVolume) ||
                const DeepCollectionEquality()
                    .equals(other.totalVolume, totalVolume)) &&
            (identical(other.lastUpdated, lastUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdated, lastUpdated)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(currentPrice) ^
      const DeepCollectionEquality().hash(marketCap) ^
      const DeepCollectionEquality().hash(marketCapRank) ^
      const DeepCollectionEquality().hash(fullyDilutedValuation) ^
      const DeepCollectionEquality().hash(totalVolume) ^
      const DeepCollectionEquality().hash(lastUpdated) ^
      runtimeType.hashCode;
}

extension $MarketDataExtension on MarketData {
  MarketData copyWith(
      {Map<String, dynamic>? currentPrice,
      Map<String, dynamic>? marketCap,
      int? marketCapRank,
      Map<String, dynamic>? fullyDilutedValuation,
      Map<String, dynamic>? totalVolume,
      DateTime? lastUpdated}) {
    return MarketData(
        currentPrice: currentPrice ?? this.currentPrice,
        marketCap: marketCap ?? this.marketCap,
        marketCapRank: marketCapRank ?? this.marketCapRank,
        fullyDilutedValuation:
            fullyDilutedValuation ?? this.fullyDilutedValuation,
        totalVolume: totalVolume ?? this.totalVolume,
        lastUpdated: lastUpdated ?? this.lastUpdated);
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
