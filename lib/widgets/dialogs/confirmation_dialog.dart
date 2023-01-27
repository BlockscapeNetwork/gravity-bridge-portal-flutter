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
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/custom_outlined_button.dart';

import '../../generated/l10n.dart';
import '../../services/themedata_service.dart';

/// Dialog with YES/NO buttons.
/// Based on Philip's design: https://philipp722480.invisionapp.com/console/share/6S2MA5PUGZR/948991998/play.
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final String? confirmText;
  final String? rejectText;
  final VoidCallback onConfirm;
  final VoidCallback onReject;

  /// true makes confirm button red
  final bool isConfirmDestructive;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.onConfirm,
    required this.onReject,
    this.confirmText,
    this.rejectText,
    this.content,
    this.isConfirmDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius),
      ),
      insetPadding: isMobile(context)
          ? const EdgeInsets.symmetric(horizontal: Sizes.paddingMicro)
          : const EdgeInsets.all(0),
      child: Container(
        width: isMobile(context) ? MediaQuery.of(context).size.width : 400,
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.padding24, horizontal: Sizes.padding16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Sizes.padding32),
            if (content != null) content!,
            if (content != null) const SizedBox(height: Sizes.padding32),
            SizedBox(
              height: Sizes.fixedButtonHeight,
              child: ElevatedButton(
                child: Text(
                  confirmText ?? S.current.YES,
                  style: TextStyle(
                    fontSize: Sizes.fontSize16,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: Sizes.paddingSmall,
                      vertical: Sizes.paddingSmall,
                    ),
                  ),
                  backgroundColor: isConfirmDestructive
                      ? MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        )
                      : null,
                ),
                onPressed: onConfirm,
              ),
            ),
            const SizedBox(height: Sizes.padding16),
            SizedBox(
              height: Sizes.fixedButtonHeight,
              child: CustomOutlinedButton(
                child: Text(
                  rejectText ?? S.current.NO,
                  style: TextStyle(
                    fontSize: Sizes.fontSize16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: Sizes.paddingSmall,
                      vertical: Sizes.paddingSmall,
                    ),
                  ),
                ),
                onPressed: onReject,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
