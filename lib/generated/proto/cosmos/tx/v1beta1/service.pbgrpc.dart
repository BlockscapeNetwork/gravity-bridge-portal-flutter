///
//  Generated code. Do not modify.
//  source: cosmos/tx/v1beta1/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $3;
export 'service.pb.dart';

class ServiceClient extends $grpc.Client {
  static final _$simulate =
      $grpc.ClientMethod<$3.SimulateRequest, $3.SimulateResponse>(
          '/cosmos.tx.v1beta1.Service/Simulate',
          ($3.SimulateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.SimulateResponse.fromBuffer(value));
  static final _$getTx = $grpc.ClientMethod<$3.GetTxRequest, $3.GetTxResponse>(
      '/cosmos.tx.v1beta1.Service/GetTx',
      ($3.GetTxRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetTxResponse.fromBuffer(value));
  static final _$broadcastTx =
      $grpc.ClientMethod<$3.BroadcastTxRequest, $3.BroadcastTxResponse>(
          '/cosmos.tx.v1beta1.Service/BroadcastTx',
          ($3.BroadcastTxRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.BroadcastTxResponse.fromBuffer(value));
  static final _$getTxsEvent =
      $grpc.ClientMethod<$3.GetTxsEventRequest, $3.GetTxsEventResponse>(
          '/cosmos.tx.v1beta1.Service/GetTxsEvent',
          ($3.GetTxsEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.GetTxsEventResponse.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.SimulateResponse> simulate($3.SimulateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$simulate, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetTxResponse> getTx($3.GetTxRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTx, request, options: options);
  }

  $grpc.ResponseFuture<$3.BroadcastTxResponse> broadcastTx(
      $3.BroadcastTxRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$broadcastTx, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetTxsEventResponse> getTxsEvent(
      $3.GetTxsEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTxsEvent, request, options: options);
  }
}

abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos.tx.v1beta1.Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.SimulateRequest, $3.SimulateResponse>(
        'Simulate',
        simulate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.SimulateRequest.fromBuffer(value),
        ($3.SimulateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetTxRequest, $3.GetTxResponse>(
        'GetTx',
        getTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetTxRequest.fromBuffer(value),
        ($3.GetTxResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.BroadcastTxRequest, $3.BroadcastTxResponse>(
            'BroadcastTx',
            broadcastTx_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.BroadcastTxRequest.fromBuffer(value),
            ($3.BroadcastTxResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.GetTxsEventRequest, $3.GetTxsEventResponse>(
            'GetTxsEvent',
            getTxsEvent_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.GetTxsEventRequest.fromBuffer(value),
            ($3.GetTxsEventResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.SimulateResponse> simulate_Pre(
      $grpc.ServiceCall call, $async.Future<$3.SimulateRequest> request) async {
    return simulate(call, await request);
  }

  $async.Future<$3.GetTxResponse> getTx_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetTxRequest> request) async {
    return getTx(call, await request);
  }

  $async.Future<$3.BroadcastTxResponse> broadcastTx_Pre($grpc.ServiceCall call,
      $async.Future<$3.BroadcastTxRequest> request) async {
    return broadcastTx(call, await request);
  }

  $async.Future<$3.GetTxsEventResponse> getTxsEvent_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetTxsEventRequest> request) async {
    return getTxsEvent(call, await request);
  }

  $async.Future<$3.SimulateResponse> simulate(
      $grpc.ServiceCall call, $3.SimulateRequest request);
  $async.Future<$3.GetTxResponse> getTx(
      $grpc.ServiceCall call, $3.GetTxRequest request);
  $async.Future<$3.BroadcastTxResponse> broadcastTx(
      $grpc.ServiceCall call, $3.BroadcastTxRequest request);
  $async.Future<$3.GetTxsEventResponse> getTxsEvent(
      $grpc.ServiceCall call, $3.GetTxsEventRequest request);
}
