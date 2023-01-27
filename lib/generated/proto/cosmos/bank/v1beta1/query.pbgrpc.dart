///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $4;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$balance =
      $grpc.ClientMethod<$4.QueryBalanceRequest, $4.QueryBalanceResponse>(
          '/cosmos.bank.v1beta1.Query/Balance',
          ($4.QueryBalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.QueryBalanceResponse.fromBuffer(value));
  static final _$allBalances = $grpc.ClientMethod<$4.QueryAllBalancesRequest,
          $4.QueryAllBalancesResponse>(
      '/cosmos.bank.v1beta1.Query/AllBalances',
      ($4.QueryAllBalancesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.QueryAllBalancesResponse.fromBuffer(value));
  static final _$totalSupply = $grpc.ClientMethod<$4.QueryTotalSupplyRequest,
          $4.QueryTotalSupplyResponse>(
      '/cosmos.bank.v1beta1.Query/TotalSupply',
      ($4.QueryTotalSupplyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.QueryTotalSupplyResponse.fromBuffer(value));
  static final _$supplyOf =
      $grpc.ClientMethod<$4.QuerySupplyOfRequest, $4.QuerySupplyOfResponse>(
          '/cosmos.bank.v1beta1.Query/SupplyOf',
          ($4.QuerySupplyOfRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.QuerySupplyOfResponse.fromBuffer(value));
  static final _$params =
      $grpc.ClientMethod<$4.QueryParamsRequest, $4.QueryParamsResponse>(
          '/cosmos.bank.v1beta1.Query/Params',
          ($4.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.QueryParamsResponse.fromBuffer(value));
  static final _$denomMetadata = $grpc.ClientMethod<
          $4.QueryDenomMetadataRequest, $4.QueryDenomMetadataResponse>(
      '/cosmos.bank.v1beta1.Query/DenomMetadata',
      ($4.QueryDenomMetadataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.QueryDenomMetadataResponse.fromBuffer(value));
  static final _$denomsMetadata = $grpc.ClientMethod<
          $4.QueryDenomsMetadataRequest, $4.QueryDenomsMetadataResponse>(
      '/cosmos.bank.v1beta1.Query/DenomsMetadata',
      ($4.QueryDenomsMetadataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.QueryDenomsMetadataResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.QueryBalanceResponse> balance(
      $4.QueryBalanceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$balance, request, options: options);
  }

  $grpc.ResponseFuture<$4.QueryAllBalancesResponse> allBalances(
      $4.QueryAllBalancesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$allBalances, request, options: options);
  }

  $grpc.ResponseFuture<$4.QueryTotalSupplyResponse> totalSupply(
      $4.QueryTotalSupplyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$totalSupply, request, options: options);
  }

  $grpc.ResponseFuture<$4.QuerySupplyOfResponse> supplyOf(
      $4.QuerySupplyOfRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$supplyOf, request, options: options);
  }

  $grpc.ResponseFuture<$4.QueryParamsResponse> params(
      $4.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }

  $grpc.ResponseFuture<$4.QueryDenomMetadataResponse> denomMetadata(
      $4.QueryDenomMetadataRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$denomMetadata, request, options: options);
  }

  $grpc.ResponseFuture<$4.QueryDenomsMetadataResponse> denomsMetadata(
      $4.QueryDenomsMetadataRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$denomsMetadata, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos.bank.v1beta1.Query';

  QueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$4.QueryBalanceRequest, $4.QueryBalanceResponse>(
            'Balance',
            balance_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.QueryBalanceRequest.fromBuffer(value),
            ($4.QueryBalanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.QueryAllBalancesRequest,
            $4.QueryAllBalancesResponse>(
        'AllBalances',
        allBalances_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.QueryAllBalancesRequest.fromBuffer(value),
        ($4.QueryAllBalancesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.QueryTotalSupplyRequest,
            $4.QueryTotalSupplyResponse>(
        'TotalSupply',
        totalSupply_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.QueryTotalSupplyRequest.fromBuffer(value),
        ($4.QueryTotalSupplyResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.QuerySupplyOfRequest, $4.QuerySupplyOfResponse>(
            'SupplyOf',
            supplyOf_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.QuerySupplyOfRequest.fromBuffer(value),
            ($4.QuerySupplyOfResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.QueryParamsRequest, $4.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.QueryParamsRequest.fromBuffer(value),
            ($4.QueryParamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.QueryDenomMetadataRequest,
            $4.QueryDenomMetadataResponse>(
        'DenomMetadata',
        denomMetadata_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.QueryDenomMetadataRequest.fromBuffer(value),
        ($4.QueryDenomMetadataResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.QueryDenomsMetadataRequest,
            $4.QueryDenomsMetadataResponse>(
        'DenomsMetadata',
        denomsMetadata_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.QueryDenomsMetadataRequest.fromBuffer(value),
        ($4.QueryDenomsMetadataResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.QueryBalanceResponse> balance_Pre($grpc.ServiceCall call,
      $async.Future<$4.QueryBalanceRequest> request) async {
    return balance(call, await request);
  }

  $async.Future<$4.QueryAllBalancesResponse> allBalances_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.QueryAllBalancesRequest> request) async {
    return allBalances(call, await request);
  }

  $async.Future<$4.QueryTotalSupplyResponse> totalSupply_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.QueryTotalSupplyRequest> request) async {
    return totalSupply(call, await request);
  }

  $async.Future<$4.QuerySupplyOfResponse> supplyOf_Pre($grpc.ServiceCall call,
      $async.Future<$4.QuerySupplyOfRequest> request) async {
    return supplyOf(call, await request);
  }

  $async.Future<$4.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$4.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$4.QueryDenomMetadataResponse> denomMetadata_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.QueryDenomMetadataRequest> request) async {
    return denomMetadata(call, await request);
  }

  $async.Future<$4.QueryDenomsMetadataResponse> denomsMetadata_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.QueryDenomsMetadataRequest> request) async {
    return denomsMetadata(call, await request);
  }

  $async.Future<$4.QueryBalanceResponse> balance(
      $grpc.ServiceCall call, $4.QueryBalanceRequest request);
  $async.Future<$4.QueryAllBalancesResponse> allBalances(
      $grpc.ServiceCall call, $4.QueryAllBalancesRequest request);
  $async.Future<$4.QueryTotalSupplyResponse> totalSupply(
      $grpc.ServiceCall call, $4.QueryTotalSupplyRequest request);
  $async.Future<$4.QuerySupplyOfResponse> supplyOf(
      $grpc.ServiceCall call, $4.QuerySupplyOfRequest request);
  $async.Future<$4.QueryParamsResponse> params(
      $grpc.ServiceCall call, $4.QueryParamsRequest request);
  $async.Future<$4.QueryDenomMetadataResponse> denomMetadata(
      $grpc.ServiceCall call, $4.QueryDenomMetadataRequest request);
  $async.Future<$4.QueryDenomsMetadataResponse> denomsMetadata(
      $grpc.ServiceCall call, $4.QueryDenomsMetadataRequest request);
}
