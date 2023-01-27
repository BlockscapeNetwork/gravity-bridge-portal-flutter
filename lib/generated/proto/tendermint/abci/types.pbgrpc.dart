///
//  Generated code. Do not modify.
//  source: tendermint/abci/types.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'types.pb.dart' as $2;
export 'types.pb.dart';

class ABCIApplicationClient extends $grpc.Client {
  static final _$echo = $grpc.ClientMethod<$2.RequestEcho, $2.ResponseEcho>(
      '/tendermint.abci.ABCIApplication/Echo',
      ($2.RequestEcho value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ResponseEcho.fromBuffer(value));
  static final _$flush = $grpc.ClientMethod<$2.RequestFlush, $2.ResponseFlush>(
      '/tendermint.abci.ABCIApplication/Flush',
      ($2.RequestFlush value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ResponseFlush.fromBuffer(value));
  static final _$info = $grpc.ClientMethod<$2.RequestInfo, $2.ResponseInfo>(
      '/tendermint.abci.ABCIApplication/Info',
      ($2.RequestInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ResponseInfo.fromBuffer(value));
  static final _$setOption =
      $grpc.ClientMethod<$2.RequestSetOption, $2.ResponseSetOption>(
          '/tendermint.abci.ABCIApplication/SetOption',
          ($2.RequestSetOption value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseSetOption.fromBuffer(value));
  static final _$deliverTx =
      $grpc.ClientMethod<$2.RequestDeliverTx, $2.ResponseDeliverTx>(
          '/tendermint.abci.ABCIApplication/DeliverTx',
          ($2.RequestDeliverTx value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseDeliverTx.fromBuffer(value));
  static final _$checkTx =
      $grpc.ClientMethod<$2.RequestCheckTx, $2.ResponseCheckTx>(
          '/tendermint.abci.ABCIApplication/CheckTx',
          ($2.RequestCheckTx value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseCheckTx.fromBuffer(value));
  static final _$query = $grpc.ClientMethod<$2.RequestQuery, $2.ResponseQuery>(
      '/tendermint.abci.ABCIApplication/Query',
      ($2.RequestQuery value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ResponseQuery.fromBuffer(value));
  static final _$commit =
      $grpc.ClientMethod<$2.RequestCommit, $2.ResponseCommit>(
          '/tendermint.abci.ABCIApplication/Commit',
          ($2.RequestCommit value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.ResponseCommit.fromBuffer(value));
  static final _$initChain =
      $grpc.ClientMethod<$2.RequestInitChain, $2.ResponseInitChain>(
          '/tendermint.abci.ABCIApplication/InitChain',
          ($2.RequestInitChain value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseInitChain.fromBuffer(value));
  static final _$beginBlock =
      $grpc.ClientMethod<$2.RequestBeginBlock, $2.ResponseBeginBlock>(
          '/tendermint.abci.ABCIApplication/BeginBlock',
          ($2.RequestBeginBlock value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseBeginBlock.fromBuffer(value));
  static final _$endBlock =
      $grpc.ClientMethod<$2.RequestEndBlock, $2.ResponseEndBlock>(
          '/tendermint.abci.ABCIApplication/EndBlock',
          ($2.RequestEndBlock value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseEndBlock.fromBuffer(value));
  static final _$listSnapshots =
      $grpc.ClientMethod<$2.RequestListSnapshots, $2.ResponseListSnapshots>(
          '/tendermint.abci.ABCIApplication/ListSnapshots',
          ($2.RequestListSnapshots value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseListSnapshots.fromBuffer(value));
  static final _$offerSnapshot =
      $grpc.ClientMethod<$2.RequestOfferSnapshot, $2.ResponseOfferSnapshot>(
          '/tendermint.abci.ABCIApplication/OfferSnapshot',
          ($2.RequestOfferSnapshot value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ResponseOfferSnapshot.fromBuffer(value));
  static final _$loadSnapshotChunk = $grpc.ClientMethod<
          $2.RequestLoadSnapshotChunk, $2.ResponseLoadSnapshotChunk>(
      '/tendermint.abci.ABCIApplication/LoadSnapshotChunk',
      ($2.RequestLoadSnapshotChunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.ResponseLoadSnapshotChunk.fromBuffer(value));
  static final _$applySnapshotChunk = $grpc.ClientMethod<
          $2.RequestApplySnapshotChunk, $2.ResponseApplySnapshotChunk>(
      '/tendermint.abci.ABCIApplication/ApplySnapshotChunk',
      ($2.RequestApplySnapshotChunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.ResponseApplySnapshotChunk.fromBuffer(value));

  ABCIApplicationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.ResponseEcho> echo($2.RequestEcho request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$echo, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseFlush> flush($2.RequestFlush request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$flush, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseInfo> info($2.RequestInfo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$info, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseSetOption> setOption(
      $2.RequestSetOption request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setOption, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseDeliverTx> deliverTx(
      $2.RequestDeliverTx request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deliverTx, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseCheckTx> checkTx($2.RequestCheckTx request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkTx, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseQuery> query($2.RequestQuery request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$query, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseCommit> commit($2.RequestCommit request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$commit, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseInitChain> initChain(
      $2.RequestInitChain request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initChain, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseBeginBlock> beginBlock(
      $2.RequestBeginBlock request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$beginBlock, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseEndBlock> endBlock($2.RequestEndBlock request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endBlock, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseListSnapshots> listSnapshots(
      $2.RequestListSnapshots request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listSnapshots, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseOfferSnapshot> offerSnapshot(
      $2.RequestOfferSnapshot request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$offerSnapshot, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseLoadSnapshotChunk> loadSnapshotChunk(
      $2.RequestLoadSnapshotChunk request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loadSnapshotChunk, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResponseApplySnapshotChunk> applySnapshotChunk(
      $2.RequestApplySnapshotChunk request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$applySnapshotChunk, request, options: options);
  }
}

abstract class ABCIApplicationServiceBase extends $grpc.Service {
  $core.String get $name => 'tendermint.abci.ABCIApplication';

  ABCIApplicationServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.RequestEcho, $2.ResponseEcho>(
        'Echo',
        echo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestEcho.fromBuffer(value),
        ($2.ResponseEcho value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestFlush, $2.ResponseFlush>(
        'Flush',
        flush_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestFlush.fromBuffer(value),
        ($2.ResponseFlush value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestInfo, $2.ResponseInfo>(
        'Info',
        info_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestInfo.fromBuffer(value),
        ($2.ResponseInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestSetOption, $2.ResponseSetOption>(
        'SetOption',
        setOption_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestSetOption.fromBuffer(value),
        ($2.ResponseSetOption value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestDeliverTx, $2.ResponseDeliverTx>(
        'DeliverTx',
        deliverTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestDeliverTx.fromBuffer(value),
        ($2.ResponseDeliverTx value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestCheckTx, $2.ResponseCheckTx>(
        'CheckTx',
        checkTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestCheckTx.fromBuffer(value),
        ($2.ResponseCheckTx value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestQuery, $2.ResponseQuery>(
        'Query',
        query_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestQuery.fromBuffer(value),
        ($2.ResponseQuery value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestCommit, $2.ResponseCommit>(
        'Commit',
        commit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestCommit.fromBuffer(value),
        ($2.ResponseCommit value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestInitChain, $2.ResponseInitChain>(
        'InitChain',
        initChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestInitChain.fromBuffer(value),
        ($2.ResponseInitChain value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestBeginBlock, $2.ResponseBeginBlock>(
        'BeginBlock',
        beginBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestBeginBlock.fromBuffer(value),
        ($2.ResponseBeginBlock value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestEndBlock, $2.ResponseEndBlock>(
        'EndBlock',
        endBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RequestEndBlock.fromBuffer(value),
        ($2.ResponseEndBlock value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.RequestListSnapshots, $2.ResponseListSnapshots>(
            'ListSnapshots',
            listSnapshots_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.RequestListSnapshots.fromBuffer(value),
            ($2.ResponseListSnapshots value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.RequestOfferSnapshot, $2.ResponseOfferSnapshot>(
            'OfferSnapshot',
            offerSnapshot_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.RequestOfferSnapshot.fromBuffer(value),
            ($2.ResponseOfferSnapshot value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestLoadSnapshotChunk,
            $2.ResponseLoadSnapshotChunk>(
        'LoadSnapshotChunk',
        loadSnapshotChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.RequestLoadSnapshotChunk.fromBuffer(value),
        ($2.ResponseLoadSnapshotChunk value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RequestApplySnapshotChunk,
            $2.ResponseApplySnapshotChunk>(
        'ApplySnapshotChunk',
        applySnapshotChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.RequestApplySnapshotChunk.fromBuffer(value),
        ($2.ResponseApplySnapshotChunk value) => value.writeToBuffer()));
  }

  $async.Future<$2.ResponseEcho> echo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestEcho> request) async {
    return echo(call, await request);
  }

  $async.Future<$2.ResponseFlush> flush_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestFlush> request) async {
    return flush(call, await request);
  }

  $async.Future<$2.ResponseInfo> info_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestInfo> request) async {
    return info(call, await request);
  }

  $async.Future<$2.ResponseSetOption> setOption_Pre($grpc.ServiceCall call,
      $async.Future<$2.RequestSetOption> request) async {
    return setOption(call, await request);
  }

  $async.Future<$2.ResponseDeliverTx> deliverTx_Pre($grpc.ServiceCall call,
      $async.Future<$2.RequestDeliverTx> request) async {
    return deliverTx(call, await request);
  }

  $async.Future<$2.ResponseCheckTx> checkTx_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestCheckTx> request) async {
    return checkTx(call, await request);
  }

  $async.Future<$2.ResponseQuery> query_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestQuery> request) async {
    return query(call, await request);
  }

  $async.Future<$2.ResponseCommit> commit_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestCommit> request) async {
    return commit(call, await request);
  }

  $async.Future<$2.ResponseInitChain> initChain_Pre($grpc.ServiceCall call,
      $async.Future<$2.RequestInitChain> request) async {
    return initChain(call, await request);
  }

  $async.Future<$2.ResponseBeginBlock> beginBlock_Pre($grpc.ServiceCall call,
      $async.Future<$2.RequestBeginBlock> request) async {
    return beginBlock(call, await request);
  }

  $async.Future<$2.ResponseEndBlock> endBlock_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RequestEndBlock> request) async {
    return endBlock(call, await request);
  }

  $async.Future<$2.ResponseListSnapshots> listSnapshots_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.RequestListSnapshots> request) async {
    return listSnapshots(call, await request);
  }

  $async.Future<$2.ResponseOfferSnapshot> offerSnapshot_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.RequestOfferSnapshot> request) async {
    return offerSnapshot(call, await request);
  }

  $async.Future<$2.ResponseLoadSnapshotChunk> loadSnapshotChunk_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.RequestLoadSnapshotChunk> request) async {
    return loadSnapshotChunk(call, await request);
  }

  $async.Future<$2.ResponseApplySnapshotChunk> applySnapshotChunk_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.RequestApplySnapshotChunk> request) async {
    return applySnapshotChunk(call, await request);
  }

  $async.Future<$2.ResponseEcho> echo(
      $grpc.ServiceCall call, $2.RequestEcho request);
  $async.Future<$2.ResponseFlush> flush(
      $grpc.ServiceCall call, $2.RequestFlush request);
  $async.Future<$2.ResponseInfo> info(
      $grpc.ServiceCall call, $2.RequestInfo request);
  $async.Future<$2.ResponseSetOption> setOption(
      $grpc.ServiceCall call, $2.RequestSetOption request);
  $async.Future<$2.ResponseDeliverTx> deliverTx(
      $grpc.ServiceCall call, $2.RequestDeliverTx request);
  $async.Future<$2.ResponseCheckTx> checkTx(
      $grpc.ServiceCall call, $2.RequestCheckTx request);
  $async.Future<$2.ResponseQuery> query(
      $grpc.ServiceCall call, $2.RequestQuery request);
  $async.Future<$2.ResponseCommit> commit(
      $grpc.ServiceCall call, $2.RequestCommit request);
  $async.Future<$2.ResponseInitChain> initChain(
      $grpc.ServiceCall call, $2.RequestInitChain request);
  $async.Future<$2.ResponseBeginBlock> beginBlock(
      $grpc.ServiceCall call, $2.RequestBeginBlock request);
  $async.Future<$2.ResponseEndBlock> endBlock(
      $grpc.ServiceCall call, $2.RequestEndBlock request);
  $async.Future<$2.ResponseListSnapshots> listSnapshots(
      $grpc.ServiceCall call, $2.RequestListSnapshots request);
  $async.Future<$2.ResponseOfferSnapshot> offerSnapshot(
      $grpc.ServiceCall call, $2.RequestOfferSnapshot request);
  $async.Future<$2.ResponseLoadSnapshotChunk> loadSnapshotChunk(
      $grpc.ServiceCall call, $2.RequestLoadSnapshotChunk request);
  $async.Future<$2.ResponseApplySnapshotChunk> applySnapshotChunk(
      $grpc.ServiceCall call, $2.RequestApplySnapshotChunk request);
}
