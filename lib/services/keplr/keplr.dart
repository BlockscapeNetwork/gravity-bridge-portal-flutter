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

// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

@JS("window")
library keplr;

import 'package:js/js.dart';

// Calls invoke JavaScript `JSON.stringify(obj)`.
@JS('JSON.stringify')
external String stringify(Object obj);

@JS('addEventListener')
external String addEventListender(String event, Object obj);

@JS("keplr")
external Keplr? get keplr;

@JS("")
class Keplr {
  @JS("defaultOptions")
  external KeplrInteractionOptions defaultOptions;

  @JS("enable")
  external Future enable(String chainID);

  /*
    returns:
    {
      // Name of the selected key store.
      name: string;
      algo: string;
      pubKey: Uint8Array;
      address: Uint8Array;
      bech32Address: string;
    } 
  */
  @JS("getKey")
  external Future getKey(String chainID);

  @JS("signDirect")
  external Future signDirect(String chainID, String signer, JSSignDoc signDoc);

  @JS("signAmino")
  external Future signAmino(String chainID, String signer, StdSignDoc signDoc);

  // @JS("sendTx")
  // external Future sendTx(
  //     String chainID, StdTx stdTx, String mode /* "block", "sync", "async"*/);

  @JS("experimentalSuggestChain")
  external Future experimentalSuggestChain(ChainInfo chainInfo);
}

@JS()
@anonymous
class KeplrInteractionOptions {
  external KeplrSignOptions sign;

  external factory KeplrInteractionOptions({
    required KeplrSignOptions sign,
  });
}

@JS()
@anonymous
class KeplrSignOptions {
  external bool preferNoSetFee;
  external bool preferNoSetMemo;

  external factory KeplrSignOptions({
    required bool preferNoSetFee,
    required bool preferNoSetMemo,
  });
}

@JS()
@anonymous
class JSSignDoc {
  external List<dynamic> bodyBytes;
  external List<dynamic> authInfoBytes;
  external String chainId;
  external int accountNumber;

  external factory JSSignDoc({
    required String chainId,
    required int accountNumber,
    required List<dynamic> bodyBytes,
    required List<dynamic> authInfoBytes,
  });
}

@JS()
@anonymous
class AminoSignResponse {
  external Signature signature;
  external StdSignDoc signed;

  external factory AminoSignResponse({
    required Signature signature,
    required StdSignDoc signed,
  });
}

@JS()
@anonymous
class Signature {
  external PubKeyAmino pub_key;
  external String signature;

  external factory Signature({
    required PubKeyAmino pub_key,
    required String signature,
  });
}

@JS()
@anonymous
class PubKeyAmino {
  external String type;
  external String value;

  external factory PubKeyAmino({
    required String type,
    required String value,
  });
}

@JS()
@anonymous
class StdSignDoc {
  external String chain_id;
  external String account_number;
  external String sequence;
  external StdFee fee;
  external List<BaseMsg> msgs;
  external String memo;

  external factory StdSignDoc({
    required String chain_id,
    required String account_number,
    required String sequence,
    required StdFee fee,
    required List<BaseMsg> msgs,
    required String memo,
  });
}

@JS()
@anonymous
class BaseMsg {
  external String type;
  external dynamic value;

  external factory BaseMsg({
    required String type,
    required dynamic value,
  });
}

@JS()
@anonymous
class StdFee {
  external List<Coin> amount;
  external String gas;

  external factory StdFee({
    required List<Coin> amount,
    required String gas,
  });
}

@JS()
@anonymous
class Coin {
  external String denom;
  external String amount;

  external factory Coin({
    required String denom,
    required String amount,
  });
}

@JS()
@anonymous
class AccKey {
  external String name;
  external String algo;
  external List<dynamic> pubKey;
  external List<dynamic> address;
  external String bech32Address;

  external factory AccKey({
    required String name,
    required String algo,
    required List<dynamic> pubKey,
    required List<dynamic> address,
    required String bech32Address,
  });
}

// To parse this JSON data, do
//
//     final txBroadcastResponse = txBroadcastResponseFromJson(jsonString);

// ChainInfo chainInfoFromJson(String str) => ChainInfo.fromJson(json.decode(str));

// String chainInfoToJson(ChainInfo data) => json.encode(data.toJson());

@JS()
@anonymous
class ChainInfo {
  external String get rpc;
  external String get rest;
  external String get chainId;
  external String get chainName;
  external Currency get stakeCurrency;
  external String? get walletUrlForStaking;
  external BIP44 get bip44;
  external List<BIP44>? get alternativeBIP44s;
  external Bech32Config get bech32Config;
  external List<Currency> get currencies;
  external List<FeeCurrency> get feeCurrencies;
  external List<String>? get features;

  external factory ChainInfo({
    required final String rpc,
    required final String rest,
    required final String chainId,
    required final String chainName,
    required final Currency stakeCurrency,
    final String? walletUrlForStaking,
    required final BIP44 bip44,
    final List<BIP44>? alternativeBip44S,
    required final Bech32Config bech32Config,
    required final List<Currency> currencies,
    required final List<FeeCurrency> feeCurrencies,
    final List<String>? features,
  });
}

@JS()
@anonymous
class BIP44 {
  external int get coinType;

  external factory BIP44({
    required int coinType,
  });
}

@JS()
@anonymous
class Bech32Config {
  external String get bech32PrefixAccAddr;
  external String get bech32PrefixAccPub;
  external String get bech32PrefixValAddr;
  external String get bech32PrefixValPub;
  external String get bech32PrefixConsAddr;
  external String get bech32PrefixConsPub;

  external factory Bech32Config({
    required String bech32PrefixAccAddr,
    required String bech32PrefixAccPub,
    required String bech32PrefixValAddr,
    required String bech32PrefixValPub,
    required String bech32PrefixConsAddr,
    required String bech32PrefixConsPub,
  });
}

@JS()
@anonymous
class Currency {
  external String get coinDenom;
  external String get coinMinimalDenom;
  external int get coinDecimals;
  external String get coinGeckoId;

  external factory Currency({
    required String coinDenom,
    required String coinMinimalDenom,
    required int coinDecimals,
    required String coinGeckoId,
  });
}

@JS()
@anonymous
class FeeCurrency {
  external String get coinDenom;
  external String get coinMinimalDenom;
  external int get coinDecimals;
  external String get coinGeckoId;
  external GasPriceStep get gasPriceStep;

  external factory FeeCurrency({
    required String coinDenom,
    required String coinMinimalDenom,
    required int coinDecimals,
    required String coinGeckoId,
    required GasPriceStep gasPriceStep,
  });
}

@JS()
@anonymous
class GasPriceStep {
  external num get low;
  external num get average;
  external num get high;

  external factory GasPriceStep({
    required num low,
    required num average,
    required num high,
  });
}
