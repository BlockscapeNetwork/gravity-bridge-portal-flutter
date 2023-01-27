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
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_text_field.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_service.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_state.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/multi_page_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/select_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/ether_token.dart';
import '../gravity_bridge/widgets/image_network_or_asset_widget.dart';
import '../swap_eth/swap_eth_page.dart';

class SelectTokenButton extends ConsumerStatefulWidget {
  final String defaultText;

  const SelectTokenButton({
    Key? key,
    required this.defaultText,
  }) : super(key: key);

  @override
  ConsumerState<SelectTokenButton> createState() => _SelectTokenButtonState();
}

class _SelectTokenButtonState extends ConsumerState<SelectTokenButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(selectTokenProvider);

    Widget? selectedToken;
    String? tokenName;
    if (state is SelectTokenSuccessState && state.selectedToken != null) {
      tokenName = state.selectedToken!.name;

      selectedToken = Container(
        constraints: const BoxConstraints(maxHeight: 30.5, maxWidth: 30.5),
        padding: const EdgeInsets.only(
            right: Sizes.paddingPico + Sizes.paddingMicro),
        child: Image.network(
          state.selectedToken!.iconUrl,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(
            Icons.not_interested_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }
    return SelectButton(
      height: Sizes.fixedButtonHeight,
      text: tokenName ?? widget.defaultText,
      spaceBetween: isMobile(context),
      isSelected: tokenName != null,
      prefix: selectedToken,
      svgAssetAsString: true,
      suffixIconUrl: SvgAssetsAsString.uiIconsExpandMore,
      onPressed: () => _showDialog(context),
    );
  }

  void _showDialog(BuildContext context) {
    ref.read(selectTokenProvider.notifier).loadData(ref);

    ref.read(multiPageDialogProvider.notifier).showMultiPageDialog(
      context: context,
      pageTitles: [
        S.current.SELECT_TOKEN,
        "Swap ETH to WETH",
      ],
      pageContents: [
        const _SelectTokenDialogContent(),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: SwapEthPage(),
        ),
      ],
    );
  }
}

class _SelectTokenDialogContent extends ConsumerWidget {
  const _SelectTokenDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch<SelectTokenState>(selectTokenProvider);
    if (state is SelectTokenSuccessState) {
      return _selectTokenDialogContent(
        context,
        ref,
        favTokens: state.favTokens,
        filteredTokens: state.filteredTokens,
      );
    } else if (state is SelectTokenErrorState) {
      return Center(child: Text(S.current.ERROR_FAILED_TO_GET_TOKENLIST));
    } else {
      // mocked token-lists for the shimmer widget, with unicode block characters b/c text with spaces does not fill its place during the shimmer animation
      final mockedTokenList = List.generate(
        2,
        (index) => TokenInfo(
          symbol: "SYM",
          name: "TOKEN",
          address: "address",
          iconUrl: Assets.logoGravityBridge,
          denom: "DEN",
          balance: "0",
          decimals: 0,
        ),
      );
      return Shimmer.fromColors(
        baseColor: Color.alphaBlend(
          Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.111) ??
              Theme.of(context).backgroundColor,
          Theme.of(context).colorScheme.secondary,
        ),
        highlightColor: Theme.of(context).colorScheme.secondary,
        child: _selectTokenDialogContent(
          context,
          ref,
          filteredTokens: mockedTokenList,
          favTokens: mockedTokenList,
        ),
      );
    }
  }

  Widget _selectTokenDialogContent(
    BuildContext context,
    WidgetRef ref, {
    required final List<TokenInfo> favTokens,
    required final List<TokenInfo> filteredTokens,
  }) {
    const double vertPadding = 15;
    const double horizPadding = 12;
    return Column(
      children: [
        Padding(
          padding: isMobile(context)
              ? const EdgeInsets.all(Sizes.paddingMicro)
              : const EdgeInsets.only(
                  top: vertPadding / 2,
                  bottom: vertPadding,
                  left: horizPadding,
                  right: horizPadding,
                ),
          child: GravityBridgeTextField(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            additionalPadding: const EdgeInsets.symmetric(vertical: 5),
            hintText: S.current.TOKEN_DIALOG_SEARCH_HINT,
            onChanged: (text) {
              switch (context.read(gravityBridgeProvider).transferType) {
                case TransferType.gra2ibc:
                case TransferType.gra2eth:
                case TransferType.ibc2gra:
                  ref
                      .read(selectTokenProvider.notifier)
                      .searchForGravityToken(text);
                  break;
                case TransferType.eth2fwd:
                default:
                  ref
                      .read(selectTokenProvider.notifier)
                      .searchForEthereumToken(text);
                  break;
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: vertPadding,
            left: 12.0,
            right: 12.0,
          ),
          child: _ChipTokens(favTokens: favTokens),
        ),
        const Divider(thickness: 1, height: 0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: vertPadding / 2),
            child: filteredTokens.isEmpty
                ? Center(
                    child: Text(
                      S.current.TOKEN_DIALOG_NO_TOKENS,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _TokenTile(token: filteredTokens[index]),
                      );
                    },
                    itemCount: filteredTokens.length,
                  ),
          ),
        ),
        if (ref.read(gravityBridgeProvider).fromChain == Chain.evmos)
          Padding(
            padding: const EdgeInsets.only(
              bottom: vertPadding,
              top: vertPadding,
              left: horizPadding + 6,
              right: horizPadding,
            ),
            child: _EvmosHintDialogFooter(),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: vertPadding / 2, right: 12.0),
          child: _DialogFooter(),
        ),
      ],
    );
  }
}

class _TokenTile extends StatelessWidget {
  const _TokenTile({Key? key, required this.token}) : super(key: key);

  final TokenInfo token;

  @override
  Widget build(BuildContext context) {
    final bool isEtherToken = token == ETHER_TOKEN;

    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: isEtherToken
          ? null
          : () {
              context
                  .read(selectTokenProvider.notifier)
                  .setSelectedToken(token);
              context
                  .read(selectTokenProvider.notifier)
                  .saveCustomErc20Tokens(token.address);
              Navigator.of(context).pop();
            },
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 4.0, left: 6.0, right: 6.0, top: 4.0),
        child: Row(
          children: [
            ClipOval(
              clipBehavior: Clip.hardEdge,
              child: SizedBox.square(
                dimension: 26,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: Theme.of(context).colorScheme.tertiary),
                    ImageNetworkOrAssetWidget(
                      imageUrl: token.iconUrl,
                      fit: BoxFit.cover,
                      height: 26,
                      width: 26,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: token.address,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          token.name,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          token.symbol,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            (isEtherToken)
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isMobile(context) ? 0 : 16.0),
                    child: OutlinedButton(
                      style: OutlinedButtonTheme.of(context).style?.copyWith(
                            foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).textTheme.button?.color,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).backgroundColor,
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                      onPressed: () {
                        context
                            .read(multiPageDialogProvider.notifier)
                            .nextPage();
                      },
                      child: Text(
                        isMobile(context)
                            ? "Swap ETH\nto WETH"
                            : "Swap ETH to WETH",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: isMobile(context)
                                ? Sizes.fontSizeXSmall
                                : Sizes.fontSizeSmall),
                      ),
                    ),
                  )
                : IconButton(
                    tooltip: S.current.TOKEN_DIALOG_TOOLTIP_COPY,
                    splashRadius: 18,
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: token.address))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            content: Text(
                              S.current.TOKEN_DIALOG_COPY_SUCCESS,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    icon: ImageNetworkOrAssetWidget(
                      svgAssetAsString: true,
                      imageUrl: SvgAssetsAsString.uiIconsCopy,
                      width: Sizes.iconSizeSmall,
                      height: Sizes.iconSizeSmall,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
            FutureBuilder(
              future: _requestBalanceAndDollarValueForToken(context, token),
              builder: (BuildContext context,
                  AsyncSnapshot<Tuple3<String, int?, double?>> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final String balanceInCoinsWithoutDecimals =
                      snapshot.data!.item1;
                  final int decimals = snapshot.data!.item2 ?? 0;
                  final double? dollarExchangeRate = snapshot.data!.item3;
                  final balanceAsDoubleString = convertIntToDecimalAmount(
                      balanceInCoinsWithoutDecimals, decimals);
                  final double balanceAsDouble = (decimals > 0)
                      ? double.parse(balanceAsDoubleString)
                      : 0.0;
                  final double? balanceInDollars = (dollarExchangeRate != null)
                      ? dollarExchangeRate * balanceAsDouble
                      : null;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Tooltip(
                        message: formatTokenAmountUsingLocale(
                            tokenAmount: balanceAsDoubleString),
                        child: Text(
                          (balanceAsDouble > 0)
                              ? formatTokenAmountUsingLocale(
                                  tokenAmount:
                                      balanceAsDouble.toStringAsNotFixed(6),
                                )
                              : formatTokenAmountUsingLocale(tokenAmount: "0"),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      if (balanceInDollars != null)
                        Tooltip(
                          message: balanceInDollars.toStringAsNotFixed(),
                          child: Text(
                            formatDollarValue(
                              dollarValue: balanceInDollars,
                              additionalSymbol: "~",
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyText1?.apply(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                        ),
                    ],
                  );
                }
                return SizedBox(
                  width: 15,
                  child: LinearProgressIndicator(
                    minHeight: 1,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Requests balance(amount, decimals), and dollar-exchange-rate for a token.
  static Future<Tuple3<String, int?, double?>>
      _requestBalanceAndDollarValueForToken(
    final BuildContext context,
    final TokenInfo token,
  ) async {
    const _logPrefix = "_requestBalanceAndDollarValueForToken";
    String balanceWithoutDecimals;
    int? decimals;
    double? dollarValue;

    /// GET BALANCE AND DECIMALS
    // ETHER TOKEN
    if (token == ETHER_TOKEN) {
      final BigInt? balance = await MetamaskService.requestEthBalanceInWei();
      balanceWithoutDecimals = (balance == null) ? "0" : "$balance";
      decimals = token.decimals;
    }
    // ERC20-TOKEN
    else if (token.walletType == WalletType.metamask) {
      balanceWithoutDecimals = token.balance ??
          ((await MetamaskService.erc20GetBalance(token.address)) ?? "0");
      decimals =
          (await MetamaskService.erc20GetDecimals(token.address)) as int?;
    }
    // COSMOS-TOKEN
    else {
      balanceWithoutDecimals = token.balance ?? "0";
      decimals = token.decimals;
    }

    /// GET DOLLAR PRICE
    dollarValue = token.priceInDollars;
    if (int.parse(balanceWithoutDecimals) > 0 &&
        decimals != null &&
        dollarValue == null) {
      dollarValue = await CoinGeckoService.requestUsDollarPriceForToken(
        tokenName: token.name,
        tokenSymbol: token.symbol,
        tryFromCache: true,
      );
    }
    return Tuple3(balanceWithoutDecimals, decimals, dollarValue);
  }
}

class _ChipTokens extends StatefulWidget {
  const _ChipTokens({Key? key, this.favTokens = const []}) : super(key: key);

  final List<TokenInfo> favTokens;

  @override
  State<_ChipTokens> createState() => _ChipTokensState();
}

class _ChipTokensState extends State<_ChipTokens> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Opacity(
        opacity: _hovering ? 1 : 0.83,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            runSpacing: 12,
            spacing: 12,
            children: widget.favTokens
                .map(
                  (token) => ActionChip(
                    pressElevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground)),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxHeight: 16, maxWidth: 16),
                            child: ClipOval(
                              child: ImageNetworkOrAssetWidget(
                                imageUrl: token.iconUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          token.name,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    onPressed: () {
                      context
                          .read(selectTokenProvider.notifier)
                          .setSelectedToken(token);
                      context
                          .read(selectTokenProvider.notifier)
                          .saveCustomErc20Tokens(token.address);

                      Navigator.of(context).pop();
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _EvmosHintDialogFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          await launchUrl(Uri.parse("https://app.evmos.org/assets"));
        },
        child: Row(
          children: [
            Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 12),
                  children: [
                    TextSpan(text: S.current.EVMOS_TOKEN_HINT),
                    const TextSpan(
                      text: "app.evmos.org/assets",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            await launchUrl(Uri.parse(Constants.coinGeckoLink));
          },
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 10),
              children: [
                TextSpan(text: S.current.API_PROVIDED_BY),
                TextSpan(
                  text: S.current.COINGECKO,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
