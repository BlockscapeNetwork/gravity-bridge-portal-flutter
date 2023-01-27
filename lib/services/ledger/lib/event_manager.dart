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

import 'dart:html';
import 'dart:js';
import 'dart:js_util';

import 'package:gravity_bridge_flutter/services/ledger/lib/hid_device_info.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:web_hid/web_hid.dart';

/// Singleton that lets you add and remove handlers on specific Hid Events
class EventManager {
  static final EventManager _em = EventManager._internal();

  int _handlerId = 0;
  bool _subscribed = false;

  final Map<int, void Function(HidDeviceInfo hidDevice)> _disconnectHandlers =
      {};
  final Map<int, void Function(HidDeviceInfo hidDevice)> _connectHandlers = {};

  factory EventManager() {
    if (!_em._subscribed) {
      _em._subscribed = true;
      _em._subscribe();
    }
    return _em;
  }

  EventManager._internal();

  void _subscribe() {
    hid.subscribeConnect(allowInterop((event) {
      final device = _getHidDeviceInfoFromEvent(event);
      _connectHandlers.forEach((handlerId, handlerFunction) {
        handlerFunction(device);
      });
    }));
    hid.subscribeDisconnect(allowInterop((event) {
      final device = _getHidDeviceInfoFromEvent(event);
      _disconnectHandlers.forEach((handlerId, handlerFunction) {
        handlerFunction(device);
      });
    }));
  }

  int addDisconnectHandler(void Function(HidDeviceInfo hidDevice) handler) {
    final usedId = _handlerId;
    _disconnectHandlers[usedId] = handler;
    _handlerId += 1;
    return usedId;
  }

  void removeDisconnectHandler(int id) {
    _disconnectHandlers.remove(id);
  }

  int addConnectHandler(void Function(HidDeviceInfo hidDeviceInfo) handler) {
    final usedId = _handlerId;
    _connectHandlers[usedId] = handler;
    _handlerId += 1;
    return usedId;
  }

  void removeConnectHandler(int id) {
    _connectHandlers.remove(id);
  }

  HidDeviceInfo _getHidDeviceInfoFromEvent(Event event) {
    if (!hasProperty(event, "device")) {
      return HidDeviceInfo(
          opened: false, productId: 0, vendorId: 0, productName: "");
    }
    final device = getProperty(event, "device");

    bool opened = getProperty(device, "opened");
    int vendorId = getProperty(device, "vendorId");
    int productId = getProperty(device, "productId");
    String productName = getProperty(device, "productName");

    return HidDeviceInfo(
        opened: opened,
        vendorId: vendorId,
        productId: productId,
        productName: productName);
  }
}
