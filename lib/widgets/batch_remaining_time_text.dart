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

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:gravity_bridge_flutter/services/batches_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';

class BatchRemainingTimeText extends StatefulWidget {
  final Batch batch;
  final double fontSize;
  const BatchRemainingTimeText({
    required this.batch,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  State<BatchRemainingTimeText> createState() => _BatchRemainingTimeTextState();
}

class _BatchRemainingTimeTextState extends State<BatchRemainingTimeText> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _generateRemainingBatchTimeString(
          widget.batch.batchTimeoutBlockHeight),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        String text = "";

        if (snapshot.hasData) {
          text = snapshot.data!;
        }

        Timer.periodic(
          const Duration(seconds: 60),
          (Timer t) {
            if (mounted) setState(() {});
          },
        );

        return Text(
          text,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        );
      },
    );
  }
}

Future<String> _generateRemainingBatchTimeString(
  final Int64 batchTimeoutBlock,
) async {
  const int blocksTillFinalisation = 96;
  const Duration bufferTime = Duration(minutes: 30);
  final double averageEthTimeInSeconds =
      await MetamaskService.calculateAverageEthereumBlockTime();
  final int? latestEthBlock = await MetamaskService.getLatestEthereumBlock();

  late Duration remaining;
  if (latestEthBlock == null) {
    remaining = const Duration(hours: 2);
  } else {
    remaining = Duration(
      seconds: ((batchTimeoutBlock.toInt() -
                  latestEthBlock +
                  blocksTillFinalisation) *
              averageEthTimeInSeconds)
          .floor(),
    );
    remaining = remaining + bufferTime;
    if (remaining.inMinutes > (24 * 60)) {
      remaining = const Duration(hours: 24);
    }
  }

  return getDurationString(remaining);
}

String getDurationString(
  final Duration remaining,
) {
  final String hours = remaining.toString().split(':')[0].padLeft(2, '0');
  final String minutes = remaining.toString().split(':')[1].padLeft(2, '0');
  if (minutes == "00") {
    return "~ $hours hrs";
  } else if (hours == "00") {
    return "~ $minutes min";
  } else {
    return "~ $hours:$minutes hrs";
  }
}
