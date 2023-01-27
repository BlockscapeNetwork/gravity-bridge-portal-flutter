///
//  Generated code. Do not modify.
//  source: gravity/v1/batch.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'attestation.pb.dart' as $13;

class OutgoingTxBatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OutgoingTxBatch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchTimeout', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<OutgoingTransferTx>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: OutgoingTransferTx.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenContract')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosBlockCreated', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  OutgoingTxBatch._() : super();
  factory OutgoingTxBatch({
    $fixnum.Int64? batchNonce,
    $fixnum.Int64? batchTimeout,
    $core.Iterable<OutgoingTransferTx>? transactions,
    $core.String? tokenContract,
    $fixnum.Int64? cosmosBlockCreated,
  }) {
    final _result = create();
    if (batchNonce != null) {
      _result.batchNonce = batchNonce;
    }
    if (batchTimeout != null) {
      _result.batchTimeout = batchTimeout;
    }
    if (transactions != null) {
      _result.transactions.addAll(transactions);
    }
    if (tokenContract != null) {
      _result.tokenContract = tokenContract;
    }
    if (cosmosBlockCreated != null) {
      _result.cosmosBlockCreated = cosmosBlockCreated;
    }
    return _result;
  }
  factory OutgoingTxBatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OutgoingTxBatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OutgoingTxBatch clone() => OutgoingTxBatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OutgoingTxBatch copyWith(void Function(OutgoingTxBatch) updates) => super.copyWith((message) => updates(message as OutgoingTxBatch)) as OutgoingTxBatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutgoingTxBatch create() => OutgoingTxBatch._();
  OutgoingTxBatch createEmptyInstance() => create();
  static $pb.PbList<OutgoingTxBatch> createRepeated() => $pb.PbList<OutgoingTxBatch>();
  @$core.pragma('dart2js:noInline')
  static OutgoingTxBatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutgoingTxBatch>(create);
  static OutgoingTxBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get batchNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set batchNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBatchNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get batchTimeout => $_getI64(1);
  @$pb.TagNumber(2)
  set batchTimeout($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBatchTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearBatchTimeout() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<OutgoingTransferTx> get transactions => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get tokenContract => $_getSZ(3);
  @$pb.TagNumber(4)
  set tokenContract($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenContract() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenContract() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get cosmosBlockCreated => $_getI64(4);
  @$pb.TagNumber(5)
  set cosmosBlockCreated($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCosmosBlockCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCosmosBlockCreated() => clearField(5);
}

class OutgoingTransferTx extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OutgoingTransferTx', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destAddress')
    ..aOM<$13.ERC20Token>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'erc20Token', subBuilder: $13.ERC20Token.create)
    ..aOM<$13.ERC20Token>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'erc20Fee', subBuilder: $13.ERC20Token.create)
    ..hasRequiredFields = false
  ;

  OutgoingTransferTx._() : super();
  factory OutgoingTransferTx({
    $fixnum.Int64? id,
    $core.String? sender,
    $core.String? destAddress,
    $13.ERC20Token? erc20Token,
    $13.ERC20Token? erc20Fee,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    if (destAddress != null) {
      _result.destAddress = destAddress;
    }
    if (erc20Token != null) {
      _result.erc20Token = erc20Token;
    }
    if (erc20Fee != null) {
      _result.erc20Fee = erc20Fee;
    }
    return _result;
  }
  factory OutgoingTransferTx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OutgoingTransferTx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OutgoingTransferTx clone() => OutgoingTransferTx()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OutgoingTransferTx copyWith(void Function(OutgoingTransferTx) updates) => super.copyWith((message) => updates(message as OutgoingTransferTx)) as OutgoingTransferTx; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutgoingTransferTx create() => OutgoingTransferTx._();
  OutgoingTransferTx createEmptyInstance() => create();
  static $pb.PbList<OutgoingTransferTx> createRepeated() => $pb.PbList<OutgoingTransferTx>();
  @$core.pragma('dart2js:noInline')
  static OutgoingTransferTx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutgoingTransferTx>(create);
  static OutgoingTransferTx? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sender => $_getSZ(1);
  @$pb.TagNumber(2)
  set sender($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get destAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set destAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestAddress() => clearField(3);

  @$pb.TagNumber(4)
  $13.ERC20Token get erc20Token => $_getN(3);
  @$pb.TagNumber(4)
  set erc20Token($13.ERC20Token v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasErc20Token() => $_has(3);
  @$pb.TagNumber(4)
  void clearErc20Token() => clearField(4);
  @$pb.TagNumber(4)
  $13.ERC20Token ensureErc20Token() => $_ensure(3);

  @$pb.TagNumber(5)
  $13.ERC20Token get erc20Fee => $_getN(4);
  @$pb.TagNumber(5)
  set erc20Fee($13.ERC20Token v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasErc20Fee() => $_has(4);
  @$pb.TagNumber(5)
  void clearErc20Fee() => clearField(5);
  @$pb.TagNumber(5)
  $13.ERC20Token ensureErc20Fee() => $_ensure(4);
}

class OutgoingLogicCall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OutgoingLogicCall', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$13.ERC20Token>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transfers', $pb.PbFieldType.PM, subBuilder: $13.ERC20Token.create)
    ..pc<$13.ERC20Token>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fees', $pb.PbFieldType.PM, subBuilder: $13.ERC20Token.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logicContractAddress')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeout', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosBlockCreated', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  OutgoingLogicCall._() : super();
  factory OutgoingLogicCall({
    $core.Iterable<$13.ERC20Token>? transfers,
    $core.Iterable<$13.ERC20Token>? fees,
    $core.String? logicContractAddress,
    $core.List<$core.int>? payload,
    $fixnum.Int64? timeout,
    $core.List<$core.int>? invalidationId,
    $fixnum.Int64? invalidationNonce,
    $fixnum.Int64? cosmosBlockCreated,
  }) {
    final _result = create();
    if (transfers != null) {
      _result.transfers.addAll(transfers);
    }
    if (fees != null) {
      _result.fees.addAll(fees);
    }
    if (logicContractAddress != null) {
      _result.logicContractAddress = logicContractAddress;
    }
    if (payload != null) {
      _result.payload = payload;
    }
    if (timeout != null) {
      _result.timeout = timeout;
    }
    if (invalidationId != null) {
      _result.invalidationId = invalidationId;
    }
    if (invalidationNonce != null) {
      _result.invalidationNonce = invalidationNonce;
    }
    if (cosmosBlockCreated != null) {
      _result.cosmosBlockCreated = cosmosBlockCreated;
    }
    return _result;
  }
  factory OutgoingLogicCall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OutgoingLogicCall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OutgoingLogicCall clone() => OutgoingLogicCall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OutgoingLogicCall copyWith(void Function(OutgoingLogicCall) updates) => super.copyWith((message) => updates(message as OutgoingLogicCall)) as OutgoingLogicCall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutgoingLogicCall create() => OutgoingLogicCall._();
  OutgoingLogicCall createEmptyInstance() => create();
  static $pb.PbList<OutgoingLogicCall> createRepeated() => $pb.PbList<OutgoingLogicCall>();
  @$core.pragma('dart2js:noInline')
  static OutgoingLogicCall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutgoingLogicCall>(create);
  static OutgoingLogicCall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$13.ERC20Token> get transfers => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$13.ERC20Token> get fees => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get logicContractAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set logicContractAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogicContractAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogicContractAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get payload => $_getN(3);
  @$pb.TagNumber(4)
  set payload($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPayload() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayload() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timeout => $_getI64(4);
  @$pb.TagNumber(5)
  set timeout($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimeout() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeout() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get invalidationId => $_getN(5);
  @$pb.TagNumber(6)
  set invalidationId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInvalidationId() => $_has(5);
  @$pb.TagNumber(6)
  void clearInvalidationId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get invalidationNonce => $_getI64(6);
  @$pb.TagNumber(7)
  set invalidationNonce($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInvalidationNonce() => $_has(6);
  @$pb.TagNumber(7)
  void clearInvalidationNonce() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get cosmosBlockCreated => $_getI64(7);
  @$pb.TagNumber(8)
  set cosmosBlockCreated($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCosmosBlockCreated() => $_has(7);
  @$pb.TagNumber(8)
  void clearCosmosBlockCreated() => clearField(8);
}

class EventOutgoingBatchCanceled extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventOutgoingBatchCanceled', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeContract')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventOutgoingBatchCanceled._() : super();
  factory EventOutgoingBatchCanceled({
    $core.String? bridgeContract,
    $core.String? bridgeChainId,
    $core.String? batchId,
    $core.String? nonce,
  }) {
    final _result = create();
    if (bridgeContract != null) {
      _result.bridgeContract = bridgeContract;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    if (batchId != null) {
      _result.batchId = batchId;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventOutgoingBatchCanceled.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventOutgoingBatchCanceled.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventOutgoingBatchCanceled clone() => EventOutgoingBatchCanceled()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventOutgoingBatchCanceled copyWith(void Function(EventOutgoingBatchCanceled) updates) => super.copyWith((message) => updates(message as EventOutgoingBatchCanceled)) as EventOutgoingBatchCanceled; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventOutgoingBatchCanceled create() => EventOutgoingBatchCanceled._();
  EventOutgoingBatchCanceled createEmptyInstance() => create();
  static $pb.PbList<EventOutgoingBatchCanceled> createRepeated() => $pb.PbList<EventOutgoingBatchCanceled>();
  @$core.pragma('dart2js:noInline')
  static EventOutgoingBatchCanceled getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventOutgoingBatchCanceled>(create);
  static EventOutgoingBatchCanceled? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bridgeContract => $_getSZ(0);
  @$pb.TagNumber(1)
  set bridgeContract($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBridgeContract() => $_has(0);
  @$pb.TagNumber(1)
  void clearBridgeContract() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bridgeChainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set bridgeChainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBridgeChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBridgeChainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get batchId => $_getSZ(2);
  @$pb.TagNumber(3)
  set batchId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBatchId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatchId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nonce => $_getSZ(3);
  @$pb.TagNumber(4)
  set nonce($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => clearField(4);
}

class EventOutgoingBatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventOutgoingBatch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeContract')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventOutgoingBatch._() : super();
  factory EventOutgoingBatch({
    $core.String? bridgeContract,
    $core.String? bridgeChainId,
    $core.String? batchId,
    $core.String? nonce,
  }) {
    final _result = create();
    if (bridgeContract != null) {
      _result.bridgeContract = bridgeContract;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    if (batchId != null) {
      _result.batchId = batchId;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventOutgoingBatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventOutgoingBatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventOutgoingBatch clone() => EventOutgoingBatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventOutgoingBatch copyWith(void Function(EventOutgoingBatch) updates) => super.copyWith((message) => updates(message as EventOutgoingBatch)) as EventOutgoingBatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventOutgoingBatch create() => EventOutgoingBatch._();
  EventOutgoingBatch createEmptyInstance() => create();
  static $pb.PbList<EventOutgoingBatch> createRepeated() => $pb.PbList<EventOutgoingBatch>();
  @$core.pragma('dart2js:noInline')
  static EventOutgoingBatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventOutgoingBatch>(create);
  static EventOutgoingBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bridgeContract => $_getSZ(0);
  @$pb.TagNumber(1)
  set bridgeContract($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBridgeContract() => $_has(0);
  @$pb.TagNumber(1)
  void clearBridgeContract() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bridgeChainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set bridgeChainId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBridgeChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBridgeChainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get batchId => $_getSZ(2);
  @$pb.TagNumber(3)
  set batchId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBatchId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatchId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nonce => $_getSZ(3);
  @$pb.TagNumber(4)
  set nonce($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => clearField(4);
}

