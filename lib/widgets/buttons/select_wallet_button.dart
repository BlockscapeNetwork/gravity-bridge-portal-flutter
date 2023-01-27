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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/alert_field.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/keplr_service.dart';
import 'package:gravity_bridge_flutter/services/ledger/ledger_service.dart';
import 'package:gravity_bridge_flutter/services/ledger/lib/apdu.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/connect_button.dart';
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectWalletButton extends StatelessWidget {
  final bool
      isInMetamaskCard; // this parameter defines if the SelectWalletButton in MetamaskCard or KeplrCard
  final bool isConnected;
  final VoidCallback onDisconnect;
  final VoidCallback onConnect;
  const SelectWalletButton({
    required this.isInMetamaskCard,
    required this.isConnected,
    required this.onDisconnect,
    required this.onConnect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectButton(
      width: isMobile(context)
          ? double.infinity
          : isConnected
              ? Sizes.fixedButtonWidthLarge
              : Sizes.fixedButtonWidthMedium,
      height: Sizes.fixedButtonHeight,
      svgAssetAsString: true,
      iconUrl: !isConnected
          ? SvgAssetsAsString.uiIconsLink
          : SvgAssetsAsString.uiIconsLinkOff,
      text: !isConnected
          ? S.current.TRANSFER_TYPE_CONNECT
          : S.current.TRANSFER_TYPE_DISCONNECT,
      isSelected: isConnected,
      spaceBetween: isMobile(context),
      onPressed: () => isConnected
          ? onDisconnect()
          : showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => SelectWalletDialog(
                isInMetamaskCard: isInMetamaskCard,
                onConnect: onConnect,
              ),
            ).then((_) => context
              .read(gravityBridgeProvider.notifier)
              .setLedgerErrorMessage("")),
    );
  }
}

class SelectWalletDialog extends ConsumerStatefulWidget {
  final bool isInMetamaskCard;
  final VoidCallback onConnect;

  const SelectWalletDialog({
    required this.isInMetamaskCard,
    required this.onConnect,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SelectWalletDialog> createState() => _SelectWalletDialogState();
}

class _SelectWalletDialogState extends ConsumerState<SelectWalletDialog> {
  bool keplrOnHoverVal = false;
  bool ledgerOnHoverVal = false;
  bool ledgerLoading = false;
  @override
  Widget build(BuildContext context) {
    final fromChain = ref.read(gravityBridgeProvider).fromChain;
    final toChain = ref.read(gravityBridgeProvider).toChain;
    final transferType = ref.read(gravityBridgeProvider).transferType;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile(context) ? double.infinity : 350,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// DIALOG TITLE
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.SELECT_WALLET,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Sizes.fontSizeMedium,
                    ),
                  ),
                  IconButton(
                      splashRadius: Sizes.buttonSplashRadius,
                      padding: const EdgeInsets.all(0),
                      icon: ImageNetworkOrAssetWidget(
                        svgAssetAsString: true,
                        imageUrl: SvgAssetsAsString.uiIconsClose,
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: Sizes.iconSizeMedium,
                        height: Sizes.iconSizeMedium,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),

            const Divider(),

            /// DIALOG CONTENT
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding16,
              ),
              child: Column(
                children: [
                  /// KEPLR BUTTON
                  DisabledWidget(
                    disabled: KeplrService.isKeplrInstalled() == false,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(Sizes.radius),
                      hoverColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      onHover: (val) {
                        keplrOnHoverVal = val;
                        setState(() {});
                      },
                      onTap: () {
                        final gbNotifier =
                            ref.read(gravityBridgeProvider.notifier);
                        final transferType =
                            ref.read(gravityBridgeProvider).transferType;

                        if (widget.isInMetamaskCard) {
                          // Metamask-card on the top
                          if (transferType == TransferType.ibc2gra) {
                            gbNotifier.setFromWalletType(WalletType.keplr);
                          }
                          // Metamask-card on the bottom
                          else if (transferType == TransferType.gra2ibc) {
                            gbNotifier.setToWalletType(WalletType.keplr);
                          }
                        } else {
                          // Keplr-card on the top
                          if (transferType == TransferType.gra2ibc ||
                              transferType == TransferType.gra2eth) {
                            gbNotifier.setFromWalletType(WalletType.keplr);
                          }
                          // Keplr-card on the bottom
                          else if (transferType == TransferType.ibc2gra ||
                              transferType == TransferType.eth2fwd) {
                            gbNotifier.setToWalletType(WalletType.keplr);
                          }
                        }

                        widget.onConnect();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.padding12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.radius),
                          border: Border.all(
                            width: 1,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Sizes.iconSize35),
                              child: const SizedBox(
                                width: Sizes.iconSize35,
                                height: Sizes.iconSize35,
                                child: ImageNetworkOrAssetWidget(
                                  imageUrl: Assets.logoKeplr,
                                ),
                              ),
                            ),
                            const SizedBox(width: Sizes.paddingMicro),
                            Text(
                              S.current.KEPLR,
                              style: TextStyle(
                                color: keplrOnHoverVal == true
                                    ? Theme.of(context).primaryColorLight
                                    : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: Sizes.padding16 / 2),

                  /// LEDGER BUTTON
                  DisabledWidget(
                    disabled: (!fromChain.isSupportedByLedger &&
                            ((widget.isInMetamaskCard &&
                                    transferType == TransferType.ibc2gra) ||
                                (!widget.isInMetamaskCard &&
                                    transferType == TransferType.gra2ibc))) ||
                        (!toChain.isSupportedByLedger &&
                            ((widget.isInMetamaskCard &&
                                    transferType == TransferType.gra2ibc) ||
                                (!widget.isInMetamaskCard &&
                                    transferType == TransferType.eth2fwd))),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(Sizes.radius),
                      hoverColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      onHover: (val) {
                        ledgerOnHoverVal = val;
                        setState(() {});
                      },
                      onTap: () {
                        setState(() {
                          ledgerLoading = true;
                        });
                        final gbNotifier =
                            ref.read(gravityBridgeProvider.notifier);
                        final transferType =
                            ref.read(gravityBridgeProvider).transferType;

                        if (widget.isInMetamaskCard) {
                          // Metamask-card on the top
                          if (transferType == TransferType.ibc2gra) {
                            gbNotifier.setFromWalletType(WalletType.ledger);
                          }
                          // Metamask-card on the bottom
                          else if (transferType == TransferType.gra2ibc) {
                            gbNotifier.setToWalletType(WalletType.ledger);
                          }
                        } else {
                          // Keplr-card on the top
                          if (transferType == TransferType.gra2ibc ||
                              transferType == TransferType.gra2eth) {
                            gbNotifier.setFromWalletType(WalletType.ledger);
                          }
                          // Keplr-card on the bottom
                          else if (transferType == TransferType.ibc2gra ||
                              transferType == TransferType.eth2fwd) {
                            gbNotifier.setToWalletType(WalletType.ledger);
                          }
                        }

                        LedgerService.getAddressFromLedger(
                          ref.read(gravityBridgeProvider).fromChain.chainPrefix,
                          ref,
                        ).then(
                          (_) async {
                            // set ledger error message to an empty string because it does not update automatically
                            ref
                                .read(gravityBridgeProvider.notifier)
                                .setLedgerErrorMessage("");

                            final gbNotifier =
                                ref.read(gravityBridgeProvider.notifier);
                            final transferType =
                                ref.read(gravityBridgeProvider).transferType;

                            if (widget.isInMetamaskCard) {
                              gbNotifier.setIsMetamaskCardConnected(true);
                              // Metamask-card on the top
                              if (transferType == TransferType.ibc2gra) {
                                SECP256k1AddrResponse response =
                                    await LedgerService.getAddressFromLedger(
                                  ref
                                      .read(gravityBridgeProvider)
                                      .fromChain
                                      .chainPrefix,
                                  ref,
                                );
                                gbNotifier.setFromAddress(response.addr);
                              }
                              // Metamask-card on the bottom
                              else if (transferType == TransferType.gra2ibc) {
                                SECP256k1AddrResponse response =
                                    await LedgerService.getAddressFromLedger(
                                  ref
                                      .read(gravityBridgeProvider)
                                      .toChain
                                      .chainPrefix,
                                  ref,
                                );
                                gbNotifier.setToAddress(response.addr);
                              }
                            } else {
                              gbNotifier.setIsKeplrCardCardConnected(true);
                              // Keplr-card on the top
                              if (transferType == TransferType.gra2ibc ||
                                  transferType == TransferType.gra2eth) {
                                SECP256k1AddrResponse response =
                                    await LedgerService.getAddressFromLedger(
                                  ref
                                      .read(gravityBridgeProvider)
                                      .fromChain
                                      .chainPrefix,
                                  ref,
                                );
                                gbNotifier.setFromAddress(response.addr);
                              }
                              // Keplr-card on the bottom
                              else if (transferType == TransferType.ibc2gra ||
                                  transferType == TransferType.eth2fwd) {
                                SECP256k1AddrResponse response =
                                    await LedgerService.getAddressFromLedger(
                                  ref
                                      .read(gravityBridgeProvider)
                                      .toChain
                                      .chainPrefix,
                                  ref,
                                );
                                gbNotifier.setToAddress(response.addr);
                              }
                            }
                            Navigator.pop(context);
                          },
                          onError: (err) {
                            ref
                                .read(gravityBridgeProvider.notifier)
                                .setLedgerErrorMessage(err.toString());
                          },
                        ).whenComplete(() {
                          setState(() {
                            ledgerLoading = false;
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.padding12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.radius),
                          border: Border.all(
                            width: 1,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Sizes.iconSize35),
                              child: const SizedBox(
                                width: Sizes.iconSize35,
                                height: Sizes.iconSize35,
                                child: ImageNetworkOrAssetWidget(
                                  imageUrl: Assets.logoLedger,
                                ),
                              ),
                            ),
                            const SizedBox(width: Sizes.paddingMicro),
                            Text(
                              S.current.LEDGER,
                              style: TextStyle(
                                color: ledgerOnHoverVal == true
                                    ? Theme.of(context).primaryColorLight
                                    : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            Expanded(child: Container()),
                            ledgerLoading
                                ? FractionallySizedBox(
                                    heightFactor: 0.4,
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: ledgerOnHoverVal == true
                                            ? Theme.of(context)
                                                .primaryColorLight
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: Sizes.iconSizeMedium,
                                    height: Sizes.iconSizeMedium,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: ImageNetworkOrAssetWidget(
                                      svgAssetAsString: true,
                                      imageUrl:
                                          SvgAssetsAsString.uiIconsCableConnect,
                                      width: Sizes.iconSize12,
                                      height: Sizes.iconSize12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// "LEDGER DOES NOT SUPPORT CHAIN" TEXT BOX
                  _LedgerSupportAlert(widget.isInMetamaskCard),

                  /// ERROR TEXT BOX
                  ref.watch(gravityBridgeProvider.select(
                                  (state) => state.ledgerErrorMessage)) ==
                              "" ||
                          ref.watch(gravityBridgeProvider.select(
                                  (state) => state.ledgerErrorMessage)) ==
                              "Success"
                      ? Container()
                      : Padding(
                          padding:
                              const EdgeInsets.only(top: Sizes.paddingSmall),
                          child: AlertField(
                            text: TextSpan(
                              text: ref.watch(gravityBridgeProvider
                                  .select((state) => state.ledgerErrorMessage)),
                            ),
                            iconAndBorderColor:
                                Theme.of(context).colorScheme.onError,
                          ),
                        ),

                  /// "Keplr not installed" text
                  KeplrService.isKeplrInstalled() == false
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: Sizes.paddingSmall),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  S.current.KEPLR_NOT_FOUND_WARNING_TEXT,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: Sizes.fontSizeSmall,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      Constants.keplrChromeExtensionLink));
                                },
                                child: ImageNetworkOrAssetWidget(
                                  svgAssetAsString: true,
                                  imageUrl: SvgAssetsAsString.uiIconsLaunch,
                                  color: Theme.of(context).colorScheme.primary,
                                  width: Sizes.iconSizeXSmall,
                                  height: Sizes.iconSizeXSmall,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LedgerSupportAlert extends ConsumerWidget {
  final bool isMetamaskCard;
  const _LedgerSupportAlert(this.isMetamaskCard);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferType = ref.read(gravityBridgeProvider).transferType;
    final fromChain = ref.read(gravityBridgeProvider).fromChain;
    final toChain = ref.read(gravityBridgeProvider).toChain;

    if (isMetamaskCard) {
      if (!fromChain.isSupportedByLedger &&
          transferType == TransferType.ibc2gra) {
        return Padding(
          padding: const EdgeInsets.only(top: Sizes.paddingSmall),
          child: AlertField(
            text: TextSpan(
                text: S.current
                    .CHAIN_NOT_SUPPORTED_BY_LEDGER(fromChain.chainName)),
            textColor: Theme.of(context).colorScheme.onPrimary,
            iconAndBorderColor: Theme.of(context).colorScheme.onError,
          ),
        );
      } else if (!toChain.isSupportedByLedger &&
          transferType == TransferType.gra2ibc) {
        return Padding(
          padding: const EdgeInsets.only(top: Sizes.paddingSmall),
          child: AlertField(
            text: TextSpan(
                text:
                    S.current.CHAIN_NOT_SUPPORTED_BY_LEDGER(toChain.chainName)),
            textColor: Theme.of(context).colorScheme.onPrimary,
            iconAndBorderColor: Theme.of(context).colorScheme.onError,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }
    // isKeplrCard
    else {
      if (!fromChain.isSupportedByLedger &&
          transferType == TransferType.gra2ibc) {
        return Padding(
          padding: const EdgeInsets.only(top: Sizes.paddingSmall),
          child: AlertField(
            text: TextSpan(
                text: S.current
                    .CHAIN_NOT_SUPPORTED_BY_LEDGER(fromChain.chainName)),
            textColor: Theme.of(context).colorScheme.onPrimary,
            iconAndBorderColor: Theme.of(context).colorScheme.onError,
          ),
        );
      } else if (!toChain.isSupportedByLedger &&
          transferType == TransferType.eth2fwd) {
        return Padding(
          padding: const EdgeInsets.only(top: Sizes.paddingSmall),
          child: AlertField(
            text: TextSpan(
                text:
                    S.current.CHAIN_NOT_SUPPORTED_BY_LEDGER(toChain.chainName)),
            textColor: Theme.of(context).colorScheme.onPrimary,
            iconAndBorderColor: Theme.of(context).colorScheme.onError,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }
  }
}
