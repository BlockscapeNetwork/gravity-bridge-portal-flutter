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

import 'package:web_hid/web_hid.dart';

/*
ToDo

HIDDevice.collections Read only Experimental
Returns an array of report formats for the HID device.

*/

/// HIDDevice.vendorId Read only Experimental
/// Returns the vendorId of the HID device.
/// https://developer.mozilla.org/en-US/docs/Web/API/HIDDevice
int getVendorId(HidDevice dev) {
  return dev.getProperty<int>("vendorId");
}

/// HIDDevice.productId Read only Experimental
/// Returns the productID of the HID device.
/// https://developer.mozilla.org/en-US/docs/Web/API/HIDDevice
int getProductId(HidDevice dev) {
  return dev.getProperty<int>("productId");
}

/// HIDDevice.productName Read only Experimental
/// Returns a string containing the product name of the HID device.
/// https://developer.mozilla.org/en-US/docs/Web/API/HIDDevice
String getProductName(HidDevice dev) {
  return dev.getProperty<String>("productName");
}
