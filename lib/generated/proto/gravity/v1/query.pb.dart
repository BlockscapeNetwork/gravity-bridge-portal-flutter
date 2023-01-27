///
//  Generated code. Do not modify.
//  source: gravity/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'genesis.pb.dart' as $15;
import 'types.pb.dart' as $11;
import 'msgs.pb.dart' as $0;
import 'pool.pb.dart' as $16;
import 'batch.pb.dart' as $14;
import 'attestation.pb.dart' as $13;

class QueryParamsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryParamsRequest._() : super();
  factory QueryParamsRequest() => create();
  factory QueryParamsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsRequest clone() => QueryParamsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsRequest copyWith(void Function(QueryParamsRequest) updates) => super.copyWith((message) => updates(message as QueryParamsRequest)) as QueryParamsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest create() => QueryParamsRequest._();
  QueryParamsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryParamsRequest> createRepeated() => $pb.PbList<QueryParamsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsRequest>(create);
  static QueryParamsRequest? _defaultInstance;
}

class QueryParamsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<$15.Params>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: $15.Params.create)
    ..hasRequiredFields = false
  ;

  QueryParamsResponse._() : super();
  factory QueryParamsResponse({
    $15.Params? params,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    return _result;
  }
  factory QueryParamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsResponse clone() => QueryParamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsResponse copyWith(void Function(QueryParamsResponse) updates) => super.copyWith((message) => updates(message as QueryParamsResponse)) as QueryParamsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse create() => QueryParamsResponse._();
  QueryParamsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryParamsResponse> createRepeated() => $pb.PbList<QueryParamsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsResponse>(create);
  static QueryParamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $15.Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params($15.Params v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  $15.Params ensureParams() => $_ensure(0);
}

class QueryCurrentValsetRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryCurrentValsetRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryCurrentValsetRequest._() : super();
  factory QueryCurrentValsetRequest() => create();
  factory QueryCurrentValsetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryCurrentValsetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryCurrentValsetRequest clone() => QueryCurrentValsetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryCurrentValsetRequest copyWith(void Function(QueryCurrentValsetRequest) updates) => super.copyWith((message) => updates(message as QueryCurrentValsetRequest)) as QueryCurrentValsetRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryCurrentValsetRequest create() => QueryCurrentValsetRequest._();
  QueryCurrentValsetRequest createEmptyInstance() => create();
  static $pb.PbList<QueryCurrentValsetRequest> createRepeated() => $pb.PbList<QueryCurrentValsetRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryCurrentValsetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryCurrentValsetRequest>(create);
  static QueryCurrentValsetRequest? _defaultInstance;
}

class QueryCurrentValsetResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryCurrentValsetResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<$11.Valset>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valset', subBuilder: $11.Valset.create)
    ..hasRequiredFields = false
  ;

  QueryCurrentValsetResponse._() : super();
  factory QueryCurrentValsetResponse({
    $11.Valset? valset,
  }) {
    final _result = create();
    if (valset != null) {
      _result.valset = valset;
    }
    return _result;
  }
  factory QueryCurrentValsetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryCurrentValsetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryCurrentValsetResponse clone() => QueryCurrentValsetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryCurrentValsetResponse copyWith(void Function(QueryCurrentValsetResponse) updates) => super.copyWith((message) => updates(message as QueryCurrentValsetResponse)) as QueryCurrentValsetResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryCurrentValsetResponse create() => QueryCurrentValsetResponse._();
  QueryCurrentValsetResponse createEmptyInstance() => create();
  static $pb.PbList<QueryCurrentValsetResponse> createRepeated() => $pb.PbList<QueryCurrentValsetResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryCurrentValsetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryCurrentValsetResponse>(create);
  static QueryCurrentValsetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.Valset get valset => $_getN(0);
  @$pb.TagNumber(1)
  set valset($11.Valset v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasValset() => $_has(0);
  @$pb.TagNumber(1)
  void clearValset() => clearField(1);
  @$pb.TagNumber(1)
  $11.Valset ensureValset() => $_ensure(0);
}

class QueryValsetRequestRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValsetRequestRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryValsetRequestRequest._() : super();
  factory QueryValsetRequestRequest({
    $fixnum.Int64? nonce,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory QueryValsetRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValsetRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValsetRequestRequest clone() => QueryValsetRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValsetRequestRequest copyWith(void Function(QueryValsetRequestRequest) updates) => super.copyWith((message) => updates(message as QueryValsetRequestRequest)) as QueryValsetRequestRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValsetRequestRequest create() => QueryValsetRequestRequest._();
  QueryValsetRequestRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValsetRequestRequest> createRepeated() => $pb.PbList<QueryValsetRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValsetRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValsetRequestRequest>(create);
  static QueryValsetRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);
}

class QueryValsetRequestResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValsetRequestResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<$11.Valset>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valset', subBuilder: $11.Valset.create)
    ..hasRequiredFields = false
  ;

  QueryValsetRequestResponse._() : super();
  factory QueryValsetRequestResponse({
    $11.Valset? valset,
  }) {
    final _result = create();
    if (valset != null) {
      _result.valset = valset;
    }
    return _result;
  }
  factory QueryValsetRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValsetRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValsetRequestResponse clone() => QueryValsetRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValsetRequestResponse copyWith(void Function(QueryValsetRequestResponse) updates) => super.copyWith((message) => updates(message as QueryValsetRequestResponse)) as QueryValsetRequestResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValsetRequestResponse create() => QueryValsetRequestResponse._();
  QueryValsetRequestResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValsetRequestResponse> createRepeated() => $pb.PbList<QueryValsetRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValsetRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValsetRequestResponse>(create);
  static QueryValsetRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.Valset get valset => $_getN(0);
  @$pb.TagNumber(1)
  set valset($11.Valset v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasValset() => $_has(0);
  @$pb.TagNumber(1)
  void clearValset() => clearField(1);
  @$pb.TagNumber(1)
  $11.Valset ensureValset() => $_ensure(0);
}

class QueryValsetConfirmRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValsetConfirmRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  QueryValsetConfirmRequest._() : super();
  factory QueryValsetConfirmRequest({
    $fixnum.Int64? nonce,
    $core.String? address,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryValsetConfirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValsetConfirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmRequest clone() => QueryValsetConfirmRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmRequest copyWith(void Function(QueryValsetConfirmRequest) updates) => super.copyWith((message) => updates(message as QueryValsetConfirmRequest)) as QueryValsetConfirmRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmRequest create() => QueryValsetConfirmRequest._();
  QueryValsetConfirmRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValsetConfirmRequest> createRepeated() => $pb.PbList<QueryValsetConfirmRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValsetConfirmRequest>(create);
  static QueryValsetConfirmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class QueryValsetConfirmResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValsetConfirmResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<$0.MsgValsetConfirm>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirm', subBuilder: $0.MsgValsetConfirm.create)
    ..hasRequiredFields = false
  ;

  QueryValsetConfirmResponse._() : super();
  factory QueryValsetConfirmResponse({
    $0.MsgValsetConfirm? confirm,
  }) {
    final _result = create();
    if (confirm != null) {
      _result.confirm = confirm;
    }
    return _result;
  }
  factory QueryValsetConfirmResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValsetConfirmResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmResponse clone() => QueryValsetConfirmResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmResponse copyWith(void Function(QueryValsetConfirmResponse) updates) => super.copyWith((message) => updates(message as QueryValsetConfirmResponse)) as QueryValsetConfirmResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmResponse create() => QueryValsetConfirmResponse._();
  QueryValsetConfirmResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValsetConfirmResponse> createRepeated() => $pb.PbList<QueryValsetConfirmResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValsetConfirmResponse>(create);
  static QueryValsetConfirmResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.MsgValsetConfirm get confirm => $_getN(0);
  @$pb.TagNumber(1)
  set confirm($0.MsgValsetConfirm v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfirm() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfirm() => clearField(1);
  @$pb.TagNumber(1)
  $0.MsgValsetConfirm ensureConfirm() => $_ensure(0);
}

class QueryValsetConfirmsByNonceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValsetConfirmsByNonceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryValsetConfirmsByNonceRequest._() : super();
  factory QueryValsetConfirmsByNonceRequest({
    $fixnum.Int64? nonce,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory QueryValsetConfirmsByNonceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValsetConfirmsByNonceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmsByNonceRequest clone() => QueryValsetConfirmsByNonceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmsByNonceRequest copyWith(void Function(QueryValsetConfirmsByNonceRequest) updates) => super.copyWith((message) => updates(message as QueryValsetConfirmsByNonceRequest)) as QueryValsetConfirmsByNonceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmsByNonceRequest create() => QueryValsetConfirmsByNonceRequest._();
  QueryValsetConfirmsByNonceRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValsetConfirmsByNonceRequest> createRepeated() => $pb.PbList<QueryValsetConfirmsByNonceRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmsByNonceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValsetConfirmsByNonceRequest>(create);
  static QueryValsetConfirmsByNonceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);
}

class QueryValsetConfirmsByNonceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValsetConfirmsByNonceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$0.MsgValsetConfirm>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirms', $pb.PbFieldType.PM, subBuilder: $0.MsgValsetConfirm.create)
    ..hasRequiredFields = false
  ;

  QueryValsetConfirmsByNonceResponse._() : super();
  factory QueryValsetConfirmsByNonceResponse({
    $core.Iterable<$0.MsgValsetConfirm>? confirms,
  }) {
    final _result = create();
    if (confirms != null) {
      _result.confirms.addAll(confirms);
    }
    return _result;
  }
  factory QueryValsetConfirmsByNonceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValsetConfirmsByNonceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmsByNonceResponse clone() => QueryValsetConfirmsByNonceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValsetConfirmsByNonceResponse copyWith(void Function(QueryValsetConfirmsByNonceResponse) updates) => super.copyWith((message) => updates(message as QueryValsetConfirmsByNonceResponse)) as QueryValsetConfirmsByNonceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmsByNonceResponse create() => QueryValsetConfirmsByNonceResponse._();
  QueryValsetConfirmsByNonceResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValsetConfirmsByNonceResponse> createRepeated() => $pb.PbList<QueryValsetConfirmsByNonceResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValsetConfirmsByNonceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValsetConfirmsByNonceResponse>(create);
  static QueryValsetConfirmsByNonceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.MsgValsetConfirm> get confirms => $_getList(0);
}

class QueryLastValsetRequestsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastValsetRequestsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryLastValsetRequestsRequest._() : super();
  factory QueryLastValsetRequestsRequest() => create();
  factory QueryLastValsetRequestsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastValsetRequestsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastValsetRequestsRequest clone() => QueryLastValsetRequestsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastValsetRequestsRequest copyWith(void Function(QueryLastValsetRequestsRequest) updates) => super.copyWith((message) => updates(message as QueryLastValsetRequestsRequest)) as QueryLastValsetRequestsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastValsetRequestsRequest create() => QueryLastValsetRequestsRequest._();
  QueryLastValsetRequestsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastValsetRequestsRequest> createRepeated() => $pb.PbList<QueryLastValsetRequestsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastValsetRequestsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastValsetRequestsRequest>(create);
  static QueryLastValsetRequestsRequest? _defaultInstance;
}

class QueryLastValsetRequestsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastValsetRequestsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$11.Valset>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valsets', $pb.PbFieldType.PM, subBuilder: $11.Valset.create)
    ..hasRequiredFields = false
  ;

  QueryLastValsetRequestsResponse._() : super();
  factory QueryLastValsetRequestsResponse({
    $core.Iterable<$11.Valset>? valsets,
  }) {
    final _result = create();
    if (valsets != null) {
      _result.valsets.addAll(valsets);
    }
    return _result;
  }
  factory QueryLastValsetRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastValsetRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastValsetRequestsResponse clone() => QueryLastValsetRequestsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastValsetRequestsResponse copyWith(void Function(QueryLastValsetRequestsResponse) updates) => super.copyWith((message) => updates(message as QueryLastValsetRequestsResponse)) as QueryLastValsetRequestsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastValsetRequestsResponse create() => QueryLastValsetRequestsResponse._();
  QueryLastValsetRequestsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastValsetRequestsResponse> createRepeated() => $pb.PbList<QueryLastValsetRequestsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastValsetRequestsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastValsetRequestsResponse>(create);
  static QueryLastValsetRequestsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.Valset> get valsets => $_getList(0);
}

class QueryLastPendingValsetRequestByAddrRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastPendingValsetRequestByAddrRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  QueryLastPendingValsetRequestByAddrRequest._() : super();
  factory QueryLastPendingValsetRequestByAddrRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryLastPendingValsetRequestByAddrRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastPendingValsetRequestByAddrRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastPendingValsetRequestByAddrRequest clone() => QueryLastPendingValsetRequestByAddrRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastPendingValsetRequestByAddrRequest copyWith(void Function(QueryLastPendingValsetRequestByAddrRequest) updates) => super.copyWith((message) => updates(message as QueryLastPendingValsetRequestByAddrRequest)) as QueryLastPendingValsetRequestByAddrRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingValsetRequestByAddrRequest create() => QueryLastPendingValsetRequestByAddrRequest._();
  QueryLastPendingValsetRequestByAddrRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastPendingValsetRequestByAddrRequest> createRepeated() => $pb.PbList<QueryLastPendingValsetRequestByAddrRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingValsetRequestByAddrRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastPendingValsetRequestByAddrRequest>(create);
  static QueryLastPendingValsetRequestByAddrRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class QueryLastPendingValsetRequestByAddrResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastPendingValsetRequestByAddrResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$11.Valset>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valsets', $pb.PbFieldType.PM, subBuilder: $11.Valset.create)
    ..hasRequiredFields = false
  ;

  QueryLastPendingValsetRequestByAddrResponse._() : super();
  factory QueryLastPendingValsetRequestByAddrResponse({
    $core.Iterable<$11.Valset>? valsets,
  }) {
    final _result = create();
    if (valsets != null) {
      _result.valsets.addAll(valsets);
    }
    return _result;
  }
  factory QueryLastPendingValsetRequestByAddrResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastPendingValsetRequestByAddrResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastPendingValsetRequestByAddrResponse clone() => QueryLastPendingValsetRequestByAddrResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastPendingValsetRequestByAddrResponse copyWith(void Function(QueryLastPendingValsetRequestByAddrResponse) updates) => super.copyWith((message) => updates(message as QueryLastPendingValsetRequestByAddrResponse)) as QueryLastPendingValsetRequestByAddrResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingValsetRequestByAddrResponse create() => QueryLastPendingValsetRequestByAddrResponse._();
  QueryLastPendingValsetRequestByAddrResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastPendingValsetRequestByAddrResponse> createRepeated() => $pb.PbList<QueryLastPendingValsetRequestByAddrResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingValsetRequestByAddrResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastPendingValsetRequestByAddrResponse>(create);
  static QueryLastPendingValsetRequestByAddrResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.Valset> get valsets => $_getList(0);
}

class QueryBatchFeeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryBatchFeeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryBatchFeeRequest._() : super();
  factory QueryBatchFeeRequest() => create();
  factory QueryBatchFeeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryBatchFeeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryBatchFeeRequest clone() => QueryBatchFeeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryBatchFeeRequest copyWith(void Function(QueryBatchFeeRequest) updates) => super.copyWith((message) => updates(message as QueryBatchFeeRequest)) as QueryBatchFeeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryBatchFeeRequest create() => QueryBatchFeeRequest._();
  QueryBatchFeeRequest createEmptyInstance() => create();
  static $pb.PbList<QueryBatchFeeRequest> createRepeated() => $pb.PbList<QueryBatchFeeRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryBatchFeeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryBatchFeeRequest>(create);
  static QueryBatchFeeRequest? _defaultInstance;
}

class QueryBatchFeeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryBatchFeeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$16.BatchFees>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batchFees', $pb.PbFieldType.PM, subBuilder: $16.BatchFees.create)
    ..hasRequiredFields = false
  ;

  QueryBatchFeeResponse._() : super();
  factory QueryBatchFeeResponse({
    $core.Iterable<$16.BatchFees>? batchFees,
  }) {
    final _result = create();
    if (batchFees != null) {
      _result.batchFees.addAll(batchFees);
    }
    return _result;
  }
  factory QueryBatchFeeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryBatchFeeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryBatchFeeResponse clone() => QueryBatchFeeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryBatchFeeResponse copyWith(void Function(QueryBatchFeeResponse) updates) => super.copyWith((message) => updates(message as QueryBatchFeeResponse)) as QueryBatchFeeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryBatchFeeResponse create() => QueryBatchFeeResponse._();
  QueryBatchFeeResponse createEmptyInstance() => create();
  static $pb.PbList<QueryBatchFeeResponse> createRepeated() => $pb.PbList<QueryBatchFeeResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryBatchFeeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryBatchFeeResponse>(create);
  static QueryBatchFeeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$16.BatchFees> get batchFees => $_getList(0);
}

class QueryLastPendingBatchRequestByAddrRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastPendingBatchRequestByAddrRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  QueryLastPendingBatchRequestByAddrRequest._() : super();
  factory QueryLastPendingBatchRequestByAddrRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryLastPendingBatchRequestByAddrRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastPendingBatchRequestByAddrRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastPendingBatchRequestByAddrRequest clone() => QueryLastPendingBatchRequestByAddrRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastPendingBatchRequestByAddrRequest copyWith(void Function(QueryLastPendingBatchRequestByAddrRequest) updates) => super.copyWith((message) => updates(message as QueryLastPendingBatchRequestByAddrRequest)) as QueryLastPendingBatchRequestByAddrRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingBatchRequestByAddrRequest create() => QueryLastPendingBatchRequestByAddrRequest._();
  QueryLastPendingBatchRequestByAddrRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastPendingBatchRequestByAddrRequest> createRepeated() => $pb.PbList<QueryLastPendingBatchRequestByAddrRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingBatchRequestByAddrRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastPendingBatchRequestByAddrRequest>(create);
  static QueryLastPendingBatchRequestByAddrRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class QueryLastPendingBatchRequestByAddrResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastPendingBatchRequestByAddrResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$14.OutgoingTxBatch>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batch', $pb.PbFieldType.PM, subBuilder: $14.OutgoingTxBatch.create)
    ..hasRequiredFields = false
  ;

  QueryLastPendingBatchRequestByAddrResponse._() : super();
  factory QueryLastPendingBatchRequestByAddrResponse({
    $core.Iterable<$14.OutgoingTxBatch>? batch,
  }) {
    final _result = create();
    if (batch != null) {
      _result.batch.addAll(batch);
    }
    return _result;
  }
  factory QueryLastPendingBatchRequestByAddrResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastPendingBatchRequestByAddrResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastPendingBatchRequestByAddrResponse clone() => QueryLastPendingBatchRequestByAddrResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastPendingBatchRequestByAddrResponse copyWith(void Function(QueryLastPendingBatchRequestByAddrResponse) updates) => super.copyWith((message) => updates(message as QueryLastPendingBatchRequestByAddrResponse)) as QueryLastPendingBatchRequestByAddrResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingBatchRequestByAddrResponse create() => QueryLastPendingBatchRequestByAddrResponse._();
  QueryLastPendingBatchRequestByAddrResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastPendingBatchRequestByAddrResponse> createRepeated() => $pb.PbList<QueryLastPendingBatchRequestByAddrResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingBatchRequestByAddrResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastPendingBatchRequestByAddrResponse>(create);
  static QueryLastPendingBatchRequestByAddrResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$14.OutgoingTxBatch> get batch => $_getList(0);
}

class QueryLastPendingLogicCallByAddrRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastPendingLogicCallByAddrRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  QueryLastPendingLogicCallByAddrRequest._() : super();
  factory QueryLastPendingLogicCallByAddrRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryLastPendingLogicCallByAddrRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastPendingLogicCallByAddrRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastPendingLogicCallByAddrRequest clone() => QueryLastPendingLogicCallByAddrRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastPendingLogicCallByAddrRequest copyWith(void Function(QueryLastPendingLogicCallByAddrRequest) updates) => super.copyWith((message) => updates(message as QueryLastPendingLogicCallByAddrRequest)) as QueryLastPendingLogicCallByAddrRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingLogicCallByAddrRequest create() => QueryLastPendingLogicCallByAddrRequest._();
  QueryLastPendingLogicCallByAddrRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastPendingLogicCallByAddrRequest> createRepeated() => $pb.PbList<QueryLastPendingLogicCallByAddrRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingLogicCallByAddrRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastPendingLogicCallByAddrRequest>(create);
  static QueryLastPendingLogicCallByAddrRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class QueryLastPendingLogicCallByAddrResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastPendingLogicCallByAddrResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$14.OutgoingLogicCall>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'call', $pb.PbFieldType.PM, subBuilder: $14.OutgoingLogicCall.create)
    ..hasRequiredFields = false
  ;

  QueryLastPendingLogicCallByAddrResponse._() : super();
  factory QueryLastPendingLogicCallByAddrResponse({
    $core.Iterable<$14.OutgoingLogicCall>? call,
  }) {
    final _result = create();
    if (call != null) {
      _result.call.addAll(call);
    }
    return _result;
  }
  factory QueryLastPendingLogicCallByAddrResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastPendingLogicCallByAddrResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastPendingLogicCallByAddrResponse clone() => QueryLastPendingLogicCallByAddrResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastPendingLogicCallByAddrResponse copyWith(void Function(QueryLastPendingLogicCallByAddrResponse) updates) => super.copyWith((message) => updates(message as QueryLastPendingLogicCallByAddrResponse)) as QueryLastPendingLogicCallByAddrResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingLogicCallByAddrResponse create() => QueryLastPendingLogicCallByAddrResponse._();
  QueryLastPendingLogicCallByAddrResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastPendingLogicCallByAddrResponse> createRepeated() => $pb.PbList<QueryLastPendingLogicCallByAddrResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastPendingLogicCallByAddrResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastPendingLogicCallByAddrResponse>(create);
  static QueryLastPendingLogicCallByAddrResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$14.OutgoingLogicCall> get call => $_getList(0);
}

class QueryOutgoingTxBatchesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryOutgoingTxBatchesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryOutgoingTxBatchesRequest._() : super();
  factory QueryOutgoingTxBatchesRequest() => create();
  factory QueryOutgoingTxBatchesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryOutgoingTxBatchesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryOutgoingTxBatchesRequest clone() => QueryOutgoingTxBatchesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryOutgoingTxBatchesRequest copyWith(void Function(QueryOutgoingTxBatchesRequest) updates) => super.copyWith((message) => updates(message as QueryOutgoingTxBatchesRequest)) as QueryOutgoingTxBatchesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingTxBatchesRequest create() => QueryOutgoingTxBatchesRequest._();
  QueryOutgoingTxBatchesRequest createEmptyInstance() => create();
  static $pb.PbList<QueryOutgoingTxBatchesRequest> createRepeated() => $pb.PbList<QueryOutgoingTxBatchesRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingTxBatchesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryOutgoingTxBatchesRequest>(create);
  static QueryOutgoingTxBatchesRequest? _defaultInstance;
}

class QueryOutgoingTxBatchesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryOutgoingTxBatchesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$14.OutgoingTxBatch>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batches', $pb.PbFieldType.PM, subBuilder: $14.OutgoingTxBatch.create)
    ..hasRequiredFields = false
  ;

  QueryOutgoingTxBatchesResponse._() : super();
  factory QueryOutgoingTxBatchesResponse({
    $core.Iterable<$14.OutgoingTxBatch>? batches,
  }) {
    final _result = create();
    if (batches != null) {
      _result.batches.addAll(batches);
    }
    return _result;
  }
  factory QueryOutgoingTxBatchesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryOutgoingTxBatchesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryOutgoingTxBatchesResponse clone() => QueryOutgoingTxBatchesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryOutgoingTxBatchesResponse copyWith(void Function(QueryOutgoingTxBatchesResponse) updates) => super.copyWith((message) => updates(message as QueryOutgoingTxBatchesResponse)) as QueryOutgoingTxBatchesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingTxBatchesResponse create() => QueryOutgoingTxBatchesResponse._();
  QueryOutgoingTxBatchesResponse createEmptyInstance() => create();
  static $pb.PbList<QueryOutgoingTxBatchesResponse> createRepeated() => $pb.PbList<QueryOutgoingTxBatchesResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingTxBatchesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryOutgoingTxBatchesResponse>(create);
  static QueryOutgoingTxBatchesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$14.OutgoingTxBatch> get batches => $_getList(0);
}

class QueryOutgoingLogicCallsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryOutgoingLogicCallsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryOutgoingLogicCallsRequest._() : super();
  factory QueryOutgoingLogicCallsRequest() => create();
  factory QueryOutgoingLogicCallsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryOutgoingLogicCallsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryOutgoingLogicCallsRequest clone() => QueryOutgoingLogicCallsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryOutgoingLogicCallsRequest copyWith(void Function(QueryOutgoingLogicCallsRequest) updates) => super.copyWith((message) => updates(message as QueryOutgoingLogicCallsRequest)) as QueryOutgoingLogicCallsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingLogicCallsRequest create() => QueryOutgoingLogicCallsRequest._();
  QueryOutgoingLogicCallsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryOutgoingLogicCallsRequest> createRepeated() => $pb.PbList<QueryOutgoingLogicCallsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingLogicCallsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryOutgoingLogicCallsRequest>(create);
  static QueryOutgoingLogicCallsRequest? _defaultInstance;
}

class QueryOutgoingLogicCallsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryOutgoingLogicCallsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$14.OutgoingLogicCall>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'calls', $pb.PbFieldType.PM, subBuilder: $14.OutgoingLogicCall.create)
    ..hasRequiredFields = false
  ;

  QueryOutgoingLogicCallsResponse._() : super();
  factory QueryOutgoingLogicCallsResponse({
    $core.Iterable<$14.OutgoingLogicCall>? calls,
  }) {
    final _result = create();
    if (calls != null) {
      _result.calls.addAll(calls);
    }
    return _result;
  }
  factory QueryOutgoingLogicCallsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryOutgoingLogicCallsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryOutgoingLogicCallsResponse clone() => QueryOutgoingLogicCallsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryOutgoingLogicCallsResponse copyWith(void Function(QueryOutgoingLogicCallsResponse) updates) => super.copyWith((message) => updates(message as QueryOutgoingLogicCallsResponse)) as QueryOutgoingLogicCallsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingLogicCallsResponse create() => QueryOutgoingLogicCallsResponse._();
  QueryOutgoingLogicCallsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryOutgoingLogicCallsResponse> createRepeated() => $pb.PbList<QueryOutgoingLogicCallsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryOutgoingLogicCallsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryOutgoingLogicCallsResponse>(create);
  static QueryOutgoingLogicCallsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$14.OutgoingLogicCall> get calls => $_getList(0);
}

class QueryBatchRequestByNonceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryBatchRequestByNonceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contractAddress')
    ..hasRequiredFields = false
  ;

  QueryBatchRequestByNonceRequest._() : super();
  factory QueryBatchRequestByNonceRequest({
    $fixnum.Int64? nonce,
    $core.String? contractAddress,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (contractAddress != null) {
      _result.contractAddress = contractAddress;
    }
    return _result;
  }
  factory QueryBatchRequestByNonceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryBatchRequestByNonceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryBatchRequestByNonceRequest clone() => QueryBatchRequestByNonceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryBatchRequestByNonceRequest copyWith(void Function(QueryBatchRequestByNonceRequest) updates) => super.copyWith((message) => updates(message as QueryBatchRequestByNonceRequest)) as QueryBatchRequestByNonceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryBatchRequestByNonceRequest create() => QueryBatchRequestByNonceRequest._();
  QueryBatchRequestByNonceRequest createEmptyInstance() => create();
  static $pb.PbList<QueryBatchRequestByNonceRequest> createRepeated() => $pb.PbList<QueryBatchRequestByNonceRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryBatchRequestByNonceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryBatchRequestByNonceRequest>(create);
  static QueryBatchRequestByNonceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contractAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set contractAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);
}

class QueryBatchRequestByNonceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryBatchRequestByNonceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOM<$14.OutgoingTxBatch>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batch', subBuilder: $14.OutgoingTxBatch.create)
    ..hasRequiredFields = false
  ;

  QueryBatchRequestByNonceResponse._() : super();
  factory QueryBatchRequestByNonceResponse({
    $14.OutgoingTxBatch? batch,
  }) {
    final _result = create();
    if (batch != null) {
      _result.batch = batch;
    }
    return _result;
  }
  factory QueryBatchRequestByNonceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryBatchRequestByNonceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryBatchRequestByNonceResponse clone() => QueryBatchRequestByNonceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryBatchRequestByNonceResponse copyWith(void Function(QueryBatchRequestByNonceResponse) updates) => super.copyWith((message) => updates(message as QueryBatchRequestByNonceResponse)) as QueryBatchRequestByNonceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryBatchRequestByNonceResponse create() => QueryBatchRequestByNonceResponse._();
  QueryBatchRequestByNonceResponse createEmptyInstance() => create();
  static $pb.PbList<QueryBatchRequestByNonceResponse> createRepeated() => $pb.PbList<QueryBatchRequestByNonceResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryBatchRequestByNonceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryBatchRequestByNonceResponse>(create);
  static QueryBatchRequestByNonceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $14.OutgoingTxBatch get batch => $_getN(0);
  @$pb.TagNumber(1)
  set batch($14.OutgoingTxBatch v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBatch() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatch() => clearField(1);
  @$pb.TagNumber(1)
  $14.OutgoingTxBatch ensureBatch() => $_ensure(0);
}

class QueryBatchConfirmsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryBatchConfirmsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contractAddress')
    ..hasRequiredFields = false
  ;

  QueryBatchConfirmsRequest._() : super();
  factory QueryBatchConfirmsRequest({
    $fixnum.Int64? nonce,
    $core.String? contractAddress,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (contractAddress != null) {
      _result.contractAddress = contractAddress;
    }
    return _result;
  }
  factory QueryBatchConfirmsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryBatchConfirmsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryBatchConfirmsRequest clone() => QueryBatchConfirmsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryBatchConfirmsRequest copyWith(void Function(QueryBatchConfirmsRequest) updates) => super.copyWith((message) => updates(message as QueryBatchConfirmsRequest)) as QueryBatchConfirmsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryBatchConfirmsRequest create() => QueryBatchConfirmsRequest._();
  QueryBatchConfirmsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryBatchConfirmsRequest> createRepeated() => $pb.PbList<QueryBatchConfirmsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryBatchConfirmsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryBatchConfirmsRequest>(create);
  static QueryBatchConfirmsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contractAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set contractAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);
}

class QueryBatchConfirmsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryBatchConfirmsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$0.MsgConfirmBatch>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirms', $pb.PbFieldType.PM, subBuilder: $0.MsgConfirmBatch.create)
    ..hasRequiredFields = false
  ;

  QueryBatchConfirmsResponse._() : super();
  factory QueryBatchConfirmsResponse({
    $core.Iterable<$0.MsgConfirmBatch>? confirms,
  }) {
    final _result = create();
    if (confirms != null) {
      _result.confirms.addAll(confirms);
    }
    return _result;
  }
  factory QueryBatchConfirmsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryBatchConfirmsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryBatchConfirmsResponse clone() => QueryBatchConfirmsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryBatchConfirmsResponse copyWith(void Function(QueryBatchConfirmsResponse) updates) => super.copyWith((message) => updates(message as QueryBatchConfirmsResponse)) as QueryBatchConfirmsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryBatchConfirmsResponse create() => QueryBatchConfirmsResponse._();
  QueryBatchConfirmsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryBatchConfirmsResponse> createRepeated() => $pb.PbList<QueryBatchConfirmsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryBatchConfirmsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryBatchConfirmsResponse>(create);
  static QueryBatchConfirmsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.MsgConfirmBatch> get confirms => $_getList(0);
}

class QueryLogicConfirmsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLogicConfirmsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invalidationNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryLogicConfirmsRequest._() : super();
  factory QueryLogicConfirmsRequest({
    $core.List<$core.int>? invalidationId,
    $fixnum.Int64? invalidationNonce,
  }) {
    final _result = create();
    if (invalidationId != null) {
      _result.invalidationId = invalidationId;
    }
    if (invalidationNonce != null) {
      _result.invalidationNonce = invalidationNonce;
    }
    return _result;
  }
  factory QueryLogicConfirmsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLogicConfirmsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLogicConfirmsRequest clone() => QueryLogicConfirmsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLogicConfirmsRequest copyWith(void Function(QueryLogicConfirmsRequest) updates) => super.copyWith((message) => updates(message as QueryLogicConfirmsRequest)) as QueryLogicConfirmsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLogicConfirmsRequest create() => QueryLogicConfirmsRequest._();
  QueryLogicConfirmsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLogicConfirmsRequest> createRepeated() => $pb.PbList<QueryLogicConfirmsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLogicConfirmsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLogicConfirmsRequest>(create);
  static QueryLogicConfirmsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get invalidationId => $_getN(0);
  @$pb.TagNumber(1)
  set invalidationId($core.List<$core.int> v) { $_setBytes(0, v); }
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
}

class QueryLogicConfirmsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLogicConfirmsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$0.MsgConfirmLogicCall>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirms', $pb.PbFieldType.PM, subBuilder: $0.MsgConfirmLogicCall.create)
    ..hasRequiredFields = false
  ;

  QueryLogicConfirmsResponse._() : super();
  factory QueryLogicConfirmsResponse({
    $core.Iterable<$0.MsgConfirmLogicCall>? confirms,
  }) {
    final _result = create();
    if (confirms != null) {
      _result.confirms.addAll(confirms);
    }
    return _result;
  }
  factory QueryLogicConfirmsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLogicConfirmsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLogicConfirmsResponse clone() => QueryLogicConfirmsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLogicConfirmsResponse copyWith(void Function(QueryLogicConfirmsResponse) updates) => super.copyWith((message) => updates(message as QueryLogicConfirmsResponse)) as QueryLogicConfirmsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLogicConfirmsResponse create() => QueryLogicConfirmsResponse._();
  QueryLogicConfirmsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLogicConfirmsResponse> createRepeated() => $pb.PbList<QueryLogicConfirmsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLogicConfirmsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLogicConfirmsResponse>(create);
  static QueryLogicConfirmsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.MsgConfirmLogicCall> get confirms => $_getList(0);
}

class QueryLastEventNonceByAddrRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastEventNonceByAddrRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  QueryLastEventNonceByAddrRequest._() : super();
  factory QueryLastEventNonceByAddrRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory QueryLastEventNonceByAddrRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastEventNonceByAddrRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastEventNonceByAddrRequest clone() => QueryLastEventNonceByAddrRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastEventNonceByAddrRequest copyWith(void Function(QueryLastEventNonceByAddrRequest) updates) => super.copyWith((message) => updates(message as QueryLastEventNonceByAddrRequest)) as QueryLastEventNonceByAddrRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastEventNonceByAddrRequest create() => QueryLastEventNonceByAddrRequest._();
  QueryLastEventNonceByAddrRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastEventNonceByAddrRequest> createRepeated() => $pb.PbList<QueryLastEventNonceByAddrRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastEventNonceByAddrRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastEventNonceByAddrRequest>(create);
  static QueryLastEventNonceByAddrRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class QueryLastEventNonceByAddrResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastEventNonceByAddrResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryLastEventNonceByAddrResponse._() : super();
  factory QueryLastEventNonceByAddrResponse({
    $fixnum.Int64? eventNonce,
  }) {
    final _result = create();
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    return _result;
  }
  factory QueryLastEventNonceByAddrResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastEventNonceByAddrResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastEventNonceByAddrResponse clone() => QueryLastEventNonceByAddrResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastEventNonceByAddrResponse copyWith(void Function(QueryLastEventNonceByAddrResponse) updates) => super.copyWith((message) => updates(message as QueryLastEventNonceByAddrResponse)) as QueryLastEventNonceByAddrResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastEventNonceByAddrResponse create() => QueryLastEventNonceByAddrResponse._();
  QueryLastEventNonceByAddrResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastEventNonceByAddrResponse> createRepeated() => $pb.PbList<QueryLastEventNonceByAddrResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastEventNonceByAddrResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastEventNonceByAddrResponse>(create);
  static QueryLastEventNonceByAddrResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set eventNonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventNonce() => clearField(1);
}

class QueryERC20ToDenomRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryERC20ToDenomRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'erc20')
    ..hasRequiredFields = false
  ;

  QueryERC20ToDenomRequest._() : super();
  factory QueryERC20ToDenomRequest({
    $core.String? erc20,
  }) {
    final _result = create();
    if (erc20 != null) {
      _result.erc20 = erc20;
    }
    return _result;
  }
  factory QueryERC20ToDenomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryERC20ToDenomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryERC20ToDenomRequest clone() => QueryERC20ToDenomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryERC20ToDenomRequest copyWith(void Function(QueryERC20ToDenomRequest) updates) => super.copyWith((message) => updates(message as QueryERC20ToDenomRequest)) as QueryERC20ToDenomRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryERC20ToDenomRequest create() => QueryERC20ToDenomRequest._();
  QueryERC20ToDenomRequest createEmptyInstance() => create();
  static $pb.PbList<QueryERC20ToDenomRequest> createRepeated() => $pb.PbList<QueryERC20ToDenomRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryERC20ToDenomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryERC20ToDenomRequest>(create);
  static QueryERC20ToDenomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get erc20 => $_getSZ(0);
  @$pb.TagNumber(1)
  set erc20($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErc20() => $_has(0);
  @$pb.TagNumber(1)
  void clearErc20() => clearField(1);
}

class QueryERC20ToDenomResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryERC20ToDenomResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denom')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosOriginated')
    ..hasRequiredFields = false
  ;

  QueryERC20ToDenomResponse._() : super();
  factory QueryERC20ToDenomResponse({
    $core.String? denom,
    $core.bool? cosmosOriginated,
  }) {
    final _result = create();
    if (denom != null) {
      _result.denom = denom;
    }
    if (cosmosOriginated != null) {
      _result.cosmosOriginated = cosmosOriginated;
    }
    return _result;
  }
  factory QueryERC20ToDenomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryERC20ToDenomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryERC20ToDenomResponse clone() => QueryERC20ToDenomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryERC20ToDenomResponse copyWith(void Function(QueryERC20ToDenomResponse) updates) => super.copyWith((message) => updates(message as QueryERC20ToDenomResponse)) as QueryERC20ToDenomResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryERC20ToDenomResponse create() => QueryERC20ToDenomResponse._();
  QueryERC20ToDenomResponse createEmptyInstance() => create();
  static $pb.PbList<QueryERC20ToDenomResponse> createRepeated() => $pb.PbList<QueryERC20ToDenomResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryERC20ToDenomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryERC20ToDenomResponse>(create);
  static QueryERC20ToDenomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get denom => $_getSZ(0);
  @$pb.TagNumber(1)
  set denom($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearDenom() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get cosmosOriginated => $_getBF(1);
  @$pb.TagNumber(2)
  set cosmosOriginated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCosmosOriginated() => $_has(1);
  @$pb.TagNumber(2)
  void clearCosmosOriginated() => clearField(2);
}

class QueryDenomToERC20Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDenomToERC20Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denom')
    ..hasRequiredFields = false
  ;

  QueryDenomToERC20Request._() : super();
  factory QueryDenomToERC20Request({
    $core.String? denom,
  }) {
    final _result = create();
    if (denom != null) {
      _result.denom = denom;
    }
    return _result;
  }
  factory QueryDenomToERC20Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDenomToERC20Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDenomToERC20Request clone() => QueryDenomToERC20Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDenomToERC20Request copyWith(void Function(QueryDenomToERC20Request) updates) => super.copyWith((message) => updates(message as QueryDenomToERC20Request)) as QueryDenomToERC20Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDenomToERC20Request create() => QueryDenomToERC20Request._();
  QueryDenomToERC20Request createEmptyInstance() => create();
  static $pb.PbList<QueryDenomToERC20Request> createRepeated() => $pb.PbList<QueryDenomToERC20Request>();
  @$core.pragma('dart2js:noInline')
  static QueryDenomToERC20Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDenomToERC20Request>(create);
  static QueryDenomToERC20Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get denom => $_getSZ(0);
  @$pb.TagNumber(1)
  set denom($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearDenom() => clearField(1);
}

class QueryDenomToERC20Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDenomToERC20Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'erc20')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosOriginated')
    ..hasRequiredFields = false
  ;

  QueryDenomToERC20Response._() : super();
  factory QueryDenomToERC20Response({
    $core.String? erc20,
    $core.bool? cosmosOriginated,
  }) {
    final _result = create();
    if (erc20 != null) {
      _result.erc20 = erc20;
    }
    if (cosmosOriginated != null) {
      _result.cosmosOriginated = cosmosOriginated;
    }
    return _result;
  }
  factory QueryDenomToERC20Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDenomToERC20Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDenomToERC20Response clone() => QueryDenomToERC20Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDenomToERC20Response copyWith(void Function(QueryDenomToERC20Response) updates) => super.copyWith((message) => updates(message as QueryDenomToERC20Response)) as QueryDenomToERC20Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDenomToERC20Response create() => QueryDenomToERC20Response._();
  QueryDenomToERC20Response createEmptyInstance() => create();
  static $pb.PbList<QueryDenomToERC20Response> createRepeated() => $pb.PbList<QueryDenomToERC20Response>();
  @$core.pragma('dart2js:noInline')
  static QueryDenomToERC20Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDenomToERC20Response>(create);
  static QueryDenomToERC20Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get erc20 => $_getSZ(0);
  @$pb.TagNumber(1)
  set erc20($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErc20() => $_has(0);
  @$pb.TagNumber(1)
  void clearErc20() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get cosmosOriginated => $_getBF(1);
  @$pb.TagNumber(2)
  set cosmosOriginated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCosmosOriginated() => $_has(1);
  @$pb.TagNumber(2)
  void clearCosmosOriginated() => clearField(2);
}

class QueryLastObservedEthBlockRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastObservedEthBlockRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'useV1Key')
    ..hasRequiredFields = false
  ;

  QueryLastObservedEthBlockRequest._() : super();
  factory QueryLastObservedEthBlockRequest({
    $core.bool? useV1Key,
  }) {
    final _result = create();
    if (useV1Key != null) {
      _result.useV1Key = useV1Key;
    }
    return _result;
  }
  factory QueryLastObservedEthBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastObservedEthBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthBlockRequest clone() => QueryLastObservedEthBlockRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthBlockRequest copyWith(void Function(QueryLastObservedEthBlockRequest) updates) => super.copyWith((message) => updates(message as QueryLastObservedEthBlockRequest)) as QueryLastObservedEthBlockRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthBlockRequest create() => QueryLastObservedEthBlockRequest._();
  QueryLastObservedEthBlockRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastObservedEthBlockRequest> createRepeated() => $pb.PbList<QueryLastObservedEthBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastObservedEthBlockRequest>(create);
  static QueryLastObservedEthBlockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get useV1Key => $_getBF(0);
  @$pb.TagNumber(1)
  set useV1Key($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUseV1Key() => $_has(0);
  @$pb.TagNumber(1)
  void clearUseV1Key() => clearField(1);
}

class QueryLastObservedEthBlockResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastObservedEthBlockResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'block', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryLastObservedEthBlockResponse._() : super();
  factory QueryLastObservedEthBlockResponse({
    $fixnum.Int64? block,
  }) {
    final _result = create();
    if (block != null) {
      _result.block = block;
    }
    return _result;
  }
  factory QueryLastObservedEthBlockResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastObservedEthBlockResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthBlockResponse clone() => QueryLastObservedEthBlockResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthBlockResponse copyWith(void Function(QueryLastObservedEthBlockResponse) updates) => super.copyWith((message) => updates(message as QueryLastObservedEthBlockResponse)) as QueryLastObservedEthBlockResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthBlockResponse create() => QueryLastObservedEthBlockResponse._();
  QueryLastObservedEthBlockResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastObservedEthBlockResponse> createRepeated() => $pb.PbList<QueryLastObservedEthBlockResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthBlockResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastObservedEthBlockResponse>(create);
  static QueryLastObservedEthBlockResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get block => $_getI64(0);
  @$pb.TagNumber(1)
  set block($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlock() => clearField(1);
}

class QueryLastObservedEthNonceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastObservedEthNonceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'useV1Key')
    ..hasRequiredFields = false
  ;

  QueryLastObservedEthNonceRequest._() : super();
  factory QueryLastObservedEthNonceRequest({
    $core.bool? useV1Key,
  }) {
    final _result = create();
    if (useV1Key != null) {
      _result.useV1Key = useV1Key;
    }
    return _result;
  }
  factory QueryLastObservedEthNonceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastObservedEthNonceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthNonceRequest clone() => QueryLastObservedEthNonceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthNonceRequest copyWith(void Function(QueryLastObservedEthNonceRequest) updates) => super.copyWith((message) => updates(message as QueryLastObservedEthNonceRequest)) as QueryLastObservedEthNonceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthNonceRequest create() => QueryLastObservedEthNonceRequest._();
  QueryLastObservedEthNonceRequest createEmptyInstance() => create();
  static $pb.PbList<QueryLastObservedEthNonceRequest> createRepeated() => $pb.PbList<QueryLastObservedEthNonceRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthNonceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastObservedEthNonceRequest>(create);
  static QueryLastObservedEthNonceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get useV1Key => $_getBF(0);
  @$pb.TagNumber(1)
  set useV1Key($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUseV1Key() => $_has(0);
  @$pb.TagNumber(1)
  void clearUseV1Key() => clearField(1);
}

class QueryLastObservedEthNonceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryLastObservedEthNonceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryLastObservedEthNonceResponse._() : super();
  factory QueryLastObservedEthNonceResponse({
    $fixnum.Int64? nonce,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    return _result;
  }
  factory QueryLastObservedEthNonceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryLastObservedEthNonceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthNonceResponse clone() => QueryLastObservedEthNonceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryLastObservedEthNonceResponse copyWith(void Function(QueryLastObservedEthNonceResponse) updates) => super.copyWith((message) => updates(message as QueryLastObservedEthNonceResponse)) as QueryLastObservedEthNonceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthNonceResponse create() => QueryLastObservedEthNonceResponse._();
  QueryLastObservedEthNonceResponse createEmptyInstance() => create();
  static $pb.PbList<QueryLastObservedEthNonceResponse> createRepeated() => $pb.PbList<QueryLastObservedEthNonceResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryLastObservedEthNonceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryLastObservedEthNonceResponse>(create);
  static QueryLastObservedEthNonceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);
}

class QueryAttestationsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAttestationsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'claimType')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'useV1Key')
    ..hasRequiredFields = false
  ;

  QueryAttestationsRequest._() : super();
  factory QueryAttestationsRequest({
    $fixnum.Int64? limit,
    $core.String? orderBy,
    $core.String? claimType,
    $fixnum.Int64? nonce,
    $fixnum.Int64? height,
    $core.bool? useV1Key,
  }) {
    final _result = create();
    if (limit != null) {
      _result.limit = limit;
    }
    if (orderBy != null) {
      _result.orderBy = orderBy;
    }
    if (claimType != null) {
      _result.claimType = claimType;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (height != null) {
      _result.height = height;
    }
    if (useV1Key != null) {
      _result.useV1Key = useV1Key;
    }
    return _result;
  }
  factory QueryAttestationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAttestationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAttestationsRequest clone() => QueryAttestationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAttestationsRequest copyWith(void Function(QueryAttestationsRequest) updates) => super.copyWith((message) => updates(message as QueryAttestationsRequest)) as QueryAttestationsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAttestationsRequest create() => QueryAttestationsRequest._();
  QueryAttestationsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryAttestationsRequest> createRepeated() => $pb.PbList<QueryAttestationsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryAttestationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAttestationsRequest>(create);
  static QueryAttestationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get limit => $_getI64(0);
  @$pb.TagNumber(1)
  set limit($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderBy() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get claimType => $_getSZ(2);
  @$pb.TagNumber(3)
  set claimType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClaimType() => $_has(2);
  @$pb.TagNumber(3)
  void clearClaimType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get nonce => $_getI64(3);
  @$pb.TagNumber(4)
  set nonce($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get height => $_getI64(4);
  @$pb.TagNumber(5)
  set height($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get useV1Key => $_getBF(5);
  @$pb.TagNumber(6)
  set useV1Key($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUseV1Key() => $_has(5);
  @$pb.TagNumber(6)
  void clearUseV1Key() => clearField(6);
}

class QueryAttestationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAttestationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$13.Attestation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestations', $pb.PbFieldType.PM, subBuilder: $13.Attestation.create)
    ..hasRequiredFields = false
  ;

  QueryAttestationsResponse._() : super();
  factory QueryAttestationsResponse({
    $core.Iterable<$13.Attestation>? attestations,
  }) {
    final _result = create();
    if (attestations != null) {
      _result.attestations.addAll(attestations);
    }
    return _result;
  }
  factory QueryAttestationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAttestationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAttestationsResponse clone() => QueryAttestationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAttestationsResponse copyWith(void Function(QueryAttestationsResponse) updates) => super.copyWith((message) => updates(message as QueryAttestationsResponse)) as QueryAttestationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAttestationsResponse create() => QueryAttestationsResponse._();
  QueryAttestationsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryAttestationsResponse> createRepeated() => $pb.PbList<QueryAttestationsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryAttestationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAttestationsResponse>(create);
  static QueryAttestationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$13.Attestation> get attestations => $_getList(0);
}

class QueryDelegateKeysByValidatorAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegateKeysByValidatorAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddress')
    ..hasRequiredFields = false
  ;

  QueryDelegateKeysByValidatorAddress._() : super();
  factory QueryDelegateKeysByValidatorAddress({
    $core.String? validatorAddress,
  }) {
    final _result = create();
    if (validatorAddress != null) {
      _result.validatorAddress = validatorAddress;
    }
    return _result;
  }
  factory QueryDelegateKeysByValidatorAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegateKeysByValidatorAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByValidatorAddress clone() => QueryDelegateKeysByValidatorAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByValidatorAddress copyWith(void Function(QueryDelegateKeysByValidatorAddress) updates) => super.copyWith((message) => updates(message as QueryDelegateKeysByValidatorAddress)) as QueryDelegateKeysByValidatorAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByValidatorAddress create() => QueryDelegateKeysByValidatorAddress._();
  QueryDelegateKeysByValidatorAddress createEmptyInstance() => create();
  static $pb.PbList<QueryDelegateKeysByValidatorAddress> createRepeated() => $pb.PbList<QueryDelegateKeysByValidatorAddress>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByValidatorAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegateKeysByValidatorAddress>(create);
  static QueryDelegateKeysByValidatorAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddress() => clearField(1);
}

class QueryDelegateKeysByValidatorAddressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegateKeysByValidatorAddressResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethAddress')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestratorAddress')
    ..hasRequiredFields = false
  ;

  QueryDelegateKeysByValidatorAddressResponse._() : super();
  factory QueryDelegateKeysByValidatorAddressResponse({
    $core.String? ethAddress,
    $core.String? orchestratorAddress,
  }) {
    final _result = create();
    if (ethAddress != null) {
      _result.ethAddress = ethAddress;
    }
    if (orchestratorAddress != null) {
      _result.orchestratorAddress = orchestratorAddress;
    }
    return _result;
  }
  factory QueryDelegateKeysByValidatorAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegateKeysByValidatorAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByValidatorAddressResponse clone() => QueryDelegateKeysByValidatorAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByValidatorAddressResponse copyWith(void Function(QueryDelegateKeysByValidatorAddressResponse) updates) => super.copyWith((message) => updates(message as QueryDelegateKeysByValidatorAddressResponse)) as QueryDelegateKeysByValidatorAddressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByValidatorAddressResponse create() => QueryDelegateKeysByValidatorAddressResponse._();
  QueryDelegateKeysByValidatorAddressResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegateKeysByValidatorAddressResponse> createRepeated() => $pb.PbList<QueryDelegateKeysByValidatorAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByValidatorAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegateKeysByValidatorAddressResponse>(create);
  static QueryDelegateKeysByValidatorAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ethAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ethAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEthAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearEthAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orchestratorAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set orchestratorAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrchestratorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrchestratorAddress() => clearField(2);
}

class QueryDelegateKeysByEthAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegateKeysByEthAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethAddress')
    ..hasRequiredFields = false
  ;

  QueryDelegateKeysByEthAddress._() : super();
  factory QueryDelegateKeysByEthAddress({
    $core.String? ethAddress,
  }) {
    final _result = create();
    if (ethAddress != null) {
      _result.ethAddress = ethAddress;
    }
    return _result;
  }
  factory QueryDelegateKeysByEthAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegateKeysByEthAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByEthAddress clone() => QueryDelegateKeysByEthAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByEthAddress copyWith(void Function(QueryDelegateKeysByEthAddress) updates) => super.copyWith((message) => updates(message as QueryDelegateKeysByEthAddress)) as QueryDelegateKeysByEthAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByEthAddress create() => QueryDelegateKeysByEthAddress._();
  QueryDelegateKeysByEthAddress createEmptyInstance() => create();
  static $pb.PbList<QueryDelegateKeysByEthAddress> createRepeated() => $pb.PbList<QueryDelegateKeysByEthAddress>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByEthAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegateKeysByEthAddress>(create);
  static QueryDelegateKeysByEthAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ethAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ethAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEthAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearEthAddress() => clearField(1);
}

class QueryDelegateKeysByEthAddressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegateKeysByEthAddressResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddress')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestratorAddress')
    ..hasRequiredFields = false
  ;

  QueryDelegateKeysByEthAddressResponse._() : super();
  factory QueryDelegateKeysByEthAddressResponse({
    $core.String? validatorAddress,
    $core.String? orchestratorAddress,
  }) {
    final _result = create();
    if (validatorAddress != null) {
      _result.validatorAddress = validatorAddress;
    }
    if (orchestratorAddress != null) {
      _result.orchestratorAddress = orchestratorAddress;
    }
    return _result;
  }
  factory QueryDelegateKeysByEthAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegateKeysByEthAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByEthAddressResponse clone() => QueryDelegateKeysByEthAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByEthAddressResponse copyWith(void Function(QueryDelegateKeysByEthAddressResponse) updates) => super.copyWith((message) => updates(message as QueryDelegateKeysByEthAddressResponse)) as QueryDelegateKeysByEthAddressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByEthAddressResponse create() => QueryDelegateKeysByEthAddressResponse._();
  QueryDelegateKeysByEthAddressResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegateKeysByEthAddressResponse> createRepeated() => $pb.PbList<QueryDelegateKeysByEthAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByEthAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegateKeysByEthAddressResponse>(create);
  static QueryDelegateKeysByEthAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orchestratorAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set orchestratorAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrchestratorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrchestratorAddress() => clearField(2);
}

class QueryDelegateKeysByOrchestratorAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegateKeysByOrchestratorAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orchestratorAddress')
    ..hasRequiredFields = false
  ;

  QueryDelegateKeysByOrchestratorAddress._() : super();
  factory QueryDelegateKeysByOrchestratorAddress({
    $core.String? orchestratorAddress,
  }) {
    final _result = create();
    if (orchestratorAddress != null) {
      _result.orchestratorAddress = orchestratorAddress;
    }
    return _result;
  }
  factory QueryDelegateKeysByOrchestratorAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegateKeysByOrchestratorAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByOrchestratorAddress clone() => QueryDelegateKeysByOrchestratorAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByOrchestratorAddress copyWith(void Function(QueryDelegateKeysByOrchestratorAddress) updates) => super.copyWith((message) => updates(message as QueryDelegateKeysByOrchestratorAddress)) as QueryDelegateKeysByOrchestratorAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByOrchestratorAddress create() => QueryDelegateKeysByOrchestratorAddress._();
  QueryDelegateKeysByOrchestratorAddress createEmptyInstance() => create();
  static $pb.PbList<QueryDelegateKeysByOrchestratorAddress> createRepeated() => $pb.PbList<QueryDelegateKeysByOrchestratorAddress>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByOrchestratorAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegateKeysByOrchestratorAddress>(create);
  static QueryDelegateKeysByOrchestratorAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orchestratorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set orchestratorAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrchestratorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrchestratorAddress() => clearField(1);
}

class QueryDelegateKeysByOrchestratorAddressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegateKeysByOrchestratorAddressResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddress')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethAddress')
    ..hasRequiredFields = false
  ;

  QueryDelegateKeysByOrchestratorAddressResponse._() : super();
  factory QueryDelegateKeysByOrchestratorAddressResponse({
    $core.String? validatorAddress,
    $core.String? ethAddress,
  }) {
    final _result = create();
    if (validatorAddress != null) {
      _result.validatorAddress = validatorAddress;
    }
    if (ethAddress != null) {
      _result.ethAddress = ethAddress;
    }
    return _result;
  }
  factory QueryDelegateKeysByOrchestratorAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegateKeysByOrchestratorAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByOrchestratorAddressResponse clone() => QueryDelegateKeysByOrchestratorAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegateKeysByOrchestratorAddressResponse copyWith(void Function(QueryDelegateKeysByOrchestratorAddressResponse) updates) => super.copyWith((message) => updates(message as QueryDelegateKeysByOrchestratorAddressResponse)) as QueryDelegateKeysByOrchestratorAddressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByOrchestratorAddressResponse create() => QueryDelegateKeysByOrchestratorAddressResponse._();
  QueryDelegateKeysByOrchestratorAddressResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegateKeysByOrchestratorAddressResponse> createRepeated() => $pb.PbList<QueryDelegateKeysByOrchestratorAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegateKeysByOrchestratorAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegateKeysByOrchestratorAddressResponse>(create);
  static QueryDelegateKeysByOrchestratorAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ethAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set ethAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthAddress() => clearField(2);
}

class QueryPendingSendToEth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPendingSendToEth', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderAddress')
    ..hasRequiredFields = false
  ;

  QueryPendingSendToEth._() : super();
  factory QueryPendingSendToEth({
    $core.String? senderAddress,
  }) {
    final _result = create();
    if (senderAddress != null) {
      _result.senderAddress = senderAddress;
    }
    return _result;
  }
  factory QueryPendingSendToEth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPendingSendToEth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPendingSendToEth clone() => QueryPendingSendToEth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPendingSendToEth copyWith(void Function(QueryPendingSendToEth) updates) => super.copyWith((message) => updates(message as QueryPendingSendToEth)) as QueryPendingSendToEth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPendingSendToEth create() => QueryPendingSendToEth._();
  QueryPendingSendToEth createEmptyInstance() => create();
  static $pb.PbList<QueryPendingSendToEth> createRepeated() => $pb.PbList<QueryPendingSendToEth>();
  @$core.pragma('dart2js:noInline')
  static QueryPendingSendToEth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPendingSendToEth>(create);
  static QueryPendingSendToEth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get senderAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set senderAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderAddress() => clearField(1);
}

class QueryPendingSendToEthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPendingSendToEthResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$14.OutgoingTransferTx>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transfersInBatches', $pb.PbFieldType.PM, subBuilder: $14.OutgoingTransferTx.create)
    ..pc<$14.OutgoingTransferTx>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbatchedTransfers', $pb.PbFieldType.PM, subBuilder: $14.OutgoingTransferTx.create)
    ..hasRequiredFields = false
  ;

  QueryPendingSendToEthResponse._() : super();
  factory QueryPendingSendToEthResponse({
    $core.Iterable<$14.OutgoingTransferTx>? transfersInBatches,
    $core.Iterable<$14.OutgoingTransferTx>? unbatchedTransfers,
  }) {
    final _result = create();
    if (transfersInBatches != null) {
      _result.transfersInBatches.addAll(transfersInBatches);
    }
    if (unbatchedTransfers != null) {
      _result.unbatchedTransfers.addAll(unbatchedTransfers);
    }
    return _result;
  }
  factory QueryPendingSendToEthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPendingSendToEthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPendingSendToEthResponse clone() => QueryPendingSendToEthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPendingSendToEthResponse copyWith(void Function(QueryPendingSendToEthResponse) updates) => super.copyWith((message) => updates(message as QueryPendingSendToEthResponse)) as QueryPendingSendToEthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPendingSendToEthResponse create() => QueryPendingSendToEthResponse._();
  QueryPendingSendToEthResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPendingSendToEthResponse> createRepeated() => $pb.PbList<QueryPendingSendToEthResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPendingSendToEthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPendingSendToEthResponse>(create);
  static QueryPendingSendToEthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$14.OutgoingTransferTx> get transfersInBatches => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$14.OutgoingTransferTx> get unbatchedTransfers => $_getList(1);
}

class QueryPendingIbcAutoForwards extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPendingIbcAutoForwards', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryPendingIbcAutoForwards._() : super();
  factory QueryPendingIbcAutoForwards({
    $fixnum.Int64? limit,
  }) {
    final _result = create();
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory QueryPendingIbcAutoForwards.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPendingIbcAutoForwards.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPendingIbcAutoForwards clone() => QueryPendingIbcAutoForwards()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPendingIbcAutoForwards copyWith(void Function(QueryPendingIbcAutoForwards) updates) => super.copyWith((message) => updates(message as QueryPendingIbcAutoForwards)) as QueryPendingIbcAutoForwards; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPendingIbcAutoForwards create() => QueryPendingIbcAutoForwards._();
  QueryPendingIbcAutoForwards createEmptyInstance() => create();
  static $pb.PbList<QueryPendingIbcAutoForwards> createRepeated() => $pb.PbList<QueryPendingIbcAutoForwards>();
  @$core.pragma('dart2js:noInline')
  static QueryPendingIbcAutoForwards getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPendingIbcAutoForwards>(create);
  static QueryPendingIbcAutoForwards? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get limit => $_getI64(0);
  @$pb.TagNumber(1)
  set limit($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);
}

class QueryPendingIbcAutoForwardsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPendingIbcAutoForwardsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..pc<$11.PendingIbcAutoForward>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pendingIbcAutoForwards', $pb.PbFieldType.PM, subBuilder: $11.PendingIbcAutoForward.create)
    ..hasRequiredFields = false
  ;

  QueryPendingIbcAutoForwardsResponse._() : super();
  factory QueryPendingIbcAutoForwardsResponse({
    $core.Iterable<$11.PendingIbcAutoForward>? pendingIbcAutoForwards,
  }) {
    final _result = create();
    if (pendingIbcAutoForwards != null) {
      _result.pendingIbcAutoForwards.addAll(pendingIbcAutoForwards);
    }
    return _result;
  }
  factory QueryPendingIbcAutoForwardsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPendingIbcAutoForwardsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPendingIbcAutoForwardsResponse clone() => QueryPendingIbcAutoForwardsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPendingIbcAutoForwardsResponse copyWith(void Function(QueryPendingIbcAutoForwardsResponse) updates) => super.copyWith((message) => updates(message as QueryPendingIbcAutoForwardsResponse)) as QueryPendingIbcAutoForwardsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPendingIbcAutoForwardsResponse create() => QueryPendingIbcAutoForwardsResponse._();
  QueryPendingIbcAutoForwardsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPendingIbcAutoForwardsResponse> createRepeated() => $pb.PbList<QueryPendingIbcAutoForwardsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPendingIbcAutoForwardsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPendingIbcAutoForwardsResponse>(create);
  static QueryPendingIbcAutoForwardsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.PendingIbcAutoForward> get pendingIbcAutoForwards => $_getList(0);
}

