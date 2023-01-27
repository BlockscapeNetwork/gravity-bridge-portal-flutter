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

// ignore_for_file: avoid_web_libraries_in_flutter, library_prefixes

import 'dart:async';
import 'dart:convert';
import 'dart:js';
import 'dart:js_util';
import 'dart:math';
import 'dart:typed_data';
import 'package:alan/proto/cosmos/crypto/secp256k1/keys.pb.dart' as alan;
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:alan/types/export.dart';
// import 'package:alan/types/export.dart';
import 'package:gravity_bridge_flutter/assets.dart';
import 'package:gravity_bridge_flutter/generated/proto/ibc/applications/transfer/v1/tx.pbgrpc.dart';
import 'package:gravity_bridge_flutter/generated/proto/ibc/core/client/v1/client.pb.dart'
    as ibc_client;
import 'package:gravity_bridge_flutter/models/enums/transfer_type.dart';
import 'package:gravity_bridge_flutter/models/token_info.dart';
import 'package:gravity_bridge_flutter/services/chain_info_service.dart' as cis;
import 'package:gravity_bridge_flutter/services/coingecko_service.dart';
import 'package:gravity_bridge_flutter/services/ledger/ledger_service.dart';
import 'package:gravity_bridge_flutter/services/metamask_service.dart';
import 'package:gravity_bridge_flutter/services/signing/amino_message.dart';
import 'package:gravity_bridge_flutter/services/signing/amino_sign_docs.dart';
import 'package:gravity_bridge_flutter/services/signing/cancel_send_to_eth_amino.dart';
import 'package:gravity_bridge_flutter/services/signing/ibc_transfer_amino.dart';
import 'package:gravity_bridge_flutter/services/signing/send_to_eth_amino.dart';
import 'package:grpc/grpc_web.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:gravity_bridge_flutter/generated/proto/cosmos/bank/v1beta1/query.pbgrpc.dart';
import 'package:gravity_bridge_flutter/generated/proto/cosmos/base/v1beta1/coin.pb.dart'
    as protoCoin;
import 'package:gravity_bridge_flutter/generated/proto/cosmos/crypto/secp256k1/keys.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/cosmos/tx/signing/v1beta1/signing.pbenum.dart';
import 'package:gravity_bridge_flutter/generated/proto/cosmos/tx/v1beta1/tx.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/google/protobuf/any.pb.dart';
import 'package:gravity_bridge_flutter/generated/proto/gravity/v1/msgs.pb.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_lcd/cosmos_lcd.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/cosmos_rpc.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/common_query_tx_resp.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/rpc_request.dart';
import 'package:gravity_bridge_flutter/services/cosmos/cosmos_rpc/types/tx_broadcast_response.dart';
import 'package:gravity_bridge_flutter/services/keplr/keplr.dart';

import '../bin/config.dart';
import '../generated/proto/cosmos/base/query/v1beta1/pagination.pb.dart';
import '../models/exceptions.dart';
import 'chain_configs/chain_configs.dart';

import 'cosmos/cosmos_lcd/types/denom_trace.dart';

final _rpc = Config.keplr.rpc;
final _lcd = Config.keplr.lcd;
final _chainID = Config.keplr.chainID;

class KeplrService {
  static Chain currentlySelected = Chain.gravity;

  static StreamController<String> _accountsController =
      StreamController<String>.broadcast();

  static bool isKeplrInstalled() {
    return keplr != null;
  }

  static Future connectWallet() {
    if (keplr != null) {
      return promiseToFuture(keplr!.enable(_chainID));
    } else {
      throw Exception("keplr wasn't found");
    }
  }

  static Future requestConnectionToExperimentalChain(Chain chainName) async {
    currentlySelected = chainName;

    if (keplr != null) {
      final chainInfo = chainInfos[chainName];
      if (chainInfo != null) {
        return promiseToFuture(keplr!.experimentalSuggestChain(chainInfo));
      }
      throw Exception(
          "Cannot connect keplr to chain. No chain configuration found for ${chainName.toString()}.");
    } else {
      throw MissingExtensionException("Keplr");
    }
  }

  static Future<String> getAddress(Chain? chainName) async {
    var key = await getKey(chainName);
    return key.bech32Address;
  }

  static Future<AccKey> getKey(Chain? chainName) async {
    final cn = chainName ?? currentlySelected;
    if (keplr != null) {
      final chainInfo = chainInfos[cn];

      if (chainInfo == null) {
        throw Exception(
            "Cannot get account info for $cn chain. No chain configuration found.");
      }

      var res = await promiseToFuture(keplr!.getKey(chainInfo.chainId));

      var addrProp = getProperty(res, "address");
      var address = addrProp is List ? addrProp : [];

      var pubKeyProp = getProperty(res, "pubKey");
      var pubKey = pubKeyProp is List<dynamic> ? pubKeyProp : [];

      var nameProp = getProperty(res, "name");
      var name = nameProp is String ? nameProp : "";

      var algoProp = getProperty(res, "algo");
      var algo = algoProp is String ? algoProp : "";

      var bech32Prop = getProperty(res, "bech32Address");
      var bech32 = bech32Prop is String ? bech32Prop : "";

      var key = AccKey(
          address: address,
          pubKey: pubKey,
          name: name,
          algo: algo,
          bech32Address: bech32);
      return key;
    } else {
      throw Exception("Keplr wasn't found in your browser.");
    }
  }

  static Stream<String> listenForAccountChange() {
    if (_accountsController.isClosed) {
      _accountsController = StreamController<String>.broadcast();
    }

    if (keplr != null) {
      addEventListender("keplr_keystorechange",
          // will be called with an event that we don't need, but it must be present so no exception will be thrown
          allowInterop((dynamic value) async {
        var address = await getAddress(currentlySelected);
        _accountsController.add(address);
        debugPrint("keplr adress change event registered");
      }));

      return _accountsController.stream;
    } else {
      throw KeplrNotFoundException();
    }
  }

  static Future<List<TokenInfo>> getTokensListOfAddress(
      String accAddr, bool bridgeFilter) async {
    final channel = GrpcWebClientChannel.xhr(Uri.parse(Config.keplr.webGRPC));

    var bal = await QueryClient(channel).allBalances(QueryAllBalancesRequest(
      address: accAddr,
      pagination: PageRequest(),
    ));

    return _createTokenInfoFromCoins(bal.balances, _lcd, bridgeFilter);
  }

  static Future<List<TokenInfo>> getTokensListOfAddressOfChain(
      String accAddr, String lcdAddr, bool bridgeFilter) async {
    final bal = await CosmosLcdService.getBalanceOfAddress(
        lcdAddr: lcdAddr, accAddr: accAddr);
    final coins = bal.result
        .map((e) => protoCoin.Coin(amount: e.amount, denom: e.denom))
        .toList();

    return _createTokenInfoFromCoins(coins, lcdAddr, bridgeFilter);
  }

  // bridge filter will only return bridgeadble tokens
  static Future<List<TokenInfo>> _createTokenInfoFromCoins(
      List<protoCoin.Coin> coins, String lcdAddr, bool bridgeFilter) async {
    final List<TokenInfo> tokens = [];
    for (final coin in coins) {
      // if bridge filter is active but the coin is not a gravity token we will skip it.
      if (bridgeFilter) {
        if (!Config.keplr.gravityTokens
                .any((gravToken) => gravToken.denom == coin.denom) &&
            !coin.denom.startsWith("gravity0x")) {
          continue;
        }
      }

      // will use the denom as default symbol
      String baseDenom = coin.denom;

      debugPrint('${coin.denom}: ${coin.amount}');
      if (coin.denom.startsWith("ibc/")) {
        try {
          final tokenInfo =
              await KeplrService.getIBCTokenInfo(coin.denom, lcdAddr);
          baseDenom = tokenInfo.denomTrace.baseDenom;
        } catch (e) {
          debugPrint(e.toString());
          // Couldn't find any ibc info, so baseDenom will stay coin.denom
        }
      }

      if (baseDenom.startsWith("gravity0x")) {
        final address = baseDenom.replaceFirst("gravity", "");
        final result = CoinGeckoService.searchToken(address);
        if (result.isNotEmpty) {
          tokens.add(TokenInfo(
            symbol: result.first.symbol,
            name: result.first.name,
            address: coin.denom,
            iconUrl: result.first.iconUrl,
            denom: coin.denom,
            balance: coin.amount,
            decimals: result.first.decimals,
          ));
        } else {
          final dec = await MetamaskService.erc20GetDecimals(address);
          final name = await MetamaskService.erc20GetName(address);
          final symbol = await MetamaskService.erc20GetSymbol(address);
          final ti = TokenInfo(
            symbol: symbol,
            name: name,
            address: address,
            denom: coin.denom,
            decimals: dec!.toInt(),
            balance: coin.amount,
          );
          tokens.add(ti);
        }
      } else {
        try {
          var ti = Config.keplr.currencyRegistry.getTokenInfo(baseDenom);
          ti = ti.copyWith(
            balance: coin.amount,
            denom: coin.denom,
          );
          tokens.add(ti);
        } catch (e) {
          String name = baseDenom;
          if (name.startsWith("ibc") || name.startsWith("cw20")) {
            name = name.truncateDots();
          }
          final ti = TokenInfo(
            symbol: name,
            name: name,
            address: coin.denom,
            denom: coin.denom,
            decimals: 0,
            balance: coin.amount,
            iconUrl: Assets.logoIbcToken,
          );
          tokens.add(ti);
        }
      }
    }
    return tokens;
  }

  static Future<Map<String, String>> getTokensOfAddress(String accAddr) async {
    final Map<String, String> tokens = {};
    final channel = GrpcWebClientChannel.xhr(Uri.parse(Config.keplr.webGRPC));

    var bal = await QueryClient(channel).allBalances(
        QueryAllBalancesRequest(address: accAddr, pagination: PageRequest()));
    for (final coin in bal.balances) {
      debugPrint('${coin.denom}: ${coin.amount}');
      tokens[coin.denom] = coin.amount;
    }
    return tokens;
  }

  /* Warning this needs to be updated to current version of sendToEthMsg once the new gravity Version was released and proto files are available */
  static Future<String> signSendToEthTxProto(
    String toAddress,
    String fromAddress,
    String transferAmount,
    String transferDenom,
    String bridgeAmount,
    WalletType fromWalletType,
  ) async {
    debugPrint(
        "transferDenom: $transferDenom; transferAmount: $transferAmount; bridgeDenom: $transferDenom; bridgeAmount: $bridgeAmount; toAddress: $toAddress");

    final accAndAuthInfo = await _getAccountAndAuthInfo(
        _lcd, _chainID, fromAddress, fromWalletType);

    // create proto encoded TxBody
    var signDoc = _createSendToEthSignDoc(
        fromAddress,
        toAddress,
        transferAmount,
        transferDenom,
        bridgeAmount,
        int.parse(accAndAuthInfo.account.accountNumber),
        accAndAuthInfo.authInfo);

    final String tx = await _signAndBroadcastJSSignDocProto(
        signDoc, _chainID, fromAddress, _rpc);
    dlog(
        "Registered Transaction - Hash: $tx, Chain: $_chainID, FromAddress: $fromAddress, RPC-url: $_rpc",
        "signTransaction");
    return tx;
  }

  static Future<String> signSendToEthTxAmino(
    String toAddress,
    String fromAddress,
    String transferAmount,
    String transferDenom,
    String bridgeFeeAmount,
    String chainFeeAmount,
    WalletType fromWalletType,
    Chain fromChain,
    WidgetRef ref,
  ) async {
    debugPrint(
        "transferDenom: $transferDenom; transferAmount: $transferAmount; bridgeDenom: $transferDenom; bridgeAmount: $bridgeFeeAmount; toAddress: $toAddress");

    final accAndAuthInfo = await _getAccountAndAuthInfo(
        _lcd, _chainID, fromAddress, fromWalletType);

    // create proto encoded TxBody
    var signDoc = createSendToEthSignDocAmino(
        fromAddress,
        toAddress,
        transferAmount,
        transferDenom,
        bridgeFeeAmount,
        chainFeeAmount,
        accAndAuthInfo.account.accountNumber,
        accAndAuthInfo.account.sequence,
        _chainID);

    return _signAndBroadcastStdSignDocAmino(
      signDoc,
      _chainID,
      fromAddress,
      _rpc,
      fromWalletType,
      fromChain,
      ref,
    );
  }

  /// This will create, sign and broadcast a MsgCancelSendToEth
  /// and return a hash of the transaction which can be polled to check for completion.
  /// Only bridge transactions that have not been batched yet can be cancelled.
  /// Use at the GravityService to get a Transaction ID and check wether is has been
  /// batched/completed already.
  static Future<String> signCancelSendToEthTxProto(
    Int64 transactionId,
    String fromAddress,
    WalletType fromWalletType,
  ) async {
    final accAndAuthInfo = await _getAccountAndAuthInfo(
        _lcd, _chainID, fromAddress, fromWalletType);

    // create proto encoded TxBody
    var signDoc = _createCancelSignDoc(
        fromAddress,
        transactionId,
        int.parse(accAndAuthInfo.account.accountNumber),
        accAndAuthInfo.authInfo);

    return _signAndBroadcastJSSignDocProto(
        signDoc, _chainID, fromAddress, _rpc);
  }

  static Future<String> signCancelSendToEthTxAmino(
    Int64 transactionId,
    String fromAddress,
    WalletType fromWalletType,
    Chain fromChain,
    String transferAmount,
    WidgetRef ref,
  ) async {
    final accAndAuthInfo = await _getAccountAndAuthInfo(
        _lcd, _chainID, fromAddress, fromWalletType);

    // create proto encoded TxBody
    var signDoc = createCancelSignDocAmino(
        fromAddress,
        transactionId,
        accAndAuthInfo.account.accountNumber,
        accAndAuthInfo.account.sequence,
        _chainID);

    return _signAndBroadcastStdSignDocAmino(
      signDoc,
      _chainID,
      fromAddress,
      _rpc,
      fromWalletType,
      fromChain,
      ref,
    );
  }

  /// Will generally return account and auth info. If WalletType is Ledger only acc will be returned so we don't need to connect to Keplr for unnecessary data.
  static Future<AccountAndAuthInfo> _getAccountAndAuthInfo(String lcd,
      String chainID, String addr, WalletType fromWalletType) async {
    debugPrint("$lcd , $chainID, $addr");

    final acc = await CosmosLcdService.getAccount(lcd, addr);
    if (fromWalletType == WalletType.ledger) {
      return AccountAndAuthInfo(acc, AuthInfo());
    }

    debugPrint("account: ${acc.toString()}");
    // create proto encoded AuthBytes
    var key = await promiseToFuture(keplr!.getKey(chainID));
    debugPrint(key.toString());
    String keyAlgo = _checkAndGetProperty(key, "algo");
    if (keyAlgo != "secp256k1") {
      throw Exception("unknown pubkey type");
    }
    debugPrint(keyAlgo);

    final List<int> pubkey = _checkAndGetProperty(key, "pubKey");
    if (pubkey.length != 33 || (pubkey[0] != 0x02 && pubkey[0] != 0x03)) {
      throw Exception(
          "Public key must be compressed secp256k1, i.e. 33 bytes starting with 0x02 or 0x03");
    }

    debugPrint(pubkey.toString());

    var encPubKey = PubKey(key: pubkey).writeToBuffer();
    // evmos uses a different key type
    Any anyPubKey;
    if (acc.type == evmosAccountType) {
      anyPubKey = Any(
          typeUrl: "/ethermint.crypto.v1.ethsecp256k1.PubKey",
          value: encPubKey);
    } else {
      anyPubKey =
          Any(typeUrl: "/cosmos.crypto.secp256k1.PubKey", value: encPubKey);
    }

    var authInfo = AuthInfo(
        fee: Fee(
            amount: [protoCoin.Coin(denom: "", amount: "0")],
            gasLimit: Int64(200000)),
        signerInfos: [
          SignerInfo(
              publicKey: anyPubKey,
              modeInfo: ModeInfo(
                  single: ModeInfo_Single(mode: SignMode.SIGN_MODE_DIRECT)),
              sequence: Int64.parseInt(acc.sequence))
        ]);

    return AccountAndAuthInfo(acc, authInfo);
  }

  static Future<String> _signAndBroadcastStdSignDocAmino(
    StdSignDoc signDoc,
    String chainID,
    String signerAddr,
    String rpc,
    WalletType fromWalletType,
    Chain fromChain,
    WidgetRef ref,
  ) async {
    AminoSignResponse signResponse;
    try {
      debugPrint(signDoc.toString());
      final sd = stringify(signDoc);
      debugPrint(sd);

      // Template for ledger signing
      // We need to set the fees, for grav > eth this is already covered by recent proposals
      // But IBC fees need to be set manually

      /// SET FEE FOR LEDGER
      if (fromWalletType == WalletType.ledger) {
        const int gas = 300000;
        final ChainInfo chainInfo = chainInfos[fromChain]!;
        final String denom = chainInfo.feeCurrencies[0].coinMinimalDenom;
        if (chainID == _chainID) {
          // set zero fees when sender is gravity
          signDoc.fee.gas = gas.toString();
          signDoc.fee.amount.add(Coin(denom: denom, amount: "0"));
        } else {
          // set fees normally for other chains
          final String fee =
              (gas.toDouble() * chainInfo.feeCurrencies[0].gasPriceStep.low.toDouble())
                  .ceil()
                  .toString();
          signDoc.fee.gas = gas.toString();
          signDoc.fee.amount.add(Coin(denom: denom, amount: fee));
        }
      } else {
        /// SET FEE FOR KEPLR
        if (chainID == _chainID) {
          // Only enforce zero fee on gravity
          setProperty(
              keplr!,
              "defaultOptions",
              KeplrInteractionOptions(
                  sign: KeplrSignOptions(
                      preferNoSetFee: true, preferNoSetMemo: false)));
        } else {
          setProperty(
              keplr!,
              "defaultOptions",
              KeplrInteractionOptions(
                  sign: KeplrSignOptions(
                      preferNoSetFee: false, preferNoSetMemo: false)));
        }
      }

      // SIGN RESPONSE FOR LEDGER
      if (fromWalletType == WalletType.ledger) {
        // Template for Ledger
        final addr = await LedgerService.getAddressFromLedger(
            fromChain.chainPrefix, ref);
        final sig =
            await LedgerService.signAmino(chainID, signerAddr, signDoc, ref);
        dlog("Signature $sig");
        signResponse = AminoSignResponse(
            signature: Signature(
                pub_key: PubKeyAmino(
                    type: "tendermint/PubKeySecp256k1",
                    value: addr.pubKeyBase64),
                signature: sig),
            signed: signDoc);
      }
      // SIGN RESPONSE FOR KEPLR
      else {
        signResponse = await promiseToFuture<AminoSignResponse>(
            keplr!.signAmino(chainID, signerAddr, signDoc));
      }

      dlog("Signature ${signResponse.signature.signature}");
      // signResponse.signature.signature = "";
    } catch (e) {
      rethrow;
    }
    debugPrint("sign response:");
    debugPrint(stringify(signResponse));
    debugPrint("Creating TxRaw");
    final txRaw = _createTxRaw(signResponse);

    debugPrint("Broadcasting tx");
    final broadcastResponse =
        await _broadcastTx(txRaw, "broadcast_tx_sync", rpc);

    if (broadcastResponse.error != null) {
      throw BlockchainException(
          "Error while broadcasting tx: Code ${broadcastResponse.error!.code}: ${broadcastResponse.error!.message}. ${broadcastResponse.error!.data}");
    }

    // if error is null as checked above result will not be null
    if (broadcastResponse.result!.code != 0) {
      throw BlockchainException(
          "Error while broadcasting tx: Code ${broadcastResponse.result!.code}: ${broadcastResponse.result!.log}");
    }

    return broadcastResponse.result!.hash;
  }

  static TxRaw _createTxRaw(AminoSignResponse signResponse) {
    final txBody = TxBody(
        memo: signResponse.signed.memo,
        messages: signResponse.signed.msgs.map((msg) {
          return Any(
              typeUrl: aminoTypeToProto(msg.type), value: fromAmino(msg));
        }));

    final authInfo = AuthInfo(
        fee: Fee(
            amount: [], gasLimit: Int64.parseInt(signResponse.signed.fee.gas)),
        signerInfos: [
          SignerInfo(
            publicKey: Any(
                typeUrl: "/cosmos.crypto.secp256k1.PubKey",
                value: alan.PubKey(
                        key:
                            base64.decode(signResponse.signature.pub_key.value))
                    .writeToBuffer()),
            sequence: Int64.parseInt(signResponse.signed.sequence),
            modeInfo: ModeInfo(
                single: ModeInfo_Single(
                    mode: SignMode.SIGN_MODE_LEGACY_AMINO_JSON)),
          )
        ]);

    if (signResponse.signed.fee.amount.isNotEmpty) {
      authInfo.fee = Fee(amount: [
        protoCoin.Coin(
            amount: signResponse.signed.fee.amount[0].amount,
            denom: signResponse.signed.fee.amount[0].denom)
      ], gasLimit: Int64.parseInt(signResponse.signed.fee.gas));
    }

    final txRaw = TxRaw(
      authInfoBytes: authInfo.writeToBuffer(),
      bodyBytes: txBody.writeToBuffer(),
      signatures: [base64Decode(signResponse.signature.signature)],
    );

    return txRaw;
  }

  static Future<String> _signAndBroadcastJSSignDocProto(
      JSSignDoc signDoc, String chainID, String signerAddr, String rpc) async {
    debugPrint(signDoc.toString());

    // Only enforce zero fee on gavity
    if (chainID == _chainID) {
      setProperty(
          keplr!,
          "defaultOptions",
          KeplrInteractionOptions(
              sign: KeplrSignOptions(
                  preferNoSetFee: true, preferNoSetMemo: false)));
    } else {
      setProperty(
          keplr!,
          "defaultOptions",
          KeplrInteractionOptions(
              sign: KeplrSignOptions(
                  preferNoSetFee: false, preferNoSetMemo: false)));
    }

    dynamic signResponse;
    try {
      signResponse = await promiseToFuture(
          keplr!.signDirect(chainID, signerAddr, signDoc));
    } catch (e, s) {
      rlogError(
          message: "Chain: $chainID, Addr: $signerAddr, Rpc-Url: $rpc",
          error: e,
          stackTrace: s,
          prefix: "_signAndBroadcastJSSignDoc");
      rethrow;
    }

    final parsedSigned = _parseDirectSignResponse(signResponse);

    final broadcastTx = TxRaw(
        authInfoBytes: parsedSigned.authInfoBytes,
        bodyBytes: parsedSigned.bodyBytes,
        signatures: [base64.decode(parsedSigned.signature)]);

    final broadcastResponse =
        await _broadcastTx(broadcastTx, "broadcast_tx_sync", rpc);

    if (broadcastResponse.error != null) {
      throw BlockchainException(
          "Error while broadcasting tx: Code ${broadcastResponse.error!.code}: ${broadcastResponse.error!.message}. ${broadcastResponse.error!.data}");
    }

    // if error is null as checked above result will not be null
    if (broadcastResponse.result!.code != 0) {
      throw BlockchainException(
          "Error while broadcasting tx: Code ${broadcastResponse.result!.code}: ${broadcastResponse.result!.log}");
    }

    return broadcastResponse.result!.hash;
  }

  /// This function will poll for the status of the newly started transaction and return it
  static Future<TransactionProgress> checkStartedTxStatus({
    required String fromAddress,
    required String toAddress,
    required TokenInfo token,
    required String transactionHash,
    String? rpc,
  }) async {
    const String logPrefix = "checkSendToEthTx";
    rpc ??= _rpc;

    late final TransactionProgress transactionProgress;
    try {
      final txResult = await pollForTransaction(transactionHash, rpc);
      if (txResult.success) {
        transactionProgress = TransactionComplete(transactionHash);
      } else {
        dlog(
            "Transaction FAILED - Message: ${txResult.message}, ID: $transactionHash",
            logPrefix);
        transactionProgress =
            TransactionError(transactionHash, txResult.message);
      }
    } catch (error, s) {
      dlogError(error: error, stackTrace: s, prefix: logPrefix);
      transactionProgress = TransactionStarted(transactionHash, token.address);
    }

    dlog(
        "New Transaction $fromAddress->$toAddress; with ID $transactionHash and Status $transactionProgress",
        logPrefix);

    return transactionProgress;
  }

  static JSSignDoc _createSendToEthSignDoc(
      String fromAddress,
      String toAddress,
      String transferAmount,
      String transferDenom,
      String bridgeAmount,
      int accountNumber,
      AuthInfo authInfo) {
    final msg = MsgSendToEth(
        sender: fromAddress,
        ethDest: toAddress,
        amount: protoCoin.Coin(amount: transferAmount, denom: transferDenom),
        bridgeFee: protoCoin.Coin(amount: bridgeAmount, denom: transferDenom));
    var encMsg = msg.writeToBuffer();

    return _signMsg(
        encMsg, msgSendToEthType, accountNumber, authInfo, _chainID);
  }

  static JSSignDoc _createCancelSignDoc(String fromAddress, Int64 transactionID,
      int accountNumber, AuthInfo authInfo) {
    final msg =
        MsgCancelSendToEth(sender: fromAddress, transactionId: transactionID);
    var encMsg = msg.writeToBuffer();

    return _signMsg(
        encMsg, msgCancelSendToEthType, accountNumber, authInfo, _chainID);
  }

  static Future<String> signIbcTransferToGravityAmino(
    String toAddress,
    String fromAddress,
    String transferAmount,
    String transferDenom,
    IbcChain originatingChain,
    WalletType fromWalletType,
    Chain fromChain,
    Chain toChain,
    WidgetRef ref,
  ) async {
    // ugly fix but evmos doesn't support amino
    // as soon as we have signing type selection based on address type we can remove this
    if (originatingChain.chainName == Chain.evmos ||
        originatingChain.chainName == Chain.agoric) {
      return signIbcTransferToGravityProto(toAddress, fromAddress,
          transferAmount, transferDenom, originatingChain, fromWalletType);
    }

    final chainInfo = chainInfos[originatingChain.chainName];
    if (chainInfo == null) {
      throw Exception("No chain info found for ${originatingChain.toString()}");
    }

    final sourceChannel = originatingChain.channelNative;
    final sourcePort = originatingChain.channelID;

    final accAndAuthInfo = await _getAccountAndAuthInfo(
        chainInfo.rest, chainInfo.chainId, fromAddress, fromWalletType);

    // create proto encoded TxBody
    var signDoc = await createIbcSignDocAmino(
      fromAddress,
      toAddress,
      transferAmount,
      transferDenom,
      accAndAuthInfo.account.accountNumber,
      accAndAuthInfo.account.sequence,
      sourceChannel,
      sourcePort,
      chainInfo.chainId,
      Chain.gravity,
    );

    return _signAndBroadcastStdSignDocAmino(
      signDoc,
      chainInfo.chainId,
      fromAddress,
      chainInfo.rpc,
      fromWalletType,
      fromChain,
      ref,
    );
  }

  static Future<String> signIbcTransferToGravityProto(
    String toAddress,
    String fromAddress,
    String transferAmount,
    String transferDenom,
    IbcChain originatingChain,
    WalletType fromWalletType,
  ) async {
    final chainInfo = chainInfos[originatingChain.chainName];
    if (chainInfo == null) {
      throw Exception("No chain info found for ${originatingChain.toString()}");
    }

    final sourceChannel = originatingChain.channelNative;
    final sourcePort = originatingChain.channelID;

    final accAndAuthInfo = await _getAccountAndAuthInfo(
        chainInfo.rest, chainInfo.chainId, fromAddress, fromWalletType);

    final transferToGravSignDoc = await _createIbcSignDoc(
        fromAddress,
        toAddress,
        transferAmount,
        transferDenom,
        int.parse(accAndAuthInfo.account.accountNumber),
        accAndAuthInfo.authInfo,
        sourceChannel,
        sourcePort,
        Chain.gravity,
        chainInfo.chainId);

    return _signAndBroadcastJSSignDocProto(
        transferToGravSignDoc, chainInfo.chainId, fromAddress, chainInfo.rpc);
  }

  static Future<String> signIbcTransferFromGravityAmino(
    String toAddress,
    String fromAddress,
    String transferAmount,
    String transferDenom,
    IbcChain destinationChain,
    WalletType fromWalletType,
    Chain fromChain,
    ChainInfo chainInfo,
    WidgetRef ref,
  ) async {
    final sourceChannel = destinationChain.channelGravity;
    final sourcePort = destinationChain.channelID;

    final authAndAcc = await _getAccountAndAuthInfo(
        _lcd, _chainID, fromAddress, fromWalletType);

    // create proto encoded TxBody
    var signDoc = await createIbcSignDocAmino(
        fromAddress,
        toAddress,
        transferAmount,
        transferDenom,
        authAndAcc.account.accountNumber,
        authAndAcc.account.sequence,
        sourceChannel,
        sourcePort,
        _chainID,
        destinationChain.chainName);

    return _signAndBroadcastStdSignDocAmino(
      signDoc,
      _chainID,
      fromAddress,
      _rpc,
      fromWalletType,
      fromChain,
      ref,
    );
  }

  static Future<String> signIbcTransferFromGravityProto(
    String toAddress,
    String fromAddress,
    String transferAmount,
    String transferDenom,
    IbcChain destinationChain,
    WalletType fromWalletType,
  ) async {
    final sourceChannel = destinationChain.channelGravity;
    final sourcePort = destinationChain.channelID;

    final chainInfo = chainInfos[Chain.gravity];
    if (chainInfo == null) {
      throw Exception("No chain info found for ${Chain.gravity.toString()}");
    }

    final accountAndAuthInfo = await _getAccountAndAuthInfo(
        chainInfo.rest, chainInfo.chainId, fromAddress, fromWalletType);

    final transferFromGravSignDoc = await _createIbcSignDoc(
        fromAddress,
        toAddress,
        transferAmount,
        transferDenom,
        int.parse(accountAndAuthInfo.account.accountNumber),
        accountAndAuthInfo.authInfo,
        sourceChannel,
        sourcePort,
        destinationChain.chainName,
        chainInfo.chainId);
    final tx = _signAndBroadcastJSSignDocProto(
        transferFromGravSignDoc, _chainID, fromAddress, _rpc);
    dlog(
        "Registered Transaction - Hash: $tx, Chain: ${chainInfo.chainId}, FromAddress: $fromAddress, RPC-url: ${chainInfo.rpc}",
        "ibcTransferFromGravity");
    return tx;
  }

  static Future<DenomTraceResp> getIBCTokenInfo(
      String denom, String lcdAddr) async {
    if (!denom.startsWith("ibc/")) {
      throw Exception("Not a valid ibc denom");
    }
    final hash = denom.substring(4);

    try {
      return await CosmosLcdService.getDenomTrace(hash, lcdAddr);
    } catch (e) {
      // If the chain isn't using the current external ibc module, we will use the legacy endpoint
      return CosmosLcdService.getDenomTraceLegacy(hash, lcdAddr);
    }
  }

  static Future<JSSignDoc> _createIbcSignDoc(
    String fromAddress,
    String toAddress,
    String transferAmount,
    String transferDenom,
    int accountNumber,
    AuthInfo authInfo,
    String sourceChannel,
    String sourcePort,
    Chain destinationChain,
    String sourceChainID,
  ) async {
    final chainStatus = await cis.ChainInfoService.getStatus(destinationChain);
    if (chainStatus.result.syncInfo.catchingUp) {
      throw Exception(
          "rpc node ${destinationChain.toString()} is currently syncing and can't be used");
    }

    final targetChainID = chainStatus.result.nodeInfo.network;
    final chainHeight =
        int.parse(chainStatus.result.syncInfo.latestBlockHeight);

    final msg = MsgTransfer(
      receiver: toAddress,
      sender: fromAddress,
      sourceChannel: sourceChannel,
      sourcePort: sourcePort,
      timeoutHeight: ibc_client.Height(
          revisionHeight: Int64(chainHeight + 150),
          revisionNumber: Int64(
              cis.ChainInfoService.getVersionFromChainID(targetChainID)
                  .version)),
      // timeoutTimestamp: ,
      token: protoCoin.Coin(amount: transferAmount, denom: transferDenom),
    );

    var encMsg = msg.writeToBuffer();

    return _signMsg(
        encMsg, msgTransferType, accountNumber, authInfo, sourceChainID);
  }

  static JSSignDoc _signMsg(Uint8List msg, String type, int accountNumber,
      AuthInfo authInfo, chainID) {
    var encAuthInfo = authInfo.writeToBuffer();
    var anyMsg = Any(typeUrl: type, value: msg);

    var txBodyEncodeObject = TxBody(
        messages: [anyMsg], memo: ""); // add messages, and memo if wanted
    var encTxBodyEncodeObject = txBodyEncodeObject.writeToBuffer();

    return JSSignDoc(
        accountNumber: accountNumber,
        bodyBytes: encTxBodyEncodeObject,
        authInfoBytes: encAuthInfo,
        chainId: chainID);
  }

  static Future<TxBroadcastResponse> _broadcastTx(
      TxRaw tx, String method, String rpc) {
    final bz = tx.writeToBuffer();
    final req = RpcRequest(
        jsonrpc: "2.0",
        id: _numberWithoutZeroes(),
        method: method,
        params: Params(tx: base64Encode(bz)));
    debugPrint(req.params.tx);
    return CosmosRPCService.broadcastTx(rpc, rpcRequestToMap(req));
  }

  static int _numberWithoutZeroes() {
    const length = 12;
    var finalNumber = 0;
    final rng = Random();
    for (var i = 0; i < length; i++) {
      var digit = rng.nextInt(9) + 1;
      finalNumber = finalNumber + (digit * pow(10, i) as int);
    }
    return finalNumber;
  }

  static Future<CommonQueryTxResponse> pollForTransaction(
      String hash, String rpc) async {
    final url = CosmosRPCService.rpcUrlFromHash(rpc, hash);

    final timeoutLimit = DateTime.now().add(const Duration(seconds: 60));
    while (true) {
      // waiting longer between requests makes the CORS-error go away (for some reason)
      await Future.delayed(const Duration(seconds: 3));
      try {
        final res = await CosmosRPCService.queryTx(url);
        if (res.found) {
          return res;
        }
      } on Exception catch (e, _) {
        rlogError(
          message: "queryTx threw an Exception, retrying...",
          prefix: "pollForTransaction",
        );
      }

      if (DateTime.now().isAfter(timeoutLimit)) {
        rlog("Timed out without successful response", "pollForTransaction");
        throw Exception(
            "Couldn't find transaction with hash $hash in time. You should check manually at a later time.");
      }
    }
  }

  /*
    Expected object looks like this:
    {
      "signed": {
        "bodyBytes": "CiwKGC9ncmF2aXR5LnYxLk1zZ1NlbmRUb0V0aBIQCgASABoECgASACIECgASABIA",
        "authInfoBytes": "ClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEC1Tgq8Uvu9VYTyj+N1zIhKa5lQ1ZsGF1W5rskz3hqnzISBAoCCAEYARIXChEKCXVmb290b2tlbhIEMjAwMBDAmgw=",
        "chainId": "cgbtestnet1",
        "accountNumber": "19"
      },
      "signature": {
        "pub_key": {
          "type": "tendermint/PubKeySecp256k1",
          "value": "AtU4KvFL7vVWE8o/jdcyISmuZUNWbBhdVua7JM94ap8y"
        },
        "signature": "DEKxRqZvg5wA1WhnL9NfpIJnask2d5QoH/B6cvKusOg8q94YKCLYv7gzshw0LpTACOUj8q9ys21V0ehDuRPMbg=="
      }
    }
  */
  static DirectSignResponse _parseDirectSignResponse(dynamic res) {
    final signed = _checkAndGetProperty(res, "signed");
    final bodyBytes = _checkAndGetProperty(signed, "bodyBytes");
    final authInfoBytes = _checkAndGetProperty(signed, "authInfoBytes");

    final signature = _checkAndGetProperty(res, "signature");
    final sig = _checkAndGetProperty(signature, "signature");

    final bbBytes = bodyBytes is Uint8List ? bodyBytes : Uint8List(0);
    final aibBytes = authInfoBytes is Uint8List ? authInfoBytes : Uint8List(0);
    final sString = sig is String ? sig : "";

    if (bbBytes.isEmpty || aibBytes.isEmpty || sString == "") {
      throw Exception(
          "direct sign response did not contain all required values");
    }

    return DirectSignResponse(bbBytes, aibBytes, sString);
  }

  /*
    export interface AminoSignResponse {
  /**
   * The sign doc that was signed.
   * This may be different from the input signDoc when the signer modifies it as part of the signing process.
   */
  readonly signed: StdSignDoc;
  readonly signature: StdSignature;
}

export interface StdSignature {
  readonly pub_key: Pubkey;
  readonly signature: string;
}

export interface Pubkey {
  // type is one of the strings defined in pubkeyType
  // I don't use a string literal union here as that makes trouble with json test data:
  // https://github.com/cosmos/cosmjs/pull/44#pullrequestreview-353280504
  readonly type: string;
  readonly value: any;
}
  */
  // static DirectSignResponse _parseDirectSignResponse(dynamic res) {}

  static dynamic _checkAndGetProperty(dynamic o, String property) {
    if (hasProperty(o, property)) {
      return getProperty(o, property);
    } else {
      throw Exception(
          "property $property wasn't found in object ${o.toString()}");
    }
  }
}

class AccountAndAuthInfo {
  AuthInfo authInfo;
  GenericAccount account;

  AccountAndAuthInfo(this.account, this.authInfo);
}

class DirectSignResponse {
  Uint8List bodyBytes;
  Uint8List authInfoBytes;
  String signature;

  DirectSignResponse(this.bodyBytes, this.authInfoBytes, this.signature);
}

class KeplrNotFoundException implements Exception {
  @override
  String toString() {
    return "couldn't find keplr extension";
  }
}

class TxErrorException implements Exception {
  final String message;
  final CommonQueryTxResponse txResult;

  CommonQueryTxResponse get result {
    return txResult;
  }

  TxErrorException(this.message, this.txResult);

  @override
  String toString() {
    return "on chain tx error (height: ${txResult.height}): ${txResult.message}";
  }
}

Object convertKeplrJsException(Object jsException) {
  final Object? m = getProperty(jsException, "message");
  final String message = m?.toString() ?? "";
  switch (message) {
    case "Request rejected":
      return UserRejectedRequestException(jsException);
    default:
      return jsException;
  }
}
