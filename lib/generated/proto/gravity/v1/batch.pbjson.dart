///
//  Generated code. Do not modify.
//  source: gravity/v1/batch.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use outgoingTxBatchDescriptor instead')
const OutgoingTxBatch$json = const {
  '1': 'OutgoingTxBatch',
  '2': const [
    const {'1': 'batch_nonce', '3': 1, '4': 1, '5': 4, '10': 'batchNonce'},
    const {'1': 'batch_timeout', '3': 2, '4': 1, '5': 4, '10': 'batchTimeout'},
    const {'1': 'transactions', '3': 3, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTransferTx', '8': const {}, '10': 'transactions'},
    const {'1': 'token_contract', '3': 4, '4': 1, '5': 9, '10': 'tokenContract'},
    const {'1': 'cosmos_block_created', '3': 5, '4': 1, '5': 4, '10': 'cosmosBlockCreated'},
  ],
};

/// Descriptor for `OutgoingTxBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outgoingTxBatchDescriptor = $convert.base64Decode('Cg9PdXRnb2luZ1R4QmF0Y2gSHwoLYmF0Y2hfbm9uY2UYASABKARSCmJhdGNoTm9uY2USIwoNYmF0Y2hfdGltZW91dBgCIAEoBFIMYmF0Y2hUaW1lb3V0EkgKDHRyYW5zYWN0aW9ucxgDIAMoCzIeLmdyYXZpdHkudjEuT3V0Z29pbmdUcmFuc2ZlclR4QgTI3h8AUgx0cmFuc2FjdGlvbnMSJQoOdG9rZW5fY29udHJhY3QYBCABKAlSDXRva2VuQ29udHJhY3QSMAoUY29zbW9zX2Jsb2NrX2NyZWF0ZWQYBSABKARSEmNvc21vc0Jsb2NrQ3JlYXRlZA==');
@$core.Deprecated('Use outgoingTransferTxDescriptor instead')
const OutgoingTransferTx$json = const {
  '1': 'OutgoingTransferTx',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    const {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'dest_address', '3': 3, '4': 1, '5': 9, '10': 'destAddress'},
    const {'1': 'erc20_token', '3': 4, '4': 1, '5': 11, '6': '.gravity.v1.ERC20Token', '8': const {}, '10': 'erc20Token'},
    const {'1': 'erc20_fee', '3': 5, '4': 1, '5': 11, '6': '.gravity.v1.ERC20Token', '8': const {}, '10': 'erc20Fee'},
  ],
};

/// Descriptor for `OutgoingTransferTx`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outgoingTransferTxDescriptor = $convert.base64Decode('ChJPdXRnb2luZ1RyYW5zZmVyVHgSDgoCaWQYASABKARSAmlkEhYKBnNlbmRlchgCIAEoCVIGc2VuZGVyEiEKDGRlc3RfYWRkcmVzcxgDIAEoCVILZGVzdEFkZHJlc3MSPQoLZXJjMjBfdG9rZW4YBCABKAsyFi5ncmF2aXR5LnYxLkVSQzIwVG9rZW5CBMjeHwBSCmVyYzIwVG9rZW4SOQoJZXJjMjBfZmVlGAUgASgLMhYuZ3Jhdml0eS52MS5FUkMyMFRva2VuQgTI3h8AUghlcmMyMEZlZQ==');
@$core.Deprecated('Use outgoingLogicCallDescriptor instead')
const OutgoingLogicCall$json = const {
  '1': 'OutgoingLogicCall',
  '2': const [
    const {'1': 'transfers', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.ERC20Token', '8': const {}, '10': 'transfers'},
    const {'1': 'fees', '3': 2, '4': 3, '5': 11, '6': '.gravity.v1.ERC20Token', '8': const {}, '10': 'fees'},
    const {'1': 'logic_contract_address', '3': 3, '4': 1, '5': 9, '10': 'logicContractAddress'},
    const {'1': 'payload', '3': 4, '4': 1, '5': 12, '10': 'payload'},
    const {'1': 'timeout', '3': 5, '4': 1, '5': 4, '10': 'timeout'},
    const {'1': 'invalidation_id', '3': 6, '4': 1, '5': 12, '10': 'invalidationId'},
    const {'1': 'invalidation_nonce', '3': 7, '4': 1, '5': 4, '10': 'invalidationNonce'},
    const {'1': 'cosmos_block_created', '3': 8, '4': 1, '5': 4, '10': 'cosmosBlockCreated'},
  ],
};

/// Descriptor for `OutgoingLogicCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outgoingLogicCallDescriptor = $convert.base64Decode('ChFPdXRnb2luZ0xvZ2ljQ2FsbBI6Cgl0cmFuc2ZlcnMYASADKAsyFi5ncmF2aXR5LnYxLkVSQzIwVG9rZW5CBMjeHwBSCXRyYW5zZmVycxIwCgRmZWVzGAIgAygLMhYuZ3Jhdml0eS52MS5FUkMyMFRva2VuQgTI3h8AUgRmZWVzEjQKFmxvZ2ljX2NvbnRyYWN0X2FkZHJlc3MYAyABKAlSFGxvZ2ljQ29udHJhY3RBZGRyZXNzEhgKB3BheWxvYWQYBCABKAxSB3BheWxvYWQSGAoHdGltZW91dBgFIAEoBFIHdGltZW91dBInCg9pbnZhbGlkYXRpb25faWQYBiABKAxSDmludmFsaWRhdGlvbklkEi0KEmludmFsaWRhdGlvbl9ub25jZRgHIAEoBFIRaW52YWxpZGF0aW9uTm9uY2USMAoUY29zbW9zX2Jsb2NrX2NyZWF0ZWQYCCABKARSEmNvc21vc0Jsb2NrQ3JlYXRlZA==');
@$core.Deprecated('Use eventOutgoingBatchCanceledDescriptor instead')
const EventOutgoingBatchCanceled$json = const {
  '1': 'EventOutgoingBatchCanceled',
  '2': const [
    const {'1': 'bridge_contract', '3': 1, '4': 1, '5': 9, '10': 'bridgeContract'},
    const {'1': 'bridge_chain_id', '3': 2, '4': 1, '5': 9, '10': 'bridgeChainId'},
    const {'1': 'batch_id', '3': 3, '4': 1, '5': 9, '10': 'batchId'},
    const {'1': 'nonce', '3': 4, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventOutgoingBatchCanceled`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventOutgoingBatchCanceledDescriptor = $convert.base64Decode('ChpFdmVudE91dGdvaW5nQmF0Y2hDYW5jZWxlZBInCg9icmlkZ2VfY29udHJhY3QYASABKAlSDmJyaWRnZUNvbnRyYWN0EiYKD2JyaWRnZV9jaGFpbl9pZBgCIAEoCVINYnJpZGdlQ2hhaW5JZBIZCghiYXRjaF9pZBgDIAEoCVIHYmF0Y2hJZBIUCgVub25jZRgEIAEoCVIFbm9uY2U=');
@$core.Deprecated('Use eventOutgoingBatchDescriptor instead')
const EventOutgoingBatch$json = const {
  '1': 'EventOutgoingBatch',
  '2': const [
    const {'1': 'bridge_contract', '3': 1, '4': 1, '5': 9, '10': 'bridgeContract'},
    const {'1': 'bridge_chain_id', '3': 2, '4': 1, '5': 9, '10': 'bridgeChainId'},
    const {'1': 'batch_id', '3': 3, '4': 1, '5': 9, '10': 'batchId'},
    const {'1': 'nonce', '3': 4, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventOutgoingBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventOutgoingBatchDescriptor = $convert.base64Decode('ChJFdmVudE91dGdvaW5nQmF0Y2gSJwoPYnJpZGdlX2NvbnRyYWN0GAEgASgJUg5icmlkZ2VDb250cmFjdBImCg9icmlkZ2VfY2hhaW5faWQYAiABKAlSDWJyaWRnZUNoYWluSWQSGQoIYmF0Y2hfaWQYAyABKAlSB2JhdGNoSWQSFAoFbm9uY2UYBCABKAlSBW5vbmNl');
