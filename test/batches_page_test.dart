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

import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_bridge_flutter/widgets/batch_remaining_time_text.dart';

/// This test must be run from the CLI with 'flutter test -r expanded --platform chrome test/batches_page_test.dart'
void main() {
  test("_getDurationString", () {
    Duration duration = const Duration(hours: 1, minutes: 0, seconds: 3);
    // print("Duration: $duration, formatted: ${getDurationString(duration)}");
    expect("~ 01 hrs", getDurationString(duration));

    duration = const Duration(hours: 0, minutes: 2, seconds: 3);
    // print("Duration: $duration, formatted: ${getDurationString(duration)}");
    expect("~ 02 min", getDurationString(duration));

    duration = const Duration(hours: 1, minutes: 2, seconds: 3);
    // print("Duration: $duration, formatted: ${getDurationString(duration)}");
    expect("~ 01:02 hrs", getDurationString(duration));

    duration = const Duration(hours: 13, minutes: 2, seconds: 3);
    // print("Duration: $duration, formatted: ${getDurationString(duration)}");
    expect("~ 13:02 hrs", getDurationString(duration));

    duration = const Duration(hours: 13, minutes: 12, seconds: 3);
    // print("Duration: $duration, formatted: ${getDurationString(duration)}");
    expect("~ 13:12 hrs", getDurationString(duration));
  });
}
