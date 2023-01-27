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
import 'package:gravity_bridge_flutter/widgets/disabled_widget.dart';
import 'package:gravity_bridge_flutter/widgets/layout_builder_helper_widget.dart';

import '../../../services/themedata_service.dart';

/// Widget that adds card-like decoration around its child:
/// - a dark/light box with rounded corners around the child
/// - a [title] string left-above
/// - a [infoTitle] widget right-above
/// - if the child is a textField no decoration is applied
class GravityBridgeContainer extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Widget? infoTitle;
  final bool textField;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Widget? action;
  final bool? disabledAction;

  const GravityBridgeContainer({
    Key? key,
    this.child,
    this.title,
    this.color,
    this.borderColor,
    this.padding,
    this.textField = false,
    this.infoTitle,
    this.action,
    this.disabledAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilderHelper(
      mobile: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Text(
                      title!,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.overline,
                    )
                  : const SizedBox(),
              if (title != null && action != null)
                const SizedBox(height: Sizes.padding16),
              if (action != null)
                DisabledWidget(
                  disabled: disabledAction!,
                  child: action!,
                ),
              if (infoTitle != null) infoTitle!,
              if (textField) child!,
              if (!textField)
                Container(
                    decoration: BoxDecoration(
                      color: color ?? Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(Sizes.radius),
                      border: borderColor != null
                          ? Border.all(color: borderColor!)
                          : null,
                    ),
                    child: LayoutBuilder(builder: (context, constrains) {
                      //used to prevent text overflow by shrinking the padding on smaller screen sizes
                      double p = percentageFromValueInRange(
                          min: 0, max: 335, value: constrains.maxWidth);
                      if (p < 1) {
                        p = p * 0.77;
                      }
                      return Padding(
                        padding: padding ??
                            EdgeInsets.symmetric(
                              horizontal: Sizes.paddingMedium * p,
                              vertical: Sizes.paddingMicro + Sizes.paddingSmall,
                            ),
                        child: child,
                      );
                    })),
            ]),
      ),
      desktop: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        right: Sizes.paddingSmall,
                        bottom: Sizes.paddingXSmall,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title!,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.overline,
                          ),
                          if (infoTitle != null) infoTitle!,
                        ],
                      ),
                    )
                  : const SizedBox(),
              if (textField) child!,
              if (!textField)
                Container(
                    decoration: BoxDecoration(
                      color: color ?? Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(Sizes.radius),
                      border: borderColor != null
                          ? Border.all(color: borderColor!)
                          : null,
                    ),
                    child: LayoutBuilder(builder: (context, constrains) {
                      //used to prevent text overflow by shrinking the padding on smaller screen sizes
                      double p = percentageFromValueInRange(
                          min: 0, max: 335, value: constrains.maxWidth);
                      if (p < 1) {
                        p = p * 0.77;
                      }
                      return Padding(
                        padding: padding ??
                            EdgeInsets.symmetric(
                              horizontal: Sizes.paddingMedium * p,
                              vertical: Sizes.paddingMicro + Sizes.paddingSmall,
                            ),
                        child: child,
                      );
                    })),
            ]),
      ),
    );
  }
}
