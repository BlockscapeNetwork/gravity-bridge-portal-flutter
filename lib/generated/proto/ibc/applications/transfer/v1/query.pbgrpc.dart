///
//  Generated code. Do not modify.
//  source: ibc/applications/transfer/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $5;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$denomTrace =
      $grpc.ClientMethod<$5.QueryDenomTraceRequest, $5.QueryDenomTraceResponse>(
          '/ibc.applications.transfer.v1.Query/DenomTrace',
          ($5.QueryDenomTraceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.QueryDenomTraceResponse.fromBuffer(value));
  static final _$denomTraces = $grpc.ClientMethod<$5.QueryDenomTracesRequest,
          $5.QueryDenomTracesResponse>(
      '/ibc.applications.transfer.v1.Query/DenomTraces',
      ($5.QueryDenomTracesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $5.QueryDenomTracesResponse.fromBuffer(value));
  static final _$params =
      $grpc.ClientMethod<$5.QueryParamsRequest, $5.QueryParamsResponse>(
          '/ibc.applications.transfer.v1.Query/Params',
          ($5.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.QueryParamsResponse.fromBuffer(value));
  static final _$denomHash =
      $grpc.ClientMethod<$5.QueryDenomHashRequest, $5.QueryDenomHashResponse>(
          '/ibc.applications.transfer.v1.Query/DenomHash',
          ($5.QueryDenomHashRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.QueryDenomHashResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.QueryDenomTraceResponse> denomTrace(
      $5.QueryDenomTraceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$denomTrace, request, options: options);
  }

  $grpc.ResponseFuture<$5.QueryDenomTracesResponse> denomTraces(
      $5.QueryDenomTracesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$denomTraces, request, options: options);
  }

  $grpc.ResponseFuture<$5.QueryParamsResponse> params(
      $5.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }

  $grpc.ResponseFuture<$5.QueryDenomHashResponse> denomHash(
      $5.QueryDenomHashRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$denomHash, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'ibc.applications.transfer.v1.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.QueryDenomTraceRequest,
            $5.QueryDenomTraceResponse>(
        'DenomTrace',
        denomTrace_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.QueryDenomTraceRequest.fromBuffer(value),
        ($5.QueryDenomTraceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.QueryDenomTracesRequest,
            $5.QueryDenomTracesResponse>(
        'DenomTraces',
        denomTraces_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.QueryDenomTracesRequest.fromBuffer(value),
        ($5.QueryDenomTracesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.QueryParamsRequest, $5.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.QueryParamsRequest.fromBuffer(value),
            ($5.QueryParamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.QueryDenomHashRequest,
            $5.QueryDenomHashResponse>(
        'DenomHash',
        denomHash_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.QueryDenomHashRequest.fromBuffer(value),
        ($5.QueryDenomHashResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.QueryDenomTraceResponse> denomTrace_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.QueryDenomTraceRequest> request) async {
    return denomTrace(call, await request);
  }

  $async.Future<$5.QueryDenomTracesResponse> denomTraces_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.QueryDenomTracesRequest> request) async {
    return denomTraces(call, await request);
  }

  $async.Future<$5.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$5.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$5.QueryDenomHashResponse> denomHash_Pre($grpc.ServiceCall call,
      $async.Future<$5.QueryDenomHashRequest> request) async {
    return denomHash(call, await request);
  }

  $async.Future<$5.QueryDenomTraceResponse> denomTrace(
      $grpc.ServiceCall call, $5.QueryDenomTraceRequest request);
  $async.Future<$5.QueryDenomTracesResponse> denomTraces(
      $grpc.ServiceCall call, $5.QueryDenomTracesRequest request);
  $async.Future<$5.QueryParamsResponse> params(
      $grpc.ServiceCall call, $5.QueryParamsRequest request);
  $async.Future<$5.QueryDenomHashResponse> denomHash(
      $grpc.ServiceCall call, $5.QueryDenomHashRequest request);
}
