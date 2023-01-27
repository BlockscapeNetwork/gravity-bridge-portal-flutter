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
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';

/// Dropdown button with the same style as OutlinedButton
class CustomDropdownButton<T> extends StatelessWidget {
  final T currentValue;
  final List<T> values;
  final List<String> valueLabels;
  final void Function(T? newValue) onChanged;
  const CustomDropdownButton({
    Key? key,
    required this.currentValue,
    required this.values,
    required this.valueLabels,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.radius),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.paddingSmall,
          vertical: 8,
        ),
        child: DropdownButton<T>(
          borderRadius: BorderRadius.circular(Sizes.radius),
          underline: const SizedBox.shrink(),
          isDense: true,
          icon: ImageNetworkOrAssetWidget(
            svgAssetAsString: true,
            color: Theme.of(context).colorScheme.onBackground,
            imageUrl: SvgAssetsAsString.uiIconsExpandMore,
            width: Sizes.iconSizeMedium,
            height: Sizes.iconSizeMedium,
          ),
          style: Theme.of(context).textTheme.button?.copyWith(
                fontWeight: FontWeight.w200,
                color: Theme.of(context).colorScheme.onBackground,
              ),
          value: currentValue,
          items: values
              .mapIndexed((index, element) => DropdownMenuItem(
                    value: element,
                    child: Text(valueLabels[index]),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
