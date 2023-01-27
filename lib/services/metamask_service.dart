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
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

import 'package:gravity_bridge_flutter/constants.dart';
import 'package:gravity_bridge_flutter/models/exceptions.dart';
import 'package:gravity_bridge_flutter/utils.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js;

import 'package:flutter_web3_provider/ethereum.dart';
import 'package:flutter_web3_provider/ethers.dart';
import 'package:gravity_bridge_flutter/models/transaction_progress.dart';
import '../bin/config.dart';

// since we use flutter_web3_provider package for all other files/services
// use this package as web3Fork to avoid conflicts
import 'package:flutter_web3/flutter_web3.dart' as web3_fork;

class MetamaskService {
  static const List<String> erc20abi = [
    'function name() view returns (string)',
    'function approve(address _spender, uint _value) returns (bool)',
    'function totalSupply() view returns (uint)',
    'function transferFrom(address _from, address _to, uint _value) returns (bool)',
    'function decimals() view returns (uint8)',
    'function balanceOf(address _owner) view returns (uint balance)',
    'function symbol() view returns (string)',
    'function transfer(address _to, uint _value) returns (bool)',
    'function allowance(address _owner, address _spender) view returns (uint)',
    'event Approval(address indexed owner, address indexed spender, uint value)',
    'event Transfer(address indexed from, address indexed to, uint value)'
  ];

  static const List<String> gravityAbi = [
    'constructor(bytes32 _gravityId, address[] _validators, uint[] _powers)',
    'event ERC20DeployedEvent(string _cosmosDenom, address indexed _tokenContract, string _name, string _symbol, uint8 _decimals, uint _eventNonce)',
    'event LogicCallEvent(bytes32 _invalidationId, uint _invalidationNonce, bytes _returnData, uint _eventNonce)',
    'event SendToCosmosEvent(address indexed _tokenContract, address indexed _sender, string _destination, uint _amount, uint _eventNonce)',
    'event TransactionBatchExecutedEvent(uint indexed _batchNonce, address indexed _token, uint _eventNonce)',
    'event ValsetUpdatedEvent(uint indexed _newValsetNonce, uint _eventNonce, uint _rewardAmount, address _rewardToken, address[] _validators, uint[] _powers)',
    'function deployERC20(string _cosmosDenom, string _name, string _symbol, uint8 _decimals)',
    'function lastBatchNonce(address _erc20Address) view returns (uint)',
    'function lastLogicCallNonce(bytes32 _invalidation_id) view returns (uint)',
    'function sendToCosmos(address _tokenContract, string _destination, uint _amount)',
    'function state_gravityId() view returns (bytes32)',
    'function state_invalidationMapping(bytes32) view returns (uint)',
    'function state_lastBatchNonces(address) view returns (uint)',
    'function state_lastEventNonce() view returns (uint)',
    'function state_lastValsetCheckpoint() view returns (bytes32)',
    'function state_lastValsetNonce() view returns (uint)',
    'function submitBatch(tuple(address[] validators, uint[] powers, uint valsetNonce, uint rewardAmount, address rewardToken) _currentValset, tuple(uint8 v, bytes32 r, bytes32 s)[] _sigs, uint[] _amounts, address[] _destinations, uint[] _fees, uint _batchNonce, address _tokenContract, uint _batchTimeout)',
    'function submitLogicCall(tuple(address[] validators, uint[] powers, uint valsetNonce, uint rewardAmount, address rewardToken) _currentValset, tuple(uint8 v, bytes32 r, bytes32 s)[] _sigs, tuple(uint[] transferAmounts, address[] transferTokenContracts, uint[] feeAmounts, address[] feeTokenContracts, address logicContractAddress, bytes payload, uint timeOut, bytes32 invalidationId, uint invalidationNonce) _args)',
    'function testCheckValidatorSignatures(tuple(address[] validators, uint[] powers, uint valsetNonce, uint rewardAmount, address rewardToken) _currentValset, tuple(uint8 v, bytes32 r, bytes32 s)[] _sigs, bytes32 _theHash, uint _powerThreshold) pure',
    'function testMakeCheckpoint(tuple(address[] validators, uint[] powers, uint valsetNonce, uint rewardAmount, address rewardToken) _valsetArgs, bytes32 _gravityId) pure',
    'function updateValset(tuple(address[] validators, uint[] powers, uint valsetNonce, uint rewardAmount, address rewardToken) _newValset, tuple(address[] validators, uint[] powers, uint valsetNonce, uint rewardAmount, address rewardToken) _currentValset, tuple(uint8 v, bytes32 r, bytes32 s)[] _sigs)'
  ];

  // 0x1 mainnet
  //
  //0x4 Rinkeby
  //0x5 Goerli

  // static String gravityContractAddr =
  //     "0xa4108aA1Ec4967F8b52220a4f7e94A8201F2D906"; // testnet: "0xace45Cd2d490a0A180e50144D8dd0c7EB9A4215f";
  static Web3Provider? web3;

  static String getSelectedAddress() {
    if (ethereum != null) {
      return ethereum!.selectedAddress;
    }
    return "";
  }

  static StreamController<String?> _accountsController =
      StreamController<String?>.broadcast()..add(null);
  static StreamController<String> _networkController =
      StreamController<String>.broadcast();

  static Stream<String?> get accountChangeStream => _accountsController.stream;
  static Stream<String> get networkChangeStream => _networkController.stream;

  /*
      General Metamask
  */

  static bool isMetamaskInstalled() {
    return ethereum != null;
  }

  static Future<void> connectWallet() async {
    if (ethereum == null) {
      throw MissingExtensionException("Metamask");
    }

    // get initial chain id
    if (_networkController.isClosed) {
      _networkController = StreamController<String>.broadcast();
    }
    _networkController.add(_getHexChainID());

    final accounts = await promiseToFuture(
        ethereum!.request(RequestParams(method: 'eth_requestAccounts')));
    final dynList = accounts is List<dynamic> ? accounts : [];
    _accountsController.add(dynList.isEmpty ? null : dynList.first);
  }

  static String _getHexChainID() {
    int idNumber;
    try {
      idNumber = int.parse(_chainId);
    } catch (e) {
      throw InvalidNumberException(
          'This error should not happen! Please refresh the browser page and try again.');
    }
    // final idNumber = int.parse(_chainId);
    final hx = idNumber.toRadixString(16);
    return "0x$hx";
  }

  static void _getWeb3() {
    if (ethereum == null) {
      throw MissingExtensionException("Metamask");
    }

    if (!ethereum!.isConnected()) {
      connectWallet();
    }

    web3 = Web3Provider(ethereum!);
  }

  static requestChainSwitch(String chainIdentifier) async {
    _getWeb3();

    List prms = [ChainParams(chainId: chainIdentifier)];
    await ethereum!.request(
        RequestParams(method: "wallet_switchEthereumChain", params: prms));
  }

  // handle changed addesses
  static void feedNetworkChangeStream() {
    _getWeb3();

    if (_networkController.isClosed) {
      _networkController = StreamController<String>.broadcast();
    }

    ethereum!.on('chainChanged', allowInterop((value) {
      var network = value is String ? value : "";
      _networkController.add(network);
    }));
  }

  // stream will always broadcast the current address when it is changed. if an empty string is broadcast this means the wallet has been disconnected.
  static void feedAccountChangeStream() {
    _getWeb3();

    if (_accountsController.isClosed) {
      _accountsController = StreamController<String>.broadcast();
    }

    ethereum!.on('accountsChanged', allowInterop((value) {
      final dynList = value is List<dynamic> ? value : [];
      _accountsController
          .add(dynList.isEmpty ? null : dynList.first.toString());
    }));
  }

  static closeAccountsStreamController() {
    _accountsController.close();
  }

  static closeNetworkStreamController() {
    _networkController.close();
  }

  /*
      erc20 interactions
  */

  // get erc20 contract name
  static Future<String> erc20GetName(String erc20con) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }
    final con = Contract(erc20con, erc20abi, web3);
    final name = await promiseToFuture(callMethod(con, "name", []));
    return name is String ? name : "";
  }

  // get erc20 contract name - without connecting wallet
  static Future<String?> erc20GetNameWithoutWalletConnect(
      String erc20con) async {
    try {
      if (web3 == null) {
        _getWeb3();
      }
      final con = Contract(erc20con, erc20abi, web3);
      final name = await promiseToFuture(callMethod(con, "name", []));
      return name is String ? name : "";
    } catch (e) {
      rlog("failed to get erc20 token name");
    }
    return null;
  }

  // get number of decimals of token
  static Future<num?> erc20GetDecimals(String erc20con) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }
    final con = Contract(erc20con, erc20abi, web3);
    final dec = await promiseToFuture(callMethod(con, "decimals", []));
    return dec is num ? dec : null;
  }

  // get number of decimals of token - without connecting wallet
  static Future<num?> erc20GetDecimalsWithoutWalletConnect(
      String erc20con) async {
    try {
      if (web3 == null) {
        _getWeb3();
      }
      final con = Contract(erc20con, erc20abi, web3);
      final dec = await promiseToFuture(callMethod(con, "decimals", []));
      return dec is num ? dec : null;
    } catch (e) {
      rlog("failed to get erc20 token decimal");
    }
    return null;
  }

  // get erc20 contract symbol
  static Future<String> erc20GetSymbol(String erc20con) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }
    final con = Contract(erc20con, erc20abi, web3);
    final symbol = await promiseToFuture(callMethod(con, "symbol", []));
    return symbol is String ? symbol : "";
  }

  // get erc20 contract symbol - without connecting wallet
  static Future<String?> erc20GetSymbolWithoutWalletConnect(
      String erc20con) async {
    try {
      if (web3 == null) {
        _getWeb3();
      }
      final con = Contract(erc20con, erc20abi, web3);
      final symbol = await promiseToFuture(callMethod(con, "symbol", []));
      return symbol is String ? symbol : "";
    } catch (e) {
      rlog("failed to get erc20 token symbol");
    }
    return null;
  }

  // Get the balance of the connected address for this erc20 token
  static Future<String?> erc20GetBalance(String erc20con) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }

    var address = ethereum!.selectedAddress;

    final con = Contract(erc20con, erc20abi, web3);
    final balance =
        await promiseToFuture(callMethod(con, "balanceOf", [address]));
    return balance.toString();
  }

  /// Checks wether the given erc20 contract has an approval for the signer and target contract.
  /// The returned String represents the remaining total of transfer-amounts (until a new approval).
  /// See also [Constants.erc20MaxApprovableTransferTotal].
  static Future<String> erc20CheckApproval(String erc20con) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }

    var address = ethereum!.selectedAddress;

    final con = Contract(erc20con, erc20abi, web3);
    final allowance = await promiseToFuture(callMethod(
        con, "allowance", [address, Config.metamask.gravityContractAddr]));
    final ret = allowance.toString();
    rlog("erc20CheckApproval($erc20con) = $ret", "MetaMaskService");
    return ret;
  }

  // approve amount to be spend by the gravity contract
  static Future<bool> erc20Approve(String erc20con, BigInt amount) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }

    if (amount.isNegative) {
      throw InvalidNumberException("Amount must be a positive integer");
    }

    var contract = Contract(erc20con, erc20abi, web3);

    // to make a write transaction, first get the signer (this will use metamask/wallet)
    contract = contract
        .connect(web3!.getSigner()); // uses the connected wallet as signer
    // then call the function:
    var res = await promiseToFuture(callMethod(contract, "approve", [
      Config.metamask.gravityContractAddr,
      "0x" + amount.toRadixString(16)
    ]));

    return res is bool ? res : false;
  }

  static Future<web3_fork.TransactionResponse?> getTransactionByHash({
    required final String hash,
  }) async {
    const String logPrefix = "getTransactionByHash";
    web3_fork.TransactionResponse? res;
    if (hash.isNotEmpty) {
      try {
        final web3_fork.Web3Provider mmProv =
            web3_fork.Web3Provider(web3_fork.ethereum);
        res = await mmProv.getTransaction(hash);
        // dlog("""Transaction: {
        //  hash: $hash,
        //  from: ${res?.from},
        //  to: ${res?.to},
        //  value: ${res?.value},
        //  confirmations: ${res?.confirmations},
        //  block: ${res?.blockNumber},
        //  nonce: ${res?.nounce},
        //  chainId: ${res?.chainId},
        //  type: ${res?.type},
        //  accessList: ${res?.accessList},
        //  timestamp: ${res?.timestamp},
        //  data: ${res?.data},
        //  r: ${res?.r},
        //  s: ${res?.s},
        //  v: ${res?.v},
        // }""", logPrefix);
      } catch (e) {
        rlogError(error: e, prefix: logPrefix);
      }
    }
    return res;
  }

  static Future<TransactionInProgress> getTransactionProgressByHash(
      String erc20con, String hash) async {
    await connectWallet();

    if (web3 == null) {
      _getWeb3();
    }

    var transaction = await promiseToFuture(ethereum!.request(
        RequestParams(method: 'eth_getTransactionByHash', params: [hash])));

    var index = js.getProperty(transaction, "transactionIndex");

    String txIndex = '';
    if (index is String) {
      txIndex = index;
    }

    return TransactionInProgress(txIndex, hash, erc20con);
  }

  /*
     gravity bridge contract interactions
  */

  //sendTx 'function sendToCosmos(address _tokenContract, string _destination, uint _amount)',
  static Future<TransactionStarted> sendToCosmos(
      String erc20TokenContract, String toAddress, BigInt amount) async {
    if (amount.isNegative) {
      throw InvalidNumberException("Amount must be a positive integer");
    }
    const String logPrefix = "sendToCosmos";

    await connectWallet();
    if (web3 == null) {
      _getWeb3();
    }

    var contract =
        Contract(Config.metamask.gravityContractAddr, gravityAbi, web3);
    // to make a write transaction, first get the signer (this will use metamask/wallet)
    contract = contract.connect(web3!.getSigner());
    var call = await promiseToFuture(callMethod(contract, "sendToCosmos",
        [erc20TokenContract, toAddress, amount.toString()]));
    dlog("Call: $call", logPrefix);
    dlog("Stringified-Call: ${stringify(call)}", logPrefix);
    String hash = js.getProperty(call, "hash");
    TransactionStarted res = TransactionStarted(hash, erc20TokenContract);
    return res;
  }

  /// Returns the current account's ETH balance
  static Future<BigInt?> requestEthBalanceInWei() async {
    const _logPrefix = "requestEthBalanceInWei";
    await connectWallet();
    if (web3 == null) {
      _getWeb3();
    }

    try {
      final req = await promiseToFuture(
        ethereum!.request(
          RequestParams(
            method: "eth_getBalance",
            params: [
              ethereum!.selectedAddress,
              "latest",
            ],
          ),
        ),
      );
      final balanceHex = req as String;
      final wei = BigInt.parse(balanceHex);
      rlog("ETH-Balance for ${ethereum!.selectedAddress}: $wei",
          "requestEthBalance");
      return wei;
    } catch (e) {
      rlogError(message: stringify(e), prefix: _logPrefix);
      return null;
    }
  }

  /// Creates a transaction to send an [ethAmount] of ether to a smart contract
  ///
  /// - Returns the Hash of the created transaction
  /// - Throws [UserRejectedRequestException] when user rejected the transfer
  /// - Throws [InsufficientFundsException] when wallet has insuffictient ether
  static Future<String> beginEtherTransferToErc20Contract({
    required final String ethAmount,
    required final String erc20SmartContractAddress,
  }) async {
    const _logPrefix = "beginEtherTransferToErc20Contract";

    await connectWallet();
    if (web3 == null) {
      _getWeb3();
    }
    final String weiAmountString = convertDecimalToIntAmount(ethAmount, 18);
    final BigInt weiAmount = BigInt.parse(weiAmountString);
    final String weiAsHex = weiAmount.toRadixString(16);
    final Signer metamaskSigner = web3!.getSigner();

    /// UI-TESTING
    // {
    //   await Future.delayed(const Duration(seconds: 2));
    // throw Exception("Some Metamask error");
    // return "0xalsdkmalskdm";
    // }

    try {
      final transactionResponse = await promiseToFuture(
        metamaskSigner.sendTransaction(
          TxParams(
            to: erc20SmartContractAddress,
            value: "0x$weiAsHex",
          ),
        ),
      );
      final String hash =
          js.getProperty(transactionResponse, "hash").toString();
      rlog("Swap Hash: $hash", _logPrefix);
      return hash;
    } catch (e) {
      rlogError(message: "Error: ${stringify(e)}", prefix: _logPrefix);
      final exception = convertMetamaskJsException(e);
      throw exception;
    }
  }

  /// Polls for the status of the Ethereum-network transaction with [hash].
  /// - True means that the transaction is successful
  /// - False means that the transaction is unsuccessful
  /// - Null means that the transaction status could not be determined
  static Future<bool?> pollForEthereumTransaction({
    required final String hash,
  }) async {
    const _logPrefix = "pollForEthereumTransaction";

    await connectWallet();
    if (web3 == null) {
      _getWeb3();
    }

    /// UI-TESTING
    // {
    //   await Future.delayed(const Duration(seconds: 2));
    // return true;
    // return false;
    // return null;
    // throw Exception("Error during status polling");
    // }

    final txReceipt = await promiseToFuture(web3!.waitForTransaction(hash));
    final String? status = js.getProperty(txReceipt, "status").toString();
    if (status == "1") {
      rlog("Swap $hash: successful", _logPrefix);
      return true;
    } else if (status == "0") {
      rlog("Swap $hash: failed", _logPrefix);
      return false;
    } else {
      rlogError(message: "Swap $hash: $status", prefix: _logPrefix);
      return null;
    }
  }

  static String getNetworkName() {
    switch (_chainId) {
      case "1":
        return "Ethereum Mainnet";
      case "3":
        return "Ropsten test network";
      case "42":
        return "Kovan test network";
      case "4":
        return "Rinkeby test network";
      case "5":
        return "Goerli test network";
      case "11155111":
        return "Sepolia test network";
      default:
        return "network";
    }
  }

  static Future<int?> getLatestEthereumBlock() async {
    try {
      final provider = web3_fork.Web3Provider(web3_fork.ethereum);
      return await provider.getBlockNumber();
    } catch (e) {
      rlog("failed to get latest ethereum block");
    }
    return null;
  }

  /// Average ETH slot duration in seconds
  static Future<double> calculateAverageEthereumBlockTime() async {
    try {
      final provider = web3_fork.Web3Provider(web3_fork.ethereum);

      const previousXBlock = 10000;

      int currentBlockNumber = await provider.getBlockNumber();
      web3_fork.Block currentBlock =
          await provider.getBlock(currentBlockNumber);
      DateTime currentTimeStamp = currentBlock.timestamp;

      int previousBlockNumber = currentBlockNumber - previousXBlock;
      web3_fork.Block previousBlock =
          await provider.getBlock(previousBlockNumber);
      DateTime previousTimeStamp = previousBlock.timestamp;

      double averageEthBlockTime = (currentTimeStamp.millisecondsSinceEpoch -
              previousTimeStamp.millisecondsSinceEpoch) /
          previousXBlock;

      // divide averageEthBlockTime with 1000 to convert milliseconds to seconds
      double formattedAverageBlockTime =
          double.parse((averageEthBlockTime / 1000).toStringAsFixed(2));

      return formattedAverageBlockTime;
    } catch (e) {
      rlog("failed to calculate average ethereum block time");
    }
    return 12;
  }

  static Future<void> importToken({
    required final String address,
    required final String symbol,
    required final int decimals,
    required final String iconUrl,
  }) async {
    assert(address.isNotEmpty && symbol.isNotEmpty && decimals > 0);

    await connectWallet();
    if (web3 == null) {
      _getWeb3();
    }

    try {
      await promiseToFuture(ethereum!.request(
        RequestParams(
          method: 'wallet_watchAsset',
          params: WatchAssetParameters(
            type: "ERC20",
            options: WatchAssetOptions(
              address: address,
              symbol: symbol,
              decimals: decimals,
              image: iconUrl,
            ),
          ),
        ),
      ));
    } catch (e) {
      final knownException = convertMetamaskJsException(e);
      if (knownException is! UserRejectedRequestException) {
        rethrow;
      }
    }
  }

  static Future<void> queryGravityContract() async {
    final web3_fork.Web3Provider mmProv =
        web3_fork.Web3Provider(web3_fork.ethereum);
    web3_fork.Contract contract = web3_fork.Contract(
        Config.metamask.gravityContractAddr, gravityAbi, mmProv);
    contract = contract.connect(mmProv);

    // 'event SendToCosmosEvent(address indexed _tokenContract, address indexed _sender, string _destination, uint _amount, uint _eventNonce)',
    final filter = contract.getFilter(
      "SendToCosmosEvent",
      [
        "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2", // tokenContract
        "0xA2B286a781233432204a573d6F40fbd2252cBBd4", // sender
        // null, // destination
        // null, // amount
        // null, // eventNonce
      ],
    );
    final List<web3_fork.Event> res = await contract.queryFilter(
      filter,
      15459175, // startBlock
      web3_fork.BlockTag.latest, // endBlock
    );
  }
}

@JS("window.ethereum.networkVersion")
external String _chainId;

class Bech32PaddingException implements Exception {
  final String message;

  Bech32PaddingException(this.message);

  @override
  String toString() {
    return "bech32 exception: $message";
  }
}

/// Converts JS-Exception thrown by Metamask's provider into:
/// - a known Exception that should be caught, and maybe shown in a dialog as a confirmation
/// - if unknown just returns the original JS-exception
Object convertMetamaskJsException(Object jsException) {
  final Object? c = js.getProperty(jsException, "code");
  final String code = c?.toString() ?? "";
  switch (code) {
    case "4001":
      return UserRejectedRequestException(jsException);
    case "INSUFFICIENT_FUNDS":
      return InsufficientFundsException(jsException);
    case "-32002":
      return MetamaskLoginAlreadyUnderwayException(jsException);
    default:
      return jsException;
  }
}
