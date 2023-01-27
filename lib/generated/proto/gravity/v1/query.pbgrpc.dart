///
//  Generated code. Do not modify.
//  source: gravity/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $1;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$params =
      $grpc.ClientMethod<$1.QueryParamsRequest, $1.QueryParamsResponse>(
          '/gravity.v1.Query/Params',
          ($1.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryParamsResponse.fromBuffer(value));
  static final _$currentValset = $grpc.ClientMethod<
          $1.QueryCurrentValsetRequest, $1.QueryCurrentValsetResponse>(
      '/gravity.v1.Query/CurrentValset',
      ($1.QueryCurrentValsetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryCurrentValsetResponse.fromBuffer(value));
  static final _$valsetRequest = $grpc.ClientMethod<
          $1.QueryValsetRequestRequest, $1.QueryValsetRequestResponse>(
      '/gravity.v1.Query/ValsetRequest',
      ($1.QueryValsetRequestRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryValsetRequestResponse.fromBuffer(value));
  static final _$valsetConfirm = $grpc.ClientMethod<
          $1.QueryValsetConfirmRequest, $1.QueryValsetConfirmResponse>(
      '/gravity.v1.Query/ValsetConfirm',
      ($1.QueryValsetConfirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryValsetConfirmResponse.fromBuffer(value));
  static final _$valsetConfirmsByNonce = $grpc.ClientMethod<
          $1.QueryValsetConfirmsByNonceRequest,
          $1.QueryValsetConfirmsByNonceResponse>(
      '/gravity.v1.Query/ValsetConfirmsByNonce',
      ($1.QueryValsetConfirmsByNonceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryValsetConfirmsByNonceResponse.fromBuffer(value));
  static final _$lastValsetRequests = $grpc.ClientMethod<
          $1.QueryLastValsetRequestsRequest,
          $1.QueryLastValsetRequestsResponse>(
      '/gravity.v1.Query/LastValsetRequests',
      ($1.QueryLastValsetRequestsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastValsetRequestsResponse.fromBuffer(value));
  static final _$lastPendingValsetRequestByAddr = $grpc.ClientMethod<
          $1.QueryLastPendingValsetRequestByAddrRequest,
          $1.QueryLastPendingValsetRequestByAddrResponse>(
      '/gravity.v1.Query/LastPendingValsetRequestByAddr',
      ($1.QueryLastPendingValsetRequestByAddrRequest value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastPendingValsetRequestByAddrResponse.fromBuffer(value));
  static final _$lastPendingBatchRequestByAddr = $grpc.ClientMethod<
          $1.QueryLastPendingBatchRequestByAddrRequest,
          $1.QueryLastPendingBatchRequestByAddrResponse>(
      '/gravity.v1.Query/LastPendingBatchRequestByAddr',
      ($1.QueryLastPendingBatchRequestByAddrRequest value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastPendingBatchRequestByAddrResponse.fromBuffer(value));
  static final _$lastPendingLogicCallByAddr = $grpc.ClientMethod<
          $1.QueryLastPendingLogicCallByAddrRequest,
          $1.QueryLastPendingLogicCallByAddrResponse>(
      '/gravity.v1.Query/LastPendingLogicCallByAddr',
      ($1.QueryLastPendingLogicCallByAddrRequest value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastPendingLogicCallByAddrResponse.fromBuffer(value));
  static final _$lastEventNonceByAddr = $grpc.ClientMethod<
          $1.QueryLastEventNonceByAddrRequest,
          $1.QueryLastEventNonceByAddrResponse>(
      '/gravity.v1.Query/LastEventNonceByAddr',
      ($1.QueryLastEventNonceByAddrRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastEventNonceByAddrResponse.fromBuffer(value));
  static final _$batchFees =
      $grpc.ClientMethod<$1.QueryBatchFeeRequest, $1.QueryBatchFeeResponse>(
          '/gravity.v1.Query/BatchFees',
          ($1.QueryBatchFeeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryBatchFeeResponse.fromBuffer(value));
  static final _$outgoingTxBatches = $grpc.ClientMethod<
          $1.QueryOutgoingTxBatchesRequest, $1.QueryOutgoingTxBatchesResponse>(
      '/gravity.v1.Query/OutgoingTxBatches',
      ($1.QueryOutgoingTxBatchesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryOutgoingTxBatchesResponse.fromBuffer(value));
  static final _$outgoingLogicCalls = $grpc.ClientMethod<
          $1.QueryOutgoingLogicCallsRequest,
          $1.QueryOutgoingLogicCallsResponse>(
      '/gravity.v1.Query/OutgoingLogicCalls',
      ($1.QueryOutgoingLogicCallsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryOutgoingLogicCallsResponse.fromBuffer(value));
  static final _$batchRequestByNonce = $grpc.ClientMethod<
          $1.QueryBatchRequestByNonceRequest,
          $1.QueryBatchRequestByNonceResponse>(
      '/gravity.v1.Query/BatchRequestByNonce',
      ($1.QueryBatchRequestByNonceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryBatchRequestByNonceResponse.fromBuffer(value));
  static final _$batchConfirms = $grpc.ClientMethod<
          $1.QueryBatchConfirmsRequest, $1.QueryBatchConfirmsResponse>(
      '/gravity.v1.Query/BatchConfirms',
      ($1.QueryBatchConfirmsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryBatchConfirmsResponse.fromBuffer(value));
  static final _$logicConfirms = $grpc.ClientMethod<
          $1.QueryLogicConfirmsRequest, $1.QueryLogicConfirmsResponse>(
      '/gravity.v1.Query/LogicConfirms',
      ($1.QueryLogicConfirmsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLogicConfirmsResponse.fromBuffer(value));
  static final _$eRC20ToDenom = $grpc.ClientMethod<$1.QueryERC20ToDenomRequest,
          $1.QueryERC20ToDenomResponse>(
      '/gravity.v1.Query/ERC20ToDenom',
      ($1.QueryERC20ToDenomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryERC20ToDenomResponse.fromBuffer(value));
  static final _$denomToERC20 = $grpc.ClientMethod<$1.QueryDenomToERC20Request,
          $1.QueryDenomToERC20Response>(
      '/gravity.v1.Query/DenomToERC20',
      ($1.QueryDenomToERC20Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryDenomToERC20Response.fromBuffer(value));
  static final _$getLastObservedEthBlock = $grpc.ClientMethod<
          $1.QueryLastObservedEthBlockRequest,
          $1.QueryLastObservedEthBlockResponse>(
      '/gravity.v1.Query/GetLastObservedEthBlock',
      ($1.QueryLastObservedEthBlockRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastObservedEthBlockResponse.fromBuffer(value));
  static final _$getLastObservedEthNonce = $grpc.ClientMethod<
          $1.QueryLastObservedEthNonceRequest,
          $1.QueryLastObservedEthNonceResponse>(
      '/gravity.v1.Query/GetLastObservedEthNonce',
      ($1.QueryLastObservedEthNonceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryLastObservedEthNonceResponse.fromBuffer(value));
  static final _$getAttestations = $grpc.ClientMethod<
          $1.QueryAttestationsRequest, $1.QueryAttestationsResponse>(
      '/gravity.v1.Query/GetAttestations',
      ($1.QueryAttestationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryAttestationsResponse.fromBuffer(value));
  static final _$getDelegateKeyByValidator = $grpc.ClientMethod<
          $1.QueryDelegateKeysByValidatorAddress,
          $1.QueryDelegateKeysByValidatorAddressResponse>(
      '/gravity.v1.Query/GetDelegateKeyByValidator',
      ($1.QueryDelegateKeysByValidatorAddress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryDelegateKeysByValidatorAddressResponse.fromBuffer(value));
  static final _$getDelegateKeyByEth = $grpc.ClientMethod<
          $1.QueryDelegateKeysByEthAddress,
          $1.QueryDelegateKeysByEthAddressResponse>(
      '/gravity.v1.Query/GetDelegateKeyByEth',
      ($1.QueryDelegateKeysByEthAddress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryDelegateKeysByEthAddressResponse.fromBuffer(value));
  static final _$getDelegateKeyByOrchestrator = $grpc.ClientMethod<
          $1.QueryDelegateKeysByOrchestratorAddress,
          $1.QueryDelegateKeysByOrchestratorAddressResponse>(
      '/gravity.v1.Query/GetDelegateKeyByOrchestrator',
      ($1.QueryDelegateKeysByOrchestratorAddress value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryDelegateKeysByOrchestratorAddressResponse.fromBuffer(value));
  static final _$getPendingSendToEth = $grpc.ClientMethod<
          $1.QueryPendingSendToEth, $1.QueryPendingSendToEthResponse>(
      '/gravity.v1.Query/GetPendingSendToEth',
      ($1.QueryPendingSendToEth value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryPendingSendToEthResponse.fromBuffer(value));
  static final _$getPendingIbcAutoForwards = $grpc.ClientMethod<
          $1.QueryPendingIbcAutoForwards,
          $1.QueryPendingIbcAutoForwardsResponse>(
      '/gravity.v1.Query/GetPendingIbcAutoForwards',
      ($1.QueryPendingIbcAutoForwards value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryPendingIbcAutoForwardsResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.QueryParamsResponse> params(
      $1.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryCurrentValsetResponse> currentValset(
      $1.QueryCurrentValsetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$currentValset, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryValsetRequestResponse> valsetRequest(
      $1.QueryValsetRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$valsetRequest, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryValsetConfirmResponse> valsetConfirm(
      $1.QueryValsetConfirmRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$valsetConfirm, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryValsetConfirmsByNonceResponse>
      valsetConfirmsByNonce($1.QueryValsetConfirmsByNonceRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$valsetConfirmsByNonce, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastValsetRequestsResponse> lastValsetRequests(
      $1.QueryLastValsetRequestsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lastValsetRequests, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastPendingValsetRequestByAddrResponse>
      lastPendingValsetRequestByAddr(
          $1.QueryLastPendingValsetRequestByAddrRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lastPendingValsetRequestByAddr, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastPendingBatchRequestByAddrResponse>
      lastPendingBatchRequestByAddr(
          $1.QueryLastPendingBatchRequestByAddrRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lastPendingBatchRequestByAddr, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastPendingLogicCallByAddrResponse>
      lastPendingLogicCallByAddr(
          $1.QueryLastPendingLogicCallByAddrRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lastPendingLogicCallByAddr, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastEventNonceByAddrResponse>
      lastEventNonceByAddr($1.QueryLastEventNonceByAddrRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lastEventNonceByAddr, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryBatchFeeResponse> batchFees(
      $1.QueryBatchFeeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$batchFees, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryOutgoingTxBatchesResponse> outgoingTxBatches(
      $1.QueryOutgoingTxBatchesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$outgoingTxBatches, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryOutgoingLogicCallsResponse> outgoingLogicCalls(
      $1.QueryOutgoingLogicCallsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$outgoingLogicCalls, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryBatchRequestByNonceResponse> batchRequestByNonce(
      $1.QueryBatchRequestByNonceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$batchRequestByNonce, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryBatchConfirmsResponse> batchConfirms(
      $1.QueryBatchConfirmsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$batchConfirms, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryLogicConfirmsResponse> logicConfirms(
      $1.QueryLogicConfirmsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logicConfirms, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryERC20ToDenomResponse> eRC20ToDenom(
      $1.QueryERC20ToDenomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$eRC20ToDenom, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryDenomToERC20Response> denomToERC20(
      $1.QueryDenomToERC20Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$denomToERC20, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastObservedEthBlockResponse>
      getLastObservedEthBlock($1.QueryLastObservedEthBlockRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLastObservedEthBlock, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryLastObservedEthNonceResponse>
      getLastObservedEthNonce($1.QueryLastObservedEthNonceRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLastObservedEthNonce, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryAttestationsResponse> getAttestations(
      $1.QueryAttestationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAttestations, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryDelegateKeysByValidatorAddressResponse>
      getDelegateKeyByValidator($1.QueryDelegateKeysByValidatorAddress request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDelegateKeyByValidator, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryDelegateKeysByEthAddressResponse>
      getDelegateKeyByEth($1.QueryDelegateKeysByEthAddress request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDelegateKeyByEth, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryDelegateKeysByOrchestratorAddressResponse>
      getDelegateKeyByOrchestrator(
          $1.QueryDelegateKeysByOrchestratorAddress request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDelegateKeyByOrchestrator, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.QueryPendingSendToEthResponse> getPendingSendToEth(
      $1.QueryPendingSendToEth request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPendingSendToEth, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryPendingIbcAutoForwardsResponse>
      getPendingIbcAutoForwards($1.QueryPendingIbcAutoForwards request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPendingIbcAutoForwards, request,
        options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'gravity.v1.Query';

  QueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.QueryParamsRequest, $1.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.QueryParamsRequest.fromBuffer(value),
            ($1.QueryParamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryCurrentValsetRequest,
            $1.QueryCurrentValsetResponse>(
        'CurrentValset',
        currentValset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryCurrentValsetRequest.fromBuffer(value),
        ($1.QueryCurrentValsetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryValsetRequestRequest,
            $1.QueryValsetRequestResponse>(
        'ValsetRequest',
        valsetRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryValsetRequestRequest.fromBuffer(value),
        ($1.QueryValsetRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryValsetConfirmRequest,
            $1.QueryValsetConfirmResponse>(
        'ValsetConfirm',
        valsetConfirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryValsetConfirmRequest.fromBuffer(value),
        ($1.QueryValsetConfirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryValsetConfirmsByNonceRequest,
            $1.QueryValsetConfirmsByNonceResponse>(
        'ValsetConfirmsByNonce',
        valsetConfirmsByNonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryValsetConfirmsByNonceRequest.fromBuffer(value),
        ($1.QueryValsetConfirmsByNonceResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLastValsetRequestsRequest,
            $1.QueryLastValsetRequestsResponse>(
        'LastValsetRequests',
        lastValsetRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastValsetRequestsRequest.fromBuffer(value),
        ($1.QueryLastValsetRequestsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<
            $1.QueryLastPendingValsetRequestByAddrRequest,
            $1.QueryLastPendingValsetRequestByAddrResponse>(
        'LastPendingValsetRequestByAddr',
        lastPendingValsetRequestByAddr_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastPendingValsetRequestByAddrRequest.fromBuffer(value),
        ($1.QueryLastPendingValsetRequestByAddrResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLastPendingBatchRequestByAddrRequest,
            $1.QueryLastPendingBatchRequestByAddrResponse>(
        'LastPendingBatchRequestByAddr',
        lastPendingBatchRequestByAddr_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastPendingBatchRequestByAddrRequest.fromBuffer(value),
        ($1.QueryLastPendingBatchRequestByAddrResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLastPendingLogicCallByAddrRequest,
            $1.QueryLastPendingLogicCallByAddrResponse>(
        'LastPendingLogicCallByAddr',
        lastPendingLogicCallByAddr_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastPendingLogicCallByAddrRequest.fromBuffer(value),
        ($1.QueryLastPendingLogicCallByAddrResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLastEventNonceByAddrRequest,
            $1.QueryLastEventNonceByAddrResponse>(
        'LastEventNonceByAddr',
        lastEventNonceByAddr_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastEventNonceByAddrRequest.fromBuffer(value),
        ($1.QueryLastEventNonceByAddrResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.QueryBatchFeeRequest, $1.QueryBatchFeeResponse>(
            'BatchFees',
            batchFees_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.QueryBatchFeeRequest.fromBuffer(value),
            ($1.QueryBatchFeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryOutgoingTxBatchesRequest,
            $1.QueryOutgoingTxBatchesResponse>(
        'OutgoingTxBatches',
        outgoingTxBatches_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryOutgoingTxBatchesRequest.fromBuffer(value),
        ($1.QueryOutgoingTxBatchesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryOutgoingLogicCallsRequest,
            $1.QueryOutgoingLogicCallsResponse>(
        'OutgoingLogicCalls',
        outgoingLogicCalls_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryOutgoingLogicCallsRequest.fromBuffer(value),
        ($1.QueryOutgoingLogicCallsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryBatchRequestByNonceRequest,
            $1.QueryBatchRequestByNonceResponse>(
        'BatchRequestByNonce',
        batchRequestByNonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryBatchRequestByNonceRequest.fromBuffer(value),
        ($1.QueryBatchRequestByNonceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryBatchConfirmsRequest,
            $1.QueryBatchConfirmsResponse>(
        'BatchConfirms',
        batchConfirms_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryBatchConfirmsRequest.fromBuffer(value),
        ($1.QueryBatchConfirmsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLogicConfirmsRequest,
            $1.QueryLogicConfirmsResponse>(
        'LogicConfirms',
        logicConfirms_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLogicConfirmsRequest.fromBuffer(value),
        ($1.QueryLogicConfirmsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryERC20ToDenomRequest,
            $1.QueryERC20ToDenomResponse>(
        'ERC20ToDenom',
        eRC20ToDenom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryERC20ToDenomRequest.fromBuffer(value),
        ($1.QueryERC20ToDenomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryDenomToERC20Request,
            $1.QueryDenomToERC20Response>(
        'DenomToERC20',
        denomToERC20_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryDenomToERC20Request.fromBuffer(value),
        ($1.QueryDenomToERC20Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLastObservedEthBlockRequest,
            $1.QueryLastObservedEthBlockResponse>(
        'GetLastObservedEthBlock',
        getLastObservedEthBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastObservedEthBlockRequest.fromBuffer(value),
        ($1.QueryLastObservedEthBlockResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryLastObservedEthNonceRequest,
            $1.QueryLastObservedEthNonceResponse>(
        'GetLastObservedEthNonce',
        getLastObservedEthNonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryLastObservedEthNonceRequest.fromBuffer(value),
        ($1.QueryLastObservedEthNonceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryAttestationsRequest,
            $1.QueryAttestationsResponse>(
        'GetAttestations',
        getAttestations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryAttestationsRequest.fromBuffer(value),
        ($1.QueryAttestationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryDelegateKeysByValidatorAddress,
            $1.QueryDelegateKeysByValidatorAddressResponse>(
        'GetDelegateKeyByValidator',
        getDelegateKeyByValidator_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryDelegateKeysByValidatorAddress.fromBuffer(value),
        ($1.QueryDelegateKeysByValidatorAddressResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryDelegateKeysByEthAddress,
            $1.QueryDelegateKeysByEthAddressResponse>(
        'GetDelegateKeyByEth',
        getDelegateKeyByEth_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryDelegateKeysByEthAddress.fromBuffer(value),
        ($1.QueryDelegateKeysByEthAddressResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryDelegateKeysByOrchestratorAddress,
            $1.QueryDelegateKeysByOrchestratorAddressResponse>(
        'GetDelegateKeyByOrchestrator',
        getDelegateKeyByOrchestrator_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryDelegateKeysByOrchestratorAddress.fromBuffer(value),
        ($1.QueryDelegateKeysByOrchestratorAddressResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryPendingSendToEth,
            $1.QueryPendingSendToEthResponse>(
        'GetPendingSendToEth',
        getPendingSendToEth_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryPendingSendToEth.fromBuffer(value),
        ($1.QueryPendingSendToEthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryPendingIbcAutoForwards,
            $1.QueryPendingIbcAutoForwardsResponse>(
        'GetPendingIbcAutoForwards',
        getPendingIbcAutoForwards_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryPendingIbcAutoForwards.fromBuffer(value),
        ($1.QueryPendingIbcAutoForwardsResponse value) =>
            value.writeToBuffer()));
  }

  $async.Future<$1.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$1.QueryCurrentValsetResponse> currentValset_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryCurrentValsetRequest> request) async {
    return currentValset(call, await request);
  }

  $async.Future<$1.QueryValsetRequestResponse> valsetRequest_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryValsetRequestRequest> request) async {
    return valsetRequest(call, await request);
  }

  $async.Future<$1.QueryValsetConfirmResponse> valsetConfirm_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryValsetConfirmRequest> request) async {
    return valsetConfirm(call, await request);
  }

  $async.Future<$1.QueryValsetConfirmsByNonceResponse>
      valsetConfirmsByNonce_Pre($grpc.ServiceCall call,
          $async.Future<$1.QueryValsetConfirmsByNonceRequest> request) async {
    return valsetConfirmsByNonce(call, await request);
  }

  $async.Future<$1.QueryLastValsetRequestsResponse> lastValsetRequests_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryLastValsetRequestsRequest> request) async {
    return lastValsetRequests(call, await request);
  }

  $async.Future<$1.QueryLastPendingValsetRequestByAddrResponse>
      lastPendingValsetRequestByAddr_Pre(
          $grpc.ServiceCall call,
          $async.Future<$1.QueryLastPendingValsetRequestByAddrRequest>
              request) async {
    return lastPendingValsetRequestByAddr(call, await request);
  }

  $async.Future<$1.QueryLastPendingBatchRequestByAddrResponse>
      lastPendingBatchRequestByAddr_Pre(
          $grpc.ServiceCall call,
          $async.Future<$1.QueryLastPendingBatchRequestByAddrRequest>
              request) async {
    return lastPendingBatchRequestByAddr(call, await request);
  }

  $async.Future<$1.QueryLastPendingLogicCallByAddrResponse>
      lastPendingLogicCallByAddr_Pre(
          $grpc.ServiceCall call,
          $async.Future<$1.QueryLastPendingLogicCallByAddrRequest>
              request) async {
    return lastPendingLogicCallByAddr(call, await request);
  }

  $async.Future<$1.QueryLastEventNonceByAddrResponse> lastEventNonceByAddr_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryLastEventNonceByAddrRequest> request) async {
    return lastEventNonceByAddr(call, await request);
  }

  $async.Future<$1.QueryBatchFeeResponse> batchFees_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryBatchFeeRequest> request) async {
    return batchFees(call, await request);
  }

  $async.Future<$1.QueryOutgoingTxBatchesResponse> outgoingTxBatches_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryOutgoingTxBatchesRequest> request) async {
    return outgoingTxBatches(call, await request);
  }

  $async.Future<$1.QueryOutgoingLogicCallsResponse> outgoingLogicCalls_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryOutgoingLogicCallsRequest> request) async {
    return outgoingLogicCalls(call, await request);
  }

  $async.Future<$1.QueryBatchRequestByNonceResponse> batchRequestByNonce_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryBatchRequestByNonceRequest> request) async {
    return batchRequestByNonce(call, await request);
  }

  $async.Future<$1.QueryBatchConfirmsResponse> batchConfirms_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryBatchConfirmsRequest> request) async {
    return batchConfirms(call, await request);
  }

  $async.Future<$1.QueryLogicConfirmsResponse> logicConfirms_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryLogicConfirmsRequest> request) async {
    return logicConfirms(call, await request);
  }

  $async.Future<$1.QueryERC20ToDenomResponse> eRC20ToDenom_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryERC20ToDenomRequest> request) async {
    return eRC20ToDenom(call, await request);
  }

  $async.Future<$1.QueryDenomToERC20Response> denomToERC20_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryDenomToERC20Request> request) async {
    return denomToERC20(call, await request);
  }

  $async.Future<$1.QueryLastObservedEthBlockResponse>
      getLastObservedEthBlock_Pre($grpc.ServiceCall call,
          $async.Future<$1.QueryLastObservedEthBlockRequest> request) async {
    return getLastObservedEthBlock(call, await request);
  }

  $async.Future<$1.QueryLastObservedEthNonceResponse>
      getLastObservedEthNonce_Pre($grpc.ServiceCall call,
          $async.Future<$1.QueryLastObservedEthNonceRequest> request) async {
    return getLastObservedEthNonce(call, await request);
  }

  $async.Future<$1.QueryAttestationsResponse> getAttestations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryAttestationsRequest> request) async {
    return getAttestations(call, await request);
  }

  $async.Future<$1.QueryDelegateKeysByValidatorAddressResponse>
      getDelegateKeyByValidator_Pre($grpc.ServiceCall call,
          $async.Future<$1.QueryDelegateKeysByValidatorAddress> request) async {
    return getDelegateKeyByValidator(call, await request);
  }

  $async.Future<$1.QueryDelegateKeysByEthAddressResponse>
      getDelegateKeyByEth_Pre($grpc.ServiceCall call,
          $async.Future<$1.QueryDelegateKeysByEthAddress> request) async {
    return getDelegateKeyByEth(call, await request);
  }

  $async.Future<$1.QueryDelegateKeysByOrchestratorAddressResponse>
      getDelegateKeyByOrchestrator_Pre(
          $grpc.ServiceCall call,
          $async.Future<$1.QueryDelegateKeysByOrchestratorAddress>
              request) async {
    return getDelegateKeyByOrchestrator(call, await request);
  }

  $async.Future<$1.QueryPendingSendToEthResponse> getPendingSendToEth_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryPendingSendToEth> request) async {
    return getPendingSendToEth(call, await request);
  }

  $async.Future<$1.QueryPendingIbcAutoForwardsResponse>
      getPendingIbcAutoForwards_Pre($grpc.ServiceCall call,
          $async.Future<$1.QueryPendingIbcAutoForwards> request) async {
    return getPendingIbcAutoForwards(call, await request);
  }

  $async.Future<$1.QueryParamsResponse> params(
      $grpc.ServiceCall call, $1.QueryParamsRequest request);
  $async.Future<$1.QueryCurrentValsetResponse> currentValset(
      $grpc.ServiceCall call, $1.QueryCurrentValsetRequest request);
  $async.Future<$1.QueryValsetRequestResponse> valsetRequest(
      $grpc.ServiceCall call, $1.QueryValsetRequestRequest request);
  $async.Future<$1.QueryValsetConfirmResponse> valsetConfirm(
      $grpc.ServiceCall call, $1.QueryValsetConfirmRequest request);
  $async.Future<$1.QueryValsetConfirmsByNonceResponse> valsetConfirmsByNonce(
      $grpc.ServiceCall call, $1.QueryValsetConfirmsByNonceRequest request);
  $async.Future<$1.QueryLastValsetRequestsResponse> lastValsetRequests(
      $grpc.ServiceCall call, $1.QueryLastValsetRequestsRequest request);
  $async.Future<$1.QueryLastPendingValsetRequestByAddrResponse>
      lastPendingValsetRequestByAddr($grpc.ServiceCall call,
          $1.QueryLastPendingValsetRequestByAddrRequest request);
  $async.Future<$1.QueryLastPendingBatchRequestByAddrResponse>
      lastPendingBatchRequestByAddr($grpc.ServiceCall call,
          $1.QueryLastPendingBatchRequestByAddrRequest request);
  $async.Future<$1.QueryLastPendingLogicCallByAddrResponse>
      lastPendingLogicCallByAddr($grpc.ServiceCall call,
          $1.QueryLastPendingLogicCallByAddrRequest request);
  $async.Future<$1.QueryLastEventNonceByAddrResponse> lastEventNonceByAddr(
      $grpc.ServiceCall call, $1.QueryLastEventNonceByAddrRequest request);
  $async.Future<$1.QueryBatchFeeResponse> batchFees(
      $grpc.ServiceCall call, $1.QueryBatchFeeRequest request);
  $async.Future<$1.QueryOutgoingTxBatchesResponse> outgoingTxBatches(
      $grpc.ServiceCall call, $1.QueryOutgoingTxBatchesRequest request);
  $async.Future<$1.QueryOutgoingLogicCallsResponse> outgoingLogicCalls(
      $grpc.ServiceCall call, $1.QueryOutgoingLogicCallsRequest request);
  $async.Future<$1.QueryBatchRequestByNonceResponse> batchRequestByNonce(
      $grpc.ServiceCall call, $1.QueryBatchRequestByNonceRequest request);
  $async.Future<$1.QueryBatchConfirmsResponse> batchConfirms(
      $grpc.ServiceCall call, $1.QueryBatchConfirmsRequest request);
  $async.Future<$1.QueryLogicConfirmsResponse> logicConfirms(
      $grpc.ServiceCall call, $1.QueryLogicConfirmsRequest request);
  $async.Future<$1.QueryERC20ToDenomResponse> eRC20ToDenom(
      $grpc.ServiceCall call, $1.QueryERC20ToDenomRequest request);
  $async.Future<$1.QueryDenomToERC20Response> denomToERC20(
      $grpc.ServiceCall call, $1.QueryDenomToERC20Request request);
  $async.Future<$1.QueryLastObservedEthBlockResponse> getLastObservedEthBlock(
      $grpc.ServiceCall call, $1.QueryLastObservedEthBlockRequest request);
  $async.Future<$1.QueryLastObservedEthNonceResponse> getLastObservedEthNonce(
      $grpc.ServiceCall call, $1.QueryLastObservedEthNonceRequest request);
  $async.Future<$1.QueryAttestationsResponse> getAttestations(
      $grpc.ServiceCall call, $1.QueryAttestationsRequest request);
  $async.Future<$1.QueryDelegateKeysByValidatorAddressResponse>
      getDelegateKeyByValidator($grpc.ServiceCall call,
          $1.QueryDelegateKeysByValidatorAddress request);
  $async.Future<$1.QueryDelegateKeysByEthAddressResponse> getDelegateKeyByEth(
      $grpc.ServiceCall call, $1.QueryDelegateKeysByEthAddress request);
  $async.Future<$1.QueryDelegateKeysByOrchestratorAddressResponse>
      getDelegateKeyByOrchestrator($grpc.ServiceCall call,
          $1.QueryDelegateKeysByOrchestratorAddress request);
  $async.Future<$1.QueryPendingSendToEthResponse> getPendingSendToEth(
      $grpc.ServiceCall call, $1.QueryPendingSendToEth request);
  $async.Future<$1.QueryPendingIbcAutoForwardsResponse>
      getPendingIbcAutoForwards(
          $grpc.ServiceCall call, $1.QueryPendingIbcAutoForwards request);
}
