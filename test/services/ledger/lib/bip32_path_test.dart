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
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/bip32_path.dart';

main() {
  group("Testing BIP32 path utils", () {
    test("Parsing string path", () {
      const examplePath = "m/1'/2'/3/4/5'";
      final p = BIP32Path.fromString(examplePath);
      expect(p.toString(), equals(examplePath));
    });

    test("Parsing invalid string path", () {
      const examplePath = "m/1'/2'/3/4'";
      expect(() => BIP32Path.fromString(examplePath), throwsFormatException);
    });

    test("Serializing path", () {
      // 0b10000000000000000000000000000000  hardened byte
      // 0b00000000000000000000000000101100  44
      // 0b10000000000000000000000000101100  44'
      const examplePath = "m/44'/44'/44/44'/44'";
      final hFourtyFour =
          int.parse("10000000000000000000000000101100", radix: 2);
      final fourtyFour = int.parse("101100", radix: 2);
      final buf = WriteBuffer();
      buf.putUint32(hFourtyFour);
      buf.putUint32(hFourtyFour);
      buf.putUint32(fourtyFour);
      buf.putUint32(hFourtyFour);
      buf.putUint32(hFourtyFour);
      final data = buf.done();

      final expectedBinary = data.buffer.asUint8List(0, data.lengthInBytes);

      final serialized = BIP32Path.fromString(examplePath).serialize();
      expect(compareUint8Lists(expectedBinary, serialized), equals(true));
    });
  });
}

bool compareUint8Lists(Uint8List a, Uint8List b) {
  if (a.length != b.length) {
    return false;
  }

  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
}
