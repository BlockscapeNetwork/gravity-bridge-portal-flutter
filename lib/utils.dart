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

import 'dart:ui' as ui;

import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_bridge_flutter/bin/config.dart';
import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/services/gravity_service.dart';
import 'package:gravity_bridge_flutter/services/layout_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/services/themedata_service.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gravity_bridge_flutter/generated/l10n.dart';
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/enums/transaction_status.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/pages/gravity_bridge/widgets/image_network_or_asset_widget.dart';
import 'package:gravity_bridge_flutter/services/chain_configs/chain_configs.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/common_query_tx_resp.dart';

String _getLogLine(
  Object? object, [
  String prefix = "",
]) {
  if (prefix.isNotEmpty) {
    prefix = "[$prefix] ";
  }
  return "$prefix$object";
}

String _getErrorLogLine({
  final String? message,
  final Object? error,
  final StackTrace? stackTrace,
  final String prefix = "",
}) {
  String line = "";
  if (message != null) {
    line = "\"$message\". ";
  }
  if (error != null) {
    line = line + "Original-Error: \"$error\". ";
  }
  if (stackTrace != null) {
    line = line +
        "Stacktrace:\n\t${stackTrace.toString().replaceAll("\n", "\n\t")}";
  }
  line = "❌❌❌[ERROR] $line";
  return _getLogLine(line, prefix);
}

/// release-mode log which is shown only on pages (see .gitlab-ci.yml)
void rlog(
  Object? object, [
  String prefix = "",
]) {
  if (kReleaseMode && (const String.fromEnvironment("SHOW_LOGS") == "true")) {
    final String log = _getLogLine(object, prefix);
    // ignore: avoid_print
    print(log);
  }
}

/// release-mode error log which is shown only on pages (see .gitlab-ci.yml)
void rlogError({
  final String? message,
  final Object? error,
  final StackTrace? stackTrace,
  final String prefix = "",
}) {
  if (kReleaseMode && (const String.fromEnvironment("SHOW_LOGS") == "true")) {
    final String log = _getErrorLogLine(
      message: message,
      error: error,
      stackTrace: stackTrace,
      prefix: prefix,
    );
    // ignore: avoid_print
    print(log);
  }
}

/// debug-mode log
void dlog(
  Object? object, [
  String prefix = "",
]) {
  if (kDebugMode) {
    final String log = _getLogLine(object, prefix);
    // ignore: avoid_print
    print(log);
  }
}

/// debug-mode error log
void dlogError({
  final String? message,
  final Object? error,
  final StackTrace? stackTrace,
  final String prefix = "",
}) {
  if (kDebugMode) {
    final String log = _getErrorLogLine(
      message: message,
      error: error,
      stackTrace: stackTrace,
      prefix: prefix,
    );
    // ignore: avoid_print
    print(log);
  }
}

extension BuildContextX on BuildContext {
  T read<T>(ProviderBase<T> provider) =>
      ProviderScope.containerOf(this, listen: false).read(provider);
}

///Calculates the percentage of a value within a given range of values
double percentageFromValueInRange(
    {required double min, required double max, required double value}) {
  final p = (value - min) / (max - min);
  return p > 1
      ? 1
      : p < 0
          ? 0
          : p;
}

final tokenValidationExpression = RegExp(r'^0x[A-Fa-f0-9]{40}');

extension StringExtension on String {
  String truncateDots({
    final int maxLenghtOfLeftSide = 6,
    final int maxLenghtOfRightSide = 4,
    final int dotsCount = 3,
  }) {
    if (length > (maxLenghtOfLeftSide + maxLenghtOfRightSide) + 1 &&
        maxLenghtOfLeftSide > 0 &&
        maxLenghtOfRightSide > 0 &&
        dotsCount > 0) {
      return replaceRange(maxLenghtOfLeftSide, length - maxLenghtOfRightSide,
          List<String>.filled(dotsCount, ".").join());
    } else {
      return this;
    }
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

/// Converts an amount of tokens into its smallest units, so the reverse of [convertIntToDecimalAmount]
/// 1 token = 10^[decimals] units, e.g. 1 Dollar = 100 Cent, 1.1 Dollar = 110 Cent, 1 Ether = 10^18 Wei.
///
/// The conversion is not done through (double) multiplication b/c of precision concerns, but through string manipulation (decimal point is moved to the right; zeros are added at the end).
/// - If there is a "." amount will be padded with zeroes to have "decimals" amount of digits after the ".".
/// - If there is no  "." amount will be padded with "decimals" amount of zeroes.
/// - If there are more decimals after a "." than "decimals" amount, decimals will be trimmed to 'decimals'.
String convertDecimalToIntAmount(String tokenAmount, int decimals) {
  // pad to length
  var padding = 0;
  final amountLength = tokenAmount.length;
  final indexOfSeparator = tokenAmount.indexOf(".");

  // check if there are more decimals than provided by 'decimals' and trim exceeding decimals off
  if (indexOfSeparator > -1) {
    final currentDecimals = amountLength - indexOfSeparator - 1;
    if (currentDecimals > decimals) {
      // trim
      final toBeTrimmed = currentDecimals - decimals;
      tokenAmount = tokenAmount.substring(0, amountLength - toBeTrimmed);
    }
  }

  if (indexOfSeparator < 0) {
    padding = decimals;
  } else {
    padding = decimals - (amountLength - 1 - indexOfSeparator);
  }

  tokenAmount = tokenAmount.padRight(amountLength + padding, "0");

  // remove separator
  tokenAmount = tokenAmount.replaceFirst(".", "");

  // remove leading zeroes
  while (tokenAmount.length > 1) {
    if (tokenAmount[0] == "0") {
      tokenAmount = tokenAmount.replaceFirst("0", "");
    } else {
      break;
    }
  }

  return tokenAmount;
}

/// Convert a token amount from format int-string to the format double-string.
/// Reverse of [convertDecimalToIntAmount].
String convertIntToDecimalAmount(String amount, int decimals) {
  if (amount == "" || decimals <= 0) {
    return amount;
  }

  var conv = amount;
  if (amount.length < decimals + 1) {
    conv = conv.padLeft(decimals + 1, "0");
  }

  // add decimal point
  final index = conv.length - decimals;
  conv = conv.substring(0, index) + "." + conv.substring(index);

  // remove trailing zeroes
  while (conv.endsWith("0")) {
    conv = conv.substring(0, conv.length - 1);
  }

  // remove point if no decimals are left
  if (conv.endsWith(".")) {
    conv = conv.substring(0, conv.length - 1);
  }

  return conv;
}

extension DoubleExtension on double {
  /// Alternative to toStringAsFixed(int precision): Returns the double as string with [maxFractionDigits].
  /// If the later is too much for the given double, e.g. 10.001.toStringAsNotFixed(15), the trailing zeroes are removed.
  String toStringAsNotFixed([final int maxFractionDigits = 20]) {
    assert(maxFractionDigits <= 20);
    return trimTrailingZeroesFromDoubleString(
        toStringAsFixed(maxFractionDigits));
  }
}

/// Trim unnecessary zero decimals at the end of a double, e.g. 0.00001000000000 will return 0.00001.
///
/// If there are only zeros after the decimal point, the first one is left, e.g. 0.0000 returns 0.0.
String trimTrailingZeroesFromDoubleString(final String doubleString) {
  String res = doubleString;
  while (res.endsWith("0") && !res.endsWith(".0")) {
    res = res.substring(0, res.length - 1);
  }
  return res;
}

String getVersion() {
  return "${const String.fromEnvironment('VERSION', defaultValue: "0.0.0")}.${const String.fromEnvironment('BUILD', defaultValue: "1337")}";
}

String? getTransferAmountValidator(
  /// amount as a double formatted string
  final String? amount,
  final int? erc20Decimals,
  final bool? isBalanceEnough,
  final TransferType transferType,
) {
  if (amount == null || amount.isEmpty) {
    return S.current.ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_EMPTY + "\n";
  } else {
    final double? parsedAmount = double.tryParse(amount);
    if (parsedAmount != null && parsedAmount == 0.0) {
      return S.current.ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_ZERO + "\n";
    }
  }

  final regMatch = RegExp(r'^\d+\.?\d*').hasMatch(amount);

  if (erc20Decimals == null) {
    return S.current.ERROR_AMOUNT_OF_TRANSFER_NO_TOKEN_SELECTED + "\n";
  }

  if (isBalanceEnough == false) {
    if (transferType == TransferType.gra2eth) {
      return S.current.TOKEN_BALANCE_NOT_ENOUGH_FOR_BRIDGE_FEE_WARNING;
    } else {
      return S.current.TOKEN_BALANCE_NOT_ENOUGH_WARNING;
    }
  }

  if (regMatch &&
      amount.contains(".") &&
      amount.split(".")[1].length > erc20Decimals) {
    return S.current.ERROR_AMOUNT_OF_TRANSFER_TO_MANY_DECIMALS + "\n";
  } else {
    return null;
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter(this.decimalRange) : assert(decimalRange >= 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == ".") {
      return TextEditingValue(
        text: "0.",
        selection: newValue.selection,
        composing: TextRange.empty,
      );
    } else {
      return newValue;
    }
  }
}

/// validates the address field
/// if [address] is not valid, will return issue description else [null]
String? isTransferAddressValid(String? address, Chain toChain) {
  RegExp regExp;

  if (address == null || address.isEmpty) {
    return S.current.ERROR_ADDRESS_IS_EMPTY;
  }

  switch (toChain) {
    case Chain.ethereum:
      regExp = RegExp(r"^0x[a-fA-F0-9]{40}$");
      break;
    default:
      regExp = RegExp("^(${toChain.chainPrefix})([A-Za-z0-9])+");
      break;
  }

  if (regExp.hasMatch(address)) {
    return null;
  }
  return S.current
      .ERROR_INVALID_ADDRESS_FOR_ADDR_TYPE(address, toChain.chainName);
}

TransactionStatus translateTxResponseToTransactionStatus({
  required final CommonQueryTxResponse response,
  required final String toAddress,
}) {
  // the blockchain does not recognize the transaction
  if (!response.found) {
    return TransactionStatus.preparing;
  }
  // the blockchain recognizes the transaction, so it has been written into its "records"
  else {
    if (!response.success) {
      return TransactionStatus.failed;
    }
    // response.success == true
    else {
      // Transactions of type
      // GRAV > IBC or
      // IBC > GRAV or
      // ETH > GRAV
      // ETH > IBC
      // have almost immediate token transfer,
      // so response.success == true also means that the tokens have been trasferred
      if (isKeplrWalletAddress(toAddress)) {
        return TransactionStatus.completed;
      }
      // Transactions of type GRAV > ETH, need some time to transfer the tokens,
      // so response.success == true only means that the transaction has been accepted and the tokens are still being sent.
      else {
        return TransactionStatus.pending;
      }
    }
  }
}

/// Warning: To be used only the first time when the transaction has been created.
///
/// Finds through the addresses what kind of transaction it is (Grav2Eth/Eth2Grav/etc),
/// and based on that and the [progress] generates a TransactionStatus
TransactionStatus translateTransactionProgressToTransactionStatus({
  required final TransactionProgress progress,
  required final String fromAddress,
  required final String toAddress,
}) {
  // ETH > COSMOS transactions have almost immediate coin transfer (3-10 sec)
  // For now we do not have an endpoint for status-check requests, so the status is set immediately to completed if it is not failed.
  if (isMetamaskWalletAddress(fromAddress)) {
    if (progress is TransactionError) {
      return TransactionStatus.failed;
    } else {
      return TransactionStatus.completed;
    }
  }
  // COSMOS >
  else {
    // COSMOS > GRAV transactions have almost immediate coin transfer (3-10 sec)
    // For cases that the status-check request throws an error, the status is set to preparing so that it can be checked later in the transaction history.
    if (isKeplrWalletAddress(toAddress)) {
      if (progress is TransactionStarted) {
        return TransactionStatus.preparing;
      } else if (progress is TransactionError) {
        return TransactionStatus.failed;
      } else {
        return TransactionStatus.completed;
      }
    }
    // COSMOS(for now only grav) > ETH transactions do not transfer coins immediately, but may be batched first (depending on how much fees were paid)
    else {
      if (progress is TransactionError) {
        return TransactionStatus.failed;
      } else //if (progress is TransactionStarted || progress is TransactionInProgress || progress is TransactionComplete)
      {
        return TransactionStatus.preparing;
      }
    }
  }
}

Chain? getChainFromWalletAddress(String walletAddress) {
  if (walletAddress.isNotEmpty) {
    for (int i = 0; i < Chain.values.length; ++i) {
      if (walletAddress.startsWith(
        RegExp(Chain.values[i].chainPrefix, caseSensitive: false),
      )) {
        return Chain.values[i];
      }
    }
  }
  return null;
}

Chain? getKeplrChainFromWalletAddress(final String walletAddress) {
  for (final chainInfoEntry in chainInfos.entries) {
    final regex = RegExp(
      "^(${chainInfoEntry.value.bech32Config.bech32PrefixAccAddr})([a-z0-9])+",
      caseSensitive: false,
    );
    if (regex.hasMatch(walletAddress)) {
      return chainInfoEntry.key;
    }
  }
  return null;
}

Uri? getCoingeckoUrl(final TokenInfo token) {
  String? coinId;

  if (token.walletType == WalletType.metamask) {
    coinId = token.address;
  } else {
    coinId = Config.keplr.currencyRegistry.getCoinGeckoId(
      tokenName: token.name,
      tokenSymbol: token.symbol,
    );
  }

  if (coinId != null) {
    return Uri.parse("https://www.coingecko.com/en/coins/$coinId");
  } else {
    return null;
  }
}

bool isMetamaskWalletAddress(final String walletAddress) {
  if (walletAddress.isEmpty) {
    return false;
  }
  final regExp = RegExp(r"^0x[a-fA-F0-9]{40}$");
  return regExp.hasMatch(walletAddress);
}

bool isKeplrWalletAddress(final String walletAddress) {
  if (walletAddress.isEmpty) {
    return false;
  }
  final Chain? chain = getChainFromWalletAddress(walletAddress);
  return (chain != null && chain != Chain.ethereum);
}

// it generates a string as link format for Etherscan or Mintscan
// e.g: https://etherscan.io/tx/0xe5c0daf6e14fee156896b9918e04c83158a10c221b45064008f0c3a4a54b4d62
// or   https://etherscan.io/address/0xa2b286a781233432204a573d6f40fbd2252cbbd4
// or   https://www.mintscan.io/gravity-bridge/txs/DA8039C786FA5AF228171D7226FC2D0635414BD63D7F53DD8187B64B03A4C2D5
// or   https://www.mintscan.io/gravity-bridge/account/gravity1fe9nn5529tzlm0ttse3fu5we2jv86ulvukwcjz
String scanLinkGenerator({
  /// etherum account or cosmos account hash
  required final String accountHash,

  /// etherum tx or cosmos tx hash
  final String txHash = "",
}) {
  if (txHash.isEmpty && accountHash.isEmpty) {
    return "";
  }

  if (isMetamaskWalletAddress(accountHash)) {
    if (txHash.isNotEmpty) {
      return Constants.etherscanLink + Constants.etherscanTxPath + txHash;
    } else {
      return Constants.etherscanLink +
          Constants.etherscanAccountPath +
          accountHash;
    }
  } else {
    final chain = getKeplrChainFromWalletAddress(accountHash);
    if (chain == null) {
      return "";
    } else if (chain == Chain.canto || chain == Chain.terraclassic) {
      final String explorer = "https://atomscan.com/${chain.chainPrefix}/";
      if (txHash.isNotEmpty) {
        return explorer + "transactions/" + txHash;
      } else {
        return explorer + "accounts/" + accountHash;
      }
    } else {
      final chainPath = chain.mintscan;
      if (chainPath.isNotEmpty) {
        if (txHash.isNotEmpty) {
          return Constants.mintscanLink +
              chainPath +
              Constants.mintscanTxPath +
              txHash;
        } else {
          return Constants.mintscanLink +
              chainPath +
              Constants.mintscanAccountPath +
              accountHash;
        }
      } else {
        return "";
      }
    }
  }
}

// with saveToPrefs and loadFromPrefs functions
// save input data as a list in the local storage
// 'key' must be same for writing and reading same data
saveToPrefs(String key, List<String> data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(key, data);
}

loadFromPrefs(String key) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(key)) {
    return prefs.getStringList(key);
  }
  return <String>[];
}

String formatDollarValue({
  required final double dollarValue,
  final String tokenAmount = "",
  final int decimalDigits = 2,
  final String symbol = "\$",
  final String additionalSymbol = "",
  final int? tokenDecimals,
}) {
  String formattedString = intl.NumberFormat.currency(
    symbol: symbol,
    locale: ui.window.locale.toString(),
  ).format(0.00);
  if (tokenAmount == "" && tokenDecimals == null) {
    try {
      formattedString = intl.NumberFormat.currency(
        symbol: symbol,
        locale: ui.window.locale.toString(),
        decimalDigits: decimalDigits,
      ).format(dollarValue);
    } catch (e) {
      dlogError(error: e);
    }
  } else if (tokenDecimals == null) {
    try {
      formattedString = intl.NumberFormat.currency(
        symbol: symbol,
        locale: ui.window.locale.toString(),
      ).format(dollarValue * double.parse(tokenAmount));
    } catch (e) {
      dlogError(
          error: e,
          message: "tokenAmount: $tokenAmount \n dollarPrice: $dollarValue");
    }
  } else {
    try {
      double amount =
          double.parse(convertIntToDecimalAmount(tokenAmount, tokenDecimals));
      formattedString = intl.NumberFormat.currency(
        symbol: symbol,
        locale: ui.window.locale.toString(),
      ).format(dollarValue * amount);
    } catch (e) {
      dlogError(
          error: e,
          message:
              "tokenAmount: $tokenAmount \n tokenDecimals: $tokenDecimals \n dollarValue: $dollarValue");
    }
  }

  return additionalSymbol + formattedString;
}

/// Returns the size that the [text] will have when displayed
Size getDisplayedTextSize({
  required final BuildContext context,
  required final String text,
  final int maxLines = 1,
  final TextStyle? textStyle,
}) {
  final painter = TextPainter(
    text: TextSpan(
      text: text,
      style: textStyle ?? DefaultTextStyle.of(context).style,
    ),
    maxLines: maxLines,
    textScaleFactor: MediaQuery.of(context).textScaleFactor,
    textDirection: TextDirection.ltr,
  );
  painter.layout();
  return painter.size;
}

bool isMobile(BuildContext context) {
  if (MediaQuery.of(context).size.width <= LayoutService.breakpoint) {
    return true;
  }
  return false;
}

String replaceSvgFillColorWithDartColor(String svgAsString, Color? color,
    {String originalColor =
        "#150500" // set originalColor default to #150500, since all the SvgAssetsAsString assets has it
    }) {
  // toRadixString(16) returns color in format "ff150500" -> while loading SVG in browser - only "#150500" format works.
  return svgAsString.replaceAll(originalColor,
      color?.value.toRadixString(16).replaceFirst("ff", "#") ?? originalColor);
}

Future<String> generateRemainingTimeStringFromInt64(
  Int64 timeoutBlockHeight,
) async {
  const String logPrefix = "generateRemainingTimeStringFromInt64";
  final timeOut = timeoutBlockHeight.toInt();
  final int? latestBlock = await MetamaskService.getLatestEthereumBlock();
  final double? averageEthereumBlockTime =
      await MetamaskService.calculateAverageEthereumBlockTime();

  if (latestBlock != null && averageEthereumBlockTime != null) {
    int seconds = ((timeOut - latestBlock) * averageEthereumBlockTime).round();
    Duration dur = Duration(seconds: seconds);
    final durStr = ((dur.isNegative) ? "-" : "") + "$dur";
    dlog(
      "Result: $durStr (($timeoutBlockHeight - $latestBlock) * $averageEthereumBlockTime)",
      logPrefix,
    );
    return durStr;

    // String hours = "$dur".split('.')[0].padLeft(8, '0').split(":")[0];
    // String minutes = "$dur".split('.')[0].padLeft(8, '0').split(":")[1];
    // if (int.parse(hours) >= 1) {
    //   return "$hours:$minutes hrs";
    // } else if (int.parse(hours) == 1 && int.parse(minutes) == 0) {
    //   return "$hours hour";
    // } else {
    //   return "$minutes minutes";
    // }

  }

  return "";
}

Widget getChainIconFromWalletAddress({
  required final BuildContext context,
  required final String walletAddress,
  final double width = Sizes.iconSize32,
  final double height = Sizes.iconSize32,
}) {
  final Chain? chain = getChainFromWalletAddress(walletAddress);
  if (chain != null) {
    return ImageNetworkOrAssetWidget(
      imageUrl: getAsset(chain),
      width: width,
      height: height,
    );
  } else {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(Sizes.iconSize32),
      ),
    );
  }
}

Widget getChainIconFromChain({
  required final BuildContext context,
  required final Chain? chain,
  final double width = Sizes.iconSize32,
  final double height = Sizes.iconSize32,
}) {
  if (chain != null) {
    return ImageNetworkOrAssetWidget(
      imageUrl: getAsset(chain),
      width: width,
      height: height,
    );
  } else {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(Sizes.iconSize32),
      ),
    );
  }
}

Future<String> generateDatetimeFromGravityTimestamp(int blockHeight) async {
  final String timeStamp =
      await GravityService().getGravityBlockTimestamp(blockHeight);
  if (timeStamp == "") {
    return "";
  }
  return generateLocaleDateTimeFormat(DateTime.parse(timeStamp).toLocal());
}

String generateLocaleDateTimeFormat(DateTime dateTime) {
  return intl.DateFormat.yMd(ui.window.locale.toString())
      .add_jm()
      .format(dateTime);
}

/*
String numberFormattingUsingLocale({
  required double? amount,
  int? decimalDigits = 2,
  int? maxDecimals,
  bool ellipsis = false,
}) {
  if (amount == null) {
    return "null";
  }
  // we only want to get the first part of the locale
  // Eg. if locale is 'en_EN', we want 'en' part of it
  final String localeDecimalSeparator =
      getLocaleDecimalSeparator(ui.window.locale.toString().split("_")[0]);

  // if token is not defined, it means decimalDigits will be 0
  // in this case we just want to format entered amount
  if (decimalDigits == 0) {
    return intl.NumberFormat.currency(
      symbol: "",
      locale: ui.window.locale.toString(),
    ).format(amount);
  }

  String regExp;
  // setting localeDecimalSeparator dynamically in regExp something like this will not work:
  // r"([$localeDecimalSeparator]*0+)(?!.*\d)" or r"([" + localeDecimalSeparator + "]*0+)(?!.*\d)"
  /// workaround solution: in [numberFormatSymbols] intl locale map, there are only three types of locale decimal separator
  /// [,], [.] and [\u066B]
  // so following implementation will detect the seperator and set the regExp
  if (localeDecimalSeparator == ",") {
    regExp = r"([,]*0+)(?!.*\d)";
  } else if (localeDecimalSeparator == "\u066B") {
    regExp = r"([\u066B]*0+)(?!.*\d)";
  } else {
    regExp = r"([.]*0+)(?!.*\d)";
  }

  if (maxDecimals != null) {
    return intl.NumberFormat.currency(
          symbol: "",
          locale: ui.window.locale.toString(),
          decimalDigits: decimalDigits,
        )
            .format(double.parse(amount.toStringAsFixed(maxDecimals)))
            .replaceAll(RegExp(regExp), "")
            .replaceAll(RegExp(r"\s"), "") +
        (ellipsis == true ? "..." : "");
  }

  return intl.NumberFormat.currency(
    symbol: "",
    locale: ui.window.locale.toString(),
    decimalDigits: decimalDigits,
  ).format(amount).replaceAll(RegExp(regExp), "");
}*/

String formatTokenAmountUsingLocale({
  /// token amount in double format
  required final String tokenAmount,
  final int? maxDecimalPlaces,
  final bool paddInteger = true,
}) {
  final String groupSeparator =
      getLocaleGroupSeparator(ui.window.locale.toString().split("_")[0]);
  final String decimalSeparator =
      getLocaleDecimalSeparator(ui.window.locale.toString().split("_")[0]);
  final String formattedAmount = formatTokenAmount(
    tokenAmount: tokenAmount,
    groupSeparator: groupSeparator,
    decimalSeparator: decimalSeparator,
    maxDecimalPlaces: maxDecimalPlaces,
    paddInteger: paddInteger,
  );
  return formattedAmount;
}

String formatTokenAmount({
  /// token amount in double format
  required final String tokenAmount,
  required final String groupSeparator,
  required final String decimalSeparator,
  final int? maxDecimalPlaces,
  final bool paddInteger = true,
}) {
  if (tokenAmount.isEmpty || double.tryParse(tokenAmount) == null) {
    return tokenAmount;
  } else {
    final List<String> parts = tokenAmount.split(RegExp(r"[^\d]"));
    final String integerPart = parts.first;
    final String formattedIntegerPart = formatIntegerNumber(
      number: integerPart,
      groupSeparator: groupSeparator,
    );
    String res = formattedIntegerPart;

    if (parts.length > 1) {
      String fractionalPart = parts.elementAt(1);
      if (maxDecimalPlaces != null &&
          fractionalPart.length > maxDecimalPlaces) {
        fractionalPart = fractionalPart.substring(0, maxDecimalPlaces);
        fractionalPart = fractionalPart + "...";
      }
      res = res + decimalSeparator + fractionalPart;
    } else {
      if (paddInteger) {
        res = res + decimalSeparator + "00";
      }
    }
    return res;
  }
}

String formatIntegerNumber({
  required final String number,
  required final String groupSeparator,
}) {
  if (number.length <= 3) {
    return number;
  } else {
    final Characters digits = number.characters;
    List<String> digitsGrouped = [];
    for (int i = digits.length - 1; i >= 0; i--) {
      if (i < digits.length - 1 && (digits.length - 1 - i) % 3 == 0) {
        digitsGrouped.add(groupSeparator);
      }
      digitsGrouped.add(digits.elementAt(i));
    }
    digitsGrouped = digitsGrouped.reversed.toList();
    return digitsGrouped.join("");
  }
}

String getLocaleDecimalSeparator(String locale) {
  return numberFormatSymbols[locale].DECIMAL_SEP ?? "";
}

String getLocaleGroupSeparator(final String locale) {
  return numberFormatSymbols[locale].GROUP_SEP ?? "";
}

/// returns horizontal padding applied to all pages
EdgeInsetsGeometry generatePageHorizontalPadding(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: isMobile(context)
        ? 0
        : MediaQuery.of(context).size.width > Sizes.desktopMaxWidth1000
            ? Sizes.padding30
            : Sizes.padding12,
  );
}
