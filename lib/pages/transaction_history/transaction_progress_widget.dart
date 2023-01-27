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

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/models/enums/transaction_status.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/services/transaction_history_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/dotted_horizontal_line_with_arrow_and_image.dart';
import 'package:gravity_bridge_flutter/widgets/rotating_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SelfUpdatingTransactionProgressWidget extends ConsumerStatefulWidget {
  final Transaction transaction;
  final double progressIconSize;
  final Color backgroundColor;
  const SelfUpdatingTransactionProgressWidget({
    super.key,
    required this.transaction,
    required this.backgroundColor,
    this.progressIconSize = Sizes.iconSize32,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelfUpdatingTransactionProgressWidgetState();
}

class _SelfUpdatingTransactionProgressWidgetState
    extends ConsumerState<SelfUpdatingTransactionProgressWidget> {
  int? confirmations;

  @override
  void initState() {
    super.initState();
    if (widget.transaction.isFromEth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(transactionHistoryProvider.notifier).startConfirmationUpdates(
              transaction: widget.transaction,
            );
      });
    }
  }

  @override
  void dispose() {
    ref
        .read(transactionHistoryProvider.notifier)
        .stopConfirmationUpdates(transaction: widget.transaction);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int? confirmations = ref.watch(
      transactionHistoryProvider.select((state) => state.transactions
          .firstWhereOrNull((e) => e.id == widget.transaction.id)
          ?.confirmations),
    );
    final Color arrowColor = Theme.of(context).colorScheme.surface;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: DottedLineWithArrow(
                color: arrowColor,
                showRightArrow: false,
              ),
            ),
            InkWell(
              onTap: () => launchUrl(
                Uri.tryParse(
                      scanLinkGenerator(
                          accountHash: widget.transaction.fromAddress,
                          txHash: widget.transaction.id),
                    ) ??
                    Uri(),
              ),
              hoverColor: Colors.transparent,
              child: (widget.transaction.isInProgress)
                  ? RotatingWidget(
                      fullRotationDuration: const Duration(seconds: 15),
                      child: _getTransactionStatusIcon(
                        context: context,
                        transaction: widget.transaction,
                        backgroundColor: widget.backgroundColor,
                        iconSize: widget.progressIconSize,
                      ),
                    )
                  : _getTransactionStatusIcon(
                      context: context,
                      transaction: widget.transaction,
                      backgroundColor: widget.backgroundColor,
                      iconSize: widget.progressIconSize,
                    ),
            ),
            Expanded(child: DottedLineWithArrow(color: arrowColor)),
          ],
        ),
        if (widget.transaction.isInProgress && confirmations != null)
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(
              "$confirmations / 96 blocks",
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10),
            ),
          ),
      ],
    );
  }
}

Widget _getTransactionStatusIcon({
  required final BuildContext context,
  required final Transaction transaction,
  required final Color backgroundColor,
  final double? iconSize,
}) {
  return IconWithCircle(
    svgAssetAsString: true,
    imageUrl: getTransactionStatusIconUrl(transaction),
    backgroundColor: backgroundColor,
    iconSize: iconSize,
  );
}

String getTransactionStatusIconUrl(final Transaction transaction) {
  if (transaction.status == TransactionStatus.failed ||
      transaction.status == TransactionStatus.canceled) {
    return SvgAssetsAsString.uiIconsStateCanceled;
  } else if (transaction.isInProgress) {
    return SvgAssetsAsString.uiIconsStateRunning;
  } else {
    return SvgAssetsAsString.uiIconsStateDone;
  }
}
