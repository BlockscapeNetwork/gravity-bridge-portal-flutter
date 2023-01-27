///
//  Generated code. Do not modify.
//  source: gravity/v1/types.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../cosmos/bank/v1beta1/bank.pb.dart' as $10;
import '../../cosmos/base/v1beta1/coin.pb.dart' as $9;

class BridgeValidator extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BridgeValidator', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'power', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethereumAddress')
    ..hasRequiredFields = false
  ;

  BridgeValidator._() : super();
  factory BridgeValidator({
    $fixnum.Int64? power,
    $core.String? ethereumAddress,
  }) {
    final _result = create();
    if (power != null) {
      _result.power = power;
    }
    if (ethereumAddress != null) {
      _result.ethereumAddress = ethereumAddress;
    }
    return _result;
  }
  factory BridgeValidator.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BridgeValidator.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BridgeValidator clone() => BridgeValidator()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BridgeValidator copyWith(void Function(BridgeValidator) updates) => super.copyWith((message) => updates(message as BridgeValidator)) as BridgeValidator; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BridgeValidator create() => BridgeValidator._();
  BridgeValidator createEmptyInstance() => create();
  static $pb.PbList<BridgeValidator> createRepeated() => $pb.PbList<BridgeValidator>();
  @$core.pragma('dart2js:noInline')
  static BridgeValidator getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BridgeValidator>(create);
  static BridgeValidator? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get power => $_getI64(0);
  @$pb.TagNumber(1)
  set power($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPower() => $_has(0);
  @$pb.TagNumber(1)
  void clearPower() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ethereumAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set ethereumAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthereumAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthereumAddress() => clearField(2);
}

class Valset extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Valset', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<BridgeValidator>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'members', $pb.PbFieldType.PM, subBuilder: BridgeValidator.create)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardAmount')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardToken')
    ..hasRequiredFields = false
  ;

  Valset._() : super();
  factory Valset({
    $fixnum.Int64? nonce,
    $core.Iterable<BridgeValidator>? members,
    $fixnum.Int64? height,
    $core.String? rewardAmount,
    $core.String? rewardToken,
  }) {
    final _result = create();
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    if (height != null) {
      _result.height = height;
    }
    if (rewardAmount != null) {
      _result.rewardAmount = rewardAmount;
    }
    if (rewardToken != null) {
      _result.rewardToken = rewardToken;
    }
    return _result;
  }
  factory Valset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Valset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Valset clone() => Valset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Valset copyWith(void Function(Valset) updates) => super.copyWith((message) => updates(message as Valset)) as Valset; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Valset create() => Valset._();
  Valset createEmptyInstance() => create();
  static $pb.PbList<Valset> createRepeated() => $pb.PbList<Valset>();
  @$core.pragma('dart2js:noInline')
  static Valset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Valset>(create);
  static Valset? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<BridgeValidator> get members => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rewardAmount => $_getSZ(3);
  @$pb.TagNumber(4)
  set rewardAmount($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRewardAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearRewardAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rewardToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set rewardToken($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRewardToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearRewardToken() => clearField(5);
}

class LastObservedEthereumBlockHeight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LastObservedEthereumBlockHeight', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cosmosBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ethereumBlockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  LastObservedEthereumBlockHeight._() : super();
  factory LastObservedEthereumBlockHeight({
    $fixnum.Int64? cosmosBlockHeight,
    $fixnum.Int64? ethereumBlockHeight,
  }) {
    final _result = create();
    if (cosmosBlockHeight != null) {
      _result.cosmosBlockHeight = cosmosBlockHeight;
    }
    if (ethereumBlockHeight != null) {
      _result.ethereumBlockHeight = ethereumBlockHeight;
    }
    return _result;
  }
  factory LastObservedEthereumBlockHeight.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LastObservedEthereumBlockHeight.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LastObservedEthereumBlockHeight clone() => LastObservedEthereumBlockHeight()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LastObservedEthereumBlockHeight copyWith(void Function(LastObservedEthereumBlockHeight) updates) => super.copyWith((message) => updates(message as LastObservedEthereumBlockHeight)) as LastObservedEthereumBlockHeight; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LastObservedEthereumBlockHeight create() => LastObservedEthereumBlockHeight._();
  LastObservedEthereumBlockHeight createEmptyInstance() => create();
  static $pb.PbList<LastObservedEthereumBlockHeight> createRepeated() => $pb.PbList<LastObservedEthereumBlockHeight>();
  @$core.pragma('dart2js:noInline')
  static LastObservedEthereumBlockHeight getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LastObservedEthereumBlockHeight>(create);
  static LastObservedEthereumBlockHeight? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get cosmosBlockHeight => $_getI64(0);
  @$pb.TagNumber(1)
  set cosmosBlockHeight($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCosmosBlockHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearCosmosBlockHeight() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ethereumBlockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set ethereumBlockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEthereumBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthereumBlockHeight() => clearField(2);
}

class ERC20ToDenom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ERC20ToDenom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'erc20')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denom')
    ..hasRequiredFields = false
  ;

  ERC20ToDenom._() : super();
  factory ERC20ToDenom({
    $core.String? erc20,
    $core.String? denom,
  }) {
    final _result = create();
    if (erc20 != null) {
      _result.erc20 = erc20;
    }
    if (denom != null) {
      _result.denom = denom;
    }
    return _result;
  }
  factory ERC20ToDenom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ERC20ToDenom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ERC20ToDenom clone() => ERC20ToDenom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ERC20ToDenom copyWith(void Function(ERC20ToDenom) updates) => super.copyWith((message) => updates(message as ERC20ToDenom)) as ERC20ToDenom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ERC20ToDenom create() => ERC20ToDenom._();
  ERC20ToDenom createEmptyInstance() => create();
  static $pb.PbList<ERC20ToDenom> createRepeated() => $pb.PbList<ERC20ToDenom>();
  @$core.pragma('dart2js:noInline')
  static ERC20ToDenom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ERC20ToDenom>(create);
  static ERC20ToDenom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get erc20 => $_getSZ(0);
  @$pb.TagNumber(1)
  set erc20($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErc20() => $_has(0);
  @$pb.TagNumber(1)
  void clearErc20() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get denom => $_getSZ(1);
  @$pb.TagNumber(2)
  set denom($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDenom() => $_has(1);
  @$pb.TagNumber(2)
  void clearDenom() => clearField(2);
}

class UnhaltBridgeProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnhaltBridgeProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UnhaltBridgeProposal._() : super();
  factory UnhaltBridgeProposal({
    $core.String? title,
    $core.String? description,
    $fixnum.Int64? targetNonce,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (targetNonce != null) {
      _result.targetNonce = targetNonce;
    }
    return _result;
  }
  factory UnhaltBridgeProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnhaltBridgeProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnhaltBridgeProposal clone() => UnhaltBridgeProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnhaltBridgeProposal copyWith(void Function(UnhaltBridgeProposal) updates) => super.copyWith((message) => updates(message as UnhaltBridgeProposal)) as UnhaltBridgeProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnhaltBridgeProposal create() => UnhaltBridgeProposal._();
  UnhaltBridgeProposal createEmptyInstance() => create();
  static $pb.PbList<UnhaltBridgeProposal> createRepeated() => $pb.PbList<UnhaltBridgeProposal>();
  @$core.pragma('dart2js:noInline')
  static UnhaltBridgeProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnhaltBridgeProposal>(create);
  static UnhaltBridgeProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get targetNonce => $_getI64(2);
  @$pb.TagNumber(4)
  set targetNonce($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasTargetNonce() => $_has(2);
  @$pb.TagNumber(4)
  void clearTargetNonce() => clearField(4);
}

class AirdropProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirdropProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denom')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recipients', $pb.PbFieldType.OY)
    ..p<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amounts', $pb.PbFieldType.PU6)
    ..hasRequiredFields = false
  ;

  AirdropProposal._() : super();
  factory AirdropProposal({
    $core.String? title,
    $core.String? description,
    $core.String? denom,
    $core.List<$core.int>? recipients,
    $core.Iterable<$fixnum.Int64>? amounts,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (denom != null) {
      _result.denom = denom;
    }
    if (recipients != null) {
      _result.recipients = recipients;
    }
    if (amounts != null) {
      _result.amounts.addAll(amounts);
    }
    return _result;
  }
  factory AirdropProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirdropProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirdropProposal clone() => AirdropProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirdropProposal copyWith(void Function(AirdropProposal) updates) => super.copyWith((message) => updates(message as AirdropProposal)) as AirdropProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirdropProposal create() => AirdropProposal._();
  AirdropProposal createEmptyInstance() => create();
  static $pb.PbList<AirdropProposal> createRepeated() => $pb.PbList<AirdropProposal>();
  @$core.pragma('dart2js:noInline')
  static AirdropProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirdropProposal>(create);
  static AirdropProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get denom => $_getSZ(2);
  @$pb.TagNumber(3)
  set denom($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDenom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDenom() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get recipients => $_getN(3);
  @$pb.TagNumber(4)
  set recipients($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRecipients() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecipients() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$fixnum.Int64> get amounts => $_getList(4);
}

class IBCMetadataProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IBCMetadataProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$10.Metadata>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', subBuilder: $10.Metadata.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ibcDenom')
    ..hasRequiredFields = false
  ;

  IBCMetadataProposal._() : super();
  factory IBCMetadataProposal({
    $core.String? title,
    $core.String? description,
    $10.Metadata? metadata,
    $core.String? ibcDenom,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (metadata != null) {
      _result.metadata = metadata;
    }
    if (ibcDenom != null) {
      _result.ibcDenom = ibcDenom;
    }
    return _result;
  }
  factory IBCMetadataProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IBCMetadataProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IBCMetadataProposal clone() => IBCMetadataProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IBCMetadataProposal copyWith(void Function(IBCMetadataProposal) updates) => super.copyWith((message) => updates(message as IBCMetadataProposal)) as IBCMetadataProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IBCMetadataProposal create() => IBCMetadataProposal._();
  IBCMetadataProposal createEmptyInstance() => create();
  static $pb.PbList<IBCMetadataProposal> createRepeated() => $pb.PbList<IBCMetadataProposal>();
  @$core.pragma('dart2js:noInline')
  static IBCMetadataProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IBCMetadataProposal>(create);
  static IBCMetadataProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $10.Metadata get metadata => $_getN(2);
  @$pb.TagNumber(3)
  set metadata($10.Metadata v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => clearField(3);
  @$pb.TagNumber(3)
  $10.Metadata ensureMetadata() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get ibcDenom => $_getSZ(3);
  @$pb.TagNumber(4)
  set ibcDenom($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIbcDenom() => $_has(3);
  @$pb.TagNumber(4)
  void clearIbcDenom() => clearField(4);
}

class PendingIbcAutoForward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PendingIbcAutoForward', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'gravity.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignReceiver')
    ..aOM<$9.Coin>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token', subBuilder: $9.Coin.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ibcChannel')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventNonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  PendingIbcAutoForward._() : super();
  factory PendingIbcAutoForward({
    $core.String? foreignReceiver,
    $9.Coin? token,
    $core.String? ibcChannel,
    $fixnum.Int64? eventNonce,
  }) {
    final _result = create();
    if (foreignReceiver != null) {
      _result.foreignReceiver = foreignReceiver;
    }
    if (token != null) {
      _result.token = token;
    }
    if (ibcChannel != null) {
      _result.ibcChannel = ibcChannel;
    }
    if (eventNonce != null) {
      _result.eventNonce = eventNonce;
    }
    return _result;
  }
  factory PendingIbcAutoForward.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PendingIbcAutoForward.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PendingIbcAutoForward clone() => PendingIbcAutoForward()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PendingIbcAutoForward copyWith(void Function(PendingIbcAutoForward) updates) => super.copyWith((message) => updates(message as PendingIbcAutoForward)) as PendingIbcAutoForward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PendingIbcAutoForward create() => PendingIbcAutoForward._();
  PendingIbcAutoForward createEmptyInstance() => create();
  static $pb.PbList<PendingIbcAutoForward> createRepeated() => $pb.PbList<PendingIbcAutoForward>();
  @$core.pragma('dart2js:noInline')
  static PendingIbcAutoForward getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PendingIbcAutoForward>(create);
  static PendingIbcAutoForward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get foreignReceiver => $_getSZ(0);
  @$pb.TagNumber(1)
  set foreignReceiver($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForeignReceiver() => $_has(0);
  @$pb.TagNumber(1)
  void clearForeignReceiver() => clearField(1);

  @$pb.TagNumber(2)
  $9.Coin get token => $_getN(1);
  @$pb.TagNumber(2)
  set token($9.Coin v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  $9.Coin ensureToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get ibcChannel => $_getSZ(2);
  @$pb.TagNumber(3)
  set ibcChannel($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIbcChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearIbcChannel() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get eventNonce => $_getI64(3);
  @$pb.TagNumber(4)
  set eventNonce($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventNonce() => clearField(4);
}

