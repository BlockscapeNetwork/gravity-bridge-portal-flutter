///
//  Generated code. Do not modify.
//  source: gravity/v1/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../cosmos/base/v1beta1/coin.pb.dart' as $9;
import 'types.pb.dart' as $11;
import 'msgs.pb.dart' as $0;
import 'batch.pb.dart' as $14;
import 'attestation.pb.dart' as $13;

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Params', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gravityId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contractSourceHash')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeEthereumAddress')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedValsetsWindow', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedBatchesWindow', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedLogicCallsWindow', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetBatchTimeout', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'averageBlockTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'averageEthereumBlockTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slashFractionValset', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slashFractionBatch', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slashFractionLogicCall', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbondSlashingValsetsWindow', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slashFractionBadEthSignature', $pb.PbFieldType.OY)
    ..aOM<$9.Coin>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valsetReward', subBuilder: $9.Coin.create)
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeActive')
    ..pPS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethereumBlacklist')
    ..a<$fixnum.Int64>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minChainFeeBasisPoints', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Params._() : super();
  factory Params({
    $core.String? gravityId,
    $core.String? contractSourceHash,
    $core.String? bridgeEthereumAddress,
    $fixnum.Int64? bridgeChainId,
    $fixnum.Int64? signedValsetsWindow,
    $fixnum.Int64? signedBatchesWindow,
    $fixnum.Int64? signedLogicCallsWindow,
    $fixnum.Int64? targetBatchTimeout,
    $fixnum.Int64? averageBlockTime,
    $fixnum.Int64? averageEthereumBlockTime,
    $core.List<$core.int>? slashFractionValset,
    $core.List<$core.int>? slashFractionBatch,
    $core.List<$core.int>? slashFractionLogicCall,
    $fixnum.Int64? unbondSlashingValsetsWindow,
    $core.List<$core.int>? slashFractionBadEthSignature,
    $9.Coin? valsetReward,
    $core.bool? bridgeActive,
    $core.Iterable<$core.String>? ethereumBlacklist,
    $fixnum.Int64? minChainFeeBasisPoints,
  }) {
    final _result = create();
    if (gravityId != null) {
      _result.gravityId = gravityId;
    }
    if (contractSourceHash != null) {
      _result.contractSourceHash = contractSourceHash;
    }
    if (bridgeEthereumAddress != null) {
      _result.bridgeEthereumAddress = bridgeEthereumAddress;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    if (signedValsetsWindow != null) {
      _result.signedValsetsWindow = signedValsetsWindow;
    }
    if (signedBatchesWindow != null) {
      _result.signedBatchesWindow = signedBatchesWindow;
    }
    if (signedLogicCallsWindow != null) {
      _result.signedLogicCallsWindow = signedLogicCallsWindow;
    }
    if (targetBatchTimeout != null) {
      _result.targetBatchTimeout = targetBatchTimeout;
    }
    if (averageBlockTime != null) {
      _result.averageBlockTime = averageBlockTime;
    }
    if (averageEthereumBlockTime != null) {
      _result.averageEthereumBlockTime = averageEthereumBlockTime;
    }
    if (slashFractionValset != null) {
      _result.slashFractionValset = slashFractionValset;
    }
    if (slashFractionBatch != null) {
      _result.slashFractionBatch = slashFractionBatch;
    }
    if (slashFractionLogicCall != null) {
      _result.slashFractionLogicCall = slashFractionLogicCall;
    }
    if (unbondSlashingValsetsWindow != null) {
      _result.unbondSlashingValsetsWindow = unbondSlashingValsetsWindow;
    }
    if (slashFractionBadEthSignature != null) {
      _result.slashFractionBadEthSignature = slashFractionBadEthSignature;
    }
    if (valsetReward != null) {
      _result.valsetReward = valsetReward;
    }
    if (bridgeActive != null) {
      _result.bridgeActive = bridgeActive;
    }
    if (ethereumBlacklist != null) {
      _result.ethereumBlacklist.addAll(ethereumBlacklist);
    }
    if (minChainFeeBasisPoints != null) {
      _result.minChainFeeBasisPoints = minChainFeeBasisPoints;
    }
    return _result;
  }
  factory Params.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Params.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Params clone() => Params()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Params copyWith(void Function(Params) updates) => super.copyWith((message) => updates(message as Params)) as Params; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Params create() => Params._();
  Params createEmptyInstance() => create();
  static $pb.PbList<Params> createRepeated() => $pb.PbList<Params>();
  @$core.pragma('dart2js:noInline')
  static Params getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Params>(create);
  static Params? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gravityId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gravityId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGravityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGravityId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contractSourceHash => $_getSZ(1);
  @$pb.TagNumber(2)
  set contractSourceHash($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractSourceHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractSourceHash() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get bridgeEthereumAddress => $_getSZ(2);
  @$pb.TagNumber(4)
  set bridgeEthereumAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasBridgeEthereumAddress() => $_has(2);
  @$pb.TagNumber(4)
  void clearBridgeEthereumAddress() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get bridgeChainId => $_getI64(3);
  @$pb.TagNumber(5)
  set bridgeChainId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasBridgeChainId() => $_has(3);
  @$pb.TagNumber(5)
  void clearBridgeChainId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get signedValsetsWindow => $_getI64(4);
  @$pb.TagNumber(6)
  set signedValsetsWindow($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasSignedValsetsWindow() => $_has(4);
  @$pb.TagNumber(6)
  void clearSignedValsetsWindow() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get signedBatchesWindow => $_getI64(5);
  @$pb.TagNumber(7)
  set signedBatchesWindow($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasSignedBatchesWindow() => $_has(5);
  @$pb.TagNumber(7)
  void clearSignedBatchesWindow() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get signedLogicCallsWindow => $_getI64(6);
  @$pb.TagNumber(8)
  set signedLogicCallsWindow($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasSignedLogicCallsWindow() => $_has(6);
  @$pb.TagNumber(8)
  void clearSignedLogicCallsWindow() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get targetBatchTimeout => $_getI64(7);
  @$pb.TagNumber(9)
  set targetBatchTimeout($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasTargetBatchTimeout() => $_has(7);
  @$pb.TagNumber(9)
  void clearTargetBatchTimeout() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get averageBlockTime => $_getI64(8);
  @$pb.TagNumber(10)
  set averageBlockTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasAverageBlockTime() => $_has(8);
  @$pb.TagNumber(10)
  void clearAverageBlockTime() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get averageEthereumBlockTime => $_getI64(9);
  @$pb.TagNumber(11)
  set averageEthereumBlockTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasAverageEthereumBlockTime() => $_has(9);
  @$pb.TagNumber(11)
  void clearAverageEthereumBlockTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get slashFractionValset => $_getN(10);
  @$pb.TagNumber(12)
  set slashFractionValset($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasSlashFractionValset() => $_has(10);
  @$pb.TagNumber(12)
  void clearSlashFractionValset() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.int> get slashFractionBatch => $_getN(11);
  @$pb.TagNumber(13)
  set slashFractionBatch($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasSlashFractionBatch() => $_has(11);
  @$pb.TagNumber(13)
  void clearSlashFractionBatch() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$core.int> get slashFractionLogicCall => $_getN(12);
  @$pb.TagNumber(14)
  set slashFractionLogicCall($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasSlashFractionLogicCall() => $_has(12);
  @$pb.TagNumber(14)
  void clearSlashFractionLogicCall() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get unbondSlashingValsetsWindow => $_getI64(13);
  @$pb.TagNumber(15)
  set unbondSlashingValsetsWindow($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasUnbondSlashingValsetsWindow() => $_has(13);
  @$pb.TagNumber(15)
  void clearUnbondSlashingValsetsWindow() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.int> get slashFractionBadEthSignature => $_getN(14);
  @$pb.TagNumber(16)
  set slashFractionBadEthSignature($core.List<$core.int> v) { $_setBytes(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasSlashFractionBadEthSignature() => $_has(14);
  @$pb.TagNumber(16)
  void clearSlashFractionBadEthSignature() => clearField(16);

  @$pb.TagNumber(17)
  $9.Coin get valsetReward => $_getN(15);
  @$pb.TagNumber(17)
  set valsetReward($9.Coin v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasValsetReward() => $_has(15);
  @$pb.TagNumber(17)
  void clearValsetReward() => clearField(17);
  @$pb.TagNumber(17)
  $9.Coin ensureValsetReward() => $_ensure(15);

  @$pb.TagNumber(18)
  $core.bool get bridgeActive => $_getBF(16);
  @$pb.TagNumber(18)
  set bridgeActive($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(18)
  $core.bool hasBridgeActive() => $_has(16);
  @$pb.TagNumber(18)
  void clearBridgeActive() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<$core.String> get ethereumBlacklist => $_getList(17);

  @$pb.TagNumber(20)
  $fixnum.Int64 get minChainFeeBasisPoints => $_getI64(18);
  @$pb.TagNumber(20)
  set minChainFeeBasisPoints($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(20)
  $core.bool hasMinChainFeeBasisPoints() => $_has(18);
  @$pb.TagNumber(20)
  void clearMinChainFeeBasisPoints() => clearField(20);
}

class GenesisState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenesisState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<Params>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: Params.create)
    ..aOM<GravityNonces>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gravityNonces', subBuilder: GravityNonces.create)
    ..pc<$11.Valset>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valsets', $pb.PbFieldType.PM, subBuilder: $11.Valset.create)
    ..pc<$0.MsgValsetConfirm>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valsetConfirms', $pb.PbFieldType.PM, subBuilder: $0.MsgValsetConfirm.create)
    ..pc<$14.OutgoingTxBatch>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batches', $pb.PbFieldType.PM, subBuilder: $14.OutgoingTxBatch.create)
    ..pc<$0.MsgConfirmBatch>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchConfirms', $pb.PbFieldType.PM, subBuilder: $0.MsgConfirmBatch.create)
    ..pc<$14.OutgoingLogicCall>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logicCalls', $pb.PbFieldType.PM, subBuilder: $14.OutgoingLogicCall.create)
    ..pc<$0.MsgConfirmLogicCall>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logicCallConfirms', $pb.PbFieldType.PM, subBuilder: $0.MsgConfirmLogicCall.create)
    ..pc<$13.Attestation>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestations', $pb.PbFieldType.PM, subBuilder: $13.Attestation.create)
    ..pc<$0.MsgSetOrchestratorAddress>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegateKeys', $pb.PbFieldType.PM, subBuilder: $0.MsgSetOrchestratorAddress.create)
    ..pc<$11.ERC20ToDenom>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'erc20ToDenoms', $pb.PbFieldType.PM, subBuilder: $11.ERC20ToDenom.create)
    ..pc<$14.OutgoingTransferTx>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbatchedTransfers', $pb.PbFieldType.PM, subBuilder: $14.OutgoingTransferTx.create)
    ..pc<$11.PendingIbcAutoForward>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pendingIbcAutoForwards', $pb.PbFieldType.PM, subBuilder: $11.PendingIbcAutoForward.create)
    ..hasRequiredFields = false
  ;

  GenesisState._() : super();
  factory GenesisState({
    Params? params,
    GravityNonces? gravityNonces,
    $core.Iterable<$11.Valset>? valsets,
    $core.Iterable<$0.MsgValsetConfirm>? valsetConfirms,
    $core.Iterable<$14.OutgoingTxBatch>? batches,
    $core.Iterable<$0.MsgConfirmBatch>? batchConfirms,
    $core.Iterable<$14.OutgoingLogicCall>? logicCalls,
    $core.Iterable<$0.MsgConfirmLogicCall>? logicCallConfirms,
    $core.Iterable<$13.Attestation>? attestations,
    $core.Iterable<$0.MsgSetOrchestratorAddress>? delegateKeys,
    $core.Iterable<$11.ERC20ToDenom>? erc20ToDenoms,
    $core.Iterable<$14.OutgoingTransferTx>? unbatchedTransfers,
    $core.Iterable<$11.PendingIbcAutoForward>? pendingIbcAutoForwards,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    if (gravityNonces != null) {
      _result.gravityNonces = gravityNonces;
    }
    if (valsets != null) {
      _result.valsets.addAll(valsets);
    }
    if (valsetConfirms != null) {
      _result.valsetConfirms.addAll(valsetConfirms);
    }
    if (batches != null) {
      _result.batches.addAll(batches);
    }
    if (batchConfirms != null) {
      _result.batchConfirms.addAll(batchConfirms);
    }
    if (logicCalls != null) {
      _result.logicCalls.addAll(logicCalls);
    }
    if (logicCallConfirms != null) {
      _result.logicCallConfirms.addAll(logicCallConfirms);
    }
    if (attestations != null) {
      _result.attestations.addAll(attestations);
    }
    if (delegateKeys != null) {
      _result.delegateKeys.addAll(delegateKeys);
    }
    if (erc20ToDenoms != null) {
      _result.erc20ToDenoms.addAll(erc20ToDenoms);
    }
    if (unbatchedTransfers != null) {
      _result.unbatchedTransfers.addAll(unbatchedTransfers);
    }
    if (pendingIbcAutoForwards != null) {
      _result.pendingIbcAutoForwards.addAll(pendingIbcAutoForwards);
    }
    return _result;
  }
  factory GenesisState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenesisState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenesisState clone() => GenesisState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenesisState copyWith(void Function(GenesisState) updates) => super.copyWith((message) => updates(message as GenesisState)) as GenesisState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenesisState create() => GenesisState._();
  GenesisState createEmptyInstance() => create();
  static $pb.PbList<GenesisState> createRepeated() => $pb.PbList<GenesisState>();
  @$core.pragma('dart2js:noInline')
  static GenesisState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenesisState>(create);
  static GenesisState? _defaultInstance;

  @$pb.TagNumber(1)
  Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(Params v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  Params ensureParams() => $_ensure(0);

  @$pb.TagNumber(2)
  GravityNonces get gravityNonces => $_getN(1);
  @$pb.TagNumber(2)
  set gravityNonces(GravityNonces v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGravityNonces() => $_has(1);
  @$pb.TagNumber(2)
  void clearGravityNonces() => clearField(2);
  @$pb.TagNumber(2)
  GravityNonces ensureGravityNonces() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$11.Valset> get valsets => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.MsgValsetConfirm> get valsetConfirms => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$14.OutgoingTxBatch> get batches => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$0.MsgConfirmBatch> get batchConfirms => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$14.OutgoingLogicCall> get logicCalls => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$0.MsgConfirmLogicCall> get logicCallConfirms => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$13.Attestation> get attestations => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$0.MsgSetOrchestratorAddress> get delegateKeys => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<$11.ERC20ToDenom> get erc20ToDenoms => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<$14.OutgoingTransferTx> get unbatchedTransfers => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<$11.PendingIbcAutoForward> get pendingIbcAutoForwards => $_getList(12);
}

class GravityNonces extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GravityNonces', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latestValsetNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastObservedNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastSlashedValsetNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastSlashedBatchBlock', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastSlashedLogicCallBlock', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastTxPoolId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastBatchId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GravityNonces._() : super();
  factory GravityNonces({
    $fixnum.Int64? latestValsetNonce,
    $fixnum.Int64? lastObservedNonce,
    $fixnum.Int64? lastSlashedValsetNonce,
    $fixnum.Int64? lastSlashedBatchBlock,
    $fixnum.Int64? lastSlashedLogicCallBlock,
    $fixnum.Int64? lastTxPoolId,
    $fixnum.Int64? lastBatchId,
  }) {
    final _result = create();
    if (latestValsetNonce != null) {
      _result.latestValsetNonce = latestValsetNonce;
    }
    if (lastObservedNonce != null) {
      _result.lastObservedNonce = lastObservedNonce;
    }
    if (lastSlashedValsetNonce != null) {
      _result.lastSlashedValsetNonce = lastSlashedValsetNonce;
    }
    if (lastSlashedBatchBlock != null) {
      _result.lastSlashedBatchBlock = lastSlashedBatchBlock;
    }
    if (lastSlashedLogicCallBlock != null) {
      _result.lastSlashedLogicCallBlock = lastSlashedLogicCallBlock;
    }
    if (lastTxPoolId != null) {
      _result.lastTxPoolId = lastTxPoolId;
    }
    if (lastBatchId != null) {
      _result.lastBatchId = lastBatchId;
    }
    return _result;
  }
  factory GravityNonces.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GravityNonces.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GravityNonces clone() => GravityNonces()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GravityNonces copyWith(void Function(GravityNonces) updates) => super.copyWith((message) => updates(message as GravityNonces)) as GravityNonces; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GravityNonces create() => GravityNonces._();
  GravityNonces createEmptyInstance() => create();
  static $pb.PbList<GravityNonces> createRepeated() => $pb.PbList<GravityNonces>();
  @$core.pragma('dart2js:noInline')
  static GravityNonces getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GravityNonces>(create);
  static GravityNonces? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get latestValsetNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set latestValsetNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatestValsetNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatestValsetNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastObservedNonce => $_getI64(1);
  @$pb.TagNumber(2)
  set lastObservedNonce($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastObservedNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastObservedNonce() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastSlashedValsetNonce => $_getI64(2);
  @$pb.TagNumber(3)
  set lastSlashedValsetNonce($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastSlashedValsetNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastSlashedValsetNonce() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastSlashedBatchBlock => $_getI64(3);
  @$pb.TagNumber(4)
  set lastSlashedBatchBlock($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastSlashedBatchBlock() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastSlashedBatchBlock() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastSlashedLogicCallBlock => $_getI64(4);
  @$pb.TagNumber(5)
  set lastSlashedLogicCallBlock($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastSlashedLogicCallBlock() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastSlashedLogicCallBlock() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastTxPoolId => $_getI64(5);
  @$pb.TagNumber(6)
  set lastTxPoolId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastTxPoolId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastTxPoolId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastBatchId => $_getI64(6);
  @$pb.TagNumber(7)
  set lastBatchId($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastBatchId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastBatchId() => clearField(7);
}

