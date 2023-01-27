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
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';

class GravityBridgeTextField extends StatefulWidget {
  final String? initialValue;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? helperText;
  final Widget? action;
  final EdgeInsets? additionalPadding;

  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? inputFillColor;
  final void Function(String)? onChanged;
  final InputDecoration? decoration;
  final bool isWidgetDisabled;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final bool isInputEnabled;
  final FocusNode? focusNode;
  final int? maxLines;

  const GravityBridgeTextField({
    Key? key,
    this.initialValue,
    this.style,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.inputFillColor,
    this.onChanged,
    this.helperText,
    this.action,
    this.decoration,
    this.isWidgetDisabled = false,
    this.controller,
    this.backgroundColor,
    this.additionalPadding,
    this.isInputEnabled = true,
    this.focusNode,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<GravityBridgeTextField> createState() => _GravityBridgeTextFieldState();
}

class _GravityBridgeTextFieldState extends State<GravityBridgeTextField> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hoverColor = Theme.of(context).colorScheme.outline;
    return DisabledWidget(
      disabled: widget.isWidgetDisabled,
      child: MouseRegion(
        onEnter: (_) {
          if (mounted) setState(() => _hovering = true);
        },
        onExit: (_) {
          if (mounted) setState(() => _hovering = false);
        },
        child: TextFormField(
          focusNode: widget.focusNode,
          enabled: widget.isInputEnabled,
          controller: widget.controller,
          initialValue: widget.initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: widget.style,
          maxLines: widget.maxLines,
          decoration: widget.decoration ??
              InputDecoration(
                hoverColor: Theme.of(context).backgroundColor,
                errorStyle: TextStyle(
                  fontSize: Sizes.fontSizeXSmall,
                  color: Theme.of(context).colorScheme.error,
                ),
                fillColor: widget.inputFillColor ??
                    widget.backgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(Sizes.radius)),
                  borderSide: BorderSide(
                    color: _hovering
                        ? hoverColor.withOpacity(0.15)
                        : Theme.of(context).backgroundColor,
                  ),
                ),
                //no interaction with the textField -> no border
                //hovering -> hover border
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(Sizes.radius)),
                  borderSide: BorderSide(
                    color: _hovering
                        ? hoverColor
                        : Theme.of(context).backgroundColor,
                  ),
                ),
                //error and actively typing
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.radius)),
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error)),
                //error and not focused -> keep error color but lower intensity
                errorBorder: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.radius)),
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .error
                            .withOpacity(0.4))),
                // active interaction with field -> primary color,
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.radius)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                hintText: widget.hintText,
                hintStyle: widget.hintStyle,
                helperText: widget.helperText,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    right: Sizes.paddingMedium,
                  ),
                  child: widget.action,
                ),
                contentPadding: (isMobile(context)
                        ? const EdgeInsets.only(
                            left: Sizes.paddingSmall,
                            top: Sizes.padding24,
                            right: Sizes.paddingLarge,
                            bottom: Sizes.padding24,
                          )
                        : const EdgeInsets.only(
                            left: Sizes.paddingMedium,
                            top: Sizes.paddingMedium,
                            right: Sizes.paddingMedium,
                            bottom: 0,
                          )) +
                    (widget.additionalPadding == null
                        ? EdgeInsets.zero
                        : widget.additionalPadding!),
                filled: true,
              ),
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
