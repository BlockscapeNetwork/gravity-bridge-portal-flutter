///
//  Generated code. Do not modify.
//  source: gravity/v1/msgs.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgSetOrchestratorAddressDescriptor instead')
const MsgSetOrchestratorAddress$json = const {
  '1': 'MsgSetOrchestratorAddress',
  '2': const [
    const {'1': 'validator', '3': 1, '4': 1, '5': 9, '10': 'validator'},
    const {'1': 'orchestrator', '3': 2, '4': 1, '5': 9, '10': 'orchestrator'},
    const {'1': 'eth_address', '3': 3, '4': 1, '5': 9, '10': 'ethAddress'},
  ],
};

/// Descriptor for `MsgSetOrchestratorAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSetOrchestratorAddressDescriptor = $convert.base64Decode('ChlNc2dTZXRPcmNoZXN0cmF0b3JBZGRyZXNzEhwKCXZhbGlkYXRvchgBIAEoCVIJdmFsaWRhdG9yEiIKDG9yY2hlc3RyYXRvchgCIAEoCVIMb3JjaGVzdHJhdG9yEh8KC2V0aF9hZGRyZXNzGAMgASgJUgpldGhBZGRyZXNz');
@$core.Deprecated('Use msgSetOrchestratorAddressResponseDescriptor instead')
const MsgSetOrchestratorAddressResponse$json = const {
  '1': 'MsgSetOrchestratorAddressResponse',
};

/// Descriptor for `MsgSetOrchestratorAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSetOrchestratorAddressResponseDescriptor = $convert.base64Decode('CiFNc2dTZXRPcmNoZXN0cmF0b3JBZGRyZXNzUmVzcG9uc2U=');
@$core.Deprecated('Use msgValsetConfirmDescriptor instead')
const MsgValsetConfirm$json = const {
  '1': 'MsgValsetConfirm',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'orchestrator', '3': 2, '4': 1, '5': 9, '10': 'orchestrator'},
    const {'1': 'eth_address', '3': 3, '4': 1, '5': 9, '10': 'ethAddress'},
    const {'1': 'signature', '3': 4, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `MsgValsetConfirm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgValsetConfirmDescriptor = $convert.base64Decode('ChBNc2dWYWxzZXRDb25maXJtEhQKBW5vbmNlGAEgASgEUgVub25jZRIiCgxvcmNoZXN0cmF0b3IYAiABKAlSDG9yY2hlc3RyYXRvchIfCgtldGhfYWRkcmVzcxgDIAEoCVIKZXRoQWRkcmVzcxIcCglzaWduYXR1cmUYBCABKAlSCXNpZ25hdHVyZQ==');
@$core.Deprecated('Use msgValsetConfirmResponseDescriptor instead')
const MsgValsetConfirmResponse$json = const {
  '1': 'MsgValsetConfirmResponse',
};

/// Descriptor for `MsgValsetConfirmResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgValsetConfirmResponseDescriptor = $convert.base64Decode('ChhNc2dWYWxzZXRDb25maXJtUmVzcG9uc2U=');
@$core.Deprecated('Use msgSendToEthDescriptor instead')
const MsgSendToEth$json = const {
  '1': 'MsgSendToEth',
  '2': const [
    const {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'eth_dest', '3': 2, '4': 1, '5': 9, '10': 'ethDest'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'amount'},
    const {'1': 'bridge_fee', '3': 4, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'bridgeFee'},
    const {'1': 'chain_fee', '3': 5, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'chainFee'},
  ],
};

/// Descriptor for `MsgSendToEth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendToEthDescriptor = $convert.base64Decode('CgxNc2dTZW5kVG9FdGgSFgoGc2VuZGVyGAEgASgJUgZzZW5kZXISGQoIZXRoX2Rlc3QYAiABKAlSB2V0aERlc3QSNwoGYW1vdW50GAMgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQgTI3h8AUgZhbW91bnQSPgoKYnJpZGdlX2ZlZRgEIAEoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIEyN4fAFIJYnJpZGdlRmVlEjwKCWNoYWluX2ZlZRgFIAEoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIEyN4fAFIIY2hhaW5GZWU=');
@$core.Deprecated('Use msgSendToEthResponseDescriptor instead')
const MsgSendToEthResponse$json = const {
  '1': 'MsgSendToEthResponse',
};

/// Descriptor for `MsgSendToEthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendToEthResponseDescriptor = $convert.base64Decode('ChRNc2dTZW5kVG9FdGhSZXNwb25zZQ==');
@$core.Deprecated('Use msgRequestBatchDescriptor instead')
const MsgRequestBatch$json = const {
  '1': 'MsgRequestBatch',
  '2': const [
    const {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'denom', '3': 2, '4': 1, '5': 9, '10': 'denom'},
  ],
};

/// Descriptor for `MsgRequestBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRequestBatchDescriptor = $convert.base64Decode('Cg9Nc2dSZXF1ZXN0QmF0Y2gSFgoGc2VuZGVyGAEgASgJUgZzZW5kZXISFAoFZGVub20YAiABKAlSBWRlbm9t');
@$core.Deprecated('Use msgRequestBatchResponseDescriptor instead')
const MsgRequestBatchResponse$json = const {
  '1': 'MsgRequestBatchResponse',
};

/// Descriptor for `MsgRequestBatchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRequestBatchResponseDescriptor = $convert.base64Decode('ChdNc2dSZXF1ZXN0QmF0Y2hSZXNwb25zZQ==');
@$core.Deprecated('Use msgConfirmBatchDescriptor instead')
const MsgConfirmBatch$json = const {
  '1': 'MsgConfirmBatch',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'token_contract', '3': 2, '4': 1, '5': 9, '10': 'tokenContract'},
    const {'1': 'eth_signer', '3': 3, '4': 1, '5': 9, '10': 'ethSigner'},
    const {'1': 'orchestrator', '3': 4, '4': 1, '5': 9, '10': 'orchestrator'},
    const {'1': 'signature', '3': 5, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `MsgConfirmBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConfirmBatchDescriptor = $convert.base64Decode('Cg9Nc2dDb25maXJtQmF0Y2gSFAoFbm9uY2UYASABKARSBW5vbmNlEiUKDnRva2VuX2NvbnRyYWN0GAIgASgJUg10b2tlbkNvbnRyYWN0Eh0KCmV0aF9zaWduZXIYAyABKAlSCWV0aFNpZ25lchIiCgxvcmNoZXN0cmF0b3IYBCABKAlSDG9yY2hlc3RyYXRvchIcCglzaWduYXR1cmUYBSABKAlSCXNpZ25hdHVyZQ==');
@$core.Deprecated('Use msgConfirmBatchResponseDescriptor instead')
const MsgConfirmBatchResponse$json = const {
  '1': 'MsgConfirmBatchResponse',
};

/// Descriptor for `MsgConfirmBatchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConfirmBatchResponseDescriptor = $convert.base64Decode('ChdNc2dDb25maXJtQmF0Y2hSZXNwb25zZQ==');
@$core.Deprecated('Use msgConfirmLogicCallDescriptor instead')
const MsgConfirmLogicCall$json = const {
  '1': 'MsgConfirmLogicCall',
  '2': const [
    const {'1': 'invalidation_id', '3': 1, '4': 1, '5': 9, '10': 'invalidationId'},
    const {'1': 'invalidation_nonce', '3': 2, '4': 1, '5': 4, '10': 'invalidationNonce'},
    const {'1': 'eth_signer', '3': 3, '4': 1, '5': 9, '10': 'ethSigner'},
    const {'1': 'orchestrator', '3': 4, '4': 1, '5': 9, '10': 'orchestrator'},
    const {'1': 'signature', '3': 5, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `MsgConfirmLogicCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConfirmLogicCallDescriptor = $convert.base64Decode('ChNNc2dDb25maXJtTG9naWNDYWxsEicKD2ludmFsaWRhdGlvbl9pZBgBIAEoCVIOaW52YWxpZGF0aW9uSWQSLQoSaW52YWxpZGF0aW9uX25vbmNlGAIgASgEUhFpbnZhbGlkYXRpb25Ob25jZRIdCgpldGhfc2lnbmVyGAMgASgJUglldGhTaWduZXISIgoMb3JjaGVzdHJhdG9yGAQgASgJUgxvcmNoZXN0cmF0b3ISHAoJc2lnbmF0dXJlGAUgASgJUglzaWduYXR1cmU=');
@$core.Deprecated('Use msgConfirmLogicCallResponseDescriptor instead')
const MsgConfirmLogicCallResponse$json = const {
  '1': 'MsgConfirmLogicCallResponse',
};

/// Descriptor for `MsgConfirmLogicCallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConfirmLogicCallResponseDescriptor = $convert.base64Decode('ChtNc2dDb25maXJtTG9naWNDYWxsUmVzcG9uc2U=');
@$core.Deprecated('Use msgSendToCosmosClaimDescriptor instead')
const MsgSendToCosmosClaim$json = const {
  '1': 'MsgSendToCosmosClaim',
  '2': const [
    const {'1': 'event_nonce', '3': 1, '4': 1, '5': 4, '10': 'eventNonce'},
    const {'1': 'eth_block_height', '3': 2, '4': 1, '5': 4, '10': 'ethBlockHeight'},
    const {'1': 'token_contract', '3': 3, '4': 1, '5': 9, '10': 'tokenContract'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'amount'},
    const {'1': 'ethereum_sender', '3': 5, '4': 1, '5': 9, '10': 'ethereumSender'},
    const {'1': 'cosmos_receiver', '3': 6, '4': 1, '5': 9, '10': 'cosmosReceiver'},
    const {'1': 'orchestrator', '3': 7, '4': 1, '5': 9, '10': 'orchestrator'},
  ],
};

/// Descriptor for `MsgSendToCosmosClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendToCosmosClaimDescriptor = $convert.base64Decode('ChRNc2dTZW5kVG9Db3Ntb3NDbGFpbRIfCgtldmVudF9ub25jZRgBIAEoBFIKZXZlbnROb25jZRIoChBldGhfYmxvY2tfaGVpZ2h0GAIgASgEUg5ldGhCbG9ja0hlaWdodBIlCg50b2tlbl9jb250cmFjdBgDIAEoCVINdG9rZW5Db250cmFjdBJGCgZhbW91bnQYBCABKAlCLtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkludMjeHwBSBmFtb3VudBInCg9ldGhlcmV1bV9zZW5kZXIYBSABKAlSDmV0aGVyZXVtU2VuZGVyEicKD2Nvc21vc19yZWNlaXZlchgGIAEoCVIOY29zbW9zUmVjZWl2ZXISIgoMb3JjaGVzdHJhdG9yGAcgASgJUgxvcmNoZXN0cmF0b3I=');
@$core.Deprecated('Use msgSendToCosmosClaimResponseDescriptor instead')
const MsgSendToCosmosClaimResponse$json = const {
  '1': 'MsgSendToCosmosClaimResponse',
};

/// Descriptor for `MsgSendToCosmosClaimResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendToCosmosClaimResponseDescriptor = $convert.base64Decode('ChxNc2dTZW5kVG9Db3Ntb3NDbGFpbVJlc3BvbnNl');
@$core.Deprecated('Use msgExecuteIbcAutoForwardsDescriptor instead')
const MsgExecuteIbcAutoForwards$json = const {
  '1': 'MsgExecuteIbcAutoForwards',
  '2': const [
    const {'1': 'forwards_to_clear', '3': 1, '4': 1, '5': 4, '10': 'forwardsToClear'},
    const {'1': 'executor', '3': 2, '4': 1, '5': 9, '10': 'executor'},
  ],
};

/// Descriptor for `MsgExecuteIbcAutoForwards`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgExecuteIbcAutoForwardsDescriptor = $convert.base64Decode('ChlNc2dFeGVjdXRlSWJjQXV0b0ZvcndhcmRzEioKEWZvcndhcmRzX3RvX2NsZWFyGAEgASgEUg9mb3J3YXJkc1RvQ2xlYXISGgoIZXhlY3V0b3IYAiABKAlSCGV4ZWN1dG9y');
@$core.Deprecated('Use msgExecuteIbcAutoForwardsResponseDescriptor instead')
const MsgExecuteIbcAutoForwardsResponse$json = const {
  '1': 'MsgExecuteIbcAutoForwardsResponse',
};

/// Descriptor for `MsgExecuteIbcAutoForwardsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgExecuteIbcAutoForwardsResponseDescriptor = $convert.base64Decode('CiFNc2dFeGVjdXRlSWJjQXV0b0ZvcndhcmRzUmVzcG9uc2U=');
@$core.Deprecated('Use msgBatchSendToEthClaimDescriptor instead')
const MsgBatchSendToEthClaim$json = const {
  '1': 'MsgBatchSendToEthClaim',
  '2': const [
    const {'1': 'event_nonce', '3': 1, '4': 1, '5': 4, '10': 'eventNonce'},
    const {'1': 'eth_block_height', '3': 2, '4': 1, '5': 4, '10': 'ethBlockHeight'},
    const {'1': 'batch_nonce', '3': 3, '4': 1, '5': 4, '10': 'batchNonce'},
    const {'1': 'token_contract', '3': 4, '4': 1, '5': 9, '10': 'tokenContract'},
    const {'1': 'orchestrator', '3': 5, '4': 1, '5': 9, '10': 'orchestrator'},
  ],
};

/// Descriptor for `MsgBatchSendToEthClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBatchSendToEthClaimDescriptor = $convert.base64Decode('ChZNc2dCYXRjaFNlbmRUb0V0aENsYWltEh8KC2V2ZW50X25vbmNlGAEgASgEUgpldmVudE5vbmNlEigKEGV0aF9ibG9ja19oZWlnaHQYAiABKARSDmV0aEJsb2NrSGVpZ2h0Eh8KC2JhdGNoX25vbmNlGAMgASgEUgpiYXRjaE5vbmNlEiUKDnRva2VuX2NvbnRyYWN0GAQgASgJUg10b2tlbkNvbnRyYWN0EiIKDG9yY2hlc3RyYXRvchgFIAEoCVIMb3JjaGVzdHJhdG9y');
@$core.Deprecated('Use msgBatchSendToEthClaimResponseDescriptor instead')
const MsgBatchSendToEthClaimResponse$json = const {
  '1': 'MsgBatchSendToEthClaimResponse',
};

/// Descriptor for `MsgBatchSendToEthClaimResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBatchSendToEthClaimResponseDescriptor = $convert.base64Decode('Ch5Nc2dCYXRjaFNlbmRUb0V0aENsYWltUmVzcG9uc2U=');
@$core.Deprecated('Use msgERC20DeployedClaimDescriptor instead')
const MsgERC20DeployedClaim$json = const {
  '1': 'MsgERC20DeployedClaim',
  '2': const [
    const {'1': 'event_nonce', '3': 1, '4': 1, '5': 4, '10': 'eventNonce'},
    const {'1': 'eth_block_height', '3': 2, '4': 1, '5': 4, '10': 'ethBlockHeight'},
    const {'1': 'cosmos_denom', '3': 3, '4': 1, '5': 9, '10': 'cosmosDenom'},
    const {'1': 'token_contract', '3': 4, '4': 1, '5': 9, '10': 'tokenContract'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'symbol', '3': 6, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'decimals', '3': 7, '4': 1, '5': 4, '10': 'decimals'},
    const {'1': 'orchestrator', '3': 8, '4': 1, '5': 9, '10': 'orchestrator'},
  ],
};

/// Descriptor for `MsgERC20DeployedClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgERC20DeployedClaimDescriptor = $convert.base64Decode('ChVNc2dFUkMyMERlcGxveWVkQ2xhaW0SHwoLZXZlbnRfbm9uY2UYASABKARSCmV2ZW50Tm9uY2USKAoQZXRoX2Jsb2NrX2hlaWdodBgCIAEoBFIOZXRoQmxvY2tIZWlnaHQSIQoMY29zbW9zX2Rlbm9tGAMgASgJUgtjb3Ntb3NEZW5vbRIlCg50b2tlbl9jb250cmFjdBgEIAEoCVINdG9rZW5Db250cmFjdBISCgRuYW1lGAUgASgJUgRuYW1lEhYKBnN5bWJvbBgGIAEoCVIGc3ltYm9sEhoKCGRlY2ltYWxzGAcgASgEUghkZWNpbWFscxIiCgxvcmNoZXN0cmF0b3IYCCABKAlSDG9yY2hlc3RyYXRvcg==');
@$core.Deprecated('Use msgERC20DeployedClaimResponseDescriptor instead')
const MsgERC20DeployedClaimResponse$json = const {
  '1': 'MsgERC20DeployedClaimResponse',
};

/// Descriptor for `MsgERC20DeployedClaimResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgERC20DeployedClaimResponseDescriptor = $convert.base64Decode('Ch1Nc2dFUkMyMERlcGxveWVkQ2xhaW1SZXNwb25zZQ==');
@$core.Deprecated('Use msgLogicCallExecutedClaimDescriptor instead')
const MsgLogicCallExecutedClaim$json = const {
  '1': 'MsgLogicCallExecutedClaim',
  '2': const [
    const {'1': 'event_nonce', '3': 1, '4': 1, '5': 4, '10': 'eventNonce'},
    const {'1': 'eth_block_height', '3': 2, '4': 1, '5': 4, '10': 'ethBlockHeight'},
    const {'1': 'invalidation_id', '3': 3, '4': 1, '5': 12, '10': 'invalidationId'},
    const {'1': 'invalidation_nonce', '3': 4, '4': 1, '5': 4, '10': 'invalidationNonce'},
    const {'1': 'orchestrator', '3': 5, '4': 1, '5': 9, '10': 'orchestrator'},
  ],
};

/// Descriptor for `MsgLogicCallExecutedClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgLogicCallExecutedClaimDescriptor = $convert.base64Decode('ChlNc2dMb2dpY0NhbGxFeGVjdXRlZENsYWltEh8KC2V2ZW50X25vbmNlGAEgASgEUgpldmVudE5vbmNlEigKEGV0aF9ibG9ja19oZWlnaHQYAiABKARSDmV0aEJsb2NrSGVpZ2h0EicKD2ludmFsaWRhdGlvbl9pZBgDIAEoDFIOaW52YWxpZGF0aW9uSWQSLQoSaW52YWxpZGF0aW9uX25vbmNlGAQgASgEUhFpbnZhbGlkYXRpb25Ob25jZRIiCgxvcmNoZXN0cmF0b3IYBSABKAlSDG9yY2hlc3RyYXRvcg==');
@$core.Deprecated('Use msgLogicCallExecutedClaimResponseDescriptor instead')
const MsgLogicCallExecutedClaimResponse$json = const {
  '1': 'MsgLogicCallExecutedClaimResponse',
};

/// Descriptor for `MsgLogicCallExecutedClaimResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgLogicCallExecutedClaimResponseDescriptor = $convert.base64Decode('CiFNc2dMb2dpY0NhbGxFeGVjdXRlZENsYWltUmVzcG9uc2U=');
@$core.Deprecated('Use msgValsetUpdatedClaimDescriptor instead')
const MsgValsetUpdatedClaim$json = const {
  '1': 'MsgValsetUpdatedClaim',
  '2': const [
    const {'1': 'event_nonce', '3': 1, '4': 1, '5': 4, '10': 'eventNonce'},
    const {'1': 'valset_nonce', '3': 2, '4': 1, '5': 4, '10': 'valsetNonce'},
    const {'1': 'eth_block_height', '3': 3, '4': 1, '5': 4, '10': 'ethBlockHeight'},
    const {'1': 'members', '3': 4, '4': 3, '5': 11, '6': '.gravity.v1.BridgeValidator', '8': const {}, '10': 'members'},
    const {'1': 'reward_amount', '3': 5, '4': 1, '5': 9, '8': const {}, '10': 'rewardAmount'},
    const {'1': 'reward_token', '3': 6, '4': 1, '5': 9, '10': 'rewardToken'},
    const {'1': 'orchestrator', '3': 7, '4': 1, '5': 9, '10': 'orchestrator'},
  ],
};

/// Descriptor for `MsgValsetUpdatedClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgValsetUpdatedClaimDescriptor = $convert.base64Decode('ChVNc2dWYWxzZXRVcGRhdGVkQ2xhaW0SHwoLZXZlbnRfbm9uY2UYASABKARSCmV2ZW50Tm9uY2USIQoMdmFsc2V0X25vbmNlGAIgASgEUgt2YWxzZXROb25jZRIoChBldGhfYmxvY2tfaGVpZ2h0GAMgASgEUg5ldGhCbG9ja0hlaWdodBI7CgdtZW1iZXJzGAQgAygLMhsuZ3Jhdml0eS52MS5CcmlkZ2VWYWxpZGF0b3JCBMjeHwBSB21lbWJlcnMSUwoNcmV3YXJkX2Ftb3VudBgFIAEoCUIu2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuSW50yN4fAFIMcmV3YXJkQW1vdW50EiEKDHJld2FyZF90b2tlbhgGIAEoCVILcmV3YXJkVG9rZW4SIgoMb3JjaGVzdHJhdG9yGAcgASgJUgxvcmNoZXN0cmF0b3I=');
@$core.Deprecated('Use msgValsetUpdatedClaimResponseDescriptor instead')
const MsgValsetUpdatedClaimResponse$json = const {
  '1': 'MsgValsetUpdatedClaimResponse',
};

/// Descriptor for `MsgValsetUpdatedClaimResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgValsetUpdatedClaimResponseDescriptor = $convert.base64Decode('Ch1Nc2dWYWxzZXRVcGRhdGVkQ2xhaW1SZXNwb25zZQ==');
@$core.Deprecated('Use msgCancelSendToEthDescriptor instead')
const MsgCancelSendToEth$json = const {
  '1': 'MsgCancelSendToEth',
  '2': const [
    const {'1': 'transaction_id', '3': 1, '4': 1, '5': 4, '10': 'transactionId'},
    const {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
  ],
};

/// Descriptor for `MsgCancelSendToEth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCancelSendToEthDescriptor = $convert.base64Decode('ChJNc2dDYW5jZWxTZW5kVG9FdGgSJQoOdHJhbnNhY3Rpb25faWQYASABKARSDXRyYW5zYWN0aW9uSWQSFgoGc2VuZGVyGAIgASgJUgZzZW5kZXI=');
@$core.Deprecated('Use msgCancelSendToEthResponseDescriptor instead')
const MsgCancelSendToEthResponse$json = const {
  '1': 'MsgCancelSendToEthResponse',
};

/// Descriptor for `MsgCancelSendToEthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCancelSendToEthResponseDescriptor = $convert.base64Decode('ChpNc2dDYW5jZWxTZW5kVG9FdGhSZXNwb25zZQ==');
@$core.Deprecated('Use msgSubmitBadSignatureEvidenceDescriptor instead')
const MsgSubmitBadSignatureEvidence$json = const {
  '1': 'MsgSubmitBadSignatureEvidence',
  '2': const [
    const {'1': 'subject', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'subject'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 9, '10': 'signature'},
    const {'1': 'sender', '3': 3, '4': 1, '5': 9, '10': 'sender'},
  ],
};

/// Descriptor for `MsgSubmitBadSignatureEvidence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSubmitBadSignatureEvidenceDescriptor = $convert.base64Decode('Ch1Nc2dTdWJtaXRCYWRTaWduYXR1cmVFdmlkZW5jZRJCCgdzdWJqZWN0GAEgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUISyrQtDkV0aGVyZXVtU2lnbmVkUgdzdWJqZWN0EhwKCXNpZ25hdHVyZRgCIAEoCVIJc2lnbmF0dXJlEhYKBnNlbmRlchgDIAEoCVIGc2VuZGVy');
@$core.Deprecated('Use msgSubmitBadSignatureEvidenceResponseDescriptor instead')
const MsgSubmitBadSignatureEvidenceResponse$json = const {
  '1': 'MsgSubmitBadSignatureEvidenceResponse',
};

/// Descriptor for `MsgSubmitBadSignatureEvidenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSubmitBadSignatureEvidenceResponseDescriptor = $convert.base64Decode('CiVNc2dTdWJtaXRCYWRTaWduYXR1cmVFdmlkZW5jZVJlc3BvbnNl');
@$core.Deprecated('Use eventSetOperatorAddressDescriptor instead')
const EventSetOperatorAddress$json = const {
  '1': 'EventSetOperatorAddress',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `EventSetOperatorAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventSetOperatorAddressDescriptor = $convert.base64Decode('ChdFdmVudFNldE9wZXJhdG9yQWRkcmVzcxIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEhgKB2FkZHJlc3MYAiABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use eventValsetConfirmKeyDescriptor instead')
const EventValsetConfirmKey$json = const {
  '1': 'EventValsetConfirmKey',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `EventValsetConfirmKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventValsetConfirmKeyDescriptor = $convert.base64Decode('ChVFdmVudFZhbHNldENvbmZpcm1LZXkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIQCgNrZXkYAiABKAlSA2tleQ==');
@$core.Deprecated('Use eventBatchCreatedDescriptor instead')
const EventBatchCreated$json = const {
  '1': 'EventBatchCreated',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'batch_nonce', '3': 2, '4': 1, '5': 9, '10': 'batchNonce'},
  ],
};

/// Descriptor for `EventBatchCreated`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventBatchCreatedDescriptor = $convert.base64Decode('ChFFdmVudEJhdGNoQ3JlYXRlZBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEh8KC2JhdGNoX25vbmNlGAIgASgJUgpiYXRjaE5vbmNl');
@$core.Deprecated('Use eventBatchConfirmKeyDescriptor instead')
const EventBatchConfirmKey$json = const {
  '1': 'EventBatchConfirmKey',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'batch_confirm_key', '3': 2, '4': 1, '5': 9, '10': 'batchConfirmKey'},
  ],
};

/// Descriptor for `EventBatchConfirmKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventBatchConfirmKeyDescriptor = $convert.base64Decode('ChRFdmVudEJhdGNoQ29uZmlybUtleRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEioKEWJhdGNoX2NvbmZpcm1fa2V5GAIgASgJUg9iYXRjaENvbmZpcm1LZXk=');
@$core.Deprecated('Use eventBatchSendToEthClaimDescriptor instead')
const EventBatchSendToEthClaim$json = const {
  '1': 'EventBatchSendToEthClaim',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventBatchSendToEthClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventBatchSendToEthClaimDescriptor = $convert.base64Decode('ChhFdmVudEJhdGNoU2VuZFRvRXRoQ2xhaW0SFAoFbm9uY2UYASABKAlSBW5vbmNl');
@$core.Deprecated('Use eventClaimDescriptor instead')
const EventClaim$json = const {
  '1': 'EventClaim',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'claim_hash', '3': 2, '4': 1, '5': 9, '10': 'claimHash'},
    const {'1': 'attestation_id', '3': 3, '4': 1, '5': 9, '10': 'attestationId'},
  ],
};

/// Descriptor for `EventClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventClaimDescriptor = $convert.base64Decode('CgpFdmVudENsYWltEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2USHQoKY2xhaW1faGFzaBgCIAEoCVIJY2xhaW1IYXNoEiUKDmF0dGVzdGF0aW9uX2lkGAMgASgJUg1hdHRlc3RhdGlvbklk');
@$core.Deprecated('Use eventBadSignatureEvidenceDescriptor instead')
const EventBadSignatureEvidence$json = const {
  '1': 'EventBadSignatureEvidence',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'bad_eth_signature', '3': 2, '4': 1, '5': 9, '10': 'badEthSignature'},
    const {'1': 'bad_eth_signature_subject', '3': 3, '4': 1, '5': 9, '10': 'badEthSignatureSubject'},
  ],
};

/// Descriptor for `EventBadSignatureEvidence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventBadSignatureEvidenceDescriptor = $convert.base64Decode('ChlFdmVudEJhZFNpZ25hdHVyZUV2aWRlbmNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2USKgoRYmFkX2V0aF9zaWduYXR1cmUYAiABKAlSD2JhZEV0aFNpZ25hdHVyZRI5ChliYWRfZXRoX3NpZ25hdHVyZV9zdWJqZWN0GAMgASgJUhZiYWRFdGhTaWduYXR1cmVTdWJqZWN0');
@$core.Deprecated('Use eventERC20DeployedClaimDescriptor instead')
const EventERC20DeployedClaim$json = const {
  '1': 'EventERC20DeployedClaim',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventERC20DeployedClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventERC20DeployedClaimDescriptor = $convert.base64Decode('ChdFdmVudEVSQzIwRGVwbG95ZWRDbGFpbRIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SFAoFbm9uY2UYAiABKAlSBW5vbmNl');
@$core.Deprecated('Use eventValsetUpdatedClaimDescriptor instead')
const EventValsetUpdatedClaim$json = const {
  '1': 'EventValsetUpdatedClaim',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventValsetUpdatedClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventValsetUpdatedClaimDescriptor = $convert.base64Decode('ChdFdmVudFZhbHNldFVwZGF0ZWRDbGFpbRIUCgVub25jZRgBIAEoCVIFbm9uY2U=');
@$core.Deprecated('Use eventMultisigUpdateRequestDescriptor instead')
const EventMultisigUpdateRequest$json = const {
  '1': 'EventMultisigUpdateRequest',
  '2': const [
    const {'1': 'bridge_contract', '3': 1, '4': 1, '5': 9, '10': 'bridgeContract'},
    const {'1': 'bridge_chain_id', '3': 2, '4': 1, '5': 9, '10': 'bridgeChainId'},
    const {'1': 'multisig_id', '3': 3, '4': 1, '5': 9, '10': 'multisigId'},
    const {'1': 'nonce', '3': 4, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `EventMultisigUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventMultisigUpdateRequestDescriptor = $convert.base64Decode('ChpFdmVudE11bHRpc2lnVXBkYXRlUmVxdWVzdBInCg9icmlkZ2VfY29udHJhY3QYASABKAlSDmJyaWRnZUNvbnRyYWN0EiYKD2JyaWRnZV9jaGFpbl9pZBgCIAEoCVINYnJpZGdlQ2hhaW5JZBIfCgttdWx0aXNpZ19pZBgDIAEoCVIKbXVsdGlzaWdJZBIUCgVub25jZRgEIAEoCVIFbm9uY2U=');
@$core.Deprecated('Use eventOutgoingLogicCallCanceledDescriptor instead')
const EventOutgoingLogicCallCanceled$json = const {
  '1': 'EventOutgoingLogicCallCanceled',
  '2': const [
    const {'1': 'logic_call_invalidation_id', '3': 1, '4': 1, '5': 9, '10': 'logicCallInvalidationId'},
    const {'1': 'logic_call_invalidation_nonce', '3': 2, '4': 1, '5': 9, '10': 'logicCallInvalidationNonce'},
  ],
};

/// Descriptor for `EventOutgoingLogicCallCanceled`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventOutgoingLogicCallCanceledDescriptor = $convert.base64Decode('Ch5FdmVudE91dGdvaW5nTG9naWNDYWxsQ2FuY2VsZWQSOwoabG9naWNfY2FsbF9pbnZhbGlkYXRpb25faWQYASABKAlSF2xvZ2ljQ2FsbEludmFsaWRhdGlvbklkEkEKHWxvZ2ljX2NhbGxfaW52YWxpZGF0aW9uX25vbmNlGAIgASgJUhpsb2dpY0NhbGxJbnZhbGlkYXRpb25Ob25jZQ==');
@$core.Deprecated('Use eventSignatureSlashingDescriptor instead')
const EventSignatureSlashing$json = const {
  '1': 'EventSignatureSlashing',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `EventSignatureSlashing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventSignatureSlashingDescriptor = $convert.base64Decode('ChZFdmVudFNpZ25hdHVyZVNsYXNoaW5nEhIKBHR5cGUYASABKAlSBHR5cGUSGAoHYWRkcmVzcxgCIAEoCVIHYWRkcmVzcw==');
@$core.Deprecated('Use eventOutgoingTxIdDescriptor instead')
const EventOutgoingTxId$json = const {
  '1': 'EventOutgoingTxId',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'tx_id', '3': 2, '4': 1, '5': 9, '10': 'txId'},
  ],
};

/// Descriptor for `EventOutgoingTxId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventOutgoingTxIdDescriptor = $convert.base64Decode('ChFFdmVudE91dGdvaW5nVHhJZBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEhMKBXR4X2lkGAIgASgJUgR0eElk');
