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
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/keplr_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_select_type.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

class ContentCard extends ConsumerWidget {
  const ContentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferType =
        ref.watch(gravityBridgeProvider.select((state) => state.transferType));

    final Widget container = (transferType == TransferType.eth2fwd)
        ? const MetamaskContainerWidget()
        : const KeplrContainerWidget();

    dlog("+++ Switched Container to "
        "${container is MetamaskContainerWidget ? "METAMASK" : "KEPLR"}"
        "-Container");

    return Column(
      children: [
        const GravityBridgeSelectType(),
        const SizedBox(height: Sizes.paddingSmall + Sizes.paddingMicro),
        container,
      ],
    );
  }
}
