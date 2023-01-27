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

import 'package:flutter/widgets.dart';

/// Widget that rotates its child
class RotatingWidget extends StatefulWidget {
  final Widget child;
  final Duration fullRotationDuration;
  const RotatingWidget({
    super.key,
    required this.child,
    this.fullRotationDuration = const Duration(minutes: 1),
  });
  @override
  State<StatefulWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.fullRotationDuration,
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
