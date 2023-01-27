///
//  Generated code. Do not modify.
//  source: ibc/applications/transfer/v1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $6;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$transfer =
      $grpc.ClientMethod<$6.MsgTransfer, $6.MsgTransferResponse>(
          '/ibc.applications.transfer.v1.Msg/Transfer',
          ($6.MsgTransfer value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $6.MsgTransferResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$6.MsgTransferResponse> transfer($6.MsgTransfer request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$transfer, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'ibc.applications.transfer.v1.Msg';

  MsgServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.MsgTransfer, $6.MsgTransferResponse>(
        'Transfer',
        transfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.MsgTransfer.fromBuffer(value),
        ($6.MsgTransferResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.MsgTransferResponse> transfer_Pre(
      $grpc.ServiceCall call, $async.Future<$6.MsgTransfer> request) async {
    return transfer(call, await request);
  }

  $async.Future<$6.MsgTransferResponse> transfer(
      $grpc.ServiceCall call, $6.MsgTransfer request);
}
