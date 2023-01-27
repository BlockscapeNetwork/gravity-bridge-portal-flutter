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

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CountdownProgressIndicator extends StatefulWidget {
  final int countdownInSeconds;
  final VoidCallback onFinished;

  const CountdownProgressIndicator({
    Key? key,
    required this.countdownInSeconds,
    required this.onFinished,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountdownProgressIndicatorState();
}

class _CountdownProgressIndicatorState
    extends State<CountdownProgressIndicator> {
  late final Timer timer;
  late int remainingCountdown;

  @override
  void initState() {
    super.initState();
    remainingCountdown = widget.countdownInSeconds;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          remainingCountdown--;
          remainingCountdown = max(0, remainingCountdown);
        });
        if (remainingCountdown == 0) {
          timer.cancel();
          widget.onFinished();
        }
      },
    );
  }

  @override
  void dispose() {
    if (timer.isActive) timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (remainingCountdown == 0) {
      return const SizedBox.shrink();
    } else {
      return CircularProgressIndicator(
        value: remainingCountdown / widget.countdownInSeconds,
        color: Theme.of(context).textTheme.bodyText1?.color,
        strokeWidth: 1,
      );
    }
  }
}
