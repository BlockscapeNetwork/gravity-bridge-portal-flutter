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

import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class BIP32Path {
  Node purpose;
  Node coinType;
  Node account;
  Node change;
  Node addressIndex;

  BIP32Path(this.purpose, this.coinType, this.account, this.change,
      this.addressIndex) {}

  /// Expects an address format of "m/44'/118'/0'/0/0".
  /// Ledger currently only supports paths that start with "m/44'/118'" (https://github.com/confio/cosmos-hd-key-derivation-spec#the-cosmos-ledger-app)
  factory BIP32Path.fromString(String path) {
    final nodes = path.split("/");
    if (nodes.length != 6) {
      throw const FormatException("invalid number of nodes in HD path");
    }

    return BIP32Path(
        Node.fromString(nodes[1]),
        Node.fromString(nodes[2]),
        Node.fromString(nodes[3]),
        Node.fromString(nodes[4]),
        Node.fromString(nodes[5]));
  }

  factory BIP32Path.cosmosHub() {
    return BIP32Path(Node.fromString("44'"), Node.fromString("118'"),
        Node.fromString("0'"), Node.fromString("0"), Node.fromString("0"));
  }

  /// Returns the bip path in binary format.
  Uint8List serialize() {
    final buf = WriteBuffer();
    List<Node> nodes = [purpose, coinType, account, change, addressIndex];
    for (var n in nodes) {
      buf.putUint32((n.hardened ? (0x80000000 | n.value) : n.value),
          endian: Endian.little);
    }
    final data = buf.done();
    return data.buffer.asUint8List(0, data.lengthInBytes);
  }

  @override
  String toString() {
    return "m/$purpose/$coinType/$account/$change/$addressIndex";
  }
}

class Node {
  int value;
  bool hardened;

  Node(this.value, this.hardened);

  factory Node.fromString(String node) {
    var hardened = false;
    if (node.endsWith("'")) {
      hardened = true;
      node = node.substring(0, node.length - 1);
    }

    final value = int.parse(node);

    return Node(value, hardened);
  }

  @override
  String toString() {
    return value.toRadixString(10) + (hardened ? "'" : "");
  }
}
