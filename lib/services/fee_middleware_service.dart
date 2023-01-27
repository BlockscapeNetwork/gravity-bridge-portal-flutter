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

import 'dart:convert';

import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:http/http.dart' as http;

class FeeMiddlewareService {
  static Future<FeeResponse> getInstantFees(String tokenAddr) async {
    var resp = await _makeFeeRequest("/fees/instant/$tokenAddr");
    if (resp.isNotEmpty) {
      return resp[0];
    }

    throw Exception("Empty Response");
  }

  static Future<FeeResponse> getHourFee(String tokenAddr) async {
    var resp = await _makeFeeRequest("/fees/hour/$tokenAddr");
    if (resp.isNotEmpty) {
      return resp[0];
    }

    throw Exception("Empty Response");
  }

  static Future<FeeResponse> getDayFee(String tokenAddr) async {
    var resp = await _makeFeeRequest("/fees/day/$tokenAddr");
    if (resp.isNotEmpty) {
      return resp[0];
    }

    throw Exception("Empty Response");
  }

  static Future<List<FeeResponse>> getAllFees(String tokenAddr) async {
    var resp = await _makeFeeRequest("/fees/all/$tokenAddr");
    if (resp.isNotEmpty) {
      return resp;
    }

    throw Exception("Empty Response");
  }

  static Future<List<FeeResponse>> _makeFeeRequest(String path) async {
    if (Config.feeServerAddress == "MOCK") {
      return _makeFeeMockRequest(path);
    }
    var url = Uri.parse(Config.feeServerAddress + path);
    var response = await http.get(url);
    if (response.statusCode != 200) {
      var errMsg = FeeErrorMessage.fromJson(json.decode(response.body));
      throw Exception(
          "Couldn't get fees for token. Status Code: ${response.statusCode}. Message: ${errMsg.message}");
    }

    var feeResp = feeResponseFromJson(response.body);
    return feeResp;
  }

  static Future<List<FeeResponse>> _makeFeeMockRequest(String path) async {
    final tokenAddr = path.split("/")[path.split("/").length - 1];
    return [
      FeeResponse(
          gas: 50000,
          gasPrice: "14",
          tokenAddr: tokenAddr,
          tokenAmount: "0",
          tokenName: "Mocked Custom Token",
          tokenSymbol: "MOCK",
          tokenDecimals: 18),
      FeeResponse(
          gas: 200000,
          gasPrice: "14",
          tokenAddr: tokenAddr,
          tokenAmount: "0.0005",
          tokenName: "Mocked Custom Token",
          tokenSymbol: "MOCK",
          tokenDecimals: 18),
      FeeResponse(
          gas: 500000,
          gasPrice: "14",
          tokenAddr: tokenAddr,
          tokenAmount: "0.5",
          tokenName: "Mocked Custom Token",
          tokenSymbol: "MOCK",
          tokenDecimals: 18),
    ];
  }

  static Future<CoinGeckoFeesAll> getFeesFromCoinGecko(
      String coingeckoID) async {
    final ethFees = await _getTotalEthFees();
    final tokenGasPrices =
        await CoinGeckoService.getPrice(coingeckoID.toLowerCase());
    final ethPrice = tokenGasPrices.marketData!.currentPrice!["eth"] == null
        ? 0
        : tokenGasPrices.marketData!.currentPrice!["eth"]!;

    var ethFeeDay = ethFees.day.totalPriceEth;
    var ethFeeHour = ethFees.hour.totalPriceEth;
    var ethFeeInstant = ethFees.instant.totalPriceEth;

    return CoinGeckoFeesAll(
        coingeckoID,
        CoinGeckoFee(
          ethFeeDay ?? 0.0,
          ethPrice,
        ),
        CoinGeckoFee(
          ethFeeHour ?? 0.0,
          ethPrice,
        ),
        CoinGeckoFee(
          ethFeeInstant ?? 0.0,
          ethPrice,
        ));
  }

  static Future<EthFeeResponse> _getTotalEthFees() async {
    var url = Uri.parse(Config.feeServerAddress + "/eth-fees/all");
    var response = await http.get(url);
    if (response.statusCode != 200) {
      var errMsg = FeeErrorMessage.fromJson(json.decode(response.body));
      throw Exception(
          "Couldn't get fees for token. Status Code: ${response.statusCode}. Message: ${errMsg.message}");
    }

    var ethFeeResp = ethFeeResponseFromJson(response.body);
    return ethFeeResp;
  }

  // ping price server every 10 seconds
  // we will use this data to show network activity
  static Stream<bool> pingPriceServer() async* {
    yield* Stream.periodic(const Duration(milliseconds: 10000), (_) {})
        .asyncMap((_) async {
      if (Config.feeServerAddress == "MOCK") {
        return true;
      }
      var url = Uri.parse(Config.feeServerAddress + "/eth-fees/all");
      var response = await http.get(url);
      if (response.statusCode != 200) {
        return false;
      }
      return true;
    });
  }
}

class CoinGeckoFeesAll {
  String coingeckoID;
  CoinGeckoFee day;
  CoinGeckoFee hour;
  CoinGeckoFee instant;

  CoinGeckoFeesAll(this.coingeckoID, this.day, this.hour, this.instant);

  @override
  String toString() {
    return "(coingeckoID: '$coingeckoID', day: '${day.toString()}', hour: '${hour.toString()}', instant: '${instant.toString()}'";
  }
}

class CoinGeckoFee {
  double ethereumFee;
  double tokenEthPrice;
  late double tokenFee;

  CoinGeckoFee(this.ethereumFee, this.tokenEthPrice) {
    tokenFee = ethereumFee / tokenEthPrice;
  }

  @override
  String toString() {
    return "(ethereumFee: '$ethereumFee', tokenEthPrice: '$tokenEthPrice', tokenFee: '$tokenFee'";
  }
}

class FeeErrorMessage {
  String? message;

  FeeErrorMessage({this.message});

  FeeErrorMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}

List<FeeResponse> feeResponseFromJson(String str) => List<FeeResponse>.from(
    json.decode(str).map((x) => FeeResponse.fromJson(x)));

String feeResponseToJson(List<FeeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeeResponse {
  int? gas;
  String? gasPrice;
  String? tokenAddr;
  String? tokenAmount;
  String? tokenName;
  String? tokenSymbol;
  int? tokenDecimals;

  FeeResponse(
      {this.gas,
      this.gasPrice,
      this.tokenAddr,
      this.tokenAmount,
      this.tokenName,
      this.tokenSymbol,
      this.tokenDecimals});

  FeeResponse.fromJson(Map<String, dynamic> json) {
    gas = json['gas'];
    gasPrice = json['gasPrice'];
    tokenAddr = json['tokenAddr'];
    tokenAmount = json['tokenAmount'];
    tokenName = json['tokenName'];
    tokenSymbol = json['tokenSymbol'];
    tokenDecimals = json['tokenDecimals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gas'] = gas;
    data['gasPrice'] = gasPrice;
    data['tokenAddr'] = tokenAddr;
    data['tokenAmount'] = tokenAmount;
    data['tokenName'] = tokenName;
    data['tokenSymbol'] = tokenSymbol;
    data['tokenDecimals'] = tokenDecimals;
    return data;
  }
}

EthFeeResponse ethFeeResponseFromJson(String str) =>
    EthFeeResponse.fromJson(json.decode(str));

String ethFeeResponseToJson(EthFeeResponse data) => json.encode(data.toJson());

class EthFeeResponse {
  EthFee day;
  EthFee hour;
  EthFee instant;

  EthFeeResponse({
    required this.day,
    required this.hour,
    required this.instant,
  });

  factory EthFeeResponse.fromJson(Map<String, dynamic> json) => EthFeeResponse(
        day: EthFee.fromJson(json["day"]),
        hour: EthFee.fromJson(json["hour"]),
        instant: EthFee.fromJson(json["instant"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day.toJson(),
        "hour": hour.toJson(),
        "instant": instant.toJson(),
      };
}

class EthFee {
  int? gas;
  String? gasPrice;
  double? totalPriceEth;

  EthFee({
    this.gas,
    this.gasPrice,
    this.totalPriceEth,
  });

  factory EthFee.fromJson(Map<String, dynamic> json) => EthFee(
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        totalPriceEth: json["totalPriceEth"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "gas": gas,
        "gasPrice": gasPrice,
        "totalPriceEth": totalPriceEth,
      };
}
