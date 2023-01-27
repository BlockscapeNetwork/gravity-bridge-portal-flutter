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

enum BridgeFeeType {
  slow(Duration(hours: 24)),
  standard(Duration(hours: 4)),
  premium(Duration(hours: 0));

  final Duration maxDuration;
  const BridgeFeeType(this.maxDuration);
}

class BridgeFeeState {
  const BridgeFeeState();
}

class BridgeFeeLoadingState extends BridgeFeeState {}

class BridgeFeeLoadedState extends BridgeFeeState {
  final List<BridgeFeeOption> options;

  BridgeFeeLoadedState({
    this.options = const [],
  });

  @override
  String toString() {
    return "[ ${options.join(", ")} ]";
  }
}

class BridgeFeeErrorState extends BridgeFeeState {
  final String error;
  BridgeFeeErrorState(this.error);
}

class BridgeFeeOption {
  final BridgeFeeType type;
  String cost;
  final String symbol;

  BridgeFeeOption({
    required this.type,
    required this.cost,
    required this.symbol,
  });

  @override
  String toString() {
    return "BridgeFeeOption { type: $type, cost: $cost, symbol: $symbol }";
  }
}
