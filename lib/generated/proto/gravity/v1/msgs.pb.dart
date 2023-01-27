///
//  Generated code. Do not modify.
//  source: gravity/v1/msgs.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../cosmos/base/v1beta1/coin.pb.dart' as $9;
import 'types.pb.dart' as $11;
import '../../google/protobuf/any.pb.dart' as $12;

class MsgSetOrchestratorAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSetOrchestratorAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validator')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethAddress')
    ..hasRequiredFields = false
  ;

  MsgSetOrchestratorAddress._() : super();
  factory MsgSetOrchestratorAddress({
    $core.String? validator,
    $core.String? orchestrator,
    $core.String? ethAddress,
  }) {
    final _result = create();
    if (validator != null) {
      _result.validator = validator;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    if (ethAddress != null) {
      _result.ethAddress = ethAddress;
    }
    return _result;
  }
  factory MsgSetOrchestratorAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSetOrchestratorAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSetOrchestratorAddress clone() => MsgSetOrchestratorAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSetOrchestratorAddress copyWith(void Function(MsgSetOrchestratorAddress) updates) => super.copyWith((message) => updates(message as MsgSetOrchestratorAddress)) as MsgSetOrchestratorAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSetOrchestratorAddress create() => MsgSetOrchestratorAddress._();
  MsgSetOrchestratorAddress createEmptyInstance() => create();
  static $pb.PbList<MsgSetOrchestratorAddress> createRepeated() => $pb.PbList<MsgSetOrchestratorAddress>();
  @$core.pragma('dart2js:noInline')
  static MsgSetOrchestratorAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSetOrchestratorAddress>(create);
  static MsgSetOrchestratorAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validator => $_getSZ(0);
  @$pb.TagNumber(1)
  set validator($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidator() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidator() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orchestrator => $_getSZ(1);
  @$pb.TagNumber(2)
  set orchestrator($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrchestrator() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrchestrator() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ethAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set ethAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEthAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearEthAddress() => clearField(3);
}

class MsgSetOrchestratorAddressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSetOrchestratorAddressResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgSetOrchestratorAddressResponse._() : super();
  factory MsgSetOrchestratorAddressResponse() => create();
  factory MsgSetOrchestratorAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSetOrchestratorAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSetOrchestratorAddressResponse clone() => MsgSetOrchestratorAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSetOrchestratorAddressResponse copyWith(void Function(MsgSetOrchestratorAddressResponse) updates) => super.copyWith((message) => updates(message as MsgSetOrchestratorAddressResponse)) as MsgSetOrchestratorAddressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSetOrchestratorAddressResponse create() => MsgSetOrchestratorAddressResponse._();
  MsgSetOrchestratorAddressResponse createEmptyInstance() => create();
  static $pb.PbList<MsgSetOrchestratorAddressResponse> createRepeated() => $pb.PbList<MsgSetOrchestratorAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgSetOrchestratorAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSetOrchestratorAddressResponse>(create);
  static MsgSetOrchestratorAddressResponse? _defaultInstance;
}

class MsgValsetConfirm extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgValsetConfirm', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethAddress')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  MsgValsetConfirm._() : super();
  factory MsgValsetConfirm({
    $fixnum.Int64? nonce,
    $core.String? orchestrator,
    $core.String? ethAddress,
    $core.String? signature,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    if (ethAddress != null) {
      _result.ethAddress = ethAddress;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory MsgValsetConfirm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgValsetConfirm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgValsetConfirm clone() => MsgValsetConfirm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgValsetConfirm copyWith(void Function(MsgValsetConfirm) updates) => super.copyWith((message) => updates(message as MsgValsetConfirm)) as MsgValsetConfirm; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgValsetConfirm create() => MsgValsetConfirm._();
  MsgValsetConfirm createEmptyInstance() => create();
  static $pb.PbList<MsgValsetConfirm> createRepeated() => $pb.PbList<MsgValsetConfirm>();
  @$core.pragma('dart2js:noInline')
  static MsgValsetConfirm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgValsetConfirm>(create);
  static MsgValsetConfirm? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orchestrator => $_getSZ(1);
  @$pb.TagNumber(2)
  set orchestrator($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrchestrator() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrchestrator() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ethAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set ethAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEthAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearEthAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get signature => $_getSZ(3);
  @$pb.TagNumber(4)
  set signature($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignature() => clearField(4);
}

class MsgValsetConfirmResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgValsetConfirmResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgValsetConfirmResponse._() : super();
  factory MsgValsetConfirmResponse() => create();
  factory MsgValsetConfirmResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgValsetConfirmResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgValsetConfirmResponse clone() => MsgValsetConfirmResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgValsetConfirmResponse copyWith(void Function(MsgValsetConfirmResponse) updates) => super.copyWith((message) => updates(message as MsgValsetConfirmResponse)) as MsgValsetConfirmResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgValsetConfirmResponse create() => MsgValsetConfirmResponse._();
  MsgValsetConfirmResponse createEmptyInstance() => create();
  static $pb.PbList<MsgValsetConfirmResponse> createRepeated() => $pb.PbList<MsgValsetConfirmResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgValsetConfirmResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgValsetConfirmResponse>(create);
  static MsgValsetConfirmResponse? _defaultInstance;
}

class MsgSendToEth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSendToEth', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethDest')
    ..aOM<$9.Coin>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', subBuilder: $9.Coin.create)
    ..aOM<$9.Coin>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeFee', subBuilder: $9.Coin.create)
    ..aOM<$9.Coin>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chainFee', subBuilder: $9.Coin.create)
    ..hasRequiredFields = false
  ;

  MsgSendToEth._() : super();
  factory MsgSendToEth({
    $core.String? sender,
    $core.String? ethDest,
    $9.Coin? amount,
    $9.Coin? bridgeFee,
    $9.Coin? chainFee,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (ethDest != null) {
      _result.ethDest = ethDest;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (bridgeFee != null) {
      _result.bridgeFee = bridgeFee;
    }
    if (chainFee != null) {
      _result.chainFee = chainFee;
    }
    return _result;
  }
  factory MsgSendToEth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSendToEth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSendToEth clone() => MsgSendToEth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSendToEth copyWith(void Function(MsgSendToEth) updates) => super.copyWith((message) => updates(message as MsgSendToEth)) as MsgSendToEth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSendToEth create() => MsgSendToEth._();
  MsgSendToEth createEmptyInstance() => create();
  static $pb.PbList<MsgSendToEth> createRepeated() => $pb.PbList<MsgSendToEth>();
  @$core.pragma('dart2js:noInline')
  static MsgSendToEth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSendToEth>(create);
  static MsgSendToEth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ethDest => $_getSZ(1);
  @$pb.TagNumber(2)
  set ethDest($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthDest() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthDest() => clearField(2);

  @$pb.TagNumber(3)
  $9.Coin get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($9.Coin v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
  @$pb.TagNumber(3)
  $9.Coin ensureAmount() => $_ensure(2);

  @$pb.TagNumber(4)
  $9.Coin get bridgeFee => $_getN(3);
  @$pb.TagNumber(4)
  set bridgeFee($9.Coin v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBridgeFee() => $_has(3);
  @$pb.TagNumber(4)
  void clearBridgeFee() => clearField(4);
  @$pb.TagNumber(4)
  $9.Coin ensureBridgeFee() => $_ensure(3);

  @$pb.TagNumber(5)
  $9.Coin get chainFee => $_getN(4);
  @$pb.TagNumber(5)
  set chainFee($9.Coin v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasChainFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearChainFee() => clearField(5);
  @$pb.TagNumber(5)
  $9.Coin ensureChainFee() => $_ensure(4);
}

class MsgSendToEthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSendToEthResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgSendToEthResponse._() : super();
  factory MsgSendToEthResponse() => create();
  factory MsgSendToEthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSendToEthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSendToEthResponse clone() => MsgSendToEthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSendToEthResponse copyWith(void Function(MsgSendToEthResponse) updates) => super.copyWith((message) => updates(message as MsgSendToEthResponse)) as MsgSendToEthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSendToEthResponse create() => MsgSendToEthResponse._();
  MsgSendToEthResponse createEmptyInstance() => create();
  static $pb.PbList<MsgSendToEthResponse> createRepeated() => $pb.PbList<MsgSendToEthResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgSendToEthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSendToEthResponse>(create);
  static MsgSendToEthResponse? _defaultInstance;
}

class MsgRequestBatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRequestBatch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denom')
    ..hasRequiredFields = false
  ;

  MsgRequestBatch._() : super();
  factory MsgRequestBatch({
    $core.String? sender,
    $core.String? denom,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (denom != null) {
      _result.denom = denom;
    }
    return _result;
  }
  factory MsgRequestBatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRequestBatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRequestBatch clone() => MsgRequestBatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRequestBatch copyWith(void Function(MsgRequestBatch) updates) => super.copyWith((message) => updates(message as MsgRequestBatch)) as MsgRequestBatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRequestBatch create() => MsgRequestBatch._();
  MsgRequestBatch createEmptyInstance() => create();
  static $pb.PbList<MsgRequestBatch> createRepeated() => $pb.PbList<MsgRequestBatch>();
  @$core.pragma('dart2js:noInline')
  static MsgRequestBatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRequestBatch>(create);
  static MsgRequestBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get denom => $_getSZ(1);
  @$pb.TagNumber(2)
  set denom($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDenom() => $_has(1);
  @$pb.TagNumber(2)
  void clearDenom() => clearField(2);
}

class MsgRequestBatchResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRequestBatchResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgRequestBatchResponse._() : super();
  factory MsgRequestBatchResponse() => create();
  factory MsgRequestBatchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRequestBatchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRequestBatchResponse clone() => MsgRequestBatchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRequestBatchResponse copyWith(void Function(MsgRequestBatchResponse) updates) => super.copyWith((message) => updates(message as MsgRequestBatchResponse)) as MsgRequestBatchResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRequestBatchResponse create() => MsgRequestBatchResponse._();
  MsgRequestBatchResponse createEmptyInstance() => create();
  static $pb.PbList<MsgRequestBatchResponse> createRepeated() => $pb.PbList<MsgRequestBatchResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgRequestBatchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRequestBatchResponse>(create);
  static MsgRequestBatchResponse? _defaultInstance;
}

class MsgConfirmBatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgConfirmBatch', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenContract')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethSigner')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  MsgConfirmBatch._() : super();
  factory MsgConfirmBatch({
    $fixnum.Int64? nonce,
    $core.String? tokenContract,
    $core.String? ethSigner,
    $core.String? orchestrator,
    $core.String? signature,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (tokenContract != null) {
      _result.tokenContract = tokenContract;
    }
    if (ethSigner != null) {
      _result.ethSigner = ethSigner;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory MsgConfirmBatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgConfirmBatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgConfirmBatch clone() => MsgConfirmBatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgConfirmBatch copyWith(void Function(MsgConfirmBatch) updates) => super.copyWith((message) => updates(message as MsgConfirmBatch)) as MsgConfirmBatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgConfirmBatch create() => MsgConfirmBatch._();
  MsgConfirmBatch createEmptyInstance() => create();
  static $pb.PbList<MsgConfirmBatch> createRepeated() => $pb.PbList<MsgConfirmBatch>();
  @$core.pragma('dart2js:noInline')
  static MsgConfirmBatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgConfirmBatch>(create);
  static MsgConfirmBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokenContract => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenContract($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenContract() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenContract() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ethSigner => $_getSZ(2);
  @$pb.TagNumber(3)
  set ethSigner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEthSigner() => $_has(2);
  @$pb.TagNumber(3)
  void clearEthSigner() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get orchestrator => $_getSZ(3);
  @$pb.TagNumber(4)
  set orchestrator($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrchestrator() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrchestrator() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get signature => $_getSZ(4);
  @$pb.TagNumber(5)
  set signature($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => clearField(5);
}

class MsgConfirmBatchResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgConfirmBatchResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgConfirmBatchResponse._() : super();
  factory MsgConfirmBatchResponse() => create();
  factory MsgConfirmBatchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgConfirmBatchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgConfirmBatchResponse clone() => MsgConfirmBatchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgConfirmBatchResponse copyWith(void Function(MsgConfirmBatchResponse) updates) => super.copyWith((message) => updates(message as MsgConfirmBatchResponse)) as MsgConfirmBatchResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgConfirmBatchResponse create() => MsgConfirmBatchResponse._();
  MsgConfirmBatchResponse createEmptyInstance() => create();
  static $pb.PbList<MsgConfirmBatchResponse> createRepeated() => $pb.PbList<MsgConfirmBatchResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgConfirmBatchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgConfirmBatchResponse>(create);
  static MsgConfirmBatchResponse? _defaultInstance;
}

class MsgConfirmLogicCall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgConfirmLogicCall', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationId')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethSigner')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  MsgConfirmLogicCall._() : super();
  factory MsgConfirmLogicCall({
    $core.String? invalidationId,
    $fixnum.Int64? invalidationNonce,
    $core.String? ethSigner,
    $core.String? orchestrator,
    $core.String? signature,
  }) {
    final _result = create();
    if (invalidationId != null) {
      _result.invalidationId = invalidationId;
    }
    if (invalidationNonce != null) {
      _result.invalidationNonce = invalidationNonce;
    }
    if (ethSigner != null) {
      _result.ethSigner = ethSigner;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory MsgConfirmLogicCall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgConfirmLogicCall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgConfirmLogicCall clone() => MsgConfirmLogicCall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgConfirmLogicCall copyWith(void Function(MsgConfirmLogicCall) updates) => super.copyWith((message) => updates(message as MsgConfirmLogicCall)) as MsgConfirmLogicCall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgConfirmLogicCall create() => MsgConfirmLogicCall._();
  MsgConfirmLogicCall createEmptyInstance() => create();
  static $pb.PbList<MsgConfirmLogicCall> createRepeated() => $pb.PbList<MsgConfirmLogicCall>();
  @$core.pragma('dart2js:noInline')
  static MsgConfirmLogicCall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgConfirmLogicCall>(create);
  static MsgConfirmLogicCall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get invalidationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set invalidationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInvalidationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvalidationId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get invalidationNonce => $_getI64(1);
  @$pb.TagNumber(2)
  set invalidationNonce($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInvalidationNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvalidationNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ethSigner => $_getSZ(2);
  @$pb.TagNumber(3)
  set ethSigner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEthSigner() => $_has(2);
  @$pb.TagNumber(3)
  void clearEthSigner() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get orchestrator => $_getSZ(3);
  @$pb.TagNumber(4)
  set orchestrator($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrchestrator() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrchestrator() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get signature => $_getSZ(4);
  @$pb.TagNumber(5)
  set signature($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => clearField(5);
}

class MsgConfirmLogicCallResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgConfirmLogicCallResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgConfirmLogicCallResponse._() : super();
  factory MsgConfirmLogicCallResponse() => create();
  factory MsgConfirmLogicCallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgConfirmLogicCallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgConfirmLogicCallResponse clone() => MsgConfirmLogicCallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgConfirmLogicCallResponse copyWith(void Function(MsgConfirmLogicCallResponse) updates) => super.copyWith((message) => updates(message as MsgConfirmLogicCallResponse)) as MsgConfirmLogicCallResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgConfirmLogicCallResponse create() => MsgConfirmLogicCallResponse._();
  MsgConfirmLogicCallResponse createEmptyInstance() => create();
  static $pb.PbList<MsgConfirmLogicCallResponse> createRepeated() => $pb.PbList<MsgConfirmLogicCallResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgConfirmLogicCallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgConfirmLogicCallResponse>(create);
  static MsgConfirmLogicCallResponse? _defaultInstance;
}

class MsgSendToCosmosClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSendToCosmosClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenContract')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethereumSender')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosReceiver')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..hasRequiredFields = false
  ;

  MsgSendToCosmosClaim._() : super();
  factory MsgSendToCosmosClaim({
    $fixnum.Int64? eventNonce,
    $fixnum.Int64? ethBlockHeight,
    $core.String? tokenContract,
    $core.String? amount,
    $core.String? ethereumSender,
    $core.String? cosmosReceiver,
    $core.String? orchestrator,
  }) {
    final _result = create();
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    if (ethBlockHeight != null) {
      _result.ethBlockHeight = ethBlockHeight;
    }
    if (tokenContract != null) {
      _result.tokenContract = tokenContract;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (ethereumSender != null) {
      _result.ethereumSender = ethereumSender;
    }
    if (cosmosReceiver != null) {
      _result.cosmosReceiver = cosmosReceiver;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    return _result;
  }
  factory MsgSendToCosmosClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSendToCosmosClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSendToCosmosClaim clone() => MsgSendToCosmosClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSendToCosmosClaim copyWith(void Function(MsgSendToCosmosClaim) updates) => super.copyWith((message) => updates(message as MsgSendToCosmosClaim)) as MsgSendToCosmosClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSendToCosmosClaim create() => MsgSendToCosmosClaim._();
  MsgSendToCosmosClaim createEmptyInstance() => create();
  static $pb.PbList<MsgSendToCosmosClaim> createRepeated() => $pb.PbList<MsgSendToCosmosClaim>();
  @$core.pragma('dart2js:noInline')
  static MsgSendToCosmosClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSendToCosmosClaim>(create);
  static MsgSendToCosmosClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set eventNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ethBlockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set ethBlockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthBlockHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tokenContract => $_getSZ(2);
  @$pb.TagNumber(3)
  set tokenContract($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTokenContract() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenContract() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get ethereumSender => $_getSZ(4);
  @$pb.TagNumber(5)
  set ethereumSender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEthereumSender() => $_has(4);
  @$pb.TagNumber(5)
  void clearEthereumSender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cosmosReceiver => $_getSZ(5);
  @$pb.TagNumber(6)
  set cosmosReceiver($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCosmosReceiver() => $_has(5);
  @$pb.TagNumber(6)
  void clearCosmosReceiver() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get orchestrator => $_getSZ(6);
  @$pb.TagNumber(7)
  set orchestrator($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrchestrator() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrchestrator() => clearField(7);
}

class MsgSendToCosmosClaimResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSendToCosmosClaimResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgSendToCosmosClaimResponse._() : super();
  factory MsgSendToCosmosClaimResponse() => create();
  factory MsgSendToCosmosClaimResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSendToCosmosClaimResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSendToCosmosClaimResponse clone() => MsgSendToCosmosClaimResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSendToCosmosClaimResponse copyWith(void Function(MsgSendToCosmosClaimResponse) updates) => super.copyWith((message) => updates(message as MsgSendToCosmosClaimResponse)) as MsgSendToCosmosClaimResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSendToCosmosClaimResponse create() => MsgSendToCosmosClaimResponse._();
  MsgSendToCosmosClaimResponse createEmptyInstance() => create();
  static $pb.PbList<MsgSendToCosmosClaimResponse> createRepeated() => $pb.PbList<MsgSendToCosmosClaimResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgSendToCosmosClaimResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSendToCosmosClaimResponse>(create);
  static MsgSendToCosmosClaimResponse? _defaultInstance;
}

class MsgExecuteIbcAutoForwards extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgExecuteIbcAutoForwards', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forwardsToClear', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'executor')
    ..hasRequiredFields = false
  ;

  MsgExecuteIbcAutoForwards._() : super();
  factory MsgExecuteIbcAutoForwards({
    $fixnum.Int64? forwardsToClear,
    $core.String? executor,
  }) {
    final _result = create();
    if (forwardsToClear != null) {
      _result.forwardsToClear = forwardsToClear;
    }
    if (executor != null) {
      _result.executor = executor;
    }
    return _result;
  }
  factory MsgExecuteIbcAutoForwards.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgExecuteIbcAutoForwards.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgExecuteIbcAutoForwards clone() => MsgExecuteIbcAutoForwards()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgExecuteIbcAutoForwards copyWith(void Function(MsgExecuteIbcAutoForwards) updates) => super.copyWith((message) => updates(message as MsgExecuteIbcAutoForwards)) as MsgExecuteIbcAutoForwards; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgExecuteIbcAutoForwards create() => MsgExecuteIbcAutoForwards._();
  MsgExecuteIbcAutoForwards createEmptyInstance() => create();
  static $pb.PbList<MsgExecuteIbcAutoForwards> createRepeated() => $pb.PbList<MsgExecuteIbcAutoForwards>();
  @$core.pragma('dart2js:noInline')
  static MsgExecuteIbcAutoForwards getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgExecuteIbcAutoForwards>(create);
  static MsgExecuteIbcAutoForwards? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get forwardsToClear => $_getI64(0);
  @$pb.TagNumber(1)
  set forwardsToClear($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForwardsToClear() => $_has(0);
  @$pb.TagNumber(1)
  void clearForwardsToClear() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get executor => $_getSZ(1);
  @$pb.TagNumber(2)
  set executor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExecutor() => $_has(1);
  @$pb.TagNumber(2)
  void clearExecutor() => clearField(2);
}

class MsgExecuteIbcAutoForwardsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgExecuteIbcAutoForwardsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgExecuteIbcAutoForwardsResponse._() : super();
  factory MsgExecuteIbcAutoForwardsResponse() => create();
  factory MsgExecuteIbcAutoForwardsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgExecuteIbcAutoForwardsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgExecuteIbcAutoForwardsResponse clone() => MsgExecuteIbcAutoForwardsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgExecuteIbcAutoForwardsResponse copyWith(void Function(MsgExecuteIbcAutoForwardsResponse) updates) => super.copyWith((message) => updates(message as MsgExecuteIbcAutoForwardsResponse)) as MsgExecuteIbcAutoForwardsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgExecuteIbcAutoForwardsResponse create() => MsgExecuteIbcAutoForwardsResponse._();
  MsgExecuteIbcAutoForwardsResponse createEmptyInstance() => create();
  static $pb.PbList<MsgExecuteIbcAutoForwardsResponse> createRepeated() => $pb.PbList<MsgExecuteIbcAutoForwardsResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgExecuteIbcAutoForwardsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgExecuteIbcAutoForwardsResponse>(create);
  static MsgExecuteIbcAutoForwardsResponse? _defaultInstance;
}

class MsgBatchSendToEthClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgBatchSendToEthClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenContract')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..hasRequiredFields = false
  ;

  MsgBatchSendToEthClaim._() : super();
  factory MsgBatchSendToEthClaim({
    $fixnum.Int64? eventNonce,
    $fixnum.Int64? ethBlockHeight,
    $fixnum.Int64? batchNonce,
    $core.String? tokenContract,
    $core.String? orchestrator,
  }) {
    final _result = create();
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    if (ethBlockHeight != null) {
      _result.ethBlockHeight = ethBlockHeight;
    }
    if (batchNonce != null) {
      _result.batchNonce = batchNonce;
    }
    if (tokenContract != null) {
      _result.tokenContract = tokenContract;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    return _result;
  }
  factory MsgBatchSendToEthClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgBatchSendToEthClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgBatchSendToEthClaim clone() => MsgBatchSendToEthClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgBatchSendToEthClaim copyWith(void Function(MsgBatchSendToEthClaim) updates) => super.copyWith((message) => updates(message as MsgBatchSendToEthClaim)) as MsgBatchSendToEthClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgBatchSendToEthClaim create() => MsgBatchSendToEthClaim._();
  MsgBatchSendToEthClaim createEmptyInstance() => create();
  static $pb.PbList<MsgBatchSendToEthClaim> createRepeated() => $pb.PbList<MsgBatchSendToEthClaim>();
  @$core.pragma('dart2js:noInline')
  static MsgBatchSendToEthClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBatchSendToEthClaim>(create);
  static MsgBatchSendToEthClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set eventNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ethBlockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set ethBlockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthBlockHeight() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get batchNonce => $_getI64(2);
  @$pb.TagNumber(3)
  set batchNonce($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBatchNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatchNonce() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tokenContract => $_getSZ(3);
  @$pb.TagNumber(4)
  set tokenContract($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenContract() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenContract() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get orchestrator => $_getSZ(4);
  @$pb.TagNumber(5)
  set orchestrator($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrchestrator() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrchestrator() => clearField(5);
}

class MsgBatchSendToEthClaimResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgBatchSendToEthClaimResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgBatchSendToEthClaimResponse._() : super();
  factory MsgBatchSendToEthClaimResponse() => create();
  factory MsgBatchSendToEthClaimResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgBatchSendToEthClaimResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgBatchSendToEthClaimResponse clone() => MsgBatchSendToEthClaimResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgBatchSendToEthClaimResponse copyWith(void Function(MsgBatchSendToEthClaimResponse) updates) => super.copyWith((message) => updates(message as MsgBatchSendToEthClaimResponse)) as MsgBatchSendToEthClaimResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgBatchSendToEthClaimResponse create() => MsgBatchSendToEthClaimResponse._();
  MsgBatchSendToEthClaimResponse createEmptyInstance() => create();
  static $pb.PbList<MsgBatchSendToEthClaimResponse> createRepeated() => $pb.PbList<MsgBatchSendToEthClaimResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgBatchSendToEthClaimResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBatchSendToEthClaimResponse>(create);
  static MsgBatchSendToEthClaimResponse? _defaultInstance;
}

class MsgERC20DeployedClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgERC20DeployedClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosDenom')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenContract')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'decimals', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..hasRequiredFields = false
  ;

  MsgERC20DeployedClaim._() : super();
  factory MsgERC20DeployedClaim({
    $fixnum.Int64? eventNonce,
    $fixnum.Int64? ethBlockHeight,
    $core.String? cosmosDenom,
    $core.String? tokenContract,
    $core.String? name,
    $core.String? symbol,
    $fixnum.Int64? decimals,
    $core.String? orchestrator,
  }) {
    final _result = create();
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    if (ethBlockHeight != null) {
      _result.ethBlockHeight = ethBlockHeight;
    }
    if (cosmosDenom != null) {
      _result.cosmosDenom = cosmosDenom;
    }
    if (tokenContract != null) {
      _result.tokenContract = tokenContract;
    }
    if (name != null) {
      _result.name = name;
    }
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (decimals != null) {
      _result.decimals = decimals;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    return _result;
  }
  factory MsgERC20DeployedClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgERC20DeployedClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgERC20DeployedClaim clone() => MsgERC20DeployedClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgERC20DeployedClaim copyWith(void Function(MsgERC20DeployedClaim) updates) => super.copyWith((message) => updates(message as MsgERC20DeployedClaim)) as MsgERC20DeployedClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgERC20DeployedClaim create() => MsgERC20DeployedClaim._();
  MsgERC20DeployedClaim createEmptyInstance() => create();
  static $pb.PbList<MsgERC20DeployedClaim> createRepeated() => $pb.PbList<MsgERC20DeployedClaim>();
  @$core.pragma('dart2js:noInline')
  static MsgERC20DeployedClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgERC20DeployedClaim>(create);
  static MsgERC20DeployedClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set eventNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ethBlockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set ethBlockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthBlockHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cosmosDenom => $_getSZ(2);
  @$pb.TagNumber(3)
  set cosmosDenom($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCosmosDenom() => $_has(2);
  @$pb.TagNumber(3)
  void clearCosmosDenom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tokenContract => $_getSZ(3);
  @$pb.TagNumber(4)
  set tokenContract($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenContract() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenContract() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get symbol => $_getSZ(5);
  @$pb.TagNumber(6)
  set symbol($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSymbol() => $_has(5);
  @$pb.TagNumber(6)
  void clearSymbol() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get decimals => $_getI64(6);
  @$pb.TagNumber(7)
  set decimals($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDecimals() => $_has(6);
  @$pb.TagNumber(7)
  void clearDecimals() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get orchestrator => $_getSZ(7);
  @$pb.TagNumber(8)
  set orchestrator($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOrchestrator() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrchestrator() => clearField(8);
}

class MsgERC20DeployedClaimResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgERC20DeployedClaimResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgERC20DeployedClaimResponse._() : super();
  factory MsgERC20DeployedClaimResponse() => create();
  factory MsgERC20DeployedClaimResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgERC20DeployedClaimResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgERC20DeployedClaimResponse clone() => MsgERC20DeployedClaimResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgERC20DeployedClaimResponse copyWith(void Function(MsgERC20DeployedClaimResponse) updates) => super.copyWith((message) => updates(message as MsgERC20DeployedClaimResponse)) as MsgERC20DeployedClaimResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgERC20DeployedClaimResponse create() => MsgERC20DeployedClaimResponse._();
  MsgERC20DeployedClaimResponse createEmptyInstance() => create();
  static $pb.PbList<MsgERC20DeployedClaimResponse> createRepeated() => $pb.PbList<MsgERC20DeployedClaimResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgERC20DeployedClaimResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgERC20DeployedClaimResponse>(create);
  static MsgERC20DeployedClaimResponse? _defaultInstance;
}

class MsgLogicCallExecutedClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgLogicCallExecutedClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..hasRequiredFields = false
  ;

  MsgLogicCallExecutedClaim._() : super();
  factory MsgLogicCallExecutedClaim({
    $fixnum.Int64? eventNonce,
    $fixnum.Int64? ethBlockHeight,
    $core.List<$core.int>? invalidationId,
    $fixnum.Int64? invalidationNonce,
    $core.String? orchestrator,
  }) {
    final _result = create();
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    if (ethBlockHeight != null) {
      _result.ethBlockHeight = ethBlockHeight;
    }
    if (invalidationId != null) {
      _result.invalidationId = invalidationId;
    }
    if (invalidationNonce != null) {
      _result.invalidationNonce = invalidationNonce;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    return _result;
  }
  factory MsgLogicCallExecutedClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgLogicCallExecutedClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgLogicCallExecutedClaim clone() => MsgLogicCallExecutedClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgLogicCallExecutedClaim copyWith(void Function(MsgLogicCallExecutedClaim) updates) => super.copyWith((message) => updates(message as MsgLogicCallExecutedClaim)) as MsgLogicCallExecutedClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgLogicCallExecutedClaim create() => MsgLogicCallExecutedClaim._();
  MsgLogicCallExecutedClaim createEmptyInstance() => create();
  static $pb.PbList<MsgLogicCallExecutedClaim> createRepeated() => $pb.PbList<MsgLogicCallExecutedClaim>();
  @$core.pragma('dart2js:noInline')
  static MsgLogicCallExecutedClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgLogicCallExecutedClaim>(create);
  static MsgLogicCallExecutedClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set eventNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ethBlockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set ethBlockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthBlockHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get invalidationId => $_getN(2);
  @$pb.TagNumber(3)
  set invalidationId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInvalidationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvalidationId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get invalidationNonce => $_getI64(3);
  @$pb.TagNumber(4)
  set invalidationNonce($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInvalidationNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvalidationNonce() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get orchestrator => $_getSZ(4);
  @$pb.TagNumber(5)
  set orchestrator($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrchestrator() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrchestrator() => clearField(5);
}

class MsgLogicCallExecutedClaimResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgLogicCallExecutedClaimResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgLogicCallExecutedClaimResponse._() : super();
  factory MsgLogicCallExecutedClaimResponse() => create();
  factory MsgLogicCallExecutedClaimResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgLogicCallExecutedClaimResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgLogicCallExecutedClaimResponse clone() => MsgLogicCallExecutedClaimResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgLogicCallExecutedClaimResponse copyWith(void Function(MsgLogicCallExecutedClaimResponse) updates) => super.copyWith((message) => updates(message as MsgLogicCallExecutedClaimResponse)) as MsgLogicCallExecutedClaimResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgLogicCallExecutedClaimResponse create() => MsgLogicCallExecutedClaimResponse._();
  MsgLogicCallExecutedClaimResponse createEmptyInstance() => create();
  static $pb.PbList<MsgLogicCallExecutedClaimResponse> createRepeated() => $pb.PbList<MsgLogicCallExecutedClaimResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgLogicCallExecutedClaimResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgLogicCallExecutedClaimResponse>(create);
  static MsgLogicCallExecutedClaimResponse? _defaultInstance;
}

class MsgValsetUpdatedClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgValsetUpdatedClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valsetNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$11.BridgeValidator>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'members', $pb.PbFieldType.PM, subBuilder: $11.BridgeValidator.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardAmount')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardToken')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestrator')
    ..hasRequiredFields = false
  ;

  MsgValsetUpdatedClaim._() : super();
  factory MsgValsetUpdatedClaim({
    $fixnum.Int64? eventNonce,
    $fixnum.Int64? valsetNonce,
    $fixnum.Int64? ethBlockHeight,
    $core.Iterable<$11.BridgeValidator>? members,
    $core.String? rewardAmount,
    $core.String? rewardToken,
    $core.String? orchestrator,
  }) {
    final _result = create();
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    if (valsetNonce != null) {
      _result.valsetNonce = valsetNonce;
    }
    if (ethBlockHeight != null) {
      _result.ethBlockHeight = ethBlockHeight;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    if (rewardAmount != null) {
      _result.rewardAmount = rewardAmount;
    }
    if (rewardToken != null) {
      _result.rewardToken = rewardToken;
    }
    if (orchestrator != null) {
      _result.orchestrator = orchestrator;
    }
    return _result;
  }
  factory MsgValsetUpdatedClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgValsetUpdatedClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgValsetUpdatedClaim clone() => MsgValsetUpdatedClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgValsetUpdatedClaim copyWith(void Function(MsgValsetUpdatedClaim) updates) => super.copyWith((message) => updates(message as MsgValsetUpdatedClaim)) as MsgValsetUpdatedClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgValsetUpdatedClaim create() => MsgValsetUpdatedClaim._();
  MsgValsetUpdatedClaim createEmptyInstance() => create();
  static $pb.PbList<MsgValsetUpdatedClaim> createRepeated() => $pb.PbList<MsgValsetUpdatedClaim>();
  @$core.pragma('dart2js:noInline')
  static MsgValsetUpdatedClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgValsetUpdatedClaim>(create);
  static MsgValsetUpdatedClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set eventNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventNonce() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get valsetNonce => $_getI64(1);
  @$pb.TagNumber(2)
  set valsetNonce($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValsetNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearValsetNonce() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get ethBlockHeight => $_getI64(2);
  @$pb.TagNumber(3)
  set ethBlockHeight($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEthBlockHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearEthBlockHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$11.BridgeValidator> get members => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get rewardAmount => $_getSZ(4);
  @$pb.TagNumber(5)
  set rewardAmount($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRewardAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRewardAmount() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rewardToken => $_getSZ(5);
  @$pb.TagNumber(6)
  set rewardToken($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRewardToken() => $_has(5);
  @$pb.TagNumber(6)
  void clearRewardToken() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get orchestrator => $_getSZ(6);
  @$pb.TagNumber(7)
  set orchestrator($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrchestrator() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrchestrator() => clearField(7);
}

class MsgValsetUpdatedClaimResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgValsetUpdatedClaimResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgValsetUpdatedClaimResponse._() : super();
  factory MsgValsetUpdatedClaimResponse() => create();
  factory MsgValsetUpdatedClaimResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgValsetUpdatedClaimResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgValsetUpdatedClaimResponse clone() => MsgValsetUpdatedClaimResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgValsetUpdatedClaimResponse copyWith(void Function(MsgValsetUpdatedClaimResponse) updates) => super.copyWith((message) => updates(message as MsgValsetUpdatedClaimResponse)) as MsgValsetUpdatedClaimResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgValsetUpdatedClaimResponse create() => MsgValsetUpdatedClaimResponse._();
  MsgValsetUpdatedClaimResponse createEmptyInstance() => create();
  static $pb.PbList<MsgValsetUpdatedClaimResponse> createRepeated() => $pb.PbList<MsgValsetUpdatedClaimResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgValsetUpdatedClaimResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgValsetUpdatedClaimResponse>(create);
  static MsgValsetUpdatedClaimResponse? _defaultInstance;
}

class MsgCancelSendToEth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgCancelSendToEth', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..hasRequiredFields = false
  ;

  MsgCancelSendToEth._() : super();
  factory MsgCancelSendToEth({
    $fixnum.Int64? transactionId,
    $core.String? sender,
  }) {
    final _result = create();
    if (transactionId != null) {
      _result.transactionId = transactionId;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    return _result;
  }
  factory MsgCancelSendToEth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgCancelSendToEth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgCancelSendToEth clone() => MsgCancelSendToEth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgCancelSendToEth copyWith(void Function(MsgCancelSendToEth) updates) => super.copyWith((message) => updates(message as MsgCancelSendToEth)) as MsgCancelSendToEth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgCancelSendToEth create() => MsgCancelSendToEth._();
  MsgCancelSendToEth createEmptyInstance() => create();
  static $pb.PbList<MsgCancelSendToEth> createRepeated() => $pb.PbList<MsgCancelSendToEth>();
  @$core.pragma('dart2js:noInline')
  static MsgCancelSendToEth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgCancelSendToEth>(create);
  static MsgCancelSendToEth? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get transactionId => $_getI64(0);
  @$pb.TagNumber(1)
  set transactionId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sender => $_getSZ(1);
  @$pb.TagNumber(2)
  set sender($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => clearField(2);
}

class MsgCancelSendToEthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgCancelSendToEthResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgCancelSendToEthResponse._() : super();
  factory MsgCancelSendToEthResponse() => create();
  factory MsgCancelSendToEthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgCancelSendToEthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgCancelSendToEthResponse clone() => MsgCancelSendToEthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgCancelSendToEthResponse copyWith(void Function(MsgCancelSendToEthResponse) updates) => super.copyWith((message) => updates(message as MsgCancelSendToEthResponse)) as MsgCancelSendToEthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgCancelSendToEthResponse create() => MsgCancelSendToEthResponse._();
  MsgCancelSendToEthResponse createEmptyInstance() => create();
  static $pb.PbList<MsgCancelSendToEthResponse> createRepeated() => $pb.PbList<MsgCancelSendToEthResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgCancelSendToEthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgCancelSendToEthResponse>(create);
  static MsgCancelSendToEthResponse? _defaultInstance;
}

class MsgSubmitBadSignatureEvidence extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSubmitBadSignatureEvidence', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<$12.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subject', subBuilder: $12.Any.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..hasRequiredFields = false
  ;

  MsgSubmitBadSignatureEvidence._() : super();
  factory MsgSubmitBadSignatureEvidence({
    $12.Any? subject,
    $core.String? signature,
    $core.String? sender,
  }) {
    final _result = create();
    if (subject != null) {
      _result.subject = subject;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    return _result;
  }
  factory MsgSubmitBadSignatureEvidence.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSubmitBadSignatureEvidence.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSubmitBadSignatureEvidence clone() => MsgSubmitBadSignatureEvidence()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSubmitBadSignatureEvidence copyWith(void Function(MsgSubmitBadSignatureEvidence) updates) => super.copyWith((message) => updates(message as MsgSubmitBadSignatureEvidence)) as MsgSubmitBadSignatureEvidence; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSubmitBadSignatureEvidence create() => MsgSubmitBadSignatureEvidence._();
  MsgSubmitBadSignatureEvidence createEmptyInstance() => create();
  static $pb.PbList<MsgSubmitBadSignatureEvidence> createRepeated() => $pb.PbList<MsgSubmitBadSignatureEvidence>();
  @$core.pragma('dart2js:noInline')
  static MsgSubmitBadSignatureEvidence getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSubmitBadSignatureEvidence>(create);
  static MsgSubmitBadSignatureEvidence? _defaultInstance;

  @$pb.TagNumber(1)
  $12.Any get subject => $_getN(0);
  @$pb.TagNumber(1)
  set subject($12.Any v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubject() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubject() => clearField(1);
  @$pb.TagNumber(1)
  $12.Any ensureSubject() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sender => $_getSZ(2);
  @$pb.TagNumber(3)
  set sender($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSender() => $_has(2);
  @$pb.TagNumber(3)
  void clearSender() => clearField(3);
}

class MsgSubmitBadSignatureEvidenceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSubmitBadSignatureEvidenceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgSubmitBadSignatureEvidenceResponse._() : super();
  factory MsgSubmitBadSignatureEvidenceResponse() => create();
  factory MsgSubmitBadSignatureEvidenceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSubmitBadSignatureEvidenceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSubmitBadSignatureEvidenceResponse clone() => MsgSubmitBadSignatureEvidenceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSubmitBadSignatureEvidenceResponse copyWith(void Function(MsgSubmitBadSignatureEvidenceResponse) updates) => super.copyWith((message) => updates(message as MsgSubmitBadSignatureEvidenceResponse)) as MsgSubmitBadSignatureEvidenceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSubmitBadSignatureEvidenceResponse create() => MsgSubmitBadSignatureEvidenceResponse._();
  MsgSubmitBadSignatureEvidenceResponse createEmptyInstance() => create();
  static $pb.PbList<MsgSubmitBadSignatureEvidenceResponse> createRepeated() => $pb.PbList<MsgSubmitBadSignatureEvidenceResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgSubmitBadSignatureEvidenceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSubmitBadSignatureEvidenceResponse>(create);
  static MsgSubmitBadSignatureEvidenceResponse? _defaultInstance;
}

class EventSetOperatorAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventSetOperatorAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  EventSetOperatorAddress._() : super();
  factory EventSetOperatorAddress({
    $core.String? message,
    $core.String? address,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory EventSetOperatorAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventSetOperatorAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventSetOperatorAddress clone() => EventSetOperatorAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventSetOperatorAddress copyWith(void Function(EventSetOperatorAddress) updates) => super.copyWith((message) => updates(message as EventSetOperatorAddress)) as EventSetOperatorAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventSetOperatorAddress create() => EventSetOperatorAddress._();
  EventSetOperatorAddress createEmptyInstance() => create();
  static $pb.PbList<EventSetOperatorAddress> createRepeated() => $pb.PbList<EventSetOperatorAddress>();
  @$core.pragma('dart2js:noInline')
  static EventSetOperatorAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventSetOperatorAddress>(create);
  static EventSetOperatorAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class EventValsetConfirmKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventValsetConfirmKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..hasRequiredFields = false
  ;

  EventValsetConfirmKey._() : super();
  factory EventValsetConfirmKey({
    $core.String? message,
    $core.String? key,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (key != null) {
      _result.key = key;
    }
    return _result;
  }
  factory EventValsetConfirmKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventValsetConfirmKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventValsetConfirmKey clone() => EventValsetConfirmKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventValsetConfirmKey copyWith(void Function(EventValsetConfirmKey) updates) => super.copyWith((message) => updates(message as EventValsetConfirmKey)) as EventValsetConfirmKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventValsetConfirmKey create() => EventValsetConfirmKey._();
  EventValsetConfirmKey createEmptyInstance() => create();
  static $pb.PbList<EventValsetConfirmKey> createRepeated() => $pb.PbList<EventValsetConfirmKey>();
  @$core.pragma('dart2js:noInline')
  static EventValsetConfirmKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventValsetConfirmKey>(create);
  static EventValsetConfirmKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
}

class EventBatchCreated extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventBatchCreated', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchNonce')
    ..hasRequiredFields = false
  ;

  EventBatchCreated._() : super();
  factory EventBatchCreated({
    $core.String? message,
    $core.String? batchNonce,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (batchNonce != null) {
      _result.batchNonce = batchNonce;
    }
    return _result;
  }
  factory EventBatchCreated.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventBatchCreated.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventBatchCreated clone() => EventBatchCreated()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventBatchCreated copyWith(void Function(EventBatchCreated) updates) => super.copyWith((message) => updates(message as EventBatchCreated)) as EventBatchCreated; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventBatchCreated create() => EventBatchCreated._();
  EventBatchCreated createEmptyInstance() => create();
  static $pb.PbList<EventBatchCreated> createRepeated() => $pb.PbList<EventBatchCreated>();
  @$core.pragma('dart2js:noInline')
  static EventBatchCreated getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventBatchCreated>(create);
  static EventBatchCreated? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get batchNonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set batchNonce($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBatchNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearBatchNonce() => clearField(2);
}

class EventBatchConfirmKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventBatchConfirmKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchConfirmKey')
    ..hasRequiredFields = false
  ;

  EventBatchConfirmKey._() : super();
  factory EventBatchConfirmKey({
    $core.String? message,
    $core.String? batchConfirmKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (batchConfirmKey != null) {
      _result.batchConfirmKey = batchConfirmKey;
    }
    return _result;
  }
  factory EventBatchConfirmKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventBatchConfirmKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventBatchConfirmKey clone() => EventBatchConfirmKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventBatchConfirmKey copyWith(void Function(EventBatchConfirmKey) updates) => super.copyWith((message) => updates(message as EventBatchConfirmKey)) as EventBatchConfirmKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventBatchConfirmKey create() => EventBatchConfirmKey._();
  EventBatchConfirmKey createEmptyInstance() => create();
  static $pb.PbList<EventBatchConfirmKey> createRepeated() => $pb.PbList<EventBatchConfirmKey>();
  @$core.pragma('dart2js:noInline')
  static EventBatchConfirmKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventBatchConfirmKey>(create);
  static EventBatchConfirmKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get batchConfirmKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set batchConfirmKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBatchConfirmKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearBatchConfirmKey() => clearField(2);
}

class EventBatchSendToEthClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventBatchSendToEthClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventBatchSendToEthClaim._() : super();
  factory EventBatchSendToEthClaim({
    $core.String? nonce,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventBatchSendToEthClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventBatchSendToEthClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventBatchSendToEthClaim clone() => EventBatchSendToEthClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventBatchSendToEthClaim copyWith(void Function(EventBatchSendToEthClaim) updates) => super.copyWith((message) => updates(message as EventBatchSendToEthClaim)) as EventBatchSendToEthClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventBatchSendToEthClaim create() => EventBatchSendToEthClaim._();
  EventBatchSendToEthClaim createEmptyInstance() => create();
  static $pb.PbList<EventBatchSendToEthClaim> createRepeated() => $pb.PbList<EventBatchSendToEthClaim>();
  @$core.pragma('dart2js:noInline')
  static EventBatchSendToEthClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventBatchSendToEthClaim>(create);
  static EventBatchSendToEthClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);
}

class EventClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'claimHash')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestationId')
    ..hasRequiredFields = false
  ;

  EventClaim._() : super();
  factory EventClaim({
    $core.String? message,
    $core.String? claimHash,
    $core.String? attestationId,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (claimHash != null) {
      _result.claimHash = claimHash;
    }
    if (attestationId != null) {
      _result.attestationId = attestationId;
    }
    return _result;
  }
  factory EventClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventClaim clone() => EventClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventClaim copyWith(void Function(EventClaim) updates) => super.copyWith((message) => updates(message as EventClaim)) as EventClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventClaim create() => EventClaim._();
  EventClaim createEmptyInstance() => create();
  static $pb.PbList<EventClaim> createRepeated() => $pb.PbList<EventClaim>();
  @$core.pragma('dart2js:noInline')
  static EventClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventClaim>(create);
  static EventClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get claimHash => $_getSZ(1);
  @$pb.TagNumber(2)
  set claimHash($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClaimHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearClaimHash() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get attestationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set attestationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAttestationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttestationId() => clearField(3);
}

class EventBadSignatureEvidence extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventBadSignatureEvidence', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badEthSignature')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badEthSignatureSubject')
    ..hasRequiredFields = false
  ;

  EventBadSignatureEvidence._() : super();
  factory EventBadSignatureEvidence({
    $core.String? message,
    $core.String? badEthSignature,
    $core.String? badEthSignatureSubject,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (badEthSignature != null) {
      _result.badEthSignature = badEthSignature;
    }
    if (badEthSignatureSubject != null) {
      _result.badEthSignatureSubject = badEthSignatureSubject;
    }
    return _result;
  }
  factory EventBadSignatureEvidence.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventBadSignatureEvidence.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventBadSignatureEvidence clone() => EventBadSignatureEvidence()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventBadSignatureEvidence copyWith(void Function(EventBadSignatureEvidence) updates) => super.copyWith((message) => updates(message as EventBadSignatureEvidence)) as EventBadSignatureEvidence; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventBadSignatureEvidence create() => EventBadSignatureEvidence._();
  EventBadSignatureEvidence createEmptyInstance() => create();
  static $pb.PbList<EventBadSignatureEvidence> createRepeated() => $pb.PbList<EventBadSignatureEvidence>();
  @$core.pragma('dart2js:noInline')
  static EventBadSignatureEvidence getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventBadSignatureEvidence>(create);
  static EventBadSignatureEvidence? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get badEthSignature => $_getSZ(1);
  @$pb.TagNumber(2)
  set badEthSignature($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBadEthSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearBadEthSignature() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get badEthSignatureSubject => $_getSZ(2);
  @$pb.TagNumber(3)
  set badEthSignatureSubject($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBadEthSignatureSubject() => $_has(2);
  @$pb.TagNumber(3)
  void clearBadEthSignatureSubject() => clearField(3);
}

class EventERC20DeployedClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventERC20DeployedClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventERC20DeployedClaim._() : super();
  factory EventERC20DeployedClaim({
    $core.String? token,
    $core.String? nonce,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventERC20DeployedClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventERC20DeployedClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventERC20DeployedClaim clone() => EventERC20DeployedClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventERC20DeployedClaim copyWith(void Function(EventERC20DeployedClaim) updates) => super.copyWith((message) => updates(message as EventERC20DeployedClaim)) as EventERC20DeployedClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventERC20DeployedClaim create() => EventERC20DeployedClaim._();
  EventERC20DeployedClaim createEmptyInstance() => create();
  static $pb.PbList<EventERC20DeployedClaim> createRepeated() => $pb.PbList<EventERC20DeployedClaim>();
  @$core.pragma('dart2js:noInline')
  static EventERC20DeployedClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventERC20DeployedClaim>(create);
  static EventERC20DeployedClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set nonce($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => clearField(2);
}

class EventValsetUpdatedClaim extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventValsetUpdatedClaim', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventValsetUpdatedClaim._() : super();
  factory EventValsetUpdatedClaim({
    $core.String? nonce,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventValsetUpdatedClaim.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventValsetUpdatedClaim.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventValsetUpdatedClaim clone() => EventValsetUpdatedClaim()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventValsetUpdatedClaim copyWith(void Function(EventValsetUpdatedClaim) updates) => super.copyWith((message) => updates(message as EventValsetUpdatedClaim)) as EventValsetUpdatedClaim; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventValsetUpdatedClaim create() => EventValsetUpdatedClaim._();
  EventValsetUpdatedClaim createEmptyInstance() => create();
  static $pb.PbList<EventValsetUpdatedClaim> createRepeated() => $pb.PbList<EventValsetUpdatedClaim>();
  @$core.pragma('dart2js:noInline')
  static EventValsetUpdatedClaim getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventValsetUpdatedClaim>(create);
  static EventValsetUpdatedClaim? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);
}

class EventMultisigUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventMultisigUpdateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeContract')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'multisigId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventMultisigUpdateRequest._() : super();
  factory EventMultisigUpdateRequest({
    $core.String? bridgeContract,
    $core.String? bridgeChainId,
    $core.String? multisigId,
    $core.String? nonce,
  }) {
    final _result = create();
    if (bridgeContract != null) {
      _result.bridgeContract = bridgeContract;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    if (multisigId != null) {
      _result.multisigId = multisigId;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventMultisigUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventMultisigUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventMultisigUpdateRequest clone() => EventMultisigUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventMultisigUpdateRequest copyWith(void Function(EventMultisigUpdateRequest) updates) => super.copyWith((message) => updates(message as EventMultisigUpdateRequest)) as EventMultisigUpdateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventMultisigUpdateRequest create() => EventMultisigUpdateRequest._();
  EventMultisigUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<EventMultisigUpdateRequest> createRepeated() => $pb.PbList<EventMultisigUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static EventMultisigUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventMultisigUpdateRequest>(create);
  static EventMultisigUpdateRequest? _defaultInstance;

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
  $core.String get multisigId => $_getSZ(2);
  @$pb.TagNumber(3)
  set multisigId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMultisigId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMultisigId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nonce => $_getSZ(3);
  @$pb.TagNumber(4)
  set nonce($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => clearField(4);
}

class EventOutgoingLogicCallCanceled extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventOutgoingLogicCallCanceled', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logicCallInvalidationId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logicCallInvalidationNonce')
    ..hasRequiredFields = false
  ;

  EventOutgoingLogicCallCanceled._() : super();
  factory EventOutgoingLogicCallCanceled({
    $core.String? logicCallInvalidationId,
    $core.String? logicCallInvalidationNonce,
  }) {
    final _result = create();
    if (logicCallInvalidationId != null) {
      _result.logicCallInvalidationId = logicCallInvalidationId;
    }
    if (logicCallInvalidationNonce != null) {
      _result.logicCallInvalidationNonce = logicCallInvalidationNonce;
    }
    return _result;
  }
  factory EventOutgoingLogicCallCanceled.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventOutgoingLogicCallCanceled.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventOutgoingLogicCallCanceled clone() => EventOutgoingLogicCallCanceled()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventOutgoingLogicCallCanceled copyWith(void Function(EventOutgoingLogicCallCanceled) updates) => super.copyWith((message) => updates(message as EventOutgoingLogicCallCanceled)) as EventOutgoingLogicCallCanceled; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventOutgoingLogicCallCanceled create() => EventOutgoingLogicCallCanceled._();
  EventOutgoingLogicCallCanceled createEmptyInstance() => create();
  static $pb.PbList<EventOutgoingLogicCallCanceled> createRepeated() => $pb.PbList<EventOutgoingLogicCallCanceled>();
  @$core.pragma('dart2js:noInline')
  static EventOutgoingLogicCallCanceled getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventOutgoingLogicCallCanceled>(create);
  static EventOutgoingLogicCallCanceled? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get logicCallInvalidationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set logicCallInvalidationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLogicCallInvalidationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogicCallInvalidationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get logicCallInvalidationNonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set logicCallInvalidationNonce($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogicCallInvalidationNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogicCallInvalidationNonce() => clearField(2);
}

class EventSignatureSlashing extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventSignatureSlashing', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  EventSignatureSlashing._() : super();
  factory EventSignatureSlashing({
    $core.String? type,
    $core.String? address,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory EventSignatureSlashing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventSignatureSlashing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventSignatureSlashing clone() => EventSignatureSlashing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventSignatureSlashing copyWith(void Function(EventSignatureSlashing) updates) => super.copyWith((message) => updates(message as EventSignatureSlashing)) as EventSignatureSlashing; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventSignatureSlashing create() => EventSignatureSlashing._();
  EventSignatureSlashing createEmptyInstance() => create();
  static $pb.PbList<EventSignatureSlashing> createRepeated() => $pb.PbList<EventSignatureSlashing>();
  @$core.pragma('dart2js:noInline')
  static EventSignatureSlashing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventSignatureSlashing>(create);
  static EventSignatureSlashing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class EventOutgoingTxId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventOutgoingTxId', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txId')
    ..hasRequiredFields = false
  ;

  EventOutgoingTxId._() : super();
  factory EventOutgoingTxId({
    $core.String? message,
    $core.String? txId,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (txId != null) {
      _result.txId = txId;
    }
    return _result;
  }
  factory EventOutgoingTxId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventOutgoingTxId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventOutgoingTxId clone() => EventOutgoingTxId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventOutgoingTxId copyWith(void Function(EventOutgoingTxId) updates) => super.copyWith((message) => updates(message as EventOutgoingTxId)) as EventOutgoingTxId; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventOutgoingTxId create() => EventOutgoingTxId._();
  EventOutgoingTxId createEmptyInstance() => create();
  static $pb.PbList<EventOutgoingTxId> createRepeated() => $pb.PbList<EventOutgoingTxId>();
  @$core.pragma('dart2js:noInline')
  static EventOutgoingTxId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventOutgoingTxId>(create);
  static EventOutgoingTxId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get txId => $_getSZ(1);
  @$pb.TagNumber(2)
  set txId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxId() => clearField(2);
}

