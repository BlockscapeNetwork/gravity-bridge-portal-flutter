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
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/gravity_error.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_state.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/content_card.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_recent_batches.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_recent_transactions.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_supply_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_transaction_queue.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_volume_info.dart';
import 'package:gravity_bridge_flutter/services/route_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/alert_dialog_outlined_button.dart';
import 'package:gravity_bridge_flutter/widgets/layout_builder_helper_widget.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/transaction_progress_dialog/transaction_progress_dialog.dart';
import 'package:gravity_bridge_flutter/widgets/license_accept_action.dart';
import 'package:gravity_bridge_flutter/widgets/main_body.dart';
import 'package:gravity_bridge_flutter/widgets/dialogs/main_page_dialog.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gravity_bridge_flutter/models/transaction_progress.dart';

class GravityBridgePage extends ConsumerStatefulWidget {
  const GravityBridgePage({Key? key}) : super(key: key);

  @override
  _GravityBridgePageState createState() => _GravityBridgePageState();
}

class _GravityBridgePageState extends ConsumerState<GravityBridgePage> {
  Future<bool>? _precacheProcess;

  @override
  void didChangeDependencies() {
    _precacheProcess ??= _precache(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<GravityBridgeState>(
        gravityBridgeProvider, _listenForProviderChanges);

    if (_precacheProcess == null) return Container();

    return FutureBuilder<bool?>(
      future: _precacheProcess,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const SizedBox();
        } else {
          return const MainBody(
            constraints: BoxConstraints(maxWidth: Sizes.desktopMaxWidth),
            child: _MainBody(),
          );
        }
      },
    );
  }

  String mapMainPageErrorTypeToActionText(GravityErrorType type) {
    switch (type) {
      case GravityErrorType.keplrExtensionMissing:
        return S.current.GET_KEPLR_CHROME;
      case GravityErrorType.metamaskExtensionMissing:
        return S.current.GET_METAMASK_CHROME;

      default:
        return S.current.OK;
    }
  }

  void Function() mapMainPageErrorTypeToAction(
      BuildContext context, GravityErrorType type) {
    switch (type) {
      case GravityErrorType.keplrExtensionMissing:
        return () async {
          await launchUrl(Uri.parse(Constants.keplrChromeExtensionLink));
          Navigator.of(context)
              .popUntil(ModalRoute.withName(RouteService.gravityBridgePage));
        };
      case GravityErrorType.metamaskExtensionMissing:
        return () async {
          await launchUrl(Uri.parse(Constants.metamaskChromeExtensionLink));
          Navigator.of(context)
              .popUntil(ModalRoute.withName(RouteService.gravityBridgePage));
        };
      default:
        return () {
          Navigator.of(context)
              .popUntil(ModalRoute.withName(RouteService.gravityBridgePage));
        };
    }
  }

  void _listenForProviderChanges(
      GravityBridgeState? oldState, GravityBridgeState currentState) {
    if (currentState.error != null) {
      dlogError(
        error: currentState.error,
        stackTrace: currentState.error!.stackTrace,
      );

      if (currentState.error!.errorType == GravityErrorType.userRejection) {
        showDialog(
          context: context,
          builder: (context) => TransferProgressDialog(
            transactionProgress: TransactionRejectedByUser(),
            fromWallet: ref.read(gravityBridgeProvider).fromWalletType,
          ),
        );
      } else if (currentState.error!.errorType ==
          GravityErrorType.metamaskUnsupportedNetwork) {
        showMainPageErrorDialog(
          context,
          title: Text(S.current.WRONG_NETWORK_TITLE),
          content: Text(currentState.error!.originalError.toString()),
          icon: const Image(
            image: AssetImage(Assets.logoMetamask),
            width: 128,
            height: 128,
          ),
          actions: [
            AlertDialogOutlinedButton(
                child: Text(
                  mapMainPageErrorTypeToActionText(
                    currentState.error!.errorType,
                  ),
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  ref.read(gravityBridgeProvider.notifier).resetError();
                  mapMainPageErrorTypeToAction(
                          context, currentState.error!.errorType)
                      .call();
                })
          ],
          onCancel: () {},
        );
      } else {
        showMainPageErrorDialog(
          context,
          title: Text(S.current.ERROR_DIALOG_TITLE),
          content: Text(currentState.error!.originalError.toString()),
          actions: [
            AlertDialogOutlinedButton(
                child: Text(
                  mapMainPageErrorTypeToActionText(
                      currentState.error!.errorType),
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  ref.read(gravityBridgeProvider.notifier).resetError();
                  mapMainPageErrorTypeToAction(
                          context, currentState.error!.errorType)
                      .call();
                })
          ],
          onCancel: () {},
        );
      }
    } else if (currentState.licenceAccepted == false) {
      showMainPageDialog(
        context,
        onCancel: () {},
        dismisable: false,
        title: Text(
          S.current.AGREEMENT_TITLE,
          style: const TextStyle(
            fontSize: Sizes.fontSizeMedium,
          ),
        ),
        content: Text(
          S.current.AGREEMENT_TEXT,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        actions: [
          LicenceAcceptAction(
            acceptButtonText: S.current.ACCEPT_AND_PROCEED,
            onAccept: () {
              ref.read(gravityBridgeProvider.notifier).acceptLicenceAgreement();

              Navigator.popUntil(
                context,
                ModalRoute.withName(RouteService.gravityBridgePage),
              );
            },
            checkBoxText: S.current.ACCEPT_AGREEMENT_CHECKBOX,
          ),
        ],
      );
    }
  }
}

class _MainBody extends ConsumerWidget {
  const _MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring:
          ref.watch(gravityBridgeProvider.select((s) => s.loading)) == true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilderHelper(
            mobile: Card(
              shadowColor: Theme.of(context).backgroundColor,
              color: Theme.of(context).backgroundColor,
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  children: [
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    const ContentCard(),
                  ],
                ),
              ),
            ),
            desktop: Column(
              children: [
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                Padding(
                  padding: generatePageHorizontalPadding(context),
                  child: LayoutBuilder(builder: (context, constrains) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constrains.maxWidth -
                                (MediaQuery.of(context).size.width >
                                        Sizes.desktopMaxWidth1000
                                    ? Sizes.padding30
                                    : Sizes.padding12) -
                                Sizes.widgetsMaxWidth,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: Sizes.paddingMedium,
                                  bottom: Sizes.paddingXSmall,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    S.current.TRANSFER_TOKENS,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: Sizes.fontSizeLarge,
                                        ),
                                  ),
                                ),
                              ),
                              Card(
                                shadowColor: Theme.of(context).backgroundColor,
                                color: Theme.of(context).backgroundColor,
                                margin: const EdgeInsets.all(0),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: ContentCard(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width >
                                  Sizes.desktopMaxWidth1000
                              ? Sizes.padding30
                              : Sizes.padding12,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: Sizes.widgetsMaxWidth,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: Sizes.paddingMedium,
                                  bottom: Sizes.paddingXSmall,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    S.current.WIDGETS,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: Sizes.fontSizeLarge,
                                        ),
                                  ),
                                ),
                              ),
                              const GravityBridgeRecentTransactions(),
                              const SizedBox(height: Sizes.padding16),
                              const GravityBridgeRecentBatches(),
                              const SizedBox(height: Sizes.padding16),
                              const GravityBridgeTransactionQueue(),
                              const SizedBox(height: Sizes.padding16),
                              const GravityBridgeVolumeInfo(),
                              const SizedBox(height: Sizes.padding16),
                              const GravityBridgeSupplyInfo(),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: Sizes.paddingLarge + Sizes.paddingMedium),
          ..._getPreFooter(context),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  List<Widget> _getPreFooter(BuildContext context) {
    return [
      Wrap(
        children: [
          Text(
            S.current.WHAT_IS_HAPPENING,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(width: 4.0),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Link(
              target: LinkTarget.blank,
              uri: Uri.parse(Constants.gravityBridgeHowTo),
              builder: (context, followLink) => GestureDetector(
                onTap: followLink,
                child: Text(S.current.READ_THIS,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 4.0),
      Wrap(
        children: [
          Text(
            S.current.SMART_CONTRACT_USED,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(width: 4.0),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Link(
              target: LinkTarget.blank,
              uri: Uri.parse(Constants.cliGravityBridgeToEthereum),
              builder: (context, followLink) => GestureDetector(
                onTap: followLink,
                child: Text(Config.metamask.gravityContractAddr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
          ),
        ],
      ),
    ];
  }
}

class ChainAlert extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color? color;
  const ChainAlert({
    super.key,
    required this.icon,
    required this.text,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Sizes.paddingMicro, bottom: Sizes.paddingNano),
      child: GravityBridgeContainer(
        padding: const EdgeInsets.all(Sizes.paddingNano),
        color: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).colorScheme.background
            : Colors.transparent,
        borderColor: color ?? Theme.of(context).colorScheme.error,
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: color ?? Theme.of(context).colorScheme.error,
              fontSize: Sizes.fontSizeSmall,
            ),
          ),
          leading: icon,
        ),
      ),
    );
  }
}

Future<bool> _precache(BuildContext context) async {
  final precache = Future.wait([
    precacheImage(const AssetImage(Assets.logoBlockscapeMono), context),
    precacheImage(const AssetImage(Assets.logoDesktop), context),
    precacheImage(const AssetImage(Assets.logoMobile), context),
    precacheImage(const AssetImage(Assets.logoMetamask), context),
    precacheImage(const AssetImage(Assets.logoKeplr), context),
    precacheImage(const AssetImage(Assets.logoGravityBridge), context),
    precacheImage(const AssetImage(Assets.logoIbcToken), context),
    precacheImage(const AssetImage(Assets.logoEthereum), context),
    precacheImage(const AssetImage(Assets.smIconsDiscord), context),
    precacheImage(const AssetImage(Assets.smIconsGithub), context),
    precacheImage(const AssetImage(Assets.smIconsMedium), context),
    precacheImage(const AssetImage(Assets.smIconsTwitter), context),
    precacheImage(const AssetImage(Assets.uiIconsAssessment), context),
    precacheImage(const AssetImage(Assets.uiIconsAttention), context),
    precacheImage(const AssetImage(Assets.uiIconsBarChart), context),
    precacheImage(const AssetImage(Assets.uiIconsBurger), context),
    precacheImage(const AssetImage(Assets.uiIconsCheckboxSet), context),
    precacheImage(const AssetImage(Assets.uiIconsCheckboxUnset), context),
    precacheImage(const AssetImage(Assets.uiIconsCheckBox), context),
    precacheImage(const AssetImage(Assets.uiIconsChevronRight), context),
    precacheImage(const AssetImage(Assets.uiIconsClose), context),
    precacheImage(const AssetImage(Assets.uiIconsCopy), context),
    precacheImage(const AssetImage(Assets.uiIconsDashboard), context),
    precacheImage(const AssetImage(Assets.uiIconsDay), context),
    precacheImage(const AssetImage(Assets.uiIconsExchange), context),
    precacheImage(const AssetImage(Assets.uiIconsExpandMore), context),
    precacheImage(const AssetImage(Assets.uiIconsInfo2), context),
    precacheImage(const AssetImage(Assets.uiIconsInfoCopy), context),
    precacheImage(const AssetImage(Assets.uiIconsInfo), context),
    precacheImage(const AssetImage(Assets.uiIconsInsertChartOutlined), context),
    precacheImage(const AssetImage(Assets.uiIconsKeyboardArrowDown), context),
    precacheImage(const AssetImage(Assets.uiIconsLaunch), context),
    precacheImage(const AssetImage(Assets.uiIconsLinkOff), context),
    precacheImage(const AssetImage(Assets.uiIconsLink), context),
    precacheImage(const AssetImage(Assets.uiIconsLockOpen), context),
    precacheImage(const AssetImage(Assets.uiIconsLock), context),
    precacheImage(const AssetImage(Assets.uiIconsMore), context),
    precacheImage(const AssetImage(Assets.uiIconsNight), context),
    precacheImage(const AssetImage(Assets.uiIconsNotification), context),
    precacheImage(const AssetImage(Assets.uiIconsRightArrow), context),
    precacheImage(const AssetImage(Assets.uiIconsSettings), context),
    precacheImage(const AssetImage(Assets.uiIconsSpaceDashboard), context),
    precacheImage(const AssetImage(Assets.uiIconsSpeedFast), context),
    precacheImage(const AssetImage(Assets.uiIconsSpeedMedium), context),
    precacheImage(const AssetImage(Assets.uiIconsSpeedSlow), context),
    precacheImage(const AssetImage(Assets.uiIconsStateCanceled), context),
    precacheImage(const AssetImage(Assets.uiIconsStateDone), context),
    precacheImage(const AssetImage(Assets.uiIconsStateRunning), context),
    precacheImage(const AssetImage(Assets.uiIconsToggleOff), context),
    precacheImage(const AssetImage(Assets.uiIconsToggleOn), context),
    precacheImage(const AssetImage(Assets.uiIconsTrendingUp), context),
  ]);

  await precache;

  return true;
}
