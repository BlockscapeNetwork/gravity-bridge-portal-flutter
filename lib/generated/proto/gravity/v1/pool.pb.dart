///
//  Generated code. Do not modify.
//  source: gravity/v1/pool.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class IDSet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IDSet', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.PU6)
    ..hasRequiredFields = false
  ;

  IDSet._() : super();
  factory IDSet({
    $core.Iterable<$fixnum.Int64>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory IDSet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IDSet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IDSet clone() => IDSet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IDSet copyWith(void Function(IDSet) updates) => super.copyWith((message) => updates(message as IDSet)) as IDSet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IDSet create() => IDSet._();
  IDSet createEmptyInstance() => create();
  static $pb.PbList<IDSet> createRepeated() => $pb.PbList<IDSet>();
  @$core.pragma('dart2js:noInline')
  static IDSet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IDSet>(create);
  static IDSet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get ids => $_getList(0);
}

class BatchFees extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BatchFees', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalFees')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  BatchFees._() : super();
  factory BatchFees({
    $core.String? token,
    $core.String? totalFees,
    $fixnum.Int64? txCount,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (totalFees != null) {
      _result.totalFees = totalFees;
    }
    if (txCount != null) {
      _result.txCount = txCount;
    }
    return _result;
  }
  factory BatchFees.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BatchFees.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BatchFees clone() => BatchFees()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BatchFees copyWith(void Function(BatchFees) updates) => super.copyWith((message) => updates(message as BatchFees)) as BatchFees; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BatchFees create() => BatchFees._();
  BatchFees createEmptyInstance() => create();
  static $pb.PbList<BatchFees> createRepeated() => $pb.PbList<BatchFees>();
  @$core.pragma('dart2js:noInline')
  static BatchFees getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BatchFees>(create);
  static BatchFees? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get totalFees => $_getSZ(1);
  @$pb.TagNumber(2)
  set totalFees($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalFees() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalFees() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get txCount => $_getI64(2);
  @$pb.TagNumber(3)
  set txCount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxCount() => clearField(3);
}

class EventWithdrawalReceived extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventWithdrawalReceived', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeContract')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'outgoingTxId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventWithdrawalReceived._() : super();
  factory EventWithdrawalReceived({
    $core.String? bridgeContract,
    $core.String? bridgeChainId,
    $core.String? outgoingTxId,
    $core.String? nonce,
  }) {
    final _result = create();
    if (bridgeContract != null) {
      _result.bridgeContract = bridgeContract;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    if (outgoingTxId != null) {
      _result.outgoingTxId = outgoingTxId;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventWithdrawalReceived.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventWithdrawalReceived.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventWithdrawalReceived clone() => EventWithdrawalReceived()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventWithdrawalReceived copyWith(void Function(EventWithdrawalReceived) updates) => super.copyWith((message) => updates(message as EventWithdrawalReceived)) as EventWithdrawalReceived; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventWithdrawalReceived create() => EventWithdrawalReceived._();
  EventWithdrawalReceived createEmptyInstance() => create();
  static $pb.PbList<EventWithdrawalReceived> createRepeated() => $pb.PbList<EventWithdrawalReceived>();
  @$core.pragma('dart2js:noInline')
  static EventWithdrawalReceived getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventWithdrawalReceived>(create);
  static EventWithdrawalReceived? _defaultInstance;

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
  $core.String get outgoingTxId => $_getSZ(2);
  @$pb.TagNumber(3)
  set outgoingTxId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutgoingTxId() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutgoingTxId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nonce => $_getSZ(3);
  @$pb.TagNumber(4)
  set nonce($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => clearField(4);
}

class EventWithdrawCanceled extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventWithdrawCanceled', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeContract')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId')
    ..hasRequiredFields = false
  ;

  EventWithdrawCanceled._() : super();
  factory EventWithdrawCanceled({
    $core.String? sender,
    $core.String? txId,
    $core.String? bridgeContract,
    $core.String? bridgeChainId,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (txId != null) {
      _result.txId = txId;
    }
    if (bridgeContract != null) {
      _result.bridgeContract = bridgeContract;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    return _result;
  }
  factory EventWithdrawCanceled.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventWithdrawCanceled.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventWithdrawCanceled clone() => EventWithdrawCanceled()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventWithdrawCanceled copyWith(void Function(EventWithdrawCanceled) updates) => super.copyWith((message) => updates(message as EventWithdrawCanceled)) as EventWithdrawCanceled; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventWithdrawCanceled create() => EventWithdrawCanceled._();
  EventWithdrawCanceled createEmptyInstance() => create();
  static $pb.PbList<EventWithdrawCanceled> createRepeated() => $pb.PbList<EventWithdrawCanceled>();
  @$core.pragma('dart2js:noInline')
  static EventWithdrawCanceled getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventWithdrawCanceled>(create);
  static EventWithdrawCanceled? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get txId => $_getSZ(1);
  @$pb.TagNumber(2)
  set txId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bridgeContract => $_getSZ(2);
  @$pb.TagNumber(3)
  set bridgeContract($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBridgeContract() => $_has(2);
  @$pb.TagNumber(3)
  void clearBridgeContract() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get bridgeChainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set bridgeChainId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBridgeChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBridgeChainId() => clearField(4);
}

