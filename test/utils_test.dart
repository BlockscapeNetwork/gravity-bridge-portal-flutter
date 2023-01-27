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
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/utils.dart';

/// This test must be run from the CLI with 'flutter test -r expanded --platform chrome test/utils_test.dart'
void main() {
  test("convertIntToDecimalAmount", () {
    const String intAmount = "123456789";
    expect(intAmount, convertIntToDecimalAmount(intAmount, 0));
    expect("12345678.9", convertIntToDecimalAmount(intAmount, 1));
    expect("1234567.89", convertIntToDecimalAmount(intAmount, 2));
    expect("0.123456789", convertIntToDecimalAmount(intAmount, 9));
    expect("0.0123456789", convertIntToDecimalAmount(intAmount, 10));
    expect("0.00000000000123456789", convertIntToDecimalAmount(intAmount, 20));
  });

  test("convertDecimalToIntAmount()", () {
    expect("", convertDecimalToIntAmount("", -1));
    expect("", convertDecimalToIntAmount("", 0));
    expect("0", convertDecimalToIntAmount("", 1));
    expect("0", convertDecimalToIntAmount("0", 18));
    expect("1", convertDecimalToIntAmount("1", -1));
    expect("1", convertDecimalToIntAmount("1", 0));

    // convert dollars to cents
    expect("100", convertDecimalToIntAmount("1", 2));
    expect("10", convertDecimalToIntAmount("0.1", 2));
    expect("12", convertDecimalToIntAmount("0.12", 2));
    expect("12", convertDecimalToIntAmount("0.123", 2));
    expect("1012", convertDecimalToIntAmount("10.123", 2));
    expect("10012", convertDecimalToIntAmount("100.12", 2));

    expect("123456", convertDecimalToIntAmount("0.1234567", 6));
    expect("123456", convertDecimalToIntAmount("0.123456", 6));
    expect("10123000", convertDecimalToIntAmount("10.123", 6));
    expect("100120000", convertDecimalToIntAmount("100.12", 6));
  });

  test("getChainFromWalletAddress", () {
    expect(null, getChainFromWalletAddress(""));
    expect(
        Chain.ethereum,
        getChainFromWalletAddress(
            "0xA2B286a781233432204a573d6F40fbd2252cBBd4"));
    expect(
        Chain.cosmosHub,
        getChainFromWalletAddress(
            "cosmos1fe9nn5529tzlm0ttse3fu5we2jv86ulvcxuqh2"));
    expect(
        Chain.osmosis,
        getChainFromWalletAddress(
            "osmo1fe9nn5529tzlm0ttse3fu5we2jv86ulvsa0spc"));
    expect(
        Chain.agoric,
        getChainFromWalletAddress(
            "agoric1ancqavess6f243t0274f3nfmdta9qurltj86y7"));
    expect(
        Chain.terraclassic,
        getChainFromWalletAddress(
            "terra1f542acyy02e5nxu5zyzc8wv3s8tnmsrr2cuw26"));
  });

  test("isKeplrWalletAddress", () {
    expect(false, isKeplrWalletAddress(""));
    expect(false,
        isKeplrWalletAddress("0xA2B286a781233432204a573d6F40fbd2252cBBd4"));
    expect(true,
        isKeplrWalletAddress("cosmos1fe9nn5529tzlm0ttse3fu5we2jv86ulvcxuqh2"));
    expect(true,
        isKeplrWalletAddress("osmo1fe9nn5529tzlm0ttse3fu5we2jv86ulvsa0spc"));
    expect(true,
        isKeplrWalletAddress("agoric1ancqavess6f243t0274f3nfmdta9qurltj86y7"));
    expect(true,
        isKeplrWalletAddress("terra1f542acyy02e5nxu5zyzc8wv3s8tnmsrr2cuw26"));
  });

  test("isMetamaskWalletAddress", () {
    expect(false, isMetamaskWalletAddress(""));
    expect(true,
        isMetamaskWalletAddress("0xA2B286a781233432204a573d6F40fbd2252cBBd4"));
    expect(
        false,
        isMetamaskWalletAddress(
            "cosmos1fe9nn5529tzlm0ttse3fu5we2jv86ulvcxuqh2"));
    expect(false,
        isMetamaskWalletAddress("osmo1fe9nn5529tzlm0ttse3fu5we2jv86ulvsa0spc"));
    expect(
        false,
        isMetamaskWalletAddress(
            "agoric1ancqavess6f243t0274f3nfmdta9qurltj86y7"));
    expect(
        false,
        isMetamaskWalletAddress(
            "terra1f542acyy02e5nxu5zyzc8wv3s8tnmsrr2cuw26"));
  });

  test("token amount formatting", () {
    try {
      const String decimalSeparator = ",";
      const String groupSeparator = "'";
      // final double amount = 0.123456789123456789;
      // String res = numberFormattingUsingLocale(amount: amount);
      // print("Formatted: $res");

      // res = numberFormattingUsingLocale(
      //     amount: amount, decimalDigits: 18, maxDecimals: 2);
      // print("Formatted: $res");

      // res = numberFormattingUsingLocale(
      //     amount: amount, decimalDigits: 18, maxDecimals: 18);
      // print("Formatted: $res");

      // res = intl.NumberFormat.currency(
      //   symbol: "",
      //   locale: ui.window.locale.toString(),
      //   decimalDigits: 18,
      // ).format(amount);
      // print("Formatted: $res");
      String intStr = "";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");
      intStr = "10";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");
      intStr = "100";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");
      intStr = "1000";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");
      intStr = "10000";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");
      intStr = "100000";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");
      intStr = "1000000";
      print(
          "Number: $intStr, Formatted: ${formatIntegerNumber(number: intStr, groupSeparator: groupSeparator)}");

      String doubleStr = "";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");
      doubleStr = "0.01";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");
      doubleStr = "0,01";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");
      doubleStr = "1000.001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");
      doubleStr = "10000,001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");
      doubleStr = "100000.00001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");
      doubleStr = "10000000000000000,00000000000000000001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: ".")}");

      doubleStr = "";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      doubleStr = "0,01";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      doubleStr = "0,01";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      doubleStr = "1000,001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      doubleStr = "10000,001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      doubleStr = "100000,00001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      doubleStr = "10000000000000000,00000000000000000001";
      print(
          "Number: $doubleStr, Formatted: ${formatTokenAmount(tokenAmount: doubleStr, groupSeparator: groupSeparator, decimalSeparator: decimalSeparator)}");
      expect(
          "0,00",
          formatTokenAmount(
              tokenAmount: "0",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));

      expect(
          "1,00",
          formatTokenAmount(
              tokenAmount: "1",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "1,00",
          formatTokenAmount(
              tokenAmount: "1",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "1,00",
          formatTokenAmount(
              tokenAmount: "1",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "10,00",
          formatTokenAmount(
              tokenAmount: "10",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "1'000,00",
          formatTokenAmount(
              tokenAmount: "1000",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "1,123",
          formatTokenAmount(
              tokenAmount: "1,123",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "10,123",
          formatTokenAmount(
              tokenAmount: "10,123",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "1'000,123",
          formatTokenAmount(
              tokenAmount: "1000,123",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
      expect(
          "1'000'000'000,123",
          formatTokenAmount(
              tokenAmount: "1000000000,123",
              groupSeparator: groupSeparator,
              decimalSeparator: decimalSeparator));
    } catch (e) {
      dlogError(error: e);
    }
  });
}
