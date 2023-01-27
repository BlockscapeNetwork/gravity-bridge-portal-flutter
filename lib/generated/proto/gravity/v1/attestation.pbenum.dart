///
//  Generated code. Do not modify.
//  source: gravity/v1/attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ClaimType extends $pb.ProtobufEnum {
  static const ClaimType CLAIM_TYPE_UNSPECIFIED = ClaimType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_TYPE_UNSPECIFIED');
  static const ClaimType CLAIM_TYPE_SEND_TO_COSMOS = ClaimType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_TYPE_SEND_TO_COSMOS');
  static const ClaimType CLAIM_TYPE_BATCH_SEND_TO_ETH = ClaimType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_TYPE_BATCH_SEND_TO_ETH');
  static const ClaimType CLAIM_TYPE_ERC20_DEPLOYED = ClaimType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_TYPE_ERC20_DEPLOYED');
  static const ClaimType CLAIM_TYPE_LOGIC_CALL_EXECUTED = ClaimType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_TYPE_LOGIC_CALL_EXECUTED');
  static const ClaimType CLAIM_TYPE_VALSET_UPDATED = ClaimType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_TYPE_VALSET_UPDATED');

  static const $core.List<ClaimType> values = <ClaimType> [
    CLAIM_TYPE_UNSPECIFIED,
    CLAIM_TYPE_SEND_TO_COSMOS,
    CLAIM_TYPE_BATCH_SEND_TO_ETH,
    CLAIM_TYPE_ERC20_DEPLOYED,
    CLAIM_TYPE_LOGIC_CALL_EXECUTED,
    CLAIM_TYPE_VALSET_UPDATED,
  ];

  static final $core.Map<$core.int, ClaimType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClaimType? valueOf($core.int value) => _byValue[value];

  const ClaimType._($core.int v, $core.String n) : super(v, n);
}

