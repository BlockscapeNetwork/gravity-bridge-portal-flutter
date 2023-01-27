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
import 'package:gravity_bridge_flutter/pages/batches/batches_page.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/gravity_bridge_page.dart';
import 'package:gravity_bridge_flutter/pages/settings/settings_page.dart';
import 'package:gravity_bridge_flutter/pages/transaction_history/transaction_history_page.dart';
import 'package:gravity_bridge_flutter/pages/whats_new/whats_new_page.dart';

Widget gravityBridgePageWidget(BuildContext context) =>
    const GravityBridgePage();
Widget transactionHistoryPageWidget(BuildContext context) =>
    const TransactionHistoryPage();
Widget whatsNewPageWidget(BuildContext context) => const WhatsNewPage();
Widget batchesPageWidget(BuildContext context) => const BatchesPage();
Widget settingsPageWidget(BuildContext context) => const SettingsPage();

class RouteService {
  static const String gravityBridgePage = "/";
  static const String transactionHistoryPage = "/history";
  static const String whatsNewPage = "/whatsNew";
  static const String batchesPage = "/batches";
  static const String settingsPage = "/settings";

  // provides the route for MaterialApp (in main.dart)
  static const Map<String, Widget Function(BuildContext)> routes = {
    gravityBridgePage: gravityBridgePageWidget,
    transactionHistoryPage: transactionHistoryPageWidget,
    whatsNewPage: whatsNewPageWidget,
    batchesPage: batchesPageWidget,
    // settingsPage: settingsPageWidget, // TODO: delete comment when "Settings" page is ready for first release
  };
}
