// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coingecko_swagger.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ping _$PingFromJson(Map<String, dynamic> json) => Ping(
      geckoSays: json['gecko_says'] as String?,
    );

Map<String, dynamic> _$PingToJson(Ping instance) => <String, dynamic>{
      'gecko_says': instance.geckoSays,
    };

CoinsListItem _$CoinsListItemFromJson(Map<String, dynamic> json) =>
    CoinsListItem(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      platforms: json['platforms'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CoinsListItemToJson(CoinsListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'platforms': instance.platforms,
    };

CoinFullData _$CoinFullDataFromJson(Map<String, dynamic> json) => CoinFullData(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      blockTimeInMinutes: json['block_time_in_minutes'] as int?,
      marketCapRank: json['market_cap_rank'] as int?,
      marketData: json['market_data'] == null
          ? null
          : MarketData.fromJson(json['market_data'] as Map<String, dynamic>),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinFullDataToJson(CoinFullData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'block_time_in_minutes': instance.blockTimeInMinutes,
      'market_cap_rank': instance.marketCapRank,
      'market_data': instance.marketData?.toJson(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'image': instance.image?.toJson(),
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      thumb: json['thumb'] as String?,
      small: json['small'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
    };

MarketData _$MarketDataFromJson(Map<String, dynamic> json) => MarketData(
      currentPrice: json['current_price'] as Map<String, dynamic>?,
      marketCap: json['market_cap'] as Map<String, dynamic>?,
      marketCapRank: json['market_cap_rank'] as int?,
      fullyDilutedValuation:
          json['fully_diluted_valuation'] as Map<String, dynamic>?,
      totalVolume: json['total_volume'] as Map<String, dynamic>?,
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$MarketDataToJson(MarketData instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };
