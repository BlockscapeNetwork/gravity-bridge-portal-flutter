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

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/models/enums/gravity_error.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/ether_token.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_state.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/keplr_service.dart';
import 'package:gravity_bridge_flutter/services/ledger/ledger_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';

import '../../bin/config.dart';
import '../../models/token_info.dart';
import '../../services/chain_configs/chain_configs.dart';
import '../../services/keplr/keplr.dart';
import '../../utils.dart';

final selectTokenProvider =
    StateNotifierProvider<SelectTokenService, SelectTokenState>((ref) {
  final provider = SelectTokenService(
    SelectTokenLoadingState(),
    ref.read(gravityBridgeProvider.notifier),
  );

  return provider;
});

class SelectTokenService extends StateNotifier<SelectTokenState> {
  Timer? debouncer;

  // when _loadKeplr function is called, then initialize keplr tokens to this variable
  // _loadKeplrWalletTokens list will be used in the search token function
  // this avoids repeating the token list recall request
  late List<TokenInfo> _loadKeplrWalletTokens;
  final GravityBridgeNotifier _gravityBridgeService;

  SelectTokenService(SelectTokenState state, this._gravityBridgeService)
      : super(state);

  void resetState() {
    state = SelectTokenLoadingState();
  }

  Future<void> loadData(WidgetRef ref) async {
    final transferType = _gravityBridgeService.state.transferType;
    final fromWalletType = _gravityBridgeService.state.fromWalletType;
    if (transferType == TransferType.ibc2gra ||
        transferType == TransferType.gra2ibc ||
        transferType == TransferType.gra2eth) {
      if (fromWalletType == WalletType.ledger) {
        _loadLedger(ref);
      } else {
        _loadKeplr();
      }
    } else if (transferType == TransferType.eth2fwd) {
      _loadMetamask();
    }
  }

  void _loadMetamask() async {
    if (!CoinGeckoService.isInit) {
      await CoinGeckoService.init();
    }

    try {
      final List<TokenInfo> defaultTokens =
          CoinGeckoService.getDefaultTokens().toList(growable: false);
      final List<TokenInfo> filteredTokens = [
        ETHER_TOKEN,
        ...defaultTokens,
      ];
      final List<TokenInfo> favTokens = [...defaultTokens];

      state = SelectTokenSuccessState(
        selectedToken: getSelectedToken(),
        filteredTokens: filteredTokens,
        favTokens: favTokens,
      );
    } catch (error, stackTrace) {
      state = SelectTokenErrorState(
        GravityError(GravityErrorType.other, error, stackTrace),
      );
    }
  }

  void saveCustomErc20Tokens(String tokenAddress) async {
    if (state is SelectTokenSuccessState) {
      CoinGeckoService.saveCustomErc20Tokens(tokenAddress);
    }
  }

  void _loadKeplr() async {
    List<TokenInfo> walletTokens = [];
    final transferType = _gravityBridgeService.state.transferType;
    String fromAddress = _gravityBridgeService.state.fromAddress;
    final IbcChain? ibcChain = _gravityBridgeService.state.ibcChain;

    try {
      if (fromAddress.isEmpty) {
        fromAddress = await KeplrService.getAddress(null);
      }

      if (ibcChain != null && transferType == TransferType.ibc2gra) {
        final ChainInfo chainInfo = chainInfos[ibcChain.chainName]!;
        walletTokens = await KeplrService.getTokensListOfAddressOfChain(
            fromAddress, chainInfo.rest, false);
      } else {
        walletTokens = await KeplrService.getTokensListOfAddress(
            fromAddress, ibcChain == null);
      }
      _loadKeplrWalletTokens = walletTokens;

      TokenInfo? selectedToken = getSelectedToken();
      if (selectedToken != null) {
        // update selected token (with possibly new data, like balance)
        try {
          selectedToken = walletTokens
              .firstWhere((e) => e.address == selectedToken!.address);
        } on StateError catch (_) {}
      }

      state = SelectTokenSuccessState(
        selectedToken: selectedToken,
        filteredTokens: walletTokens,
        favTokens: walletTokens.take(5).toList(),
      );
    } catch (error, stackTrace) {
      state = SelectTokenErrorState(
        GravityError(GravityErrorType.other, error, stackTrace),
      );
      return null;
    }
  }

  void _loadLedger(WidgetRef ref) async {
    List<TokenInfo> walletTokens = [];
    final transferType = _gravityBridgeService.state.transferType;
    String fromAddress = _gravityBridgeService.state.fromAddress;
    Chain fromChain = _gravityBridgeService.state.fromChain;
    final IbcChain? ibcChain = _gravityBridgeService.state.ibcChain;

    try {
      if (fromAddress.isEmpty) {
        final response = await LedgerService.getAddressFromLedger(
            fromChain.chainPrefix, ref);
        fromAddress = response.addr;
      }

      if (ibcChain != null && transferType == TransferType.ibc2gra) {
        final ChainInfo chainInfo = chainInfos[ibcChain.chainName]!;
        walletTokens = await KeplrService.getTokensListOfAddressOfChain(
            fromAddress, chainInfo.rest, false);
      } else {
        walletTokens = await KeplrService.getTokensListOfAddress(
            fromAddress, ibcChain == null);
      }
      _loadKeplrWalletTokens = walletTokens;

      TokenInfo? selectedToken = getSelectedToken();
      if (selectedToken != null) {
        // update selected token (with possibly new data, like balance)
        try {
          selectedToken = walletTokens
              .firstWhere((e) => e.address == selectedToken!.address);
        } on StateError catch (_) {}
      }

      state = SelectTokenSuccessState(
        selectedToken: selectedToken,
        filteredTokens: walletTokens,
        favTokens: walletTokens.take(5).toList(),
      );
    } catch (error, stackTrace) {
      state = SelectTokenErrorState(
        GravityError(GravityErrorType.other, error, stackTrace),
      );
      return null;
    }
  }

  bool keplrTokenExistInWallet(TokenInfo? token) {
    if (_loadKeplrWalletTokens.contains(token)) {
      return true;
    }
    return false;
  }

  void searchForEthereumToken(String term) async {
    final String searchTerm = term.trim();

    if (searchTerm.length > 2) {
      List<TokenInfo> filteredTokens =
          CoinGeckoService.searchToken(searchTerm).toList();

      if (filteredTokens.isEmpty &&
          searchTerm.startsWith("0x") &&
          tokenValidationExpression.hasMatch(searchTerm)) {
        var name = await MetamaskService.erc20GetSymbol(searchTerm);
        filteredTokens.add(
          TokenInfo(
              symbol: searchTerm,
              name: name,
              address: searchTerm,
              walletType: WalletType.metamask),
        );
      }

      state = SelectTokenSuccessState(
          searchTerm: searchTerm,
          filteredTokens: filteredTokens,
          favTokens: CoinGeckoService.getDefaultTokens().toList());
    } else if (searchTerm.isEmpty) {
      _loadMetamask();
    }
  }

  void searchForGravityToken(String term) async {
    final String searchTerm = term.trim().toLowerCase();
    final List<TokenInfo> walletTokens = _loadKeplrWalletTokens;

    if (searchTerm.length > 2) {
      final List<TokenInfo> filteredTokens = [];

      for (final token in walletTokens) {
        if (token.balance != null &&
            token.balance!.isNotEmpty &&
            (token.address.toLowerCase().startsWith(searchTerm) ||
                token.name.toLowerCase().contains(searchTerm) ||
                token.symbol.toLowerCase().contains(searchTerm))) {
          filteredTokens.add(token);
        }
      }

      state = SelectTokenSuccessState(
        searchTerm: searchTerm,
        filteredTokens: filteredTokens,
        favTokens: filteredTokens,
      );
    } else if (searchTerm.isEmpty) {
      state = SelectTokenSuccessState(
        searchTerm: "",
        filteredTokens: walletTokens,
        favTokens: walletTokens.take(5).toList(),
      );
    }
  }

  void setSelectedToken(TokenInfo token) {
    if (state is SelectTokenSuccessState) {
      state = SelectTokenSuccessState(
        selectedToken: token,
        favTokens: (state as SelectTokenSuccessState).favTokens,
        filteredTokens: (state as SelectTokenSuccessState).favTokens,
        searchTerm: (state as SelectTokenSuccessState).searchTerm,
      );
    }
  }

  TokenInfo? getSelectedToken() {
    return (state is SelectTokenSuccessState)
        ? (state as SelectTokenSuccessState).selectedToken
        : null;
  }
}
