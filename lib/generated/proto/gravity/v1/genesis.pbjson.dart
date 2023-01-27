///
//  Generated code. Do not modify.
//  source: gravity/v1/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use paramsDescriptor instead')
const Params$json = const {
  '1': 'Params',
  '2': const [
    const {'1': 'gravity_id', '3': 1, '4': 1, '5': 9, '10': 'gravityId'},
    const {'1': 'contract_source_hash', '3': 2, '4': 1, '5': 9, '10': 'contractSourceHash'},
    const {'1': 'bridge_ethereum_address', '3': 4, '4': 1, '5': 9, '10': 'bridgeEthereumAddress'},
    const {'1': 'bridge_chain_id', '3': 5, '4': 1, '5': 4, '10': 'bridgeChainId'},
    const {'1': 'signed_valsets_window', '3': 6, '4': 1, '5': 4, '10': 'signedValsetsWindow'},
    const {'1': 'signed_batches_window', '3': 7, '4': 1, '5': 4, '10': 'signedBatchesWindow'},
    const {'1': 'signed_logic_calls_window', '3': 8, '4': 1, '5': 4, '10': 'signedLogicCallsWindow'},
    const {'1': 'target_batch_timeout', '3': 9, '4': 1, '5': 4, '10': 'targetBatchTimeout'},
    const {'1': 'average_block_time', '3': 10, '4': 1, '5': 4, '10': 'averageBlockTime'},
    const {'1': 'average_ethereum_block_time', '3': 11, '4': 1, '5': 4, '10': 'averageEthereumBlockTime'},
    const {'1': 'slash_fraction_valset', '3': 12, '4': 1, '5': 12, '8': const {}, '10': 'slashFractionValset'},
    const {'1': 'slash_fraction_batch', '3': 13, '4': 1, '5': 12, '8': const {}, '10': 'slashFractionBatch'},
    const {'1': 'slash_fraction_logic_call', '3': 14, '4': 1, '5': 12, '8': const {}, '10': 'slashFractionLogicCall'},
    const {'1': 'unbond_slashing_valsets_window', '3': 15, '4': 1, '5': 4, '10': 'unbondSlashingValsetsWindow'},
    const {'1': 'slash_fraction_bad_eth_signature', '3': 16, '4': 1, '5': 12, '8': const {}, '10': 'slashFractionBadEthSignature'},
    const {'1': 'valset_reward', '3': 17, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'valsetReward'},
    const {'1': 'bridge_active', '3': 18, '4': 1, '5': 8, '10': 'bridgeActive'},
    const {'1': 'ethereum_blacklist', '3': 19, '4': 3, '5': 9, '10': 'ethereumBlacklist'},
    const {'1': 'min_chain_fee_basis_points', '3': 20, '4': 1, '5': 4, '10': 'minChainFeeBasisPoints'},
  ],
  '7': const {},
};

/// Descriptor for `Params`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paramsDescriptor = $convert.base64Decode('CgZQYXJhbXMSHQoKZ3Jhdml0eV9pZBgBIAEoCVIJZ3Jhdml0eUlkEjAKFGNvbnRyYWN0X3NvdXJjZV9oYXNoGAIgASgJUhJjb250cmFjdFNvdXJjZUhhc2gSNgoXYnJpZGdlX2V0aGVyZXVtX2FkZHJlc3MYBCABKAlSFWJyaWRnZUV0aGVyZXVtQWRkcmVzcxImCg9icmlkZ2VfY2hhaW5faWQYBSABKARSDWJyaWRnZUNoYWluSWQSMgoVc2lnbmVkX3ZhbHNldHNfd2luZG93GAYgASgEUhNzaWduZWRWYWxzZXRzV2luZG93EjIKFXNpZ25lZF9iYXRjaGVzX3dpbmRvdxgHIAEoBFITc2lnbmVkQmF0Y2hlc1dpbmRvdxI5ChlzaWduZWRfbG9naWNfY2FsbHNfd2luZG93GAggASgEUhZzaWduZWRMb2dpY0NhbGxzV2luZG93EjAKFHRhcmdldF9iYXRjaF90aW1lb3V0GAkgASgEUhJ0YXJnZXRCYXRjaFRpbWVvdXQSLAoSYXZlcmFnZV9ibG9ja190aW1lGAogASgEUhBhdmVyYWdlQmxvY2tUaW1lEj0KG2F2ZXJhZ2VfZXRoZXJldW1fYmxvY2tfdGltZRgLIAEoBFIYYXZlcmFnZUV0aGVyZXVtQmxvY2tUaW1lEmIKFXNsYXNoX2ZyYWN0aW9uX3ZhbHNldBgMIAEoDEIu2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuRGVjyN4fAFITc2xhc2hGcmFjdGlvblZhbHNldBJgChRzbGFzaF9mcmFjdGlvbl9iYXRjaBgNIAEoDEIu2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuRGVjyN4fAFISc2xhc2hGcmFjdGlvbkJhdGNoEmkKGXNsYXNoX2ZyYWN0aW9uX2xvZ2ljX2NhbGwYDiABKAxCLtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY8jeHwBSFnNsYXNoRnJhY3Rpb25Mb2dpY0NhbGwSQwoedW5ib25kX3NsYXNoaW5nX3ZhbHNldHNfd2luZG93GA8gASgEUht1bmJvbmRTbGFzaGluZ1ZhbHNldHNXaW5kb3cSdgogc2xhc2hfZnJhY3Rpb25fYmFkX2V0aF9zaWduYXR1cmUYECABKAxCLtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY8jeHwBSHHNsYXNoRnJhY3Rpb25CYWRFdGhTaWduYXR1cmUSRAoNdmFsc2V0X3Jld2FyZBgRIAEoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIEyN4fAFIMdmFsc2V0UmV3YXJkEiMKDWJyaWRnZV9hY3RpdmUYEiABKAhSDGJyaWRnZUFjdGl2ZRItChJldGhlcmV1bV9ibGFja2xpc3QYEyADKAlSEWV0aGVyZXVtQmxhY2tsaXN0EjoKGm1pbl9jaGFpbl9mZWVfYmFzaXNfcG9pbnRzGBQgASgEUhZtaW5DaGFpbkZlZUJhc2lzUG9pbnRzOgSA3CAA');
@$core.Deprecated('Use genesisStateDescriptor instead')
const GenesisState$json = const {
  '1': 'GenesisState',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.gravity.v1.Params', '10': 'params'},
    const {'1': 'gravity_nonces', '3': 2, '4': 1, '5': 11, '6': '.gravity.v1.GravityNonces', '8': const {}, '10': 'gravityNonces'},
    const {'1': 'valsets', '3': 3, '4': 3, '5': 11, '6': '.gravity.v1.Valset', '8': const {}, '10': 'valsets'},
    const {'1': 'valset_confirms', '3': 4, '4': 3, '5': 11, '6': '.gravity.v1.MsgValsetConfirm', '8': const {}, '10': 'valsetConfirms'},
    const {'1': 'batches', '3': 5, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTxBatch', '8': const {}, '10': 'batches'},
    const {'1': 'batch_confirms', '3': 6, '4': 3, '5': 11, '6': '.gravity.v1.MsgConfirmBatch', '8': const {}, '10': 'batchConfirms'},
    const {'1': 'logic_calls', '3': 7, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingLogicCall', '8': const {}, '10': 'logicCalls'},
    const {'1': 'logic_call_confirms', '3': 8, '4': 3, '5': 11, '6': '.gravity.v1.MsgConfirmLogicCall', '8': const {}, '10': 'logicCallConfirms'},
    const {'1': 'attestations', '3': 9, '4': 3, '5': 11, '6': '.gravity.v1.Attestation', '8': const {}, '10': 'attestations'},
    const {'1': 'delegate_keys', '3': 10, '4': 3, '5': 11, '6': '.gravity.v1.MsgSetOrchestratorAddress', '8': const {}, '10': 'delegateKeys'},
    const {'1': 'erc20_to_denoms', '3': 11, '4': 3, '5': 11, '6': '.gravity.v1.ERC20ToDenom', '8': const {}, '10': 'erc20ToDenoms'},
    const {'1': 'unbatched_transfers', '3': 12, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTransferTx', '8': const {}, '10': 'unbatchedTransfers'},
    const {'1': 'pending_ibc_auto_forwards', '3': 13, '4': 3, '5': 11, '6': '.gravity.v1.PendingIbcAutoForward', '8': const {}, '10': 'pendingIbcAutoForwards'},
  ],
};

/// Descriptor for `GenesisState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genesisStateDescriptor = $convert.base64Decode('CgxHZW5lc2lzU3RhdGUSKgoGcGFyYW1zGAEgASgLMhIuZ3Jhdml0eS52MS5QYXJhbXNSBnBhcmFtcxJGCg5ncmF2aXR5X25vbmNlcxgCIAEoCzIZLmdyYXZpdHkudjEuR3Jhdml0eU5vbmNlc0IEyN4fAFINZ3Jhdml0eU5vbmNlcxIyCgd2YWxzZXRzGAMgAygLMhIuZ3Jhdml0eS52MS5WYWxzZXRCBMjeHwBSB3ZhbHNldHMSSwoPdmFsc2V0X2NvbmZpcm1zGAQgAygLMhwuZ3Jhdml0eS52MS5Nc2dWYWxzZXRDb25maXJtQgTI3h8AUg52YWxzZXRDb25maXJtcxI7CgdiYXRjaGVzGAUgAygLMhsuZ3Jhdml0eS52MS5PdXRnb2luZ1R4QmF0Y2hCBMjeHwBSB2JhdGNoZXMSSAoOYmF0Y2hfY29uZmlybXMYBiADKAsyGy5ncmF2aXR5LnYxLk1zZ0NvbmZpcm1CYXRjaEIEyN4fAFINYmF0Y2hDb25maXJtcxJECgtsb2dpY19jYWxscxgHIAMoCzIdLmdyYXZpdHkudjEuT3V0Z29pbmdMb2dpY0NhbGxCBMjeHwBSCmxvZ2ljQ2FsbHMSVQoTbG9naWNfY2FsbF9jb25maXJtcxgIIAMoCzIfLmdyYXZpdHkudjEuTXNnQ29uZmlybUxvZ2ljQ2FsbEIEyN4fAFIRbG9naWNDYWxsQ29uZmlybXMSQQoMYXR0ZXN0YXRpb25zGAkgAygLMhcuZ3Jhdml0eS52MS5BdHRlc3RhdGlvbkIEyN4fAFIMYXR0ZXN0YXRpb25zElAKDWRlbGVnYXRlX2tleXMYCiADKAsyJS5ncmF2aXR5LnYxLk1zZ1NldE9yY2hlc3RyYXRvckFkZHJlc3NCBMjeHwBSDGRlbGVnYXRlS2V5cxJGCg9lcmMyMF90b19kZW5vbXMYCyADKAsyGC5ncmF2aXR5LnYxLkVSQzIwVG9EZW5vbUIEyN4fAFINZXJjMjBUb0Rlbm9tcxJVChN1bmJhdGNoZWRfdHJhbnNmZXJzGAwgAygLMh4uZ3Jhdml0eS52MS5PdXRnb2luZ1RyYW5zZmVyVHhCBMjeHwBSEnVuYmF0Y2hlZFRyYW5zZmVycxJiChlwZW5kaW5nX2liY19hdXRvX2ZvcndhcmRzGA0gAygLMiEuZ3Jhdml0eS52MS5QZW5kaW5nSWJjQXV0b0ZvcndhcmRCBMjeHwBSFnBlbmRpbmdJYmNBdXRvRm9yd2FyZHM=');
@$core.Deprecated('Use gravityNoncesDescriptor instead')
const GravityNonces$json = const {
  '1': 'GravityNonces',
  '2': const [
    const {'1': 'latest_valset_nonce', '3': 1, '4': 1, '5': 4, '10': 'latestValsetNonce'},
    const {'1': 'last_observed_nonce', '3': 2, '4': 1, '5': 4, '10': 'lastObservedNonce'},
    const {'1': 'last_slashed_valset_nonce', '3': 3, '4': 1, '5': 4, '10': 'lastSlashedValsetNonce'},
    const {'1': 'last_slashed_batch_block', '3': 4, '4': 1, '5': 4, '10': 'lastSlashedBatchBlock'},
    const {'1': 'last_slashed_logic_call_block', '3': 5, '4': 1, '5': 4, '10': 'lastSlashedLogicCallBlock'},
    const {'1': 'last_tx_pool_id', '3': 6, '4': 1, '5': 4, '10': 'lastTxPoolId'},
    const {'1': 'last_batch_id', '3': 7, '4': 1, '5': 4, '10': 'lastBatchId'},
  ],
};

/// Descriptor for `GravityNonces`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gravityNoncesDescriptor = $convert.base64Decode('Cg1HcmF2aXR5Tm9uY2VzEi4KE2xhdGVzdF92YWxzZXRfbm9uY2UYASABKARSEWxhdGVzdFZhbHNldE5vbmNlEi4KE2xhc3Rfb2JzZXJ2ZWRfbm9uY2UYAiABKARSEWxhc3RPYnNlcnZlZE5vbmNlEjkKGWxhc3Rfc2xhc2hlZF92YWxzZXRfbm9uY2UYAyABKARSFmxhc3RTbGFzaGVkVmFsc2V0Tm9uY2USNwoYbGFzdF9zbGFzaGVkX2JhdGNoX2Jsb2NrGAQgASgEUhVsYXN0U2xhc2hlZEJhdGNoQmxvY2sSQAodbGFzdF9zbGFzaGVkX2xvZ2ljX2NhbGxfYmxvY2sYBSABKARSGWxhc3RTbGFzaGVkTG9naWNDYWxsQmxvY2sSJQoPbGFzdF90eF9wb29sX2lkGAYgASgEUgxsYXN0VHhQb29sSWQSIgoNbGFzdF9iYXRjaF9pZBgHIAEoBFILbGFzdEJhdGNoSWQ=');
