///
//  Generated code. Do not modify.
//  source: gravity/v1/attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/any.pb.dart' as $12;

export 'attestation.pbenum.dart';

class Attestation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Attestation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'observed')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'votes')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$12.Any>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'claim', subBuilder: $12.Any.create)
    ..hasRequiredFields = false
  ;

  Attestation._() : super();
  factory Attestation({
    $core.bool? observed,
    $core.Iterable<$core.String>? votes,
    $fixnum.Int64? height,
    $12.Any? claim,
  }) {
    final _result = create();
    if (observed != null) {
      _result.observed = observed;
    }
    if (votes != null) {
      _result.votes.addAll(votes);
    }
    if (height != null) {
      _result.height = height;
    }
    if (claim != null) {
      _result.claim = claim;
    }
    return _result;
  }
  factory Attestation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attestation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attestation clone() => Attestation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attestation copyWith(void Function(Attestation) updates) => super.copyWith((message) => updates(message as Attestation)) as Attestation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Attestation create() => Attestation._();
  Attestation createEmptyInstance() => create();
  static $pb.PbList<Attestation> createRepeated() => $pb.PbList<Attestation>();
  @$core.pragma('dart2js:noInline')
  static Attestation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attestation>(create);
  static Attestation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get observed => $_getBF(0);
  @$pb.TagNumber(1)
  set observed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasObserved() => $_has(0);
  @$pb.TagNumber(1)
  void clearObserved() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get votes => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $12.Any get claim => $_getN(3);
  @$pb.TagNumber(4)
  set claim($12.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasClaim() => $_has(3);
  @$pb.TagNumber(4)
  void clearClaim() => clearField(4);
  @$pb.TagNumber(4)
  $12.Any ensureClaim() => $_ensure(3);
}

class ERC20Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ERC20Token', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contract')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  ERC20Token._() : super();
  factory ERC20Token({
    $core.String? contract,
    $core.String? amount,
  }) {
    final _result = create();
    if (contract != null) {
      _result.contract = contract;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory ERC20Token.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ERC20Token.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ERC20Token clone() => ERC20Token()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ERC20Token copyWith(void Function(ERC20Token) updates) => super.copyWith((message) => updates(message as ERC20Token)) as ERC20Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ERC20Token create() => ERC20Token._();
  ERC20Token createEmptyInstance() => create();
  static $pb.PbList<ERC20Token> createRepeated() => $pb.PbList<ERC20Token>();
  @$core.pragma('dart2js:noInline')
  static ERC20Token getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ERC20Token>(create);
  static ERC20Token? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get contract => $_getSZ(0);
  @$pb.TagNumber(1)
  set contract($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContract() => $_has(0);
  @$pb.TagNumber(1)
  void clearContract() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
}

class EventObservation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventObservation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestationType')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeContract')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeChainId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestationId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..hasRequiredFields = false
  ;

  EventObservation._() : super();
  factory EventObservation({
    $core.String? attestationType,
    $core.String? bridgeContract,
    $core.String? bridgeChainId,
    $core.String? attestationId,
    $core.String? nonce,
  }) {
    final _result = create();
    if (attestationType != null) {
      _result.attestationType = attestationType;
    }
    if (bridgeContract != null) {
      _result.bridgeContract = bridgeContract;
    }
    if (bridgeChainId != null) {
      _result.bridgeChainId = bridgeChainId;
    }
    if (attestationId != null) {
      _result.attestationId = attestationId;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory EventObservation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventObservation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventObservation clone() => EventObservation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventObservation copyWith(void Function(EventObservation) updates) => super.copyWith((message) => updates(message as EventObservation)) as EventObservation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventObservation create() => EventObservation._();
  EventObservation createEmptyInstance() => create();
  static $pb.PbList<EventObservation> createRepeated() => $pb.PbList<EventObservation>();
  @$core.pragma('dart2js:noInline')
  static EventObservation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventObservation>(create);
  static EventObservation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get attestationType => $_getSZ(0);
  @$pb.TagNumber(1)
  set attestationType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttestationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttestationType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bridgeContract => $_getSZ(1);
  @$pb.TagNumber(2)
  set bridgeContract($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBridgeContract() => $_has(1);
  @$pb.TagNumber(2)
  void clearBridgeContract() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bridgeChainId => $_getSZ(2);
  @$pb.TagNumber(3)
  set bridgeChainId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBridgeChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBridgeChainId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get attestationId => $_getSZ(3);
  @$pb.TagNumber(4)
  set attestationId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAttestationId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttestationId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nonce => $_getSZ(4);
  @$pb.TagNumber(5)
  set nonce($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonce() => clearField(5);
}

class EventInvalidSendToCosmosReceiver extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventInvalidSendToCosmosReceiver', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..hasRequiredFields = false
  ;

  EventInvalidSendToCosmosReceiver._() : super();
  factory EventInvalidSendToCosmosReceiver({
    $core.String? amount,
    $core.String? nonce,
    $core.String? token,
    $core.String? sender,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (token != null) {
      _result.token = token;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    return _result;
  }
  factory EventInvalidSendToCosmosReceiver.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventInvalidSendToCosmosReceiver.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventInvalidSendToCosmosReceiver clone() => EventInvalidSendToCosmosReceiver()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventInvalidSendToCosmosReceiver copyWith(void Function(EventInvalidSendToCosmosReceiver) updates) => super.copyWith((message) => updates(message as EventInvalidSendToCosmosReceiver)) as EventInvalidSendToCosmosReceiver; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventInvalidSendToCosmosReceiver create() => EventInvalidSendToCosmosReceiver._();
  EventInvalidSendToCosmosReceiver createEmptyInstance() => create();
  static $pb.PbList<EventInvalidSendToCosmosReceiver> createRepeated() => $pb.PbList<EventInvalidSendToCosmosReceiver>();
  @$core.pragma('dart2js:noInline')
  static EventInvalidSendToCosmosReceiver getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventInvalidSendToCosmosReceiver>(create);
  static EventInvalidSendToCosmosReceiver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get amount => $_getSZ(0);
  @$pb.TagNumber(1)
  set amount($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set nonce($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sender => $_getSZ(3);
  @$pb.TagNumber(4)
  set sender($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSender() => $_has(3);
  @$pb.TagNumber(4)
  void clearSender() => clearField(4);
}

class EventSendToCosmos extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventSendToCosmos', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  EventSendToCosmos._() : super();
  factory EventSendToCosmos({
    $core.String? amount,
    $core.String? nonce,
    $core.String? token,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory EventSendToCosmos.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventSendToCosmos.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventSendToCosmos clone() => EventSendToCosmos()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventSendToCosmos copyWith(void Function(EventSendToCosmos) updates) => super.copyWith((message) => updates(message as EventSendToCosmos)) as EventSendToCosmos; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmos create() => EventSendToCosmos._();
  EventSendToCosmos createEmptyInstance() => create();
  static $pb.PbList<EventSendToCosmos> createRepeated() => $pb.PbList<EventSendToCosmos>();
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmos getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventSendToCosmos>(create);
  static EventSendToCosmos? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get amount => $_getSZ(0);
  @$pb.TagNumber(1)
  set amount($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set nonce($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);
}

class EventSendToCosmosLocal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventSendToCosmosLocal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  EventSendToCosmosLocal._() : super();
  factory EventSendToCosmosLocal({
    $core.String? nonce,
    $core.String? receiver,
    $core.String? token,
    $core.String? amount,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (token != null) {
      _result.token = token;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory EventSendToCosmosLocal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventSendToCosmosLocal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventSendToCosmosLocal clone() => EventSendToCosmosLocal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventSendToCosmosLocal copyWith(void Function(EventSendToCosmosLocal) updates) => super.copyWith((message) => updates(message as EventSendToCosmosLocal)) as EventSendToCosmosLocal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmosLocal create() => EventSendToCosmosLocal._();
  EventSendToCosmosLocal createEmptyInstance() => create();
  static $pb.PbList<EventSendToCosmosLocal> createRepeated() => $pb.PbList<EventSendToCosmosLocal>();
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmosLocal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventSendToCosmosLocal>(create);
  static EventSendToCosmosLocal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}

class EventSendToCosmosPendingIbcAutoForward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventSendToCosmosPendingIbcAutoForward', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel')
    ..hasRequiredFields = false
  ;

  EventSendToCosmosPendingIbcAutoForward._() : super();
  factory EventSendToCosmosPendingIbcAutoForward({
    $core.String? nonce,
    $core.String? receiver,
    $core.String? token,
    $core.String? amount,
    $core.String? channel,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (token != null) {
      _result.token = token;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    return _result;
  }
  factory EventSendToCosmosPendingIbcAutoForward.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventSendToCosmosPendingIbcAutoForward.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventSendToCosmosPendingIbcAutoForward clone() => EventSendToCosmosPendingIbcAutoForward()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventSendToCosmosPendingIbcAutoForward copyWith(void Function(EventSendToCosmosPendingIbcAutoForward) updates) => super.copyWith((message) => updates(message as EventSendToCosmosPendingIbcAutoForward)) as EventSendToCosmosPendingIbcAutoForward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmosPendingIbcAutoForward create() => EventSendToCosmosPendingIbcAutoForward._();
  EventSendToCosmosPendingIbcAutoForward createEmptyInstance() => create();
  static $pb.PbList<EventSendToCosmosPendingIbcAutoForward> createRepeated() => $pb.PbList<EventSendToCosmosPendingIbcAutoForward>();
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmosPendingIbcAutoForward getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventSendToCosmosPendingIbcAutoForward>(create);
  static EventSendToCosmosPendingIbcAutoForward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get channel => $_getSZ(4);
  @$pb.TagNumber(5)
  set channel($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChannel() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannel() => clearField(5);
}

class EventSendToCosmosExecutedIbcAutoForward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventSendToCosmosExecutedIbcAutoForward', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeoutTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeoutHeight')
    ..hasRequiredFields = false
  ;

  EventSendToCosmosExecutedIbcAutoForward._() : super();
  factory EventSendToCosmosExecutedIbcAutoForward({
    $core.String? nonce,
    $core.String? receiver,
    $core.String? token,
    $core.String? amount,
    $core.String? channel,
    $core.String? timeoutTime,
    $core.String? timeoutHeight,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (token != null) {
      _result.token = token;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    if (timeoutTime != null) {
      _result.timeoutTime = timeoutTime;
    }
    if (timeoutHeight != null) {
      _result.timeoutHeight = timeoutHeight;
    }
    return _result;
  }
  factory EventSendToCosmosExecutedIbcAutoForward.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventSendToCosmosExecutedIbcAutoForward.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventSendToCosmosExecutedIbcAutoForward clone() => EventSendToCosmosExecutedIbcAutoForward()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventSendToCosmosExecutedIbcAutoForward copyWith(void Function(EventSendToCosmosExecutedIbcAutoForward) updates) => super.copyWith((message) => updates(message as EventSendToCosmosExecutedIbcAutoForward)) as EventSendToCosmosExecutedIbcAutoForward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmosExecutedIbcAutoForward create() => EventSendToCosmosExecutedIbcAutoForward._();
  EventSendToCosmosExecutedIbcAutoForward createEmptyInstance() => create();
  static $pb.PbList<EventSendToCosmosExecutedIbcAutoForward> createRepeated() => $pb.PbList<EventSendToCosmosExecutedIbcAutoForward>();
  @$core.pragma('dart2js:noInline')
  static EventSendToCosmosExecutedIbcAutoForward getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventSendToCosmosExecutedIbcAutoForward>(create);
  static EventSendToCosmosExecutedIbcAutoForward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get channel => $_getSZ(4);
  @$pb.TagNumber(5)
  set channel($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChannel() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get timeoutTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set timeoutTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimeoutTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimeoutTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get timeoutHeight => $_getSZ(6);
  @$pb.TagNumber(7)
  set timeoutHeight($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimeoutHeight() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimeoutHeight() => clearField(7);
}

