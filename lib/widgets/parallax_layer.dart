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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mouseDeltaProvider = StateProvider<Offset>((ref) => Offset.zero);

class ParallaxLayer extends ConsumerWidget {
  const ParallaxLayer(
      {Key? key, required this.child, this.factor = 1, this.opacity = 1})
      : super(key: key);

  final Widget child;
  final double factor;
  final double opacity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalWidth = MediaQuery.of(context).size.width;
    final globalHeight = MediaQuery.of(context).size.height;
    const kFactor = 0.02;

    return Positioned(
      left: ref.watch(mouseDeltaProvider).dx * kFactor * factor,
      top: (globalHeight - ref.watch(mouseDeltaProvider).dy) *
          kFactor *
          factor *
          0.6,
      child: Opacity(
        opacity: opacity,
        child: SizedBox(
          width: globalWidth,
          height: globalHeight,
          child: child,
        ),
      ),
    );
  }
}
