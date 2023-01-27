///
//  Generated code. Do not modify.
//  source: gravity/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3Q=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.gravity.v1.Params', '8': const {}, '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjAKBnBhcmFtcxgBIAEoCzISLmdyYXZpdHkudjEuUGFyYW1zQgTI3h8AUgZwYXJhbXM=');
@$core.Deprecated('Use queryCurrentValsetRequestDescriptor instead')
const QueryCurrentValsetRequest$json = const {
  '1': 'QueryCurrentValsetRequest',
};

/// Descriptor for `QueryCurrentValsetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryCurrentValsetRequestDescriptor = $convert.base64Decode('ChlRdWVyeUN1cnJlbnRWYWxzZXRSZXF1ZXN0');
@$core.Deprecated('Use queryCurrentValsetResponseDescriptor instead')
const QueryCurrentValsetResponse$json = const {
  '1': 'QueryCurrentValsetResponse',
  '2': const [
    const {'1': 'valset', '3': 1, '4': 1, '5': 11, '6': '.gravity.v1.Valset', '8': const {}, '10': 'valset'},
  ],
};

/// Descriptor for `QueryCurrentValsetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryCurrentValsetResponseDescriptor = $convert.base64Decode('ChpRdWVyeUN1cnJlbnRWYWxzZXRSZXNwb25zZRIwCgZ2YWxzZXQYASABKAsyEi5ncmF2aXR5LnYxLlZhbHNldEIEyN4fAFIGdmFsc2V0');
@$core.Deprecated('Use queryValsetRequestRequestDescriptor instead')
const QueryValsetRequestRequest$json = const {
  '1': 'QueryValsetRequestRequest',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
  ],
};

/// Descriptor for `QueryValsetRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValsetRequestRequestDescriptor = $convert.base64Decode('ChlRdWVyeVZhbHNldFJlcXVlc3RSZXF1ZXN0EhQKBW5vbmNlGAEgASgEUgVub25jZQ==');
@$core.Deprecated('Use queryValsetRequestResponseDescriptor instead')
const QueryValsetRequestResponse$json = const {
  '1': 'QueryValsetRequestResponse',
  '2': const [
    const {'1': 'valset', '3': 1, '4': 1, '5': 11, '6': '.gravity.v1.Valset', '10': 'valset'},
  ],
};

/// Descriptor for `QueryValsetRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValsetRequestResponseDescriptor = $convert.base64Decode('ChpRdWVyeVZhbHNldFJlcXVlc3RSZXNwb25zZRIqCgZ2YWxzZXQYASABKAsyEi5ncmF2aXR5LnYxLlZhbHNldFIGdmFsc2V0');
@$core.Deprecated('Use queryValsetConfirmRequestDescriptor instead')
const QueryValsetConfirmRequest$json = const {
  '1': 'QueryValsetConfirmRequest',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `QueryValsetConfirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValsetConfirmRequestDescriptor = $convert.base64Decode('ChlRdWVyeVZhbHNldENvbmZpcm1SZXF1ZXN0EhQKBW5vbmNlGAEgASgEUgVub25jZRIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use queryValsetConfirmResponseDescriptor instead')
const QueryValsetConfirmResponse$json = const {
  '1': 'QueryValsetConfirmResponse',
  '2': const [
    const {'1': 'confirm', '3': 1, '4': 1, '5': 11, '6': '.gravity.v1.MsgValsetConfirm', '10': 'confirm'},
  ],
};

/// Descriptor for `QueryValsetConfirmResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValsetConfirmResponseDescriptor = $convert.base64Decode('ChpRdWVyeVZhbHNldENvbmZpcm1SZXNwb25zZRI2Cgdjb25maXJtGAEgASgLMhwuZ3Jhdml0eS52MS5Nc2dWYWxzZXRDb25maXJtUgdjb25maXJt');
@$core.Deprecated('Use queryValsetConfirmsByNonceRequestDescriptor instead')
const QueryValsetConfirmsByNonceRequest$json = const {
  '1': 'QueryValsetConfirmsByNonceRequest',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
  ],
};

/// Descriptor for `QueryValsetConfirmsByNonceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValsetConfirmsByNonceRequestDescriptor = $convert.base64Decode('CiFRdWVyeVZhbHNldENvbmZpcm1zQnlOb25jZVJlcXVlc3QSFAoFbm9uY2UYASABKARSBW5vbmNl');
@$core.Deprecated('Use queryValsetConfirmsByNonceResponseDescriptor instead')
const QueryValsetConfirmsByNonceResponse$json = const {
  '1': 'QueryValsetConfirmsByNonceResponse',
  '2': const [
    const {'1': 'confirms', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.MsgValsetConfirm', '8': const {}, '10': 'confirms'},
  ],
};

/// Descriptor for `QueryValsetConfirmsByNonceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValsetConfirmsByNonceResponseDescriptor = $convert.base64Decode('CiJRdWVyeVZhbHNldENvbmZpcm1zQnlOb25jZVJlc3BvbnNlEj4KCGNvbmZpcm1zGAEgAygLMhwuZ3Jhdml0eS52MS5Nc2dWYWxzZXRDb25maXJtQgTI3h8AUghjb25maXJtcw==');
@$core.Deprecated('Use queryLastValsetRequestsRequestDescriptor instead')
const QueryLastValsetRequestsRequest$json = const {
  '1': 'QueryLastValsetRequestsRequest',
};

/// Descriptor for `QueryLastValsetRequestsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastValsetRequestsRequestDescriptor = $convert.base64Decode('Ch5RdWVyeUxhc3RWYWxzZXRSZXF1ZXN0c1JlcXVlc3Q=');
@$core.Deprecated('Use queryLastValsetRequestsResponseDescriptor instead')
const QueryLastValsetRequestsResponse$json = const {
  '1': 'QueryLastValsetRequestsResponse',
  '2': const [
    const {'1': 'valsets', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.Valset', '8': const {}, '10': 'valsets'},
  ],
};

/// Descriptor for `QueryLastValsetRequestsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastValsetRequestsResponseDescriptor = $convert.base64Decode('Ch9RdWVyeUxhc3RWYWxzZXRSZXF1ZXN0c1Jlc3BvbnNlEjIKB3ZhbHNldHMYASADKAsyEi5ncmF2aXR5LnYxLlZhbHNldEIEyN4fAFIHdmFsc2V0cw==');
@$core.Deprecated('Use queryLastPendingValsetRequestByAddrRequestDescriptor instead')
const QueryLastPendingValsetRequestByAddrRequest$json = const {
  '1': 'QueryLastPendingValsetRequestByAddrRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `QueryLastPendingValsetRequestByAddrRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastPendingValsetRequestByAddrRequestDescriptor = $convert.base64Decode('CipRdWVyeUxhc3RQZW5kaW5nVmFsc2V0UmVxdWVzdEJ5QWRkclJlcXVlc3QSGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcw==');
@$core.Deprecated('Use queryLastPendingValsetRequestByAddrResponseDescriptor instead')
const QueryLastPendingValsetRequestByAddrResponse$json = const {
  '1': 'QueryLastPendingValsetRequestByAddrResponse',
  '2': const [
    const {'1': 'valsets', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.Valset', '8': const {}, '10': 'valsets'},
  ],
};

/// Descriptor for `QueryLastPendingValsetRequestByAddrResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastPendingValsetRequestByAddrResponseDescriptor = $convert.base64Decode('CitRdWVyeUxhc3RQZW5kaW5nVmFsc2V0UmVxdWVzdEJ5QWRkclJlc3BvbnNlEjIKB3ZhbHNldHMYASADKAsyEi5ncmF2aXR5LnYxLlZhbHNldEIEyN4fAFIHdmFsc2V0cw==');
@$core.Deprecated('Use queryBatchFeeRequestDescriptor instead')
const QueryBatchFeeRequest$json = const {
  '1': 'QueryBatchFeeRequest',
};

/// Descriptor for `QueryBatchFeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBatchFeeRequestDescriptor = $convert.base64Decode('ChRRdWVyeUJhdGNoRmVlUmVxdWVzdA==');
@$core.Deprecated('Use queryBatchFeeResponseDescriptor instead')
const QueryBatchFeeResponse$json = const {
  '1': 'QueryBatchFeeResponse',
  '2': const [
    const {'1': 'batch_fees', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.BatchFees', '8': const {}, '10': 'batchFees'},
  ],
};

/// Descriptor for `QueryBatchFeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBatchFeeResponseDescriptor = $convert.base64Decode('ChVRdWVyeUJhdGNoRmVlUmVzcG9uc2USOgoKYmF0Y2hfZmVlcxgBIAMoCzIVLmdyYXZpdHkudjEuQmF0Y2hGZWVzQgTI3h8AUgliYXRjaEZlZXM=');
@$core.Deprecated('Use queryLastPendingBatchRequestByAddrRequestDescriptor instead')
const QueryLastPendingBatchRequestByAddrRequest$json = const {
  '1': 'QueryLastPendingBatchRequestByAddrRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `QueryLastPendingBatchRequestByAddrRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastPendingBatchRequestByAddrRequestDescriptor = $convert.base64Decode('CilRdWVyeUxhc3RQZW5kaW5nQmF0Y2hSZXF1ZXN0QnlBZGRyUmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use queryLastPendingBatchRequestByAddrResponseDescriptor instead')
const QueryLastPendingBatchRequestByAddrResponse$json = const {
  '1': 'QueryLastPendingBatchRequestByAddrResponse',
  '2': const [
    const {'1': 'batch', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTxBatch', '8': const {}, '10': 'batch'},
  ],
};

/// Descriptor for `QueryLastPendingBatchRequestByAddrResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastPendingBatchRequestByAddrResponseDescriptor = $convert.base64Decode('CipRdWVyeUxhc3RQZW5kaW5nQmF0Y2hSZXF1ZXN0QnlBZGRyUmVzcG9uc2USNwoFYmF0Y2gYASADKAsyGy5ncmF2aXR5LnYxLk91dGdvaW5nVHhCYXRjaEIEyN4fAFIFYmF0Y2g=');
@$core.Deprecated('Use queryLastPendingLogicCallByAddrRequestDescriptor instead')
const QueryLastPendingLogicCallByAddrRequest$json = const {
  '1': 'QueryLastPendingLogicCallByAddrRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `QueryLastPendingLogicCallByAddrRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastPendingLogicCallByAddrRequestDescriptor = $convert.base64Decode('CiZRdWVyeUxhc3RQZW5kaW5nTG9naWNDYWxsQnlBZGRyUmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use queryLastPendingLogicCallByAddrResponseDescriptor instead')
const QueryLastPendingLogicCallByAddrResponse$json = const {
  '1': 'QueryLastPendingLogicCallByAddrResponse',
  '2': const [
    const {'1': 'call', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingLogicCall', '8': const {}, '10': 'call'},
  ],
};

/// Descriptor for `QueryLastPendingLogicCallByAddrResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastPendingLogicCallByAddrResponseDescriptor = $convert.base64Decode('CidRdWVyeUxhc3RQZW5kaW5nTG9naWNDYWxsQnlBZGRyUmVzcG9uc2USNwoEY2FsbBgBIAMoCzIdLmdyYXZpdHkudjEuT3V0Z29pbmdMb2dpY0NhbGxCBMjeHwBSBGNhbGw=');
@$core.Deprecated('Use queryOutgoingTxBatchesRequestDescriptor instead')
const QueryOutgoingTxBatchesRequest$json = const {
  '1': 'QueryOutgoingTxBatchesRequest',
};

/// Descriptor for `QueryOutgoingTxBatchesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryOutgoingTxBatchesRequestDescriptor = $convert.base64Decode('Ch1RdWVyeU91dGdvaW5nVHhCYXRjaGVzUmVxdWVzdA==');
@$core.Deprecated('Use queryOutgoingTxBatchesResponseDescriptor instead')
const QueryOutgoingTxBatchesResponse$json = const {
  '1': 'QueryOutgoingTxBatchesResponse',
  '2': const [
    const {'1': 'batches', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTxBatch', '8': const {}, '10': 'batches'},
  ],
};

/// Descriptor for `QueryOutgoingTxBatchesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryOutgoingTxBatchesResponseDescriptor = $convert.base64Decode('Ch5RdWVyeU91dGdvaW5nVHhCYXRjaGVzUmVzcG9uc2USOwoHYmF0Y2hlcxgBIAMoCzIbLmdyYXZpdHkudjEuT3V0Z29pbmdUeEJhdGNoQgTI3h8AUgdiYXRjaGVz');
@$core.Deprecated('Use queryOutgoingLogicCallsRequestDescriptor instead')
const QueryOutgoingLogicCallsRequest$json = const {
  '1': 'QueryOutgoingLogicCallsRequest',
};

/// Descriptor for `QueryOutgoingLogicCallsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryOutgoingLogicCallsRequestDescriptor = $convert.base64Decode('Ch5RdWVyeU91dGdvaW5nTG9naWNDYWxsc1JlcXVlc3Q=');
@$core.Deprecated('Use queryOutgoingLogicCallsResponseDescriptor instead')
const QueryOutgoingLogicCallsResponse$json = const {
  '1': 'QueryOutgoingLogicCallsResponse',
  '2': const [
    const {'1': 'calls', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingLogicCall', '8': const {}, '10': 'calls'},
  ],
};

/// Descriptor for `QueryOutgoingLogicCallsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryOutgoingLogicCallsResponseDescriptor = $convert.base64Decode('Ch9RdWVyeU91dGdvaW5nTG9naWNDYWxsc1Jlc3BvbnNlEjkKBWNhbGxzGAEgAygLMh0uZ3Jhdml0eS52MS5PdXRnb2luZ0xvZ2ljQ2FsbEIEyN4fAFIFY2FsbHM=');
@$core.Deprecated('Use queryBatchRequestByNonceRequestDescriptor instead')
const QueryBatchRequestByNonceRequest$json = const {
  '1': 'QueryBatchRequestByNonceRequest',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
  ],
};

/// Descriptor for `QueryBatchRequestByNonceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBatchRequestByNonceRequestDescriptor = $convert.base64Decode('Ch9RdWVyeUJhdGNoUmVxdWVzdEJ5Tm9uY2VSZXF1ZXN0EhQKBW5vbmNlGAEgASgEUgVub25jZRIpChBjb250cmFjdF9hZGRyZXNzGAIgASgJUg9jb250cmFjdEFkZHJlc3M=');
@$core.Deprecated('Use queryBatchRequestByNonceResponseDescriptor instead')
const QueryBatchRequestByNonceResponse$json = const {
  '1': 'QueryBatchRequestByNonceResponse',
  '2': const [
    const {'1': 'batch', '3': 1, '4': 1, '5': 11, '6': '.gravity.v1.OutgoingTxBatch', '8': const {}, '10': 'batch'},
  ],
};

/// Descriptor for `QueryBatchRequestByNonceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBatchRequestByNonceResponseDescriptor = $convert.base64Decode('CiBRdWVyeUJhdGNoUmVxdWVzdEJ5Tm9uY2VSZXNwb25zZRI3CgViYXRjaBgBIAEoCzIbLmdyYXZpdHkudjEuT3V0Z29pbmdUeEJhdGNoQgTI3h8AUgViYXRjaA==');
@$core.Deprecated('Use queryBatchConfirmsRequestDescriptor instead')
const QueryBatchConfirmsRequest$json = const {
  '1': 'QueryBatchConfirmsRequest',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
  ],
};

/// Descriptor for `QueryBatchConfirmsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBatchConfirmsRequestDescriptor = $convert.base64Decode('ChlRdWVyeUJhdGNoQ29uZmlybXNSZXF1ZXN0EhQKBW5vbmNlGAEgASgEUgVub25jZRIpChBjb250cmFjdF9hZGRyZXNzGAIgASgJUg9jb250cmFjdEFkZHJlc3M=');
@$core.Deprecated('Use queryBatchConfirmsResponseDescriptor instead')
const QueryBatchConfirmsResponse$json = const {
  '1': 'QueryBatchConfirmsResponse',
  '2': const [
    const {'1': 'confirms', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.MsgConfirmBatch', '8': const {}, '10': 'confirms'},
  ],
};

/// Descriptor for `QueryBatchConfirmsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBatchConfirmsResponseDescriptor = $convert.base64Decode('ChpRdWVyeUJhdGNoQ29uZmlybXNSZXNwb25zZRI9Cghjb25maXJtcxgBIAMoCzIbLmdyYXZpdHkudjEuTXNnQ29uZmlybUJhdGNoQgTI3h8AUghjb25maXJtcw==');
@$core.Deprecated('Use queryLogicConfirmsRequestDescriptor instead')
const QueryLogicConfirmsRequest$json = const {
  '1': 'QueryLogicConfirmsRequest',
  '2': const [
    const {'1': 'invalidation_id', '3': 1, '4': 1, '5': 12, '10': 'invalidationId'},
    const {'1': 'invalidation_nonce', '3': 2, '4': 1, '5': 4, '10': 'invalidationNonce'},
  ],
};

/// Descriptor for `QueryLogicConfirmsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLogicConfirmsRequestDescriptor = $convert.base64Decode('ChlRdWVyeUxvZ2ljQ29uZmlybXNSZXF1ZXN0EicKD2ludmFsaWRhdGlvbl9pZBgBIAEoDFIOaW52YWxpZGF0aW9uSWQSLQoSaW52YWxpZGF0aW9uX25vbmNlGAIgASgEUhFpbnZhbGlkYXRpb25Ob25jZQ==');
@$core.Deprecated('Use queryLogicConfirmsResponseDescriptor instead')
const QueryLogicConfirmsResponse$json = const {
  '1': 'QueryLogicConfirmsResponse',
  '2': const [
    const {'1': 'confirms', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.MsgConfirmLogicCall', '8': const {}, '10': 'confirms'},
  ],
};

/// Descriptor for `QueryLogicConfirmsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLogicConfirmsResponseDescriptor = $convert.base64Decode('ChpRdWVyeUxvZ2ljQ29uZmlybXNSZXNwb25zZRJBCghjb25maXJtcxgBIAMoCzIfLmdyYXZpdHkudjEuTXNnQ29uZmlybUxvZ2ljQ2FsbEIEyN4fAFIIY29uZmlybXM=');
@$core.Deprecated('Use queryLastEventNonceByAddrRequestDescriptor instead')
const QueryLastEventNonceByAddrRequest$json = const {
  '1': 'QueryLastEventNonceByAddrRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `QueryLastEventNonceByAddrRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastEventNonceByAddrRequestDescriptor = $convert.base64Decode('CiBRdWVyeUxhc3RFdmVudE5vbmNlQnlBZGRyUmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use queryLastEventNonceByAddrResponseDescriptor instead')
const QueryLastEventNonceByAddrResponse$json = const {
  '1': 'QueryLastEventNonceByAddrResponse',
  '2': const [
    const {'1': 'event_nonce', '3': 1, '4': 1, '5': 4, '10': 'eventNonce'},
  ],
};

/// Descriptor for `QueryLastEventNonceByAddrResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastEventNonceByAddrResponseDescriptor = $convert.base64Decode('CiFRdWVyeUxhc3RFdmVudE5vbmNlQnlBZGRyUmVzcG9uc2USHwoLZXZlbnRfbm9uY2UYASABKARSCmV2ZW50Tm9uY2U=');
@$core.Deprecated('Use queryERC20ToDenomRequestDescriptor instead')
const QueryERC20ToDenomRequest$json = const {
  '1': 'QueryERC20ToDenomRequest',
  '2': const [
    const {'1': 'erc20', '3': 1, '4': 1, '5': 9, '10': 'erc20'},
  ],
};

/// Descriptor for `QueryERC20ToDenomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryERC20ToDenomRequestDescriptor = $convert.base64Decode('ChhRdWVyeUVSQzIwVG9EZW5vbVJlcXVlc3QSFAoFZXJjMjAYASABKAlSBWVyYzIw');
@$core.Deprecated('Use queryERC20ToDenomResponseDescriptor instead')
const QueryERC20ToDenomResponse$json = const {
  '1': 'QueryERC20ToDenomResponse',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'cosmos_originated', '3': 2, '4': 1, '5': 8, '10': 'cosmosOriginated'},
  ],
};

/// Descriptor for `QueryERC20ToDenomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryERC20ToDenomResponseDescriptor = $convert.base64Decode('ChlRdWVyeUVSQzIwVG9EZW5vbVJlc3BvbnNlEhQKBWRlbm9tGAEgASgJUgVkZW5vbRIrChFjb3Ntb3Nfb3JpZ2luYXRlZBgCIAEoCFIQY29zbW9zT3JpZ2luYXRlZA==');
@$core.Deprecated('Use queryDenomToERC20RequestDescriptor instead')
const QueryDenomToERC20Request$json = const {
  '1': 'QueryDenomToERC20Request',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
  ],
};

/// Descriptor for `QueryDenomToERC20Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomToERC20RequestDescriptor = $convert.base64Decode('ChhRdWVyeURlbm9tVG9FUkMyMFJlcXVlc3QSFAoFZGVub20YASABKAlSBWRlbm9t');
@$core.Deprecated('Use queryDenomToERC20ResponseDescriptor instead')
const QueryDenomToERC20Response$json = const {
  '1': 'QueryDenomToERC20Response',
  '2': const [
    const {'1': 'erc20', '3': 1, '4': 1, '5': 9, '10': 'erc20'},
    const {'1': 'cosmos_originated', '3': 2, '4': 1, '5': 8, '10': 'cosmosOriginated'},
  ],
};

/// Descriptor for `QueryDenomToERC20Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomToERC20ResponseDescriptor = $convert.base64Decode('ChlRdWVyeURlbm9tVG9FUkMyMFJlc3BvbnNlEhQKBWVyYzIwGAEgASgJUgVlcmMyMBIrChFjb3Ntb3Nfb3JpZ2luYXRlZBgCIAEoCFIQY29zbW9zT3JpZ2luYXRlZA==');
@$core.Deprecated('Use queryLastObservedEthBlockRequestDescriptor instead')
const QueryLastObservedEthBlockRequest$json = const {
  '1': 'QueryLastObservedEthBlockRequest',
  '2': const [
    const {'1': 'use_v1_key', '3': 1, '4': 1, '5': 8, '10': 'useV1Key'},
  ],
};

/// Descriptor for `QueryLastObservedEthBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastObservedEthBlockRequestDescriptor = $convert.base64Decode('CiBRdWVyeUxhc3RPYnNlcnZlZEV0aEJsb2NrUmVxdWVzdBIcCgp1c2VfdjFfa2V5GAEgASgIUgh1c2VWMUtleQ==');
@$core.Deprecated('Use queryLastObservedEthBlockResponseDescriptor instead')
const QueryLastObservedEthBlockResponse$json = const {
  '1': 'QueryLastObservedEthBlockResponse',
  '2': const [
    const {'1': 'block', '3': 1, '4': 1, '5': 4, '10': 'block'},
  ],
};

/// Descriptor for `QueryLastObservedEthBlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastObservedEthBlockResponseDescriptor = $convert.base64Decode('CiFRdWVyeUxhc3RPYnNlcnZlZEV0aEJsb2NrUmVzcG9uc2USFAoFYmxvY2sYASABKARSBWJsb2Nr');
@$core.Deprecated('Use queryLastObservedEthNonceRequestDescriptor instead')
const QueryLastObservedEthNonceRequest$json = const {
  '1': 'QueryLastObservedEthNonceRequest',
  '2': const [
    const {'1': 'use_v1_key', '3': 1, '4': 1, '5': 8, '10': 'useV1Key'},
  ],
};

/// Descriptor for `QueryLastObservedEthNonceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastObservedEthNonceRequestDescriptor = $convert.base64Decode('CiBRdWVyeUxhc3RPYnNlcnZlZEV0aE5vbmNlUmVxdWVzdBIcCgp1c2VfdjFfa2V5GAEgASgIUgh1c2VWMUtleQ==');
@$core.Deprecated('Use queryLastObservedEthNonceResponseDescriptor instead')
const QueryLastObservedEthNonceResponse$json = const {
  '1': 'QueryLastObservedEthNonceResponse',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
  ],
};

/// Descriptor for `QueryLastObservedEthNonceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLastObservedEthNonceResponseDescriptor = $convert.base64Decode('CiFRdWVyeUxhc3RPYnNlcnZlZEV0aE5vbmNlUmVzcG9uc2USFAoFbm9uY2UYASABKARSBW5vbmNl');
@$core.Deprecated('Use queryAttestationsRequestDescriptor instead')
const QueryAttestationsRequest$json = const {
  '1': 'QueryAttestationsRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 4, '10': 'limit'},
    const {'1': 'order_by', '3': 2, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'claim_type', '3': 3, '4': 1, '5': 9, '10': 'claimType'},
    const {'1': 'nonce', '3': 4, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'height', '3': 5, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'use_v1_key', '3': 6, '4': 1, '5': 8, '10': 'useV1Key'},
  ],
};

/// Descriptor for `QueryAttestationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAttestationsRequestDescriptor = $convert.base64Decode('ChhRdWVyeUF0dGVzdGF0aW9uc1JlcXVlc3QSFAoFbGltaXQYASABKARSBWxpbWl0EhkKCG9yZGVyX2J5GAIgASgJUgdvcmRlckJ5Eh0KCmNsYWltX3R5cGUYAyABKAlSCWNsYWltVHlwZRIUCgVub25jZRgEIAEoBFIFbm9uY2USFgoGaGVpZ2h0GAUgASgEUgZoZWlnaHQSHAoKdXNlX3YxX2tleRgGIAEoCFIIdXNlVjFLZXk=');
@$core.Deprecated('Use queryAttestationsResponseDescriptor instead')
const QueryAttestationsResponse$json = const {
  '1': 'QueryAttestationsResponse',
  '2': const [
    const {'1': 'attestations', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.Attestation', '8': const {}, '10': 'attestations'},
  ],
};

/// Descriptor for `QueryAttestationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAttestationsResponseDescriptor = $convert.base64Decode('ChlRdWVyeUF0dGVzdGF0aW9uc1Jlc3BvbnNlEkEKDGF0dGVzdGF0aW9ucxgBIAMoCzIXLmdyYXZpdHkudjEuQXR0ZXN0YXRpb25CBMjeHwBSDGF0dGVzdGF0aW9ucw==');
@$core.Deprecated('Use queryDelegateKeysByValidatorAddressDescriptor instead')
const QueryDelegateKeysByValidatorAddress$json = const {
  '1': 'QueryDelegateKeysByValidatorAddress',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '10': 'validatorAddress'},
  ],
};

/// Descriptor for `QueryDelegateKeysByValidatorAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegateKeysByValidatorAddressDescriptor = $convert.base64Decode('CiNRdWVyeURlbGVnYXRlS2V5c0J5VmFsaWRhdG9yQWRkcmVzcxIrChF2YWxpZGF0b3JfYWRkcmVzcxgBIAEoCVIQdmFsaWRhdG9yQWRkcmVzcw==');
@$core.Deprecated('Use queryDelegateKeysByValidatorAddressResponseDescriptor instead')
const QueryDelegateKeysByValidatorAddressResponse$json = const {
  '1': 'QueryDelegateKeysByValidatorAddressResponse',
  '2': const [
    const {'1': 'eth_address', '3': 1, '4': 1, '5': 9, '10': 'ethAddress'},
    const {'1': 'orchestrator_address', '3': 2, '4': 1, '5': 9, '10': 'orchestratorAddress'},
  ],
};

/// Descriptor for `QueryDelegateKeysByValidatorAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegateKeysByValidatorAddressResponseDescriptor = $convert.base64Decode('CitRdWVyeURlbGVnYXRlS2V5c0J5VmFsaWRhdG9yQWRkcmVzc1Jlc3BvbnNlEh8KC2V0aF9hZGRyZXNzGAEgASgJUgpldGhBZGRyZXNzEjEKFG9yY2hlc3RyYXRvcl9hZGRyZXNzGAIgASgJUhNvcmNoZXN0cmF0b3JBZGRyZXNz');
@$core.Deprecated('Use queryDelegateKeysByEthAddressDescriptor instead')
const QueryDelegateKeysByEthAddress$json = const {
  '1': 'QueryDelegateKeysByEthAddress',
  '2': const [
    const {'1': 'eth_address', '3': 1, '4': 1, '5': 9, '10': 'ethAddress'},
  ],
};

/// Descriptor for `QueryDelegateKeysByEthAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegateKeysByEthAddressDescriptor = $convert.base64Decode('Ch1RdWVyeURlbGVnYXRlS2V5c0J5RXRoQWRkcmVzcxIfCgtldGhfYWRkcmVzcxgBIAEoCVIKZXRoQWRkcmVzcw==');
@$core.Deprecated('Use queryDelegateKeysByEthAddressResponseDescriptor instead')
const QueryDelegateKeysByEthAddressResponse$json = const {
  '1': 'QueryDelegateKeysByEthAddressResponse',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '10': 'validatorAddress'},
    const {'1': 'orchestrator_address', '3': 2, '4': 1, '5': 9, '10': 'orchestratorAddress'},
  ],
};

/// Descriptor for `QueryDelegateKeysByEthAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegateKeysByEthAddressResponseDescriptor = $convert.base64Decode('CiVRdWVyeURlbGVnYXRlS2V5c0J5RXRoQWRkcmVzc1Jlc3BvbnNlEisKEXZhbGlkYXRvcl9hZGRyZXNzGAEgASgJUhB2YWxpZGF0b3JBZGRyZXNzEjEKFG9yY2hlc3RyYXRvcl9hZGRyZXNzGAIgASgJUhNvcmNoZXN0cmF0b3JBZGRyZXNz');
@$core.Deprecated('Use queryDelegateKeysByOrchestratorAddressDescriptor instead')
const QueryDelegateKeysByOrchestratorAddress$json = const {
  '1': 'QueryDelegateKeysByOrchestratorAddress',
  '2': const [
    const {'1': 'orchestrator_address', '3': 1, '4': 1, '5': 9, '10': 'orchestratorAddress'},
  ],
};

/// Descriptor for `QueryDelegateKeysByOrchestratorAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegateKeysByOrchestratorAddressDescriptor = $convert.base64Decode('CiZRdWVyeURlbGVnYXRlS2V5c0J5T3JjaGVzdHJhdG9yQWRkcmVzcxIxChRvcmNoZXN0cmF0b3JfYWRkcmVzcxgBIAEoCVITb3JjaGVzdHJhdG9yQWRkcmVzcw==');
@$core.Deprecated('Use queryDelegateKeysByOrchestratorAddressResponseDescriptor instead')
const QueryDelegateKeysByOrchestratorAddressResponse$json = const {
  '1': 'QueryDelegateKeysByOrchestratorAddressResponse',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '10': 'validatorAddress'},
    const {'1': 'eth_address', '3': 2, '4': 1, '5': 9, '10': 'ethAddress'},
  ],
};

/// Descriptor for `QueryDelegateKeysByOrchestratorAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegateKeysByOrchestratorAddressResponseDescriptor = $convert.base64Decode('Ci5RdWVyeURlbGVnYXRlS2V5c0J5T3JjaGVzdHJhdG9yQWRkcmVzc1Jlc3BvbnNlEisKEXZhbGlkYXRvcl9hZGRyZXNzGAEgASgJUhB2YWxpZGF0b3JBZGRyZXNzEh8KC2V0aF9hZGRyZXNzGAIgASgJUgpldGhBZGRyZXNz');
@$core.Deprecated('Use queryPendingSendToEthDescriptor instead')
const QueryPendingSendToEth$json = const {
  '1': 'QueryPendingSendToEth',
  '2': const [
    const {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
  ],
};

/// Descriptor for `QueryPendingSendToEth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPendingSendToEthDescriptor = $convert.base64Decode('ChVRdWVyeVBlbmRpbmdTZW5kVG9FdGgSJQoOc2VuZGVyX2FkZHJlc3MYASABKAlSDXNlbmRlckFkZHJlc3M=');
@$core.Deprecated('Use queryPendingSendToEthResponseDescriptor instead')
const QueryPendingSendToEthResponse$json = const {
  '1': 'QueryPendingSendToEthResponse',
  '2': const [
    const {'1': 'transfers_in_batches', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTransferTx', '8': const {}, '10': 'transfersInBatches'},
    const {'1': 'unbatched_transfers', '3': 2, '4': 3, '5': 11, '6': '.gravity.v1.OutgoingTransferTx', '8': const {}, '10': 'unbatchedTransfers'},
  ],
};

/// Descriptor for `QueryPendingSendToEthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPendingSendToEthResponseDescriptor = $convert.base64Decode('Ch1RdWVyeVBlbmRpbmdTZW5kVG9FdGhSZXNwb25zZRJWChR0cmFuc2ZlcnNfaW5fYmF0Y2hlcxgBIAMoCzIeLmdyYXZpdHkudjEuT3V0Z29pbmdUcmFuc2ZlclR4QgTI3h8AUhJ0cmFuc2ZlcnNJbkJhdGNoZXMSVQoTdW5iYXRjaGVkX3RyYW5zZmVycxgCIAMoCzIeLmdyYXZpdHkudjEuT3V0Z29pbmdUcmFuc2ZlclR4QgTI3h8AUhJ1bmJhdGNoZWRUcmFuc2ZlcnM=');
@$core.Deprecated('Use queryPendingIbcAutoForwardsDescriptor instead')
const QueryPendingIbcAutoForwards$json = const {
  '1': 'QueryPendingIbcAutoForwards',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 4, '10': 'limit'},
  ],
};

/// Descriptor for `QueryPendingIbcAutoForwards`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPendingIbcAutoForwardsDescriptor = $convert.base64Decode('ChtRdWVyeVBlbmRpbmdJYmNBdXRvRm9yd2FyZHMSFAoFbGltaXQYASABKARSBWxpbWl0');
@$core.Deprecated('Use queryPendingIbcAutoForwardsResponseDescriptor instead')
const QueryPendingIbcAutoForwardsResponse$json = const {
  '1': 'QueryPendingIbcAutoForwardsResponse',
  '2': const [
    const {'1': 'pending_ibc_auto_forwards', '3': 1, '4': 3, '5': 11, '6': '.gravity.v1.PendingIbcAutoForward', '10': 'pendingIbcAutoForwards'},
  ],
};

/// Descriptor for `QueryPendingIbcAutoForwardsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPendingIbcAutoForwardsResponseDescriptor = $convert.base64Decode('CiNRdWVyeVBlbmRpbmdJYmNBdXRvRm9yd2FyZHNSZXNwb25zZRJcChlwZW5kaW5nX2liY19hdXRvX2ZvcndhcmRzGAEgAygLMiEuZ3Jhdml0eS52MS5QZW5kaW5nSWJjQXV0b0ZvcndhcmRSFnBlbmRpbmdJYmNBdXRvRm9yd2FyZHM=');
