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

import 'dart:convert';
import 'dart:typed_data';

import 'package:alan/alan.dart';
import 'package:pointycastle/export.dart';

String decodeDERSignature(Uint8List sig) {
  if (sig.length < 8) throw InvalidSignatureException();
  if (sig.length > 72) throw InvalidSignatureException();
  if (sig[0] != 0x30) throw InvalidSignatureException();
  if (sig[1] != sig.length - 2) throw InvalidSignatureException();
  if (sig[2] != 0x02) throw InvalidSignatureException();

  final lenR = sig[3];
  if (lenR == 0) throw InvalidSignatureException();
  if (5 + lenR >= sig.length) throw InvalidSignatureException();
  if (sig[4 + lenR] != 0x02) throw InvalidSignatureException();

  final lenS = sig[5 + lenR];
  if (lenS == 0) throw InvalidSignatureException();
  if ((6 + lenR + lenS) != sig.length) throw InvalidSignatureException();

  if ((sig[4] & 0x80) != 0) throw InvalidSignatureException();
  if (lenR > 1 && (sig[4] == 0x00) && (sig[5] & 0x80) == 0) {
    throw InvalidSignatureException();
  }

  if ((sig[lenR + 6] & 0x80) != 0) throw InvalidSignatureException();
  if (lenS > 1 && (sig[lenR + 6] == 0x00) && (sig[lenR + 7] & 0x80) == 0) {
    throw InvalidSignatureException();
  }

  var sigR = sig.sublist(4, 4 + lenR);
  if (sigR.length == 33 && sigR[0] == 0x00) sigR = sigR.sublist(1);
  if (sigR.length > 32) throw InvalidSignatureException();

  var sigS = sig.sublist(6 + lenR);
  if (sigS.length == 33 && sigS[0] == 0x00) sigS = sigS.sublist(1);
  if (sigS.length > 32) {
    throw InvalidSignatureException();
  } // new Error('S length is too long')

  final r = sigR.toBigInt();
  // sigR.buffer.asByteData().getUint32(0); // new BN(sigR)
  // if (r.cmp(ecparams.n) >= 0) r = new BN(0)

  final s = sigS.toBigInt(); //new BN(sigS);
  // if (s.cmp(ecparams.n) >= 0) s = new BN(0)

  //  output.set(r.toArrayLike(Uint8Array, 'be', 32), 0)
  // output.set(s.toArrayLike(Uint8Array, 'be', 32), 32)
  ;

  final ecSignature = ECSignature(r, s);
  return base64Encode(normalizeSignature(ecSignature));
}

Uint8List normalizeSignature(ECSignature ecSignature) {
  final normalized = _normalizeECSignature(ecSignature, ECCurve_secp256k1());
  final rBytes = normalized.r.toUin8List();
  final sBytes = normalized.s.toUin8List();

  var sigBytes = Uint8List(64);
  copy(rBytes, 32 - rBytes.length, 32, sigBytes);
  copy(sBytes, 64 - sBytes.length, 64, sigBytes);
  return sigBytes;
}

/// Normalizes the given [signature] using the provided [curveParams].
/// This is used to create signatures that are always in the lower-S form, to
/// make sure that they cannot be tamped with the alternative S value.
/// More info can be found here: https://tinyurl.com/2yfurry7
///
/// This is taken directly from alan: https://github.com/alan-sdk/alan.dart/blob/94842aec95ec1c4a840863e58ec85d6b32cb1811/lib/wallet/wallet.dart
ECSignature _normalizeECSignature(
  ECSignature signature,
  ECDomainParameters curveParams,
) {
  var normalizedS = signature.s;
  if (normalizedS.compareTo(curveParams.n >> 1) > 0) {
    normalizedS = curveParams.n - normalizedS;
  }
  return ECSignature(signature.r, normalizedS);
}

class InvalidSignatureException implements Exception {}

class LedgerException implements Exception {
  final String message;
  LedgerException(this.message);

  @override
  String toString() => "Ledger Error: $message";
}
