// /*
//     Gravity Bridge is a UI for interacting with the gravity chain.
//     Copyright (C) 2023  blockscape Finance AG, Switzerland
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
// */

import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/batch.pb.dart';

final batchesProvider =
    ChangeNotifierProvider<BatchesService>((ref) => BatchesService());

class BatchesService extends ChangeNotifier {
  final List<String> _contractAddresses = [];
  List<String> get contractAddresses => _contractAddresses;
  List<Batch> generateBatchesListFromOutgoingTxBatches(
      List<OutgoingTxBatch> outgoingTxBatches) {
    List<Batch> batches = [];
    for (var i = 0; i < outgoingTxBatches.length; i++) {
      for (var j = 0; j < outgoingTxBatches[i].transactions.length; j++) {
        batches.add(
          Batch(
            tokenContractAddress: outgoingTxBatches[i].tokenContract,
            amount: outgoingTxBatches[i].transactions[j].erc20Token.amount,
            batchTimeoutBlockHeight: outgoingTxBatches[i].batchTimeout,
            sender: outgoingTxBatches[i].transactions[j].sender,
            destAddress: outgoingTxBatches[i].transactions[j].destAddress,
            nonce: outgoingTxBatches[i].batchNonce.toInt(),
            block: outgoingTxBatches[i].cosmosBlockCreated.toInt(),
            fee: outgoingTxBatches[i].transactions[j].erc20Fee.amount,
          ),
        );
      }
      _contractAddresses.add(outgoingTxBatches[i].tokenContract);
    }

    /// [TESTING]
    // batches.add(
    //   Batch(
    //     tokenContractAddress: "0xdaf0b40b961CA51Fc914fbabdA8E779619576caD",
    //     amount: "68650",
    //     batchTimeoutBlockHeight: Int64(16117803),
    //     sender: "gravity1dt88064nyvqljvfe42udpjxcr0e4q7q73affk7",
    //     destAddress: "0xe9c0aac9074afd0cbf1bb35c285aca14d6977d39",
    //     nonce: 1234,
    //     block: 4846387,
    //     fee: "10000",
    //   ),
    // );
    batches = batches.sorted((a, b) =>
        a.batchTimeoutBlockHeight.compareTo(b.batchTimeoutBlockHeight));
    return batches;
  }
}

class Batch {
  String tokenContractAddress;

  /// amount in int string format
  String amount;

  /// batch timeout
  Int64 batchTimeoutBlockHeight;
  String sender;
  String destAddress;

  /// batch nonce
  int nonce;
  int block;

  /// fee in int string format
  String fee;

  Batch({
    required this.tokenContractAddress,
    required this.amount,
    required this.batchTimeoutBlockHeight,
    required this.sender,
    required this.destAddress,
    required this.nonce,
    required this.block,
    required this.fee,
  });
}
