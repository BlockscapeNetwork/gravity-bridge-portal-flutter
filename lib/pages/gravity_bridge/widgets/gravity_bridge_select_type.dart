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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/severity.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_state.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_keplr/keplr_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/type_metamask/metamask_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/chain_alert_text.dart';
import 'package:gravity_bridge_flutter/pages/select_token_dialog/select_token_service.dart';
import 'package:gravity_bridge_flutter/services/chain_info_service.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/connect_button.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/select_wallet_button.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/selection_dialog.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:flutter/services.dart';
import 'package:gravity_bridge_flutter/widgets/layout_builder_helper_widget.dart';

import 'dart:math' as math;

import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:tuple/tuple.dart';

class GravityBridgeSelectType extends ConsumerStatefulWidget {
  const GravityBridgeSelectType({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GravityBridgeSelectType> createState() =>
      GravityBridgeSelectTypeState();
}

class GravityBridgeSelectTypeState
    extends ConsumerState<GravityBridgeSelectType>
    with TickerProviderStateMixin {
  bool _swapped = false;
  bool _delay = false;

  @override
  Widget build(BuildContext context) {
    const int tweenAnimationDuration = 252;
    double maxSize = isMobile(context) ? 450.0 : 196.0;
    double kSwapButtonSize = isMobile(context) ? 230.0 : 102.0;
    double contentSize = (maxSize - kSwapButtonSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMobile(context)
            ? Padding(
                padding: EdgeInsets.only(
                  right: Sizes.paddingSmall,
                  bottom: Sizes.paddingSmall,
                  top: isMobile(context)
                      ? Sizes.paddingXSmall
                      : Sizes.paddingMedium,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.current.TRANSFER_TOKENS,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: Sizes.fontSizeLarge,
                        ),
                  ),
                ),
              )
            : const SizedBox(),
        IgnorePointer(
          ignoring: _delay,
          child: SizedBox(
            height: maxSize,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration:
                      const Duration(milliseconds: tweenAnimationDuration),
                  right: 0,
                  left: 0,
                  top: maxSize * ref.read(gravityBridgeProvider).tweenValue -
                      (contentSize *
                          ref.read(gravityBridgeProvider).tweenValue),
                  child: SizedBox(
                    height: contentSize,
                    child: _MetamaskCard(
                      fromOrToText:
                          ref.read(gravityBridgeProvider).tweenValue == 0
                              ? S.current.SELECT_TYPE_FROM
                              : S.current.SELECT_TYPE_TO,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration:
                      const Duration(milliseconds: tweenAnimationDuration),
                  right: 0,
                  left: 0,
                  bottom: maxSize * ref.read(gravityBridgeProvider).tweenValue -
                      (contentSize *
                          ref.read(gravityBridgeProvider).tweenValue),
                  child: SizedBox(
                    height: contentSize,
                    child: _KeplrCard(
                      fromOrToText:
                          ref.read(gravityBridgeProvider).tweenValue == 1
                              ? S.current.SELECT_TYPE_FROM
                              : S.current.SELECT_TYPE_TO,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(10),
                    child: _SwitchToggleButton(
                      horizontal: false,
                      onToggle: () {
                        setState(() {
                          _swapped = !_swapped;
                          _delay = true;
                        });

                        // toggle addresses first in case one is empty
                        ref
                            .read(gravityBridgeProvider.notifier)
                            .toggleAddresses();

                        // after chains change && a card is connected, its connect() function is called automatically (see the first lines in MetamaskCard.build()/KeplrCard.build())
                        ref
                            .read(gravityBridgeProvider.notifier)
                            .toggleToAndFromChains();

                        // toggle wallet types
                        ref
                            .read(gravityBridgeProvider.notifier)
                            .toggleToAndFromWalletTypes();

                        if (ref.read(gravityBridgeProvider).tweenValue == 1) {
                          ref
                              .read(gravityBridgeProvider.notifier)
                              .setTweenValue(0);
                        } else {
                          ref
                              .read(gravityBridgeProvider.notifier)
                              .setTweenValue(1);
                        }

                        // reset filled transfer data
                        ref
                            .read(metamaskProvider.notifier)
                            .resetTransferPayload();
                        ref.read(keplrProvider.notifier).resetTransferPayload();
                        ref.read(selectTokenProvider.notifier).resetState();

                        Timer(
                            const Duration(
                                milliseconds: tweenAnimationDuration), () {
                          setState(() => _delay = false);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const ChainAlertText(),
      ],
    );
  }
}

class _SwitchToggleButton extends ConsumerStatefulWidget {
  const _SwitchToggleButton(
      {Key? key, required this.onToggle, this.horizontal = true})
      : super(key: key);

  final VoidCallback onToggle;
  final bool horizontal;

  @override
  _SwitchToggleButtonState createState() => _SwitchToggleButtonState();
}

class _SwitchToggleButtonState extends ConsumerState<_SwitchToggleButton>
    with TickerProviderStateMixin {
  bool _swapped = false;
  bool bothWalletsConnected = false;

  late Animation<double> animation;
  late AnimationController controller;

  animationListener() => setState(() {});

  Animation<double> get _animation =>
      Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 1, curve: Curves.easeInOutCubic),
      ));

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    controller = AnimationController(
      duration: Duration(milliseconds: widget.horizontal ? 500 : 380),
      vsync: this,
    );

    animation = _animation..addListener(animationListener);
  }

  late AnimationController _rippleController;

  @override
  dispose() {
    controller.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bothWalletsConnected = ref.watch(
            keplrProvider.select((value) => value.isKeplrCardConnected)) &&
        ref.watch(
            metamaskProvider.select((value) => value.isMetamaskCardConnected));
    const double kIconSize = 35;
    final rotationValueLeft = (1 - animation.value) * math.pi;
    final rotationValueRight = animation.value * math.pi;

    return CustomPaint(
      painter: _CirclePainter(
        _rippleController,
        color: Theme.of(context).brightness == Brightness.dark
            ? Color.alphaBlend(
                Theme.of(context).primaryColorLight.withOpacity(0.3),
                Theme.of(context).colorScheme.tertiary,
              )
            : Theme.of(context).primaryColorLight,
      ),
      child: Center(
        child: ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.11).animate(
            CurvedAnimation(
              parent: _rippleController,
              curve: const _CurveWave(),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              setState(() => _swapped = !_swapped);

              !_swapped ? controller.reverse() : controller.forward();
              widget.onToggle();
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => _rippleController.repeat(),
              onExit: (_) {
                _rippleController.animateTo(0,
                    duration: const Duration(milliseconds: 500));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Container(
                  margin: const EdgeInsets.all(6),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  child: SizedBox(
                    width: kIconSize,
                    height: kIconSize,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: widget.horizontal ? null : 0,
                          right: 6,
                          left: widget.horizontal ? 0 : null,
                          child: Transform(
                            transform: widget.horizontal
                                ? (Matrix4.identity()
                                  ..rotateY(rotationValueLeft)
                                  ..rotateX(rotationValueLeft))
                                : (Matrix4.identity()
                                  ..rotateX(rotationValueLeft)
                                  ..rotateY(rotationValueLeft)),
                            alignment: FractionalOffset.center,
                            child: RotatedBox(
                              quarterTurns: widget.horizontal ? 0 : 45,
                              child: SizedBox(
                                width: kIconSize,
                                height: kIconSize,
                                child: ImageNetworkOrAssetWidget(
                                  svgAssetAsString: true,
                                  imageUrl: SvgAssetsAsString.uiIconsRightArrow,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: widget.horizontal ? null : 0,
                          bottom: 0,
                          right: widget.horizontal ? 0 : null,
                          left: 6,
                          child: Transform(
                            transform: widget.horizontal
                                ? (Matrix4.identity()
                                  ..rotateY(rotationValueRight)
                                  ..rotateX(rotationValueRight))
                                : (Matrix4.identity()
                                  ..rotateX(rotationValueRight)
                                  ..rotateY(rotationValueRight)),
                            alignment: FractionalOffset.center,
                            child: RotatedBox(
                              quarterTurns: widget.horizontal ? 0 : 45,
                              child: SizedBox(
                                width: kIconSize,
                                height: kIconSize,
                                child: ImageNetworkOrAssetWidget(
                                  svgAssetAsString: true,
                                  imageUrl: SvgAssetsAsString.uiIconsRightArrow,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardIconText extends StatefulWidget {
  const _CardIconText({
    Key? key,
    required this.fromOrToText,
    required this.text,
    required this.icon,
    required this.button,
    this.isConnected = false,
    this.onDropdown,
    required this.address,
    this.validation,
  }) : super(key: key);

  final String fromOrToText;
  final String text;
  final String address;
  final String icon;
  final Widget button;
  final bool isConnected;
  final VoidCallback? onDropdown;
  final Tuple2<Severity, String>? validation;

  @override
  State<_CardIconText> createState() => _CardIconTextState();
}

class _CardIconTextState extends State<_CardIconText> {
  bool mouseHover = false;
  bool themeMode = false;

  @override
  Widget build(BuildContext context) {
    themeMode = Theme.of(context).brightness == Brightness.light;
    final border = Border.all(
      color: widget.validation?.item1 == Severity.error
          ? Theme.of(context).colorScheme.onError
          : widget.validation?.item1 == Severity.warning
              ? Theme.of(context).colorScheme.error
              : Colors.transparent,
    );
    return LayoutBuilderHelper(
      mobile: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.radius),
          border: border,
        ),
        padding: const EdgeInsets.only(
          left: Sizes.padding16,
          top: Sizes.padding24,
          right: Sizes.padding16,
          bottom: Sizes.paddingLarge,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.start,
              widget.fromOrToText,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            MouseRegion(
              cursor: widget.onDropdown != null
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.basic,
              child: GestureDetector(
                onTap: widget.onDropdown,
                child: Container(
                  padding: const EdgeInsets.all(
                    Sizes.paddingMicro,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.radius,
                      ),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ImageNetworkOrAssetWidget(
                          imageUrl: widget.icon,
                        ),
                      ),
                      const SizedBox(width: Sizes.paddingNano),
                      _textWidget(),
                      if (widget.onDropdown != null)
                        Expanded(child: Container()),
                      if (widget.onDropdown != null)
                        const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: widget.button,
            ),
          ],
        ),
      ),
      desktop: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(Sizes.radius),
              border: border,
            ),
            padding: const EdgeInsets.only(
              left: Sizes.paddingMedium + 60,
              right: Sizes.paddingMedium,
            ),
            child: Row(
              children: [
                Expanded(
                  child: MouseRegion(
                    cursor: widget.onDropdown != null
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.basic,
                    child: GestureDetector(
                      onTap: widget.onDropdown,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ImageNetworkOrAssetWidget(
                              imageUrl: widget.icon,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _textWidget(),
                          if (widget.onDropdown != null)
                            const SizedBox(width: 6),
                          if (widget.onDropdown != null)
                            const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                widget.button,
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                widget.fromOrToText,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isConnected)
          Text(
            widget.text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            mouseHover = true;
            setState(() {});
          },
          onExit: (_) {
            mouseHover = false;
            setState(() {});
          },
          child: GestureDetector(
            onTap: widget.isConnected && mouseHover
                ? () {
                    Clipboard.setData(ClipboardData(text: widget.address)).then(
                      (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            content: Text(
                              S.current.COPY_TO_CLIPBOARD_CONFIRMATION,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                : null,
            child: Text(
              widget.address.isEmpty
                  ? widget.text
                  : widget.isConnected && mouseHover
                      ? widget.address
                      : widget.address.truncateDots(),
              maxLines: widget.isConnected ? 1 : 2,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight:
                    widget.isConnected ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MetamaskCard extends ConsumerWidget {
  final String fromOrToText;
  const _MetamaskCard({
    required this.fromOrToText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(gravityBridgeProvider,
        (GravityBridgeState? previous, GravityBridgeState next) {
      // if this card is connected
      if (ref.read(metamaskProvider).isMetamaskCardConnected) {
        // if fromChain changed and this card is on the top => disconnect
        if ((previous?.fromChain != next.fromChain &&
            (next.transferType == TransferType.eth2fwd ||
                next.transferType == TransferType.ibc2gra))) {
          onDisconnectMetamask(ref);
          onDisconnectKeplr(ref);
        }
        // if toChain changed and this card is on the bottom
        if (previous?.toChain != next.toChain &&
            (next.transferType == TransferType.gra2eth ||
                next.transferType == TransferType.gra2ibc)) {
          // disconnect
          onDisconnectMetamask(ref);
          onDisconnectKeplr(ref);
        }
      }
    });

    final transferType =
        ref.watch(gravityBridgeProvider.select((s) => s.transferType));
    dlog("MetamaskCard - Transfertype: $transferType");
    final ibcChain = ref.watch(gravityBridgeProvider.select((s) => s.ibcChain));
    final isMetamaskConnected =
        ref.watch(metamaskProvider.select((s) => s.isMetamaskCardConnected));
    final ibcOrEthAddress =
        ref.watch(gravityBridgeProvider.select((s) => s.ibcOrEthAddress));
    final Chain metamaskCardChain = ref.watch(
        gravityBridgeProvider.select((value) => value.metamaskCardChain));

    String chainLabel;
    String icon = Assets.logoEthereum;
    int selectedIndex = 0;
    if (ibcChain != null) {
      chainLabel = ibcChain.label;
      icon = ibcChain.iconUri;
      selectedIndex = Config.keplr.ibcChains.indexWhere((_) =>
          _.addressPrefix ==
          ref.read(gravityBridgeProvider).ibcChain!.addressPrefix);
      selectedIndex++;
    } else {
      chainLabel = S.current.TRANSFER_TYPE_METAMASK;
    }

    return _CardIconText(
      fromOrToText: fromOrToText,
      text: chainLabel,
      address: ibcOrEthAddress,
      icon: icon,
      isConnected: isMetamaskConnected,
      button: transferType == TransferType.eth2fwd ||
              transferType == TransferType.gra2eth
          ? ConnectButton(
              width: isMobile(context)
                  ? double.infinity
                  : isMetamaskConnected
                      ? Sizes.fixedButtonWidthLarge
                      : Sizes.fixedButtonWidthMedium,
              height: Sizes.fixedButtonHeight,
              svgAssetAsString: true,
              iconUrl: !isMetamaskConnected
                  ? SvgAssetsAsString.uiIconsLink
                  : SvgAssetsAsString.uiIconsLinkOff,
              text: !isMetamaskConnected
                  ? S.current.TRANSFER_TYPE_CONNECT
                  : S.current.TRANSFER_TYPE_DISCONNECT,
              isSelected: isMetamaskConnected,
              spaceBetween: isMobile(context),
              onPressed: () => isMetamaskConnected
                  ? onDisconnectMetamask(ref)
                  : onConnectMetamask(ref),
            )
          : (metamaskCardChain != Chain.canto)
              ? SelectWalletButton(
                  isInMetamaskCard: true,
                  isConnected: isMetamaskConnected,
                  onDisconnect: () => onMetamaskCardWalletButtonDisconnect(ref),
                  onConnect: () =>
                      onMetamaskCardWalletButtonConnect(context, ref),
                )
              : const SizedBox.shrink(),
      onDropdown: () => onMetamaskCardDropDown(context, ref, selectedIndex),
      validation: ref.watch(gravityBridgeProvider
          .select((value) => value.metamaskCardValidation)),
    );
  }

  Future<void> onConnectMetamask(WidgetRef ref) async {
    final gbNotifier = ref.read(gravityBridgeProvider.notifier);
    final metamaskNotifier = ref.read(metamaskProvider.notifier);
    final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
    final transferType = ref.read(gravityBridgeProvider).transferType;
    String walletAddress = await metamaskNotifier.connectMetamask();
    if (walletAddress.isNotEmpty) {
      gbNotifier.setIsMetamaskCardConnected(true);
      // Metamask-card on the top
      if (transferType == TransferType.eth2fwd) {
        gbNotifier.setFromAddress(walletAddress);
        metamaskNotifier.resetTransferPayload();
        selectTokenNotifier.resetState();
      }
      // Metamask-card on the bottom
      else if (transferType == TransferType.gra2eth) {
        gbNotifier.setToAddress(walletAddress);
      }
    }
  }

  void onDisconnectMetamask(WidgetRef ref) {
    final gbNotifier = ref.read(gravityBridgeProvider.notifier);
    final metamaskNotifier = ref.read(metamaskProvider.notifier);
    final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
    final transferType = ref.read(gravityBridgeProvider).transferType;
    gbNotifier.setIsMetamaskCardConnected(false);
    // Metamask-card on the top
    if (transferType == TransferType.eth2fwd) {
      gbNotifier.resetFromAddress();
      metamaskNotifier.resetTransferPayload();
      selectTokenNotifier.resetState();
    }
    // Metamask-card on the bottom
    else if (transferType == TransferType.gra2eth) {
      gbNotifier.resetToAddress();
    }
  }

  void onDisconnectKeplr(WidgetRef ref) {
    final gbNotifier = ref.read(gravityBridgeProvider.notifier);
    final keplrNotifier = ref.read(keplrProvider.notifier);
    final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
    final transferType = ref.read(gravityBridgeProvider).transferType;

    gbNotifier.setIsMetamaskCardConnected(false);

    // Metamask-card on the top
    if (transferType == TransferType.ibc2gra) {
      gbNotifier.resetFromAddress();
      keplrNotifier.resetTransferPayload();
      selectTokenNotifier.resetState();
    }
    // Metamask-card on the bottom
    else if (transferType == TransferType.gra2ibc) {
      gbNotifier.resetToAddress();
    }
  }
}

class _KeplrCard extends ConsumerWidget {
  final String fromOrToText;
  const _KeplrCard({
    required this.fromOrToText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(gravityBridgeProvider,
        (GravityBridgeState? previous, GravityBridgeState next) {
      // if this card is connected
      // if fromChain changed and this card is on the top
      // OR if toChain changed and this card is on the bottom
      // => disconnect
      if (ref.read(keplrProvider).isKeplrCardConnected) {
        if ((previous?.fromChain != next.fromChain &&
                (next.transferType == TransferType.gra2eth ||
                    next.transferType == TransferType.gra2ibc)) ||
            (previous?.toChain != next.toChain &&
                (next.transferType == TransferType.eth2fwd ||
                    next.transferType == TransferType.ibc2gra))) {
          onDisconnectKeplr(ref);
        }
      }
    });

    bool isKeplrConnected =
        ref.watch(keplrProvider.select((s) => s.isKeplrCardConnected));
    final ForwardChain chain =
        ref.watch(gravityBridgeProvider.select((s) => s.forwardChain));
    final transferType =
        ref.watch(gravityBridgeProvider.select((s) => s.transferType));
    final fwdAddress =
        ref.watch(gravityBridgeProvider.select((s) => s.fwdAddress));
    final keplrCardChain = ref
        .watch(gravityBridgeProvider.select((value) => value.keplrCardChain));

    return _CardIconText(
      fromOrToText: fromOrToText,
      text: chain.label,
      address: fwdAddress,
      icon: chain.iconUri,
      isConnected: isKeplrConnected,
      button: (keplrCardChain != Chain.canto)
          ? SelectWalletButton(
              isInMetamaskCard: false,
              isConnected: isKeplrConnected,
              onConnect: () => onKeplrCardWalletButtonConnect(context, ref),
              onDisconnect: () => onKeplrCardWalletButtonDisconnect(ref),
            )
          : const SizedBox.shrink(),
      onDropdown: (transferType == TransferType.ibc2gra ||
              transferType == TransferType.gra2ibc ||
              transferType == TransferType.gra2eth)
          ? null
          : () => onKeplrCardDropDown(context, ref),
      validation: ref.watch(
          gravityBridgeProvider.select((value) => value.keplrCardValidation)),
    );
  }

  void onDisconnectKeplr(WidgetRef ref) {
    final gbNotifier = ref.read(gravityBridgeProvider.notifier);
    final keplrNotifier = ref.read(keplrProvider.notifier);
    final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
    final transferType = ref.read(gravityBridgeProvider).transferType;

    gbNotifier.setIsKeplrCardCardConnected(false);

    // Keplr-card on the top
    if (transferType == TransferType.gra2ibc ||
        transferType == TransferType.gra2eth) {
      gbNotifier.resetFromAddress();
      keplrNotifier.resetTransferPayload();
      selectTokenNotifier.resetState();
    }
    // Keplr-card on the bottom
    else if (transferType == TransferType.ibc2gra ||
        transferType == TransferType.eth2fwd) {
      gbNotifier.resetToAddress();
    }
  }
}

class _CurveWave extends Curve {
  const _CurveWave();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}

class _CirclePainter extends CustomPainter {
  _CirclePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;
  final int count = 1;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / count)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / count);
    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = count - 1; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => true;
}

Future<void> onMetamaskCardWalletButtonConnect(
  final BuildContext context,
  final WidgetRef ref,
) async {
  Navigator.pop(context);
  final gbNotifier = ref.read(gravityBridgeProvider.notifier);
  final keplrNotifier = ref.read(keplrProvider.notifier);
  final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
  final transferType = ref.read(gravityBridgeProvider).transferType;
  String walletAddress = await keplrNotifier.connectKeplr(
      chain: ref.read(gravityBridgeProvider).ibcChain!.chainName);
  if (walletAddress.isNotEmpty) {
    gbNotifier.setIsMetamaskCardConnected(true);
    // Metamask-card on the top
    if (transferType == TransferType.ibc2gra) {
      gbNotifier.setFromAddress(walletAddress);
      keplrNotifier.resetTransferPayload();
      selectTokenNotifier.resetState();
    }
    // Metamask-card on the bottom
    else if (transferType == TransferType.gra2ibc) {
      gbNotifier.setToAddress(walletAddress);
    }
  }
}

void onMetamaskCardWalletButtonDisconnect(final WidgetRef ref) {
  final gbNotifier = ref.read(gravityBridgeProvider.notifier);
  final keplrNotifier = ref.read(keplrProvider.notifier);
  final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
  final transferType = ref.read(gravityBridgeProvider).transferType;
  gbNotifier.setIsMetamaskCardConnected(false);
  // Metamask-card on the top
  if (transferType == TransferType.ibc2gra) {
    gbNotifier.resetFromAddress();
    keplrNotifier.resetTransferPayload();
    selectTokenNotifier.resetState();
  }
  // Metamask-card on the bottom
  else if (transferType == TransferType.gra2ibc) {
    gbNotifier.resetToAddress();
  }
}

void onMetamaskCardDropDown(
  final BuildContext context,
  final WidgetRef ref,
  final int selectedIndex,
) {
  showChainSelectionDialog(
    dialogTitle: S.current.SELECT_CHAIN_DIALOG_TITLE,
    context: context,
    selectedOptionIndex: selectedIndex,
    options: [
      S.current.TRANSFER_TYPE_METAMASK,
      ...Config.keplr.ibcChains.map((_) => _.label),
    ],
    icons: [
      const ImageNetworkOrAssetWidget(imageUrl: Assets.logoEthereum),
      ...Config.keplr.ibcChains.map(
        (e) => ImageNetworkOrAssetWidget(imageUrl: e.iconUri),
      ),
    ],
    chainHealthChecks: [
      Future.value(Tuple2<bool, String>(true, S.current.CHAIN_RPC_URL_SUCCESS)),
      ...Config.keplr.ibcChains
          .map((e) => ChainInfoService.isChainWorking(e.chainName))
          .toList(),
    ],
    onSelectionChanged: (int index) async {
      // since Ethereum is in the list of options, we need to offset the index
      index--;
      Chain selectedChain = index == -1
          ? Chain.ethereum
          : Config.keplr.ibcChains[index].chainName;

      final transferType = ref.read(gravityBridgeProvider).transferType;
      // MetamaskCard on the top
      if (transferType == TransferType.ibc2gra ||
          transferType == TransferType.eth2fwd) {
        ref.read(gravityBridgeProvider.notifier).setFromChain(selectedChain);

        // when changing selected network
        // set from wallet type regarding of the transfer type
        if (selectedChain == Chain.ethereum) {
          ref
              .read(gravityBridgeProvider.notifier)
              .setFromWalletType(WalletType.metamask);
        } else {
          ref
              .read(gravityBridgeProvider.notifier)
              .setFromWalletType(WalletType.keplr);
        }
      }
      // MetamaskCard on the bottom
      else if (transferType == TransferType.gra2ibc ||
          transferType == TransferType.gra2eth) {
        ref.read(gravityBridgeProvider.notifier).setToChain(selectedChain);

        // when changing selected network
        // set from wallet type regarding of the transfer type
        if (selectedChain == Chain.ethereum) {
          ref
              .read(gravityBridgeProvider.notifier)
              .setToWalletType(WalletType.metamask);
        } else {
          ref
              .read(gravityBridgeProvider.notifier)
              .setToWalletType(WalletType.keplr);
        }
      }
    },
  );
}

Future<void> onKeplrCardWalletButtonConnect(
  final BuildContext context,
  final WidgetRef ref,
) async {
  Navigator.pop(context);
  final gbNotifier = ref.read(gravityBridgeProvider.notifier);
  final walletAddr = await ref.read(keplrProvider.notifier).connectKeplr(
      chain: ref.read(gravityBridgeProvider).forwardChain.chainName);

  if (walletAddr.isNotEmpty) {
    gbNotifier.setIsKeplrCardCardConnected(true);
    final transferType = ref.read(gravityBridgeProvider).transferType;
    if (transferType == TransferType.gra2ibc ||
        transferType == TransferType.gra2eth) {
      gbNotifier.setFromAddress(walletAddr);
    } else if (transferType == TransferType.ibc2gra) {
      gbNotifier.setToAddress(walletAddr);
    } else if (transferType == TransferType.eth2fwd) {
      gbNotifier.setToAddress(walletAddr);
    }
  }
}

void onKeplrCardWalletButtonDisconnect(final WidgetRef ref) {
  final gbNotifier = ref.read(gravityBridgeProvider.notifier);
  final keplrNotifier = ref.read(keplrProvider.notifier);
  final selectTokenNotifier = ref.read(selectTokenProvider.notifier);
  final transferType = ref.read(gravityBridgeProvider).transferType;
  gbNotifier.setIsKeplrCardCardConnected(false);
  // Keplr-card on the top
  if (transferType == TransferType.gra2ibc ||
      transferType == TransferType.gra2eth) {
    gbNotifier.resetFromAddress();
    keplrNotifier.resetTransferPayload();
    selectTokenNotifier.resetState();
  }
  // Keplr-card on the bottom
  else if (transferType == TransferType.ibc2gra ||
      transferType == TransferType.eth2fwd) {
    gbNotifier.resetToAddress();
  }
}

void onKeplrCardDropDown(final BuildContext context, final WidgetRef ref) {
  showChainSelectionDialog(
    dialogTitle: S.current.SELECT_CHAIN_DIALOG_TITLE,
    context: context,
    selectedOptionIndex: Config.keplr.forwardChains.indexWhere((_) =>
        _.chainName == ref.read(gravityBridgeProvider).forwardChain.chainName),
    options: Config.keplr.forwardChains.map((e) => e.label).toList(),
    icons: Config.keplr.forwardChains
        .map((e) => ImageNetworkOrAssetWidget(imageUrl: e.iconUri))
        .toList(),
    chainHealthChecks: Config.keplr.forwardChains
        .map((e) => ChainInfoService.isChainWorking(e.chainName))
        .toList(),
    onSelectionChanged: (int index) async {
      final ForwardChain chain = Config.keplr.forwardChains[index];

      final transferType = ref.read(gravityBridgeProvider).transferType;
      // KeplrCard on the top
      if (transferType == TransferType.gra2ibc ||
          transferType == TransferType.gra2eth) {
        ref.read(gravityBridgeProvider.notifier).setFromChain(chain.chainName);
        ref
            .read(gravityBridgeProvider.notifier)
            .setFromWalletType(WalletType.keplr);
      }
      // KeplrCard on the bottom
      else if (transferType == TransferType.ibc2gra ||
          transferType == TransferType.eth2fwd) {
        ref.read(gravityBridgeProvider.notifier).setToChain(chain.chainName);
        ref
            .read(gravityBridgeProvider.notifier)
            .setToWalletType(WalletType.keplr);
      }
    },
  );
}
