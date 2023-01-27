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
import 'package:gravity_bridge_flutter/models/enums/severity.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:tuple/tuple.dart';

/// Widget that shows validator messages for a chain card (either warnings or errors)
class ChainAlertText extends ConsumerWidget {
  const ChainAlertText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keplrCardValidation = ref.watch(
        gravityBridgeProvider.select((value) => value.keplrCardValidation));
    final metamaskCardValidation = ref.watch(
        gravityBridgeProvider.select((value) => value.metamaskCardValidation));
    final isMetamaskCardFirst = ref.watch(
        gravityBridgeProvider.select((value) => value.isMetamaskCardFirst));

    Tuple2<Severity, String>? validation;
    if (isMetamaskCardFirst) {
      validation = metamaskCardValidation;
      validation ??= keplrCardValidation;
    } else {
      validation = keplrCardValidation;
      validation ??= metamaskCardValidation;
    }

    if (validation == null) {
      return const SizedBox.shrink();
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 30),
        child: Text(
          validation.item2,
          style: TextStyle(
            fontSize: Sizes.fontSizeXSmall,
            color: validation.item1 == Severity.error
                ? Theme.of(context).colorScheme.onError
                : validation.item1 == Severity.warning
                    ? Theme.of(context).colorScheme.error
                    : Colors.transparent,
          ),
        ),
      );
    }
  }
}
