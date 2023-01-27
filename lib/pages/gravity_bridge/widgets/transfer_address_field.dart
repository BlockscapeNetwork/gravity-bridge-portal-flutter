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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_provider.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_text_field.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';

class TransferAddressField extends StatefulWidget {
  const TransferAddressField({
    Key? key,
    required this.isWidgetDisabled,
    required this.isInputEnabled,
    required this.controller,
    required this.transferType,
    required this.onChanged,
    required this.transferChain,
  }) : super(key: key);
  final bool isWidgetDisabled;
  final bool isInputEnabled;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final TransferType transferType;
  final Chain transferChain;

  @override
  State<TransferAddressField> createState() => _TransferAddressFieldState();
}

class _TransferAddressFieldState extends State<TransferAddressField> {
  late bool _isInputEnabled;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isInputEnabled = widget.isInputEnabled;
  }

  @override
  void didUpdateWidget(final TransferAddressField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isInputEnabled = widget.isInputEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return GravityBridgeContainer(
      textField: true,
      padding: Sizes.cardPadding.copyWith(
        top: Sizes.paddingTextField,
        bottom: Sizes.paddingTextField,
      ),
      title: S.current.TRANSFER_ADDRESS,
      child: Stack(
        children: [
          /// TEXT FIELD
          Padding(
            padding: EdgeInsets.only(
              top: isMobile(context) ? Sizes.padding16 : 0,
            ),
            child: GravityBridgeTextField(
              maxLines: isMobile(context) ? 2 : 1,
              focusNode: focusNode,
              isInputEnabled: _isInputEnabled,
              isWidgetDisabled: widget.isWidgetDisabled,
              additionalPadding:
                  EdgeInsets.only(top: isMobile(context) ? 19 : 40),
              controller: widget.controller,
              hintText: S.current.ADDRESS_HINT(
                  context.read(gravityBridgeProvider).toChain.chainName),
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              style: _isInputEnabled
                  ? null
                  : TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              validator: (transferAddress) =>
                  isTransferAddressValid(transferAddress, widget.transferChain),
              onChanged: widget.onChanged,
            ),
          ),

          /// LOCK BUTTON
          Positioned(
            top: isMobile(context) ? 49 : 23,
            right: isMobile(context) ? Sizes.padding16 : Sizes.paddingMedium,
            child: DisabledWidget(
              disabled: widget.isWidgetDisabled,
              child: InkWell(
                splashColor: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 202),
                  child: SizedBox(
                    child: _OutlinedIcon(
                      svgAssetAsString: true,
                      iconUrl: _isInputEnabled
                          ? SvgAssetsAsString.uiIconsLockOpen
                          : SvgAssetsAsString.uiIconsLock,
                      message: _isInputEnabled
                          ? S.current.TRANSFER_ADDRESS_LOCK
                          : S.current.TRANSFER_ADDRESS_UNLOCK,
                      widgetDisabled: widget.isWidgetDisabled,
                    ),
                  ),
                ),
                onTap: () async {
                  setState(() => _isInputEnabled = !_isInputEnabled);

                  if (_isInputEnabled) {
                    int timeoutCount = 0;
                    while (!focusNode.hasFocus) {
                      timeoutCount++;
                      focusNode.requestFocus();
                      await Future.delayed(
                        const Duration(milliseconds: 10),
                      );
                      if (timeoutCount >= 25) break;
                    }
                  } else {
                    focusNode.unfocus();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OutlinedIcon extends StatelessWidget {
  const _OutlinedIcon({
    Key? key,
    required this.svgAssetAsString,
    required this.iconUrl,
    required this.message,
    required this.widgetDisabled,
  }) : super(key: key);

  final bool svgAssetAsString;
  final String iconUrl;
  final String message;
  final bool widgetDisabled;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: widgetDisabled
              ? Theme.of(context).colorScheme.onSecondary
              : Theme.of(context).backgroundColor,
          border: Border.all(
            color: widgetDisabled
                ? Theme.of(context).backgroundColor
                : Theme.of(context).colorScheme.primary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: ImageNetworkOrAssetWidget(
          svgAssetAsString: svgAssetAsString,
          imageUrl: iconUrl,
          color: Theme.of(context).colorScheme.onPrimary,
          width: Sizes.iconSizeMedium,
          height: Sizes.iconSizeMedium,
        ),
      ),
    );
  }
}
