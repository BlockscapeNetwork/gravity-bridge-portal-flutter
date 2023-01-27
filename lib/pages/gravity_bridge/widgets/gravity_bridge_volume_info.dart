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

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_widget_error_widget.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:intl/intl.dart';

class GravityBridgeVolumeInfo extends ConsumerStatefulWidget {
  const GravityBridgeVolumeInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GravityBridgeVolumeInfoState();
}

class _GravityBridgeVolumeInfoState
    extends ConsumerState<GravityBridgeVolumeInfo> {
  @override
  Widget build(BuildContext context) {
    return GravityBridgeWidget(
      title: Text(
        S.current.GRAVITY_VOLUME_INFO,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Sizes.fontSize16,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      isVisible: ref.watch(
          gravityBridgeProvider.select((s) => s.isVolumeInfoWidgetVisible)),
      onVisibleChanged: ((val) {
        ref
            .read(gravityBridgeProvider.notifier)
            .setVolumeInfoWidgetVisibility(val);
      }),
      hasVisibleSwitch: true,
      child: FutureBuilder(
        future: GravityService().getGravityChainVolumeInfo(),
        builder: (BuildContext context, AsyncSnapshot<VolumeInfo?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return Column(
                children: [
                  _volumeInfoRow(
                    context,
                    S.current.GRAVITY_VOLUME_INFO_DAILY_VOLUME,
                    snapshot.data!.dailyVolume,
                  ),
                  _volumeInfoRow(
                    context,
                    S.current.GRAVITY_VOLUME_INFO_DAILY_INFLOW,
                    snapshot.data!.dailyInflow,
                  ),
                  _volumeInfoRow(
                    context,
                    S.current.GRAVITY_VOLUME_INFO_DAILY_OUTFLOW,
                    snapshot.data!.dailyOutflow,
                  ),
                  _volumeInfoRow(
                    context,
                    S.current.GRAVITY_VOLUME_INFO_WEEKLY_VOLUME,
                    snapshot.data!.weeklyVolume,
                  ),
                  _volumeInfoRow(
                    context,
                    S.current.GRAVITY_VOLUME_INFO_WEEKLY_INFLOW,
                    snapshot.data!.weeklyInflow,
                  ),
                  _volumeInfoRow(
                    context,
                    S.current.GRAVITY_VOLUME_INFO_WEEKLY_OUTFLOW,
                    snapshot.data!.weeklyOutflow,
                  ),
                ],
              );
            } else {
              return GravityBridgeErrorWidget(
                onButtonPress: () => setState(() {}),
              );
            }
          } else {
            return Text(
              S.current.GRAVITY_VOLUME_INFO_FETCHING,
              style: TextStyle(
                fontSize: Sizes.fontSizeSmall,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          }
        },
      ),
    );
  }
}

Widget _volumeInfoRow(BuildContext context, String text, String volumeInfo) {
  String volumeInfoFormatted = "-";
  try {
    volumeInfoFormatted = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: "\$",
      locale: ui.window.locale.toString(),
    ).format(double.parse(volumeInfo));
  } catch (_) {}

  return Row(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: Sizes.fontSizeSmall,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      Expanded(child: Container()),
      Text(
        volumeInfoFormatted,
        style: TextStyle(
          fontSize: Sizes.fontSizeSmall,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    ],
  );
}
