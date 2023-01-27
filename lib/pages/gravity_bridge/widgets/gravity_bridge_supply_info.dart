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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_widget.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_widget_error_widget.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:intl/intl.dart';

class GravityBridgeSupplyInfo extends ConsumerStatefulWidget {
  const GravityBridgeSupplyInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GravityBridgeSupplyInfoState();
}

class _GravityBridgeSupplyInfoState
    extends ConsumerState<GravityBridgeSupplyInfo> {
  @override
  Widget build(BuildContext context) {
    return GravityBridgeWidget(
      title: Text(
        S.current.GRAVITY_SUPPLY_INFO,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Sizes.fontSize16,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      isVisible: ref.watch(
          gravityBridgeProvider.select((s) => s.isSupplyInfoWidgetVisible)),
      onVisibleChanged: ((val) {
        ref
            .read(gravityBridgeProvider.notifier)
            .setSupplyInfoWidgetVisibility(val);
      }),
      hasVisibleSwitch: true,
      child: FutureBuilder(
        future: GravityService().getGravityChainSupplyInfo(),
        builder: (BuildContext context, AsyncSnapshot<SupplyInfo?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  _supplyInfoRow(
                    context,
                    S.current.GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING,
                    snapshot.data!.totalLiquidSupply,
                  ),
                  _supplyInfoRow(
                    context,
                    S.current.GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING_AND_STAKED,
                    snapshot.data!.totalNonvestingStaked,
                  ),
                  _supplyInfoRow(
                    context,
                    S.current.GRAVITY_SUPPLY_INFO_UNCLAIMED_STAKING_REWARDS,
                    snapshot.data!.totalUnclaimedRewards,
                  ),
                  _supplyInfoRow(
                    context,
                    S.current.GRAVITY_SUPPLY_INFO_UNVESTED,
                    snapshot.data!.totalVesting,
                  ),
                  _supplyInfoRow(
                    context,
                    S.current.GRAVITY_SUPPLY_INFO_UNVESTED_STAKED,
                    snapshot.data!.totalVestingStaked,
                  ),
                  _supplyInfoRow(
                    context,
                    S.current.GRAVITY_SUPPLY_INFO_VESTED,
                    snapshot.data!.totalVested,
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
              S.current.GRAVITY_SUPPLY_INFO_FETCHING,
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

Widget _supplyInfoRow(BuildContext context, String text, String supplyInfo) {
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
        "${NumberFormat.compact().format(double.parse(supplyInfo) / pow(10, 6))} ${S.current.GRAVITON}",
        style: TextStyle(
          fontSize: Sizes.fontSizeSmall,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    ],
  );
}
