///
//  Generated code. Do not modify.
//  source: ibc/core/client/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $7;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$clientState = $grpc.ClientMethod<$7.QueryClientStateRequest,
          $7.QueryClientStateResponse>(
      '/ibc.core.client.v1.Query/ClientState',
      ($7.QueryClientStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryClientStateResponse.fromBuffer(value));
  static final _$clientStates = $grpc.ClientMethod<$7.QueryClientStatesRequest,
          $7.QueryClientStatesResponse>(
      '/ibc.core.client.v1.Query/ClientStates',
      ($7.QueryClientStatesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryClientStatesResponse.fromBuffer(value));
  static final _$consensusState = $grpc.ClientMethod<
          $7.QueryConsensusStateRequest, $7.QueryConsensusStateResponse>(
      '/ibc.core.client.v1.Query/ConsensusState',
      ($7.QueryConsensusStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryConsensusStateResponse.fromBuffer(value));
  static final _$consensusStates = $grpc.ClientMethod<
          $7.QueryConsensusStatesRequest, $7.QueryConsensusStatesResponse>(
      '/ibc.core.client.v1.Query/ConsensusStates',
      ($7.QueryConsensusStatesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryConsensusStatesResponse.fromBuffer(value));
  static final _$clientStatus = $grpc.ClientMethod<$7.QueryClientStatusRequest,
          $7.QueryClientStatusResponse>(
      '/ibc.core.client.v1.Query/ClientStatus',
      ($7.QueryClientStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryClientStatusResponse.fromBuffer(value));
  static final _$clientParams = $grpc.ClientMethod<$7.QueryClientParamsRequest,
          $7.QueryClientParamsResponse>(
      '/ibc.core.client.v1.Query/ClientParams',
      ($7.QueryClientParamsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryClientParamsResponse.fromBuffer(value));
  static final _$upgradedClientState = $grpc.ClientMethod<
          $7.QueryUpgradedClientStateRequest,
          $7.QueryUpgradedClientStateResponse>(
      '/ibc.core.client.v1.Query/UpgradedClientState',
      ($7.QueryUpgradedClientStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryUpgradedClientStateResponse.fromBuffer(value));
  static final _$upgradedConsensusState = $grpc.ClientMethod<
          $7.QueryUpgradedConsensusStateRequest,
          $7.QueryUpgradedConsensusStateResponse>(
      '/ibc.core.client.v1.Query/UpgradedConsensusState',
      ($7.QueryUpgradedConsensusStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.QueryUpgradedConsensusStateResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$7.QueryClientStateResponse> clientState(
      $7.QueryClientStateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$clientState, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryClientStatesResponse> clientStates(
      $7.QueryClientStatesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$clientStates, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryConsensusStateResponse> consensusState(
      $7.QueryConsensusStateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$consensusState, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryConsensusStatesResponse> consensusStates(
      $7.QueryConsensusStatesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$consensusStates, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryClientStatusResponse> clientStatus(
      $7.QueryClientStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$clientStatus, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryClientParamsResponse> clientParams(
      $7.QueryClientParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$clientParams, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryUpgradedClientStateResponse> upgradedClientState(
      $7.QueryUpgradedClientStateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upgradedClientState, request, options: options);
  }

  $grpc.ResponseFuture<$7.QueryUpgradedConsensusStateResponse>
      upgradedConsensusState($7.QueryUpgradedConsensusStateRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upgradedConsensusState, request,
        options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'ibc.core.client.v1.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.QueryClientStateRequest,
            $7.QueryClientStateResponse>(
        'ClientState',
        clientState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryClientStateRequest.fromBuffer(value),
        ($7.QueryClientStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryClientStatesRequest,
            $7.QueryClientStatesResponse>(
        'ClientStates',
        clientStates_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryClientStatesRequest.fromBuffer(value),
        ($7.QueryClientStatesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryConsensusStateRequest,
            $7.QueryConsensusStateResponse>(
        'ConsensusState',
        consensusState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryConsensusStateRequest.fromBuffer(value),
        ($7.QueryConsensusStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryConsensusStatesRequest,
            $7.QueryConsensusStatesResponse>(
        'ConsensusStates',
        consensusStates_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryConsensusStatesRequest.fromBuffer(value),
        ($7.QueryConsensusStatesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryClientStatusRequest,
            $7.QueryClientStatusResponse>(
        'ClientStatus',
        clientStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryClientStatusRequest.fromBuffer(value),
        ($7.QueryClientStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryClientParamsRequest,
            $7.QueryClientParamsResponse>(
        'ClientParams',
        clientParams_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryClientParamsRequest.fromBuffer(value),
        ($7.QueryClientParamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryUpgradedClientStateRequest,
            $7.QueryUpgradedClientStateResponse>(
        'UpgradedClientState',
        upgradedClientState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryUpgradedClientStateRequest.fromBuffer(value),
        ($7.QueryUpgradedClientStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.QueryUpgradedConsensusStateRequest,
            $7.QueryUpgradedConsensusStateResponse>(
        'UpgradedConsensusState',
        upgradedConsensusState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.QueryUpgradedConsensusStateRequest.fromBuffer(value),
        ($7.QueryUpgradedConsensusStateResponse value) =>
            value.writeToBuffer()));
  }

  $async.Future<$7.QueryClientStateResponse> clientState_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryClientStateRequest> request) async {
    return clientState(call, await request);
  }

  $async.Future<$7.QueryClientStatesResponse> clientStates_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryClientStatesRequest> request) async {
    return clientStates(call, await request);
  }

  $async.Future<$7.QueryConsensusStateResponse> consensusState_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryConsensusStateRequest> request) async {
    return consensusState(call, await request);
  }

  $async.Future<$7.QueryConsensusStatesResponse> consensusStates_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryConsensusStatesRequest> request) async {
    return consensusStates(call, await request);
  }

  $async.Future<$7.QueryClientStatusResponse> clientStatus_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryClientStatusRequest> request) async {
    return clientStatus(call, await request);
  }

  $async.Future<$7.QueryClientParamsResponse> clientParams_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryClientParamsRequest> request) async {
    return clientParams(call, await request);
  }

  $async.Future<$7.QueryUpgradedClientStateResponse> upgradedClientState_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.QueryUpgradedClientStateRequest> request) async {
    return upgradedClientState(call, await request);
  }

  $async.Future<$7.QueryUpgradedConsensusStateResponse>
      upgradedConsensusState_Pre($grpc.ServiceCall call,
          $async.Future<$7.QueryUpgradedConsensusStateRequest> request) async {
    return upgradedConsensusState(call, await request);
  }

  $async.Future<$7.QueryClientStateResponse> clientState(
      $grpc.ServiceCall call, $7.QueryClientStateRequest request);
  $async.Future<$7.QueryClientStatesResponse> clientStates(
      $grpc.ServiceCall call, $7.QueryClientStatesRequest request);
  $async.Future<$7.QueryConsensusStateResponse> consensusState(
      $grpc.ServiceCall call, $7.QueryConsensusStateRequest request);
  $async.Future<$7.QueryConsensusStatesResponse> consensusStates(
      $grpc.ServiceCall call, $7.QueryConsensusStatesRequest request);
  $async.Future<$7.QueryClientStatusResponse> clientStatus(
      $grpc.ServiceCall call, $7.QueryClientStatusRequest request);
  $async.Future<$7.QueryClientParamsResponse> clientParams(
      $grpc.ServiceCall call, $7.QueryClientParamsRequest request);
  $async.Future<$7.QueryUpgradedClientStateResponse> upgradedClientState(
      $grpc.ServiceCall call, $7.QueryUpgradedClientStateRequest request);
  $async.Future<$7.QueryUpgradedConsensusStateResponse> upgradedConsensusState(
      $grpc.ServiceCall call, $7.QueryUpgradedConsensusStateRequest request);
}
