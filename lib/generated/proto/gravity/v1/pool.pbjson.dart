///
//  Generated code. Do not modify.
//  source: gravity/v1/pool.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use iDSetDescriptor instead')
const IDSet$json = const {
  '1': 'IDSet',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 4, '10': 'ids'},
  ],
};

/// Descriptor for `IDSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iDSetDescriptor = $convert.base64Decode('CgVJRFNldBIQCgNpZHMYASADKARSA2lkcw==');
@$core.Deprecated('Use batchFeesDescriptor instead')
const BatchFees$json = const {
  '1': 'BatchFees',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'total_fees', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'totalFees'},
    const {'1': 'tx_count', '3': 3, '4': 1, '5': 4, '10': 'txCount'},
  ],
};

/// Descriptor for `BatchFees`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchFeesDescriptor = $convert.base64Decode('CglCYXRjaEZlZXMSFAoFdG9rZW4YASABKAlSBXRva2VuEk0KCnRvdGFsX2ZlZXMYAiABKAlCLtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkludMjeHwBSCXRvdGFsRmVlcxIZCgh0eF9jb3VudBgDIAEoBFIHdHhDb3VudA==');
@$core.Deprecated('Use eventWithdrawalReceivedDescriptor instead')
const EventWithdrawalReceived$json = const {
  '1': 'EventWithdrawalReceived',
  '2': const [
    const {'1': 'bridge_contract', '3': 1, '4': 1, '5': 9, '10': 'bridgeContract'},
    const {'1': 'bridge_chain_id', '3': 2, '4': 1, '5': 9, '10': 'bridgeChainId'},
    const {'1': 'outgoing_tx_id', '3': 3, '4': 1, '5': 9, '10': 'outgoingTxId'},
    const {'1': 'nonce', '3': 4, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventWithdrawalReceived`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventWithdrawalReceivedDescriptor = $convert.base64Decode('ChdFdmVudFdpdGhkcmF3YWxSZWNlaXZlZBInCg9icmlkZ2VfY29udHJhY3QYASABKAlSDmJyaWRnZUNvbnRyYWN0EiYKD2JyaWRnZV9jaGFpbl9pZBgCIAEoCVINYnJpZGdlQ2hhaW5JZBIkCg5vdXRnb2luZ190eF9pZBgDIAEoCVIMb3V0Z29pbmdUeElkEhQKBW5vbmNlGAQgASgJUgVub25jZQ==');
@$core.Deprecated('Use eventWithdrawCanceledDescriptor instead')
const EventWithdrawCanceled$json = const {
  '1': 'EventWithdrawCanceled',
  '2': const [
    const {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'tx_id', '3': 2, '4': 1, '5': 9, '10': 'txId'},
    const {'1': 'bridge_contract', '3': 3, '4': 1, '5': 9, '10': 'bridgeContract'},
    const {'1': 'bridge_chain_id', '3': 4, '4': 1, '5': 9, '10': 'bridgeChainId'},
  ],
};

/// Descriptor for `EventWithdrawCanceled`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventWithdrawCanceledDescriptor = $convert.base64Decode('ChVFdmVudFdpdGhkcmF3Q2FuY2VsZWQSFgoGc2VuZGVyGAEgASgJUgZzZW5kZXISEwoFdHhfaWQYAiABKAlSBHR4SWQSJwoPYnJpZGdlX2NvbnRyYWN0GAMgASgJUg5icmlkZ2VDb250cmFjdBImCg9icmlkZ2VfY2hhaW5faWQYBCABKAlSDWJyaWRnZUNoYWluSWQ=');
