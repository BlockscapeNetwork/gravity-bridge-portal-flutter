///
//  Generated code. Do not modify.
//  source: tendermint/crypto/keys.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum PublicKey_Sum {
  ed25519, 
  notSet
}

class PublicKey extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, PublicKey_Sum> _PublicKey_SumByTag = {
    1 : PublicKey_Sum.ed25519,
    0 : PublicKey_Sum.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublicKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.crypto'), createEmptyInstance: create)
    ..oo(0, [1])
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ed25519', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PublicKey._() : super();
  factory PublicKey({
    $core.List<$core.int>? ed25519,
  }) {
    final _result = create();
    if (ed25519 != null) {
      _result.ed25519 = ed25519;
    }
    return _result;
  }
  factory PublicKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicKey clone() => PublicKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicKey copyWith(void Function(PublicKey) updates) => super.copyWith((message) => updates(message as PublicKey)) as PublicKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublicKey create() => PublicKey._();
  PublicKey createEmptyInstance() => create();
  static $pb.PbList<PublicKey> createRepeated() => $pb.PbList<PublicKey>();
  @$core.pragma('dart2js:noInline')
  static PublicKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicKey>(create);
  static PublicKey? _defaultInstance;

  PublicKey_Sum whichSum() => _PublicKey_SumByTag[$_whichOneof(0)]!;
  void clearSum() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get ed25519 => $_getN(0);
  @$pb.TagNumber(1)
  set ed25519($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEd25519() => $_has(0);
  @$pb.TagNumber(1)
  void clearEd25519() => clearField(1);
}

enum PrivateKey_Sum {
  ed25519, 
  notSet
}

class PrivateKey extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, PrivateKey_Sum> _PrivateKey_SumByTag = {
    1 : PrivateKey_Sum.ed25519,
    0 : PrivateKey_Sum.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PrivateKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.crypto'), createEmptyInstance: create)
    ..oo(0, [1])
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ed25519', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PrivateKey._() : super();
  factory PrivateKey({
    $core.List<$core.int>? ed25519,
  }) {
    final _result = create();
    if (ed25519 != null) {
      _result.ed25519 = ed25519;
    }
    return _result;
  }
  factory PrivateKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PrivateKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PrivateKey clone() => PrivateKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PrivateKey copyWith(void Function(PrivateKey) updates) => super.copyWith((message) => updates(message as PrivateKey)) as PrivateKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrivateKey create() => PrivateKey._();
  PrivateKey createEmptyInstance() => create();
  static $pb.PbList<PrivateKey> createRepeated() => $pb.PbList<PrivateKey>();
  @$core.pragma('dart2js:noInline')
  static PrivateKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrivateKey>(create);
  static PrivateKey? _defaultInstance;

  PrivateKey_Sum whichSum() => _PrivateKey_SumByTag[$_whichOneof(0)]!;
  void clearSum() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get ed25519 => $_getN(0);
  @$pb.TagNumber(1)
  set ed25519($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEd25519() => $_has(0);
  @$pb.TagNumber(1)
  void clearEd25519() => clearField(1);
}

