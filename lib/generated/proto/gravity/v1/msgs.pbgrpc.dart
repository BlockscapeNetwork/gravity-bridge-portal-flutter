///
//  Generated code. Do not modify.
//  source: gravity/v1/msgs.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'msgs.pb.dart' as $0;
export 'msgs.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$valsetConfirm =
      $grpc.ClientMethod<$0.MsgValsetConfirm, $0.MsgValsetConfirmResponse>(
          '/gravity.v1.Msg/ValsetConfirm',
          ($0.MsgValsetConfirm value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgValsetConfirmResponse.fromBuffer(value));
  static final _$sendToEth =
      $grpc.ClientMethod<$0.MsgSendToEth, $0.MsgSendToEthResponse>(
          '/gravity.v1.Msg/SendToEth',
          ($0.MsgSendToEth value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgSendToEthResponse.fromBuffer(value));
  static final _$requestBatch =
      $grpc.ClientMethod<$0.MsgRequestBatch, $0.MsgRequestBatchResponse>(
          '/gravity.v1.Msg/RequestBatch',
          ($0.MsgRequestBatch value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgRequestBatchResponse.fromBuffer(value));
  static final _$confirmBatch =
      $grpc.ClientMethod<$0.MsgConfirmBatch, $0.MsgConfirmBatchResponse>(
          '/gravity.v1.Msg/ConfirmBatch',
          ($0.MsgConfirmBatch value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgConfirmBatchResponse.fromBuffer(value));
  static final _$confirmLogicCall = $grpc.ClientMethod<$0.MsgConfirmLogicCall,
          $0.MsgConfirmLogicCallResponse>(
      '/gravity.v1.Msg/ConfirmLogicCall',
      ($0.MsgConfirmLogicCall value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgConfirmLogicCallResponse.fromBuffer(value));
  static final _$sendToCosmosClaim = $grpc.ClientMethod<$0.MsgSendToCosmosClaim,
          $0.MsgSendToCosmosClaimResponse>(
      '/gravity.v1.Msg/SendToCosmosClaim',
      ($0.MsgSendToCosmosClaim value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgSendToCosmosClaimResponse.fromBuffer(value));
  static final _$executeIbcAutoForwards = $grpc.ClientMethod<
          $0.MsgExecuteIbcAutoForwards, $0.MsgExecuteIbcAutoForwardsResponse>(
      '/gravity.v1.Msg/ExecuteIbcAutoForwards',
      ($0.MsgExecuteIbcAutoForwards value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgExecuteIbcAutoForwardsResponse.fromBuffer(value));
  static final _$batchSendToEthClaim = $grpc.ClientMethod<
          $0.MsgBatchSendToEthClaim, $0.MsgBatchSendToEthClaimResponse>(
      '/gravity.v1.Msg/BatchSendToEthClaim',
      ($0.MsgBatchSendToEthClaim value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgBatchSendToEthClaimResponse.fromBuffer(value));
  static final _$valsetUpdateClaim = $grpc.ClientMethod<
          $0.MsgValsetUpdatedClaim, $0.MsgValsetUpdatedClaimResponse>(
      '/gravity.v1.Msg/ValsetUpdateClaim',
      ($0.MsgValsetUpdatedClaim value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgValsetUpdatedClaimResponse.fromBuffer(value));
  static final _$eRC20DeployedClaim = $grpc.ClientMethod<
          $0.MsgERC20DeployedClaim, $0.MsgERC20DeployedClaimResponse>(
      '/gravity.v1.Msg/ERC20DeployedClaim',
      ($0.MsgERC20DeployedClaim value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgERC20DeployedClaimResponse.fromBuffer(value));
  static final _$logicCallExecutedClaim = $grpc.ClientMethod<
          $0.MsgLogicCallExecutedClaim, $0.MsgLogicCallExecutedClaimResponse>(
      '/gravity.v1.Msg/LogicCallExecutedClaim',
      ($0.MsgLogicCallExecutedClaim value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgLogicCallExecutedClaimResponse.fromBuffer(value));
  static final _$setOrchestratorAddress = $grpc.ClientMethod<
          $0.MsgSetOrchestratorAddress, $0.MsgSetOrchestratorAddressResponse>(
      '/gravity.v1.Msg/SetOrchestratorAddress',
      ($0.MsgSetOrchestratorAddress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgSetOrchestratorAddressResponse.fromBuffer(value));
  static final _$cancelSendToEth =
      $grpc.ClientMethod<$0.MsgCancelSendToEth, $0.MsgCancelSendToEthResponse>(
          '/gravity.v1.Msg/CancelSendToEth',
          ($0.MsgCancelSendToEth value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgCancelSendToEthResponse.fromBuffer(value));
  static final _$submitBadSignatureEvidence = $grpc.ClientMethod<
          $0.MsgSubmitBadSignatureEvidence,
          $0.MsgSubmitBadSignatureEvidenceResponse>(
      '/gravity.v1.Msg/SubmitBadSignatureEvidence',
      ($0.MsgSubmitBadSignatureEvidence value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgSubmitBadSignatureEvidenceResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MsgValsetConfirmResponse> valsetConfirm(
      $0.MsgValsetConfirm request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$valsetConfirm, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgSendToEthResponse> sendToEth(
      $0.MsgSendToEth request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendToEth, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgRequestBatchResponse> requestBatch(
      $0.MsgRequestBatch request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestBatch, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgConfirmBatchResponse> confirmBatch(
      $0.MsgConfirmBatch request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$confirmBatch, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgConfirmLogicCallResponse> confirmLogicCall(
      $0.MsgConfirmLogicCall request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$confirmLogicCall, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgSendToCosmosClaimResponse> sendToCosmosClaim(
      $0.MsgSendToCosmosClaim request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendToCosmosClaim, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgExecuteIbcAutoForwardsResponse>
      executeIbcAutoForwards($0.MsgExecuteIbcAutoForwards request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$executeIbcAutoForwards, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.MsgBatchSendToEthClaimResponse> batchSendToEthClaim(
      $0.MsgBatchSendToEthClaim request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$batchSendToEthClaim, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgValsetUpdatedClaimResponse> valsetUpdateClaim(
      $0.MsgValsetUpdatedClaim request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$valsetUpdateClaim, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgERC20DeployedClaimResponse> eRC20DeployedClaim(
      $0.MsgERC20DeployedClaim request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$eRC20DeployedClaim, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgLogicCallExecutedClaimResponse>
      logicCallExecutedClaim($0.MsgLogicCallExecutedClaim request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logicCallExecutedClaim, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.MsgSetOrchestratorAddressResponse>
      setOrchestratorAddress($0.MsgSetOrchestratorAddress request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setOrchestratorAddress, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.MsgCancelSendToEthResponse> cancelSendToEth(
      $0.MsgCancelSendToEth request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelSendToEth, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgSubmitBadSignatureEvidenceResponse>
      submitBadSignatureEvidence($0.MsgSubmitBadSignatureEvidence request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$submitBadSignatureEvidence, request,
        options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'gravity.v1.Msg';

  MsgServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.MsgValsetConfirm, $0.MsgValsetConfirmResponse>(
            'ValsetConfirm',
            valsetConfirm_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MsgValsetConfirm.fromBuffer(value),
            ($0.MsgValsetConfirmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgSendToEth, $0.MsgSendToEthResponse>(
        'SendToEth',
        sendToEth_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgSendToEth.fromBuffer(value),
        ($0.MsgSendToEthResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MsgRequestBatch, $0.MsgRequestBatchResponse>(
            'RequestBatch',
            requestBatch_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MsgRequestBatch.fromBuffer(value),
            ($0.MsgRequestBatchResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MsgConfirmBatch, $0.MsgConfirmBatchResponse>(
            'ConfirmBatch',
            confirmBatch_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MsgConfirmBatch.fromBuffer(value),
            ($0.MsgConfirmBatchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgConfirmLogicCall,
            $0.MsgConfirmLogicCallResponse>(
        'ConfirmLogicCall',
        confirmLogicCall_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgConfirmLogicCall.fromBuffer(value),
        ($0.MsgConfirmLogicCallResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgSendToCosmosClaim,
            $0.MsgSendToCosmosClaimResponse>(
        'SendToCosmosClaim',
        sendToCosmosClaim_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgSendToCosmosClaim.fromBuffer(value),
        ($0.MsgSendToCosmosClaimResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgExecuteIbcAutoForwards,
            $0.MsgExecuteIbcAutoForwardsResponse>(
        'ExecuteIbcAutoForwards',
        executeIbcAutoForwards_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgExecuteIbcAutoForwards.fromBuffer(value),
        ($0.MsgExecuteIbcAutoForwardsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgBatchSendToEthClaim,
            $0.MsgBatchSendToEthClaimResponse>(
        'BatchSendToEthClaim',
        batchSendToEthClaim_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgBatchSendToEthClaim.fromBuffer(value),
        ($0.MsgBatchSendToEthClaimResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgValsetUpdatedClaim,
            $0.MsgValsetUpdatedClaimResponse>(
        'ValsetUpdateClaim',
        valsetUpdateClaim_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgValsetUpdatedClaim.fromBuffer(value),
        ($0.MsgValsetUpdatedClaimResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgERC20DeployedClaim,
            $0.MsgERC20DeployedClaimResponse>(
        'ERC20DeployedClaim',
        eRC20DeployedClaim_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgERC20DeployedClaim.fromBuffer(value),
        ($0.MsgERC20DeployedClaimResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgLogicCallExecutedClaim,
            $0.MsgLogicCallExecutedClaimResponse>(
        'LogicCallExecutedClaim',
        logicCallExecutedClaim_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgLogicCallExecutedClaim.fromBuffer(value),
        ($0.MsgLogicCallExecutedClaimResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgSetOrchestratorAddress,
            $0.MsgSetOrchestratorAddressResponse>(
        'SetOrchestratorAddress',
        setOrchestratorAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgSetOrchestratorAddress.fromBuffer(value),
        ($0.MsgSetOrchestratorAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgCancelSendToEth,
            $0.MsgCancelSendToEthResponse>(
        'CancelSendToEth',
        cancelSendToEth_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgCancelSendToEth.fromBuffer(value),
        ($0.MsgCancelSendToEthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgSubmitBadSignatureEvidence,
            $0.MsgSubmitBadSignatureEvidenceResponse>(
        'SubmitBadSignatureEvidence',
        submitBadSignatureEvidence_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgSubmitBadSignatureEvidence.fromBuffer(value),
        ($0.MsgSubmitBadSignatureEvidenceResponse value) =>
            value.writeToBuffer()));
  }

  $async.Future<$0.MsgValsetConfirmResponse> valsetConfirm_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgValsetConfirm> request) async {
    return valsetConfirm(call, await request);
  }

  $async.Future<$0.MsgSendToEthResponse> sendToEth_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgSendToEth> request) async {
    return sendToEth(call, await request);
  }

  $async.Future<$0.MsgRequestBatchResponse> requestBatch_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgRequestBatch> request) async {
    return requestBatch(call, await request);
  }

  $async.Future<$0.MsgConfirmBatchResponse> confirmBatch_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgConfirmBatch> request) async {
    return confirmBatch(call, await request);
  }

  $async.Future<$0.MsgConfirmLogicCallResponse> confirmLogicCall_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgConfirmLogicCall> request) async {
    return confirmLogicCall(call, await request);
  }

  $async.Future<$0.MsgSendToCosmosClaimResponse> sendToCosmosClaim_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgSendToCosmosClaim> request) async {
    return sendToCosmosClaim(call, await request);
  }

  $async.Future<$0.MsgExecuteIbcAutoForwardsResponse>
      executeIbcAutoForwards_Pre($grpc.ServiceCall call,
          $async.Future<$0.MsgExecuteIbcAutoForwards> request) async {
    return executeIbcAutoForwards(call, await request);
  }

  $async.Future<$0.MsgBatchSendToEthClaimResponse> batchSendToEthClaim_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgBatchSendToEthClaim> request) async {
    return batchSendToEthClaim(call, await request);
  }

  $async.Future<$0.MsgValsetUpdatedClaimResponse> valsetUpdateClaim_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgValsetUpdatedClaim> request) async {
    return valsetUpdateClaim(call, await request);
  }

  $async.Future<$0.MsgERC20DeployedClaimResponse> eRC20DeployedClaim_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgERC20DeployedClaim> request) async {
    return eRC20DeployedClaim(call, await request);
  }

  $async.Future<$0.MsgLogicCallExecutedClaimResponse>
      logicCallExecutedClaim_Pre($grpc.ServiceCall call,
          $async.Future<$0.MsgLogicCallExecutedClaim> request) async {
    return logicCallExecutedClaim(call, await request);
  }

  $async.Future<$0.MsgSetOrchestratorAddressResponse>
      setOrchestratorAddress_Pre($grpc.ServiceCall call,
          $async.Future<$0.MsgSetOrchestratorAddress> request) async {
    return setOrchestratorAddress(call, await request);
  }

  $async.Future<$0.MsgCancelSendToEthResponse> cancelSendToEth_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgCancelSendToEth> request) async {
    return cancelSendToEth(call, await request);
  }

  $async.Future<$0.MsgSubmitBadSignatureEvidenceResponse>
      submitBadSignatureEvidence_Pre($grpc.ServiceCall call,
          $async.Future<$0.MsgSubmitBadSignatureEvidence> request) async {
    return submitBadSignatureEvidence(call, await request);
  }

  $async.Future<$0.MsgValsetConfirmResponse> valsetConfirm(
      $grpc.ServiceCall call, $0.MsgValsetConfirm request);
  $async.Future<$0.MsgSendToEthResponse> sendToEth(
      $grpc.ServiceCall call, $0.MsgSendToEth request);
  $async.Future<$0.MsgRequestBatchResponse> requestBatch(
      $grpc.ServiceCall call, $0.MsgRequestBatch request);
  $async.Future<$0.MsgConfirmBatchResponse> confirmBatch(
      $grpc.ServiceCall call, $0.MsgConfirmBatch request);
  $async.Future<$0.MsgConfirmLogicCallResponse> confirmLogicCall(
      $grpc.ServiceCall call, $0.MsgConfirmLogicCall request);
  $async.Future<$0.MsgSendToCosmosClaimResponse> sendToCosmosClaim(
      $grpc.ServiceCall call, $0.MsgSendToCosmosClaim request);
  $async.Future<$0.MsgExecuteIbcAutoForwardsResponse> executeIbcAutoForwards(
      $grpc.ServiceCall call, $0.MsgExecuteIbcAutoForwards request);
  $async.Future<$0.MsgBatchSendToEthClaimResponse> batchSendToEthClaim(
      $grpc.ServiceCall call, $0.MsgBatchSendToEthClaim request);
  $async.Future<$0.MsgValsetUpdatedClaimResponse> valsetUpdateClaim(
      $grpc.ServiceCall call, $0.MsgValsetUpdatedClaim request);
  $async.Future<$0.MsgERC20DeployedClaimResponse> eRC20DeployedClaim(
      $grpc.ServiceCall call, $0.MsgERC20DeployedClaim request);
  $async.Future<$0.MsgLogicCallExecutedClaimResponse> logicCallExecutedClaim(
      $grpc.ServiceCall call, $0.MsgLogicCallExecutedClaim request);
  $async.Future<$0.MsgSetOrchestratorAddressResponse> setOrchestratorAddress(
      $grpc.ServiceCall call, $0.MsgSetOrchestratorAddress request);
  $async.Future<$0.MsgCancelSendToEthResponse> cancelSendToEth(
      $grpc.ServiceCall call, $0.MsgCancelSendToEth request);
  $async.Future<$0.MsgSubmitBadSignatureEvidenceResponse>
      submitBadSignatureEvidence(
          $grpc.ServiceCall call, $0.MsgSubmitBadSignatureEvidence request);
}
