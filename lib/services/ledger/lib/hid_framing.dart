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

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

const int _packageSize = 64;
const int _tag = 0x05;

final _channel = Random().nextInt(0xffff);

/// Takes data and converts it to blocks that can be sent via HidDevice's sendReport function
/// Adapted from https://github.com/LedgerHQ/ledger-live/blob/b14aaa8366c6b271050d94ad6dd79368711b446c/libs/ledgerjs/packages/devices/src/hid-framing.ts#L51
List<Uint8List> createBlocks(Uint8List payload) {
  final dataBuffer = WriteBuffer();
  dataBuffer.putUint16(payload.length, endian: Endian.big);
  dataBuffer.putUint8List(payload);
  final totalDataSize = payload.length + 2;

  const blockSize = _packageSize - 5;
  final numberOfBlocks = (totalDataSize / blockSize).ceil();

  final numberOfPaddingBytes = numberOfBlocks * blockSize - totalDataSize + 1;

  for (var i = 0; i < numberOfPaddingBytes; i++) {
    dataBuffer.putUint8(0);
  }

  final data = dataBuffer.done();
  final dataList = data.buffer.asUint8List(0, data.lengthInBytes);

  final List<Uint8List> blocks = [];
  for (var i = 0; i < numberOfBlocks; i++) {
    final blockBuffer = WriteBuffer();
    blockBuffer.putUint16(_channel, endian: Endian.big);
    blockBuffer.putUint8(_tag);
    blockBuffer.putUint16(i, endian: Endian.big);
    blockBuffer
        .putUint8List(dataList.sublist(i * blockSize, (i + 1) * blockSize));
    final blockData = blockBuffer.done();

    blocks.add(blockData.buffer.asUint8List(0, blockData.lengthInBytes));
  }
  return blocks;
}

class HidResponse {
  int channel;
  int tag;
  int sequence;
  int length;
  Uint8List data;
  bool completed;

  HidResponse._(this.channel, this.tag, this.sequence, this.length, this.data,
      this.completed);

  factory HidResponse(HidResponsePart part) {
    bool completed;
    Uint8List data;

    if (part.length > part.data.length) {
      completed = false;
      data = part.data;
    } else {
      completed = true;
      data = part.data.sublist(0, part.length);
    }

    if (part.sequence != 0) {
      throw Exception(
          "HidResponse must be initialized with the first HidResponsePart (sequence = 0)");
    }

    return HidResponse._(
        part.channel, part.tag, part.sequence, part.length, data, completed);
  }

  void addPart(HidResponsePart part) {
    final expectedSequence = sequence + 1;
    if (part.sequence != expectedSequence) {
      throw Exception(
          "Can't add part to HidResponse. Expected sequence '$expectedSequence' but got '${part.sequence}'.");
    }

    if (channel != part.channel || tag != part.tag) {
      throw Exception(
          "Can't add part to HidResponse. Expected channel '$channel' and tag '$tag' but got channel '${part.channel}' and tag '${part.tag}'.");
    }

    if (completed) {
      throw Exception(
          "Can't add part to HidResponse. HidResponse is already completed.");
    }

    // concat data
    final bb = BytesBuilder();
    bb.add(data);
    bb.add(part.data);
    data = bb.toBytes();

    // remove padding bytes if necessary
    if (length <= data.length) {
      completed = true;
      data = data.sublist(0, length);
    }
  }

  @override
  String toString() {
    String dataString = "";
    for (var i = 0; i < data.length; i++) {
      if (i != 0) {
        dataString += ", ";
      }
      dataString += data[i].toRadixString(16);
    }

    return "{channel = $channel; tag = $tag; sequence = $sequence; length = $length; completed = $completed; data = [$dataString]}";
  }
}

class HidResponsePart {
  int channel;
  int tag;
  int sequence;
  int length;
  Uint8List data;

  HidResponsePart._(
      this.channel, this.tag, this.sequence, this.length, this.data);

  factory HidResponsePart(ByteData bytes) {
    final channel = bytes.getUint16(0);
    final tag = bytes.getUint8(2);
    final sequence = bytes.getUint16(3);
    int length;
    Uint8List dataBytes;
    if (sequence == 0) {
      length = bytes.getUint16(5);
      dataBytes = bytes.buffer.asUint8List(7);
    } else {
      length = 0;
      dataBytes = bytes.buffer.asUint8List(5);
    }

    return HidResponsePart._(channel, tag, sequence, length, dataBytes);
  }
}

void parseResponse(ByteData data) {}
