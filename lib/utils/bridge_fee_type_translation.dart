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

import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/bridge_fee_state.dart';

extension BridgeFeeTypeTranslation on BridgeFeeType {
  String typeTranslation() {
    switch (this) {
      case BridgeFeeType.slow:
        return S.current.BRIDGE_FEE_LOW_TYPE;
      case BridgeFeeType.standard:
        return S.current.BRIDGE_FEE_STANDARD_TYPE;
      case BridgeFeeType.premium:
        return S.current.BRIDGE_FEE_PREMIUM_TYPE;
    }
  }

  String typeDescription() {
    switch (this) {
      case BridgeFeeType.slow:
        return S.current.BRIDGE_FEE_LOW_TYPE_DESCRIPTION;
      case BridgeFeeType.standard:
        return S.current.BRIDGE_FEE_STANDARD_TYPE_DESCRIPTION;
      case BridgeFeeType.premium:
        return S.current.BRIDGE_FEE_PREMIUM_TYPE_DESCRIPTION;
    }
  }

  String typeIcon() {
    switch (this) {
      case BridgeFeeType.slow:
        return SvgAssetsAsString.uiIconsSpeedSlow;
      case BridgeFeeType.standard:
        return SvgAssetsAsString.uiIconsSpeedMedium;
      case BridgeFeeType.premium:
        return SvgAssetsAsString.uiIconsSpeedFast;
    }
  }

  String typeSpeedDescription() {
    switch (this) {
      case BridgeFeeType.slow:
        return S.current.BRIDGE_FEE_SPEED_DESCRIPTION(maxDuration.inHours);
      case BridgeFeeType.standard:
        return S.current.BRIDGE_FEE_SPEED_DESCRIPTION(maxDuration.inHours);
      case BridgeFeeType.premium:
        return S.current.BRIDGE_FEE_PREMIUM_SPEED_DESCRIPTION;
    }
  }
}
