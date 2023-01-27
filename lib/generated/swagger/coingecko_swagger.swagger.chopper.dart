// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coingecko_swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CoingeckoSwagger extends CoingeckoSwagger {
  _$CoingeckoSwagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CoingeckoSwagger;

  @override
  Future<Response<Ping>> _pingGet() {
    final $url = '/ping';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Ping, Ping>($request);
  }

  @override
  Future<Response<List<CoinsListItem>>> _coinsListGet({bool? includePlatform}) {
    final $url = '/coins/list';
    final $params = <String, dynamic>{'include_platform': includePlatform};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<CoinsListItem>, CoinsListItem>($request);
  }

  @override
  Future<Response<CoinFullData>> _coinsIdGet(
      {required String? id,
      String? localization,
      bool? tickers,
      bool? marketData,
      bool? communityData,
      bool? developerData,
      bool? sparkline}) {
    final $url = '/coins/${id}';
    final $params = <String, dynamic>{
      'localization': localization,
      'tickers': tickers,
      'market_data': marketData,
      'community_data': communityData,
      'developer_data': developerData,
      'sparkline': sparkline
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<CoinFullData, CoinFullData>($request);
  }
}
