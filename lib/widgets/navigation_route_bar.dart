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
import 'package:url_launcher/link.dart';

class NavigationRouteBar extends StatelessWidget {
  final String label;
  final String routeName;

  const NavigationRouteBar({
    Key? key,
    required this.label,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ClickableNavigationItem(
          label: "Bridge",
          icon: Icons.home,
          link: Uri.parse(Uri.base.path.replaceAll(routeName, "")),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(">"),
        ),
        Text(label),
      ],
    );
  }
}

class _ClickableNavigationItem extends StatefulWidget {
  const _ClickableNavigationItem({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
    this.link,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final Uri? link;

  @override
  State<_ClickableNavigationItem> createState() =>
      _ClickableNavigationItemState();
}

class _ClickableNavigationItemState extends State<_ClickableNavigationItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        if (widget.icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Icon(
              widget.icon,
              size: 15,
            ),
          ),
        Text(
          widget.label,
          style: _hovering
              ? const TextStyle(decoration: TextDecoration.underline)
              : null,
        ),
      ],
    );

    if (widget.onTap == null) return content;

    return Link(
      uri: widget.link,
      builder: (context, followLink) => MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(onTap: widget.onTap, child: content),
      ),
    );
  }
}
