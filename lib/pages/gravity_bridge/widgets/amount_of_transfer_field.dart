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
import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_container.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/gravity_bridge_text_field.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';

class AmountOfTransferField extends StatelessWidget {
  const AmountOfTransferField({
    Key? key,
    this.currentBalance,
    this.balanceHint = "",
    required this.selectedTokenExist,
    required this.controller,
    required this.decimals,
    required this.disabledInput,
    this.validatorMessage,
    this.textStyle,
    this.action,
    this.inputFillColor,
  }) : super(key: key);

  final String? currentBalance;
  final String balanceHint;
  final bool selectedTokenExist;
  final TextEditingController controller;
  final int? decimals;
  final bool disabledInput;
  final String? validatorMessage;
  final TextStyle? textStyle;
  final Widget? action;
  final Color? inputFillColor;

  @override
  Widget build(BuildContext context) {
    String balance = "";
    try {
      if (selectedTokenExist) {
        balance = convertIntToDecimalAmount(currentBalance!, decimals!);
      } else {
        balance = '-';
      }
    } catch (e) {
      balance = '-';
    }

    final TextStyle? style = textStyle ?? Theme.of(context).textTheme.headline3;

    return GravityBridgeContainer(
      textField: true,
      title: S.current.AMOUNT,
      infoTitle: InkWell(
        child: Padding(
          padding: EdgeInsets.only(
            left: isMobile(context) == true ? 0 : 3,
            top: isMobile(context) == true ? Sizes.paddingMicro : 0,
            right: isMobile(context) == true ? 0 : 3,
            bottom: isMobile(context) == true ? Sizes.padding16 : 0,
          ),
          child: Text(
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            disabledInput
                ? S.current.BALANCE_TEXT_BEFORE_CONNECTING_WALLET
                : balanceHint.isEmpty
                    ? S.current.BALANCE(balance)
                    : S.current.BALANCE("$balance ($balanceHint)"),
          ),
        ),
        onTap: () {
          if (currentBalance != null) {
            controller.text = balance;
          }
        },
      ),
      padding: Sizes.cardPadding.copyWith(top: 0, bottom: 0),
      action: isMobile(context) == true ? action : null,
      disabledAction: disabledInput,
      child: GravityBridgeTextField(
        controller: controller,
        hintText: "0.0",
        hintStyle: disabledInput
            ? null
            : TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        isWidgetDisabled: disabledInput,
        additionalPadding: const EdgeInsets.symmetric(vertical: 5),
        inputFillColor: inputFillColor,
        style: disabledInput
            ? style
            : style?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        action: isMobile(context) == false ? action : null,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(
              r'^\d+\.?\d' + (decimals == null ? "*" : "{0,$decimals}"))),
        ],
        validator: (_) => validatorMessage,
      ),
    );
  }
}
