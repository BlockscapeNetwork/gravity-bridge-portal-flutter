///
//  Generated code. Do not modify.
//  source: gravity/v1/attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use claimTypeDescriptor instead')
const ClaimType$json = const {
  '1': 'ClaimType',
  '2': const [
    const {'1': 'CLAIM_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'CLAIM_TYPE_SEND_TO_COSMOS', '2': 1},
    const {'1': 'CLAIM_TYPE_BATCH_SEND_TO_ETH', '2': 2},
    const {'1': 'CLAIM_TYPE_ERC20_DEPLOYED', '2': 3},
    const {'1': 'CLAIM_TYPE_LOGIC_CALL_EXECUTED', '2': 4},
    const {'1': 'CLAIM_TYPE_VALSET_UPDATED', '2': 5},
  ],
  '3': const {},
};

/// Descriptor for `ClaimType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List claimTypeDescriptor = $convert.base64Decode('CglDbGFpbVR5cGUSGgoWQ0xBSU1fVFlQRV9VTlNQRUNJRklFRBAAEh0KGUNMQUlNX1RZUEVfU0VORF9UT19DT1NNT1MQARIgChxDTEFJTV9UWVBFX0JBVENIX1NFTkRfVE9fRVRIEAISHQoZQ0xBSU1fVFlQRV9FUkMyMF9ERVBMT1lFRBADEiIKHkNMQUlNX1RZUEVfTE9HSUNfQ0FMTF9FWEVDVVRFRBAEEh0KGUNMQUlNX1RZUEVfVkFMU0VUX1VQREFURUQQBRoEiKMeAA==');
@$core.Deprecated('Use attestationDescriptor instead')
const Attestation$json = const {
  '1': 'Attestation',
  '2': const [
    const {'1': 'observed', '3': 1, '4': 1, '5': 8, '10': 'observed'},
    const {'1': 'votes', '3': 2, '4': 3, '5': 9, '10': 'votes'},
    const {'1': 'height', '3': 3, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'claim', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'claim'},
  ],
};

/// Descriptor for `Attestation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attestationDescriptor = $convert.base64Decode('CgtBdHRlc3RhdGlvbhIaCghvYnNlcnZlZBgBIAEoCFIIb2JzZXJ2ZWQSFAoFdm90ZXMYAiADKAlSBXZvdGVzEhYKBmhlaWdodBgDIAEoBFIGaGVpZ2h0EioKBWNsYWltGAQgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIFY2xhaW0=');
@$core.Deprecated('Use eRC20TokenDescriptor instead')
const ERC20Token$json = const {
  '1': 'ERC20Token',
  '2': const [
    const {'1': 'contract', '3': 1, '4': 1, '5': 9, '10': 'contract'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'amount'},
  ],
};

/// Descriptor for `ERC20Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eRC20TokenDescriptor = $convert.base64Decode('CgpFUkMyMFRva2VuEhoKCGNvbnRyYWN0GAEgASgJUghjb250cmFjdBJGCgZhbW91bnQYAiABKAlCLtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkludMjeHwBSBmFtb3VudA==');
@$core.Deprecated('Use eventObservationDescriptor instead')
const EventObservation$json = const {
  '1': 'EventObservation',
  '2': const [
    const {'1': 'attestation_type', '3': 1, '4': 1, '5': 9, '10': 'attestationType'},
    const {'1': 'bridge_contract', '3': 2, '4': 1, '5': 9, '10': 'bridgeContract'},
    const {'1': 'bridge_chain_id', '3': 3, '4': 1, '5': 9, '10': 'bridgeChainId'},
    const {'1': 'attestation_id', '3': 4, '4': 1, '5': 9, '10': 'attestationId'},
    const {'1': 'nonce', '3': 5, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventObservation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventObservationDescriptor = $convert.base64Decode('ChBFdmVudE9ic2VydmF0aW9uEikKEGF0dGVzdGF0aW9uX3R5cGUYASABKAlSD2F0dGVzdGF0aW9uVHlwZRInCg9icmlkZ2VfY29udHJhY3QYAiABKAlSDmJyaWRnZUNvbnRyYWN0EiYKD2JyaWRnZV9jaGFpbl9pZBgDIAEoCVINYnJpZGdlQ2hhaW5JZBIlCg5hdHRlc3RhdGlvbl9pZBgEIAEoCVINYXR0ZXN0YXRpb25JZBIUCgVub25jZRgFIAEoCVIFbm9uY2U=');
@$core.Deprecated('Use eventInvalidSendToCosmosReceiverDescriptor instead')
const EventInvalidSendToCosmosReceiver$json = const {
  '1': 'EventInvalidSendToCosmosReceiver',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 9, '10': 'amount'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'sender', '3': 4, '4': 1, '5': 9, '10': 'sender'},
  ],
};

/// Descriptor for `EventInvalidSendToCosmosReceiver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventInvalidSendToCosmosReceiverDescriptor = $convert.base64Decode('CiBFdmVudEludmFsaWRTZW5kVG9Db3Ntb3NSZWNlaXZlchIWCgZhbW91bnQYASABKAlSBmFtb3VudBIUCgVub25jZRgCIAEoCVIFbm9uY2USFAoFdG9rZW4YAyABKAlSBXRva2VuEhYKBnNlbmRlchgEIAEoCVIGc2VuZGVy');
@$core.Deprecated('Use eventSendToCosmosDescriptor instead')
const EventSendToCosmos$json = const {
  '1': 'EventSendToCosmos',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 9, '10': 'amount'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `EventSendToCosmos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventSendToCosmosDescriptor = $convert.base64Decode('ChFFdmVudFNlbmRUb0Nvc21vcxIWCgZhbW91bnQYASABKAlSBmFtb3VudBIUCgVub25jZRgCIAEoCVIFbm9uY2USFAoFdG9rZW4YAyABKAlSBXRva2Vu');
@$core.Deprecated('Use eventSendToCosmosLocalDescriptor instead')
const EventSendToCosmosLocal$json = const {
  '1': 'EventSendToCosmosLocal',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
  ],
};

/// Descriptor for `EventSendToCosmosLocal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventSendToCosmosLocalDescriptor = $convert.base64Decode('ChZFdmVudFNlbmRUb0Nvc21vc0xvY2FsEhQKBW5vbmNlGAEgASgJUgVub25jZRIaCghyZWNlaXZlchgCIAEoCVIIcmVjZWl2ZXISFAoFdG9rZW4YAyABKAlSBXRva2VuEhYKBmFtb3VudBgEIAEoCVIGYW1vdW50');
@$core.Deprecated('Use eventSendToCosmosPendingIbcAutoForwardDescriptor instead')
const EventSendToCosmosPendingIbcAutoForward$json = const {
  '1': 'EventSendToCosmosPendingIbcAutoForward',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
    const {'1': 'channel', '3': 5, '4': 1, '5': 9, '10': 'channel'},
  ],
};

/// Descriptor for `EventSendToCosmosPendingIbcAutoForward`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventSendToCosmosPendingIbcAutoForwardDescriptor = $convert.base64Decode('CiZFdmVudFNlbmRUb0Nvc21vc1BlbmRpbmdJYmNBdXRvRm9yd2FyZBIUCgVub25jZRgBIAEoCVIFbm9uY2USGgoIcmVjZWl2ZXIYAiABKAlSCHJlY2VpdmVyEhQKBXRva2VuGAMgASgJUgV0b2tlbhIWCgZhbW91bnQYBCABKAlSBmFtb3VudBIYCgdjaGFubmVsGAUgASgJUgdjaGFubmVs');
@$core.Deprecated('Use eventSendToCosmosExecutedIbcAutoForwardDescriptor instead')
const EventSendToCosmosExecutedIbcAutoForward$json = const {
  '1': 'EventSendToCosmosExecutedIbcAutoForward',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
    const {'1': 'channel', '3': 5, '4': 1, '5': 9, '10': 'channel'},
    const {'1': 'timeout_time', '3': 6, '4': 1, '5': 9, '10': 'timeoutTime'},
    const {'1': 'timeout_height', '3': 7, '4': 1, '5': 9, '10': 'timeoutHeight'},
  ],
};

/// Descriptor for `EventSendToCosmosExecutedIbcAutoForward`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventSendToCosmosExecutedIbcAutoForwardDescriptor = $convert.base64Decode('CidFdmVudFNlbmRUb0Nvc21vc0V4ZWN1dGVkSWJjQXV0b0ZvcndhcmQSFAoFbm9uY2UYASABKAlSBW5vbmNlEhoKCHJlY2VpdmVyGAIgASgJUghyZWNlaXZlchIUCgV0b2tlbhgDIAEoCVIFdG9rZW4SFgoGYW1vdW50GAQgASgJUgZhbW91bnQSGAoHY2hhbm5lbBgFIAEoCVIHY2hhbm5lbBIhCgx0aW1lb3V0X3RpbWUYBiABKAlSC3RpbWVvdXRUaW1lEiUKDnRpbWVvdXRfaGVpZ2h0GAcgASgJUg10aW1lb3V0SGVpZ2h0');
