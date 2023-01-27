///
//  Generated code. Do not modify.
//  source: gravity/v1/types.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use bridgeValidatorDescriptor instead')
const BridgeValidator$json = const {
  '1': 'BridgeValidator',
  '2': const [
    const {'1': 'power', '3': 1, '4': 1, '5': 4, '10': 'power'},
    const {'1': 'ethereum_address', '3': 2, '4': 1, '5': 9, '10': 'ethereumAddress'},
  ],
};

/// Descriptor for `BridgeValidator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bridgeValidatorDescriptor = $convert.base64Decode('Cg9CcmlkZ2VWYWxpZGF0b3ISFAoFcG93ZXIYASABKARSBXBvd2VyEikKEGV0aGVyZXVtX2FkZHJlc3MYAiABKAlSD2V0aGVyZXVtQWRkcmVzcw==');
@$core.Deprecated('Use valsetDescriptor instead')
const Valset$json = const {
  '1': 'Valset',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'members', '3': 2, '4': 3, '5': 11, '6': '.gravity.v1.BridgeValidator', '8': const {}, '10': 'members'},
    const {'1': 'height', '3': 3, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'reward_amount', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'rewardAmount'},
    const {'1': 'reward_token', '3': 5, '4': 1, '5': 9, '10': 'rewardToken'},
  ],
};

/// Descriptor for `Valset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valsetDescriptor = $convert.base64Decode('CgZWYWxzZXQSFAoFbm9uY2UYASABKARSBW5vbmNlEjsKB21lbWJlcnMYAiADKAsyGy5ncmF2aXR5LnYxLkJyaWRnZVZhbGlkYXRvckIEyN4fAFIHbWVtYmVycxIWCgZoZWlnaHQYAyABKARSBmhlaWdodBJTCg1yZXdhcmRfYW1vdW50GAQgASgJQi7a3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5JbnTI3h8AUgxyZXdhcmRBbW91bnQSIQoMcmV3YXJkX3Rva2VuGAUgASgJUgtyZXdhcmRUb2tlbg==');
@$core.Deprecated('Use lastObservedEthereumBlockHeightDescriptor instead')
const LastObservedEthereumBlockHeight$json = const {
  '1': 'LastObservedEthereumBlockHeight',
  '2': const [
    const {'1': 'cosmos_block_height', '3': 1, '4': 1, '5': 4, '10': 'cosmosBlockHeight'},
    const {'1': 'ethereum_block_height', '3': 2, '4': 1, '5': 4, '10': 'ethereumBlockHeight'},
  ],
};

/// Descriptor for `LastObservedEthereumBlockHeight`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastObservedEthereumBlockHeightDescriptor = $convert.base64Decode('Ch9MYXN0T2JzZXJ2ZWRFdGhlcmV1bUJsb2NrSGVpZ2h0Ei4KE2Nvc21vc19ibG9ja19oZWlnaHQYASABKARSEWNvc21vc0Jsb2NrSGVpZ2h0EjIKFWV0aGVyZXVtX2Jsb2NrX2hlaWdodBgCIAEoBFITZXRoZXJldW1CbG9ja0hlaWdodA==');
@$core.Deprecated('Use eRC20ToDenomDescriptor instead')
const ERC20ToDenom$json = const {
  '1': 'ERC20ToDenom',
  '2': const [
    const {'1': 'erc20', '3': 1, '4': 1, '5': 9, '10': 'erc20'},
    const {'1': 'denom', '3': 2, '4': 1, '5': 9, '10': 'denom'},
  ],
};

/// Descriptor for `ERC20ToDenom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eRC20ToDenomDescriptor = $convert.base64Decode('CgxFUkMyMFRvRGVub20SFAoFZXJjMjAYASABKAlSBWVyYzIwEhQKBWRlbm9tGAIgASgJUgVkZW5vbQ==');
@$core.Deprecated('Use unhaltBridgeProposalDescriptor instead')
const UnhaltBridgeProposal$json = const {
  '1': 'UnhaltBridgeProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'target_nonce', '3': 4, '4': 1, '5': 4, '10': 'targetNonce'},
  ],
  '7': const {},
};

/// Descriptor for `UnhaltBridgeProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unhaltBridgeProposalDescriptor = $convert.base64Decode('ChRVbmhhbHRCcmlkZ2VQcm9wb3NhbBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEiEKDHRhcmdldF9ub25jZRgEIAEoBFILdGFyZ2V0Tm9uY2U6DOigHwGIoB8AmKAfAA==');
@$core.Deprecated('Use airdropProposalDescriptor instead')
const AirdropProposal$json = const {
  '1': 'AirdropProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'denom', '3': 3, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'recipients', '3': 4, '4': 1, '5': 12, '10': 'recipients'},
    const {'1': 'amounts', '3': 5, '4': 3, '5': 4, '10': 'amounts'},
  ],
  '7': const {},
};

/// Descriptor for `AirdropProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airdropProposalDescriptor = $convert.base64Decode('Cg9BaXJkcm9wUHJvcG9zYWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIUCgVkZW5vbRgDIAEoCVIFZGVub20SHgoKcmVjaXBpZW50cxgEIAEoDFIKcmVjaXBpZW50cxIYCgdhbW91bnRzGAUgAygEUgdhbW91bnRzOgzooB8BiKAfAJigHwA=');
@$core.Deprecated('Use iBCMetadataProposalDescriptor instead')
const IBCMetadataProposal$json = const {
  '1': 'IBCMetadataProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'metadata', '3': 3, '4': 1, '5': 11, '6': '.cosmos.bank.v1beta1.Metadata', '8': const {}, '10': 'metadata'},
    const {'1': 'ibc_denom', '3': 4, '4': 1, '5': 9, '10': 'ibcDenom'},
  ],
  '7': const {},
};

/// Descriptor for `IBCMetadataProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iBCMetadataProposalDescriptor = $convert.base64Decode('ChNJQkNNZXRhZGF0YVByb3Bvc2FsEhQKBXRpdGxlGAEgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SPwoIbWV0YWRhdGEYAyABKAsyHS5jb3Ntb3MuYmFuay52MWJldGExLk1ldGFkYXRhQgTI3h8AUghtZXRhZGF0YRIbCglpYmNfZGVub20YBCABKAlSCGliY0Rlbm9tOgzooB8AiKAfAJigHwA=');
@$core.Deprecated('Use pendingIbcAutoForwardDescriptor instead')
const PendingIbcAutoForward$json = const {
  '1': 'PendingIbcAutoForward',
  '2': const [
    const {'1': 'foreign_receiver', '3': 1, '4': 1, '5': 9, '10': 'foreignReceiver'},
    const {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '10': 'token'},
    const {'1': 'ibc_channel', '3': 3, '4': 1, '5': 9, '10': 'ibcChannel'},
    const {'1': 'event_nonce', '3': 4, '4': 1, '5': 4, '10': 'eventNonce'},
  ],
};

/// Descriptor for `PendingIbcAutoForward`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pendingIbcAutoForwardDescriptor = $convert.base64Decode('ChVQZW5kaW5nSWJjQXV0b0ZvcndhcmQSKQoQZm9yZWlnbl9yZWNlaXZlchgBIAEoCVIPZm9yZWlnblJlY2VpdmVyEi8KBXRva2VuGAIgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luUgV0b2tlbhIfCgtpYmNfY2hhbm5lbBgDIAEoCVIKaWJjQ2hhbm5lbBIfCgtldmVudF9ub25jZRgEIAEoBFIKZXZlbnROb25jZQ==');
