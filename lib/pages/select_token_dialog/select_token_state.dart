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

import 'package:gravity_bridge_flutter/models/enums/gravity_error.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';

abstract class SelectTokenState {}

class SelectTokenLoadingState extends SelectTokenState {}

class SelectTokenErrorState extends SelectTokenState {
  final GravityError error;

  SelectTokenErrorState(this.error);
}

class SelectTokenSuccessState extends SelectTokenState {
  final TokenInfo? selectedToken;
  final List<TokenInfo> filteredTokens;
  final List<TokenInfo> favTokens;
  final String searchTerm;

  SelectTokenSuccessState({
    this.selectedToken,
    required this.filteredTokens,
    required this.favTokens,
    this.searchTerm = "",
  });

  SelectTokenSuccessState copyWith({
    final TokenInfo? selectedToken,
    final List<TokenInfo>? filteredTokens,
    final List<TokenInfo>? favTokens,
    final String? searchTerm,
  }) {
    return SelectTokenSuccessState(
      selectedToken: selectedToken ?? this.selectedToken,
      filteredTokens: filteredTokens ?? this.filteredTokens,
      favTokens: favTokens ?? this.favTokens,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
