// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(toChain) => "Enter the ${toChain} address to receive tokens";

  static String m1(balance) => "Available: ${balance}";

  static String m2(durationInHours) =>
      "Your batched transaction has been created, and may take up to ${durationInHours} hours to complete.";

  static String m3(durationInHours) => "up to ${durationInHours}h";

  static String m4(chain) =>
      "Ledger does not support the ${chain} chain (incompatible bip44 numbers).";

  static String m5(previous, next) =>
      "Please change your network from \"${previous}\" to \"${next}\"!";

  static String m6(address) => "Press to copy address: ${address}";

  static String m7(address, addressType) =>
      "${address} is not a valid ${addressType} address";

  static String m8(transferType) => "Invalid transfer type (${transferType})!";

  static String m9(dateString, chainName) =>
      "(${dateString}) ${chainName} updated its fees. Please remove it from Keplr, and re-connect to it, to ensure transfers are always successful.";

  static String m10(token) => "Give permission to transfer ${token}";

  static String m11(chain1, chain2) =>
      "You are about to start the IBC transfer from ${chain1} to ${chain2}. If you\'ve made it this far, then you\'ve probably also double-checked the input fields. If yes, proceed with pressing the button below.";

  static String m12(token) => "Add ${token}";

  static String m13(extensionName) =>
      "${extensionName} extension couldn\'t be found";

  static String m14(smth) => "Open in ${smth}";

  static String m15(extension) =>
      "Please confirm it in the ${extension} popup...";

  static String m16(error) =>
      "Could not create swap transaction.\nError: ${error}";

  static String m17(error) =>
      "Checking the swap status threw an error, please check it on Etherscan.\nError: ${error}";

  static String m18(id) => "Cancel transaction ${id}?";

  static String m19(id) => "Remove entry ${id} from this table?";

  static String m20(requiredNetwork) =>
      "You are on the wrong ethereum network, please switch to ${requiredNetwork}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ABOUT_INFO": MessageLookupByLibrary.simpleMessage(
            "Blockscapes Gravity Bridge, baby! 🖖🏻"),
        "ACCEPT_AGREEMENT_CHECKBOX": MessageLookupByLibrary.simpleMessage(
            "I have read the alert and understood the risks"),
        "ACCEPT_AND_PROCEED":
            MessageLookupByLibrary.simpleMessage("Accept and proceed"),
        "ADDRESS_HINT": m0,
        "AGREEMENT_TEXT": MessageLookupByLibrary.simpleMessage(
            "This is a newly developed tool and Blockscape.Network assumes no responsibility for bugs or token losses due to inappropriate use of it.\n\nYou are responsible for doing your own diligence on those interfaces to understand the fees and risks they present.\n\nBefore executing transactions with a large amount of tokens it is highly recommended to test the tool with smaller amounts.\n\nTHE BLOCKSCAPE.NETWORK BRIDGE IS PROVIDED “AS IS”, AT YOUR OWN RISK, AND WITHOUT WARRANTIES OF ANY KIND. The Gravity Bridge Portal is based primarily on the Code of the Gravity Bridge from Althea Inc. (“Althea”). Gravity Bridge Portal is one of several interfaces to get access to the Gravity Bridge Protocol. Althea developed much of the initial code from the Gravity Bridge Foundation, it does not provide, own, or control the Gravity Bridge protocol, which is run by a decentralized validator set. Upgrades and modifications to the protocol are managed in a community-driven way by holders of the GRAVITON governance token. No developer or entity involved in creating or building on top of the Gravity Bridge protocol will be liable for any claims or damages whatsoever associated with your use, inability to use, or your interaction with other users of the Gravity Bridge protocol, including any direct, indirect, incidental, special, exemplary, punitive or consequential damages, or loss of profits, cryptocurrencies, tokens, or anything else of value."),
        "AGREEMENT_TITLE": MessageLookupByLibrary.simpleMessage(
            "Please accept our Terms of Service"),
        "AMOUNT": MessageLookupByLibrary.simpleMessage("AMOUNT"),
        "AMOUNT_OF_TRANSFER":
            MessageLookupByLibrary.simpleMessage("Amount of transfer"),
        "API_PROVIDED_BY":
            MessageLookupByLibrary.simpleMessage("API provided by "),
        "APPROVAL_COMPLETE": MessageLookupByLibrary.simpleMessage(
            "You may continue with the transfer."),
        "APPROVAL_COMPLETE_TITLE":
            MessageLookupByLibrary.simpleMessage("Approval complete"),
        "APPROVAL_START": MessageLookupByLibrary.simpleMessage(
            "Please confirm (or decline) confirmation in Metamask to continue."),
        "APPROVAL_START_TITLE":
            MessageLookupByLibrary.simpleMessage("Approval pending"),
        "APPROVE_TRANSFER":
            MessageLookupByLibrary.simpleMessage("Approve transfer"),
        "BACK": MessageLookupByLibrary.simpleMessage("Back"),
        "BALANCE": m1,
        "BALANCE_TEXT_BEFORE_CONNECTING_WALLET":
            MessageLookupByLibrary.simpleMessage(
                "Connect your wallet to see the available amount"),
        "BASE_CURRENCY": MessageLookupByLibrary.simpleMessage("Base currency"),
        "BASE_CURRENCY_USD": MessageLookupByLibrary.simpleMessage("USD"),
        "BATCH": MessageLookupByLibrary.simpleMessage("Batch"),
        "BATCHED_TRANSACTION_CREATED_TEXT_DESCRIPTION": m2,
        "BATCH_TRANSACTION_CREATED_TITLE":
            MessageLookupByLibrary.simpleMessage("Batched transaction created"),
        "BEGIN_TRANSFER":
            MessageLookupByLibrary.simpleMessage("Begin transfer"),
        "BLOCK": MessageLookupByLibrary.simpleMessage("BLOCK"),
        "BRIDGE_FEE": MessageLookupByLibrary.simpleMessage("BRIDGE FEE"),
        "BRIDGE_FEE_DEDUCTED_TEXT":
            MessageLookupByLibrary.simpleMessage("bridge fee deducted"),
        "BRIDGE_FEE_ERROR": MessageLookupByLibrary.simpleMessage(
            "There was an error fetching the bridge fee."),
        "BRIDGE_FEE_LOW_TYPE": MessageLookupByLibrary.simpleMessage("Slow"),
        "BRIDGE_FEE_LOW_TYPE_DESCRIPTION":
            MessageLookupByLibrary.simpleMessage("batched transfer"),
        "BRIDGE_FEE_PREMIUM_SPEED_DESCRIPTION":
            MessageLookupByLibrary.simpleMessage("instant"),
        "BRIDGE_FEE_PREMIUM_TYPE":
            MessageLookupByLibrary.simpleMessage("Premium"),
        "BRIDGE_FEE_PREMIUM_TYPE_DESCRIPTION":
            MessageLookupByLibrary.simpleMessage("individual transfer"),
        "BRIDGE_FEE_SELECT_TOKEN": MessageLookupByLibrary.simpleMessage(
            "Select token to see bridge fee options"),
        "BRIDGE_FEE_SPEED_DESCRIPTION": m3,
        "BRIDGE_FEE_STANDARD_TYPE":
            MessageLookupByLibrary.simpleMessage("Standard"),
        "BRIDGE_FEE_STANDARD_TYPE_DESCRIPTION":
            MessageLookupByLibrary.simpleMessage("batched transfer"),
        "BRIDGE_FEE_TRANSFER_AMOUNT":
            MessageLookupByLibrary.simpleMessage("Amount to transfer"),
        "BRIDGE_FEE_TRANSFER_BRIDGE_FEE_COST":
            MessageLookupByLibrary.simpleMessage(
                "Bridge fee cost (paid to relayers)"),
        "BRIDGE_FEE_TRANSFER_TOTAL_COST":
            MessageLookupByLibrary.simpleMessage("Total transfer cost"),
        "CANCEL": MessageLookupByLibrary.simpleMessage("Cancel"),
        "CANCEL_THE_FOLLOWING_TRANSACTION":
            MessageLookupByLibrary.simpleMessage(
                "Cancel the following transaction?"),
        "CHAIN_FEES_DEDUCTED":
            MessageLookupByLibrary.simpleMessage("chain fees deducted"),
        "CHAIN_FEE_COST": MessageLookupByLibrary.simpleMessage(
            "Chain fee cost (paid to validators)"),
        "CHAIN_NOT_SUPPORTED_BY_LEDGER": m4,
        "CHAIN_RPC_URL_INACTIVE":
            MessageLookupByLibrary.simpleMessage("Chain client is not active."),
        "CHAIN_RPC_URL_OFFLINE":
            MessageLookupByLibrary.simpleMessage("Chain client is offline."),
        "CHAIN_RPC_URL_SUCCESS":
            MessageLookupByLibrary.simpleMessage("Network success!"),
        "CHAIN_RPC_URL_WAITING_RESPONSE": MessageLookupByLibrary.simpleMessage(
            "Waiting response from Chain RPC service.."),
        "CHANGE_NETWORK_REQUEST": m5,
        "CHOSE_TOKEN": MessageLookupByLibrary.simpleMessage("Chose token"),
        "COINGECKO": MessageLookupByLibrary.simpleMessage("CoinGecko"),
        "COMING_SOON": MessageLookupByLibrary.simpleMessage("Coming soon"),
        "CONFIRM_TRANSFER":
            MessageLookupByLibrary.simpleMessage("Confirm transfer"),
        "CONNECT_TO_KEPLR":
            MessageLookupByLibrary.simpleMessage("Connect to Keplr"),
        "CONNECT_TO_LEDGER":
            MessageLookupByLibrary.simpleMessage("Connect to Ledger"),
        "CONNECT_TO_WALLET":
            MessageLookupByLibrary.simpleMessage("Connect to wallet"),
        "COPY": MessageLookupByLibrary.simpleMessage("copy"),
        "COPY_ADDRESS_HINT": m6,
        "COPY_TO_CLIPBOARD_CONFIRMATION":
            MessageLookupByLibrary.simpleMessage("Copied to clipboard!"),
        "COSMOS_TO_ETHERIUM":
            MessageLookupByLibrary.simpleMessage("Cosmos to ETH"),
        "DATE_AND_TIME": MessageLookupByLibrary.simpleMessage("DATE - TIME"),
        "DESKTOP": MessageLookupByLibrary.simpleMessage("Desktop"),
        "DETAILS": MessageLookupByLibrary.simpleMessage("Details"),
        "EMAIL": MessageLookupByLibrary.simpleMessage("Email"),
        "ERROR_ADDRESS_IS_EMPTY":
            MessageLookupByLibrary.simpleMessage("Address is empty!"),
        "ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_EMPTY":
            MessageLookupByLibrary.simpleMessage("Amount cannot be empty!"),
        "ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_ZERO":
            MessageLookupByLibrary.simpleMessage("Amount cannot be zero!"),
        "ERROR_AMOUNT_OF_TRANSFER_NO_TOKEN_SELECTED":
            MessageLookupByLibrary.simpleMessage(
                "No token selected or failed to get token info!"),
        "ERROR_AMOUNT_OF_TRANSFER_TO_MANY_DECIMALS":
            MessageLookupByLibrary.simpleMessage(
                "To many decimals for selected token!"),
        "ERROR_APPROVAL": MessageLookupByLibrary.simpleMessage(
            "Failed to approve permissions for transfer."),
        "ERROR_CANNOT_BE_EMPTY":
            MessageLookupByLibrary.simpleMessage("Cannot be empty!"),
        "ERROR_DIALOG_TITLE":
            MessageLookupByLibrary.simpleMessage("An error occurred"),
        "ERROR_EXTENSION_NOT_CONNECTED":
            MessageLookupByLibrary.simpleMessage("Extension is not connected!"),
        "ERROR_FAILED_TO_GET_TOKENLIST": MessageLookupByLibrary.simpleMessage(
            "Failed to receive token list!"),
        "ERROR_GENERIC":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "ERROR_INVALID_ADDRESS_FOR_ADDR_TYPE": m7,
        "ERROR_INVALID_TRANSFER_TYPE": m8,
        "ERROR_MISMATCHED_TOKEN_SCHEMA": MessageLookupByLibrary.simpleMessage(
            "Your input does not match the token schema!"),
        "ERROR_TRANSFER_AMOUNT_IS_ZERO":
            MessageLookupByLibrary.simpleMessage("Transfer amount is 0!"),
        "ERROR_TRANSFER_NO_TOKEN_SELECTED":
            MessageLookupByLibrary.simpleMessage(
                "You haven\'t selected a token!"),
        "ERROR_UNRECOGNIZED_TOKEN_ADDRESS":
            MessageLookupByLibrary.simpleMessage("Unrecognized token address!"),
        "ETHERIUM_TO_COSMOS":
            MessageLookupByLibrary.simpleMessage("ETH to Cosmos"),
        "ETHERSCAN_TEXT": MessageLookupByLibrary.simpleMessage("Etherscan"),
        "EVMOS_TOKEN_HINT": MessageLookupByLibrary.simpleMessage(
            "Some tokens in an Evmos account may not be listed because of technical limitations. If you do not see all your tokens, please check "),
        "EXTENSION_COULD_NOT_BE_FOUND": MessageLookupByLibrary.simpleMessage(
            "Extension could not be found"),
        "EXTENSION_DIALOG_TITLE":
            MessageLookupByLibrary.simpleMessage("Waiting for extension..."),
        "FAQ": MessageLookupByLibrary.simpleMessage("FAQ"),
        "FEE": MessageLookupByLibrary.simpleMessage("FEE"),
        "FEE_UPDATE_ALERT": m9,
        "FOOTER_INFO": MessageLookupByLibrary.simpleMessage(
            "Based on Gravity Bridge by Althea"),
        "GET_KEPLR_CHROME":
            MessageLookupByLibrary.simpleMessage("Get Keplr on Chrome"),
        "GET_METAMASK_CHROME":
            MessageLookupByLibrary.simpleMessage("Get MetaMask on Chrome"),
        "GIVE_PERMISSION_FOR_TOKEN": m10,
        "GIVE_PERMISSION_FOR_TOKEN_HINT": MessageLookupByLibrary.simpleMessage(
            "To execute a transfer Gravity-Bridge needs your permission to send out a token. For each token you need to do this only once."),
        "GIVE_PERMISSION_TITLE_FOR_MOBILE":
            MessageLookupByLibrary.simpleMessage(
                "Why do I need to give permission"),
        "GRAVITON": MessageLookupByLibrary.simpleMessage("Graviton"),
        "GRAVITY_SUPPLY_INFO":
            MessageLookupByLibrary.simpleMessage("Gravity supply info"),
        "GRAVITY_SUPPLY_INFO_FETCHING": MessageLookupByLibrary.simpleMessage(
            "Gravity Chain supply info fetching.."),
        "GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING":
            MessageLookupByLibrary.simpleMessage("Liquid (not vesting)"),
        "GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING_AND_STAKED":
            MessageLookupByLibrary.simpleMessage(
                "Liquid (not vesting) and staked"),
        "GRAVITY_SUPPLY_INFO_UNCLAIMED_STAKING_REWARDS":
            MessageLookupByLibrary.simpleMessage("Unclaimed staking rewards"),
        "GRAVITY_SUPPLY_INFO_UNVESTED":
            MessageLookupByLibrary.simpleMessage("Unvested"),
        "GRAVITY_SUPPLY_INFO_UNVESTED_STAKED":
            MessageLookupByLibrary.simpleMessage("Unvested staked"),
        "GRAVITY_SUPPLY_INFO_VESTED":
            MessageLookupByLibrary.simpleMessage("Vested"),
        "GRAVITY_TRANSACTION_QUEUE_INFO_FETCHING":
            MessageLookupByLibrary.simpleMessage(
                "Gravity Chain transaction queue info fetching.."),
        "GRAVITY_VOLUME_INFO":
            MessageLookupByLibrary.simpleMessage("Gravity volume"),
        "GRAVITY_VOLUME_INFO_DAILY_INFLOW":
            MessageLookupByLibrary.simpleMessage("Daily inflow"),
        "GRAVITY_VOLUME_INFO_DAILY_OUTFLOW":
            MessageLookupByLibrary.simpleMessage("Daily outflow"),
        "GRAVITY_VOLUME_INFO_DAILY_VOLUME":
            MessageLookupByLibrary.simpleMessage("Daily volume"),
        "GRAVITY_VOLUME_INFO_FETCHING": MessageLookupByLibrary.simpleMessage(
            "Gravity Chain volume info fetching.."),
        "GRAVITY_VOLUME_INFO_WEEKLY_INFLOW":
            MessageLookupByLibrary.simpleMessage("Weekly inflow"),
        "GRAVITY_VOLUME_INFO_WEEKLY_OUTFLOW":
            MessageLookupByLibrary.simpleMessage("Weekly outflow"),
        "GRAVITY_VOLUME_INFO_WEEKLY_VOLUME":
            MessageLookupByLibrary.simpleMessage("Weekly volume"),
        "GRAVITY_VOLUME_WIDGET_ERROR_DESC": MessageLookupByLibrary.simpleMessage(
            "We can\'t fetch the data at the moment -\rplease try again later."),
        "GRAVITY_VOLUME_WIDGET_ERROR_TITLE":
            MessageLookupByLibrary.simpleMessage("Oh no..."),
        "HEADLINE": MessageLookupByLibrary.simpleMessage(
            "Bridge between or send within Ethereum, Gravity and Osmosis!"),
        "HEADLINE_SUB": MessageLookupByLibrary.simpleMessage(
            "Connect your wallet to get started."),
        "HOW_TO": MessageLookupByLibrary.simpleMessage("How to"),
        "IBC_TRANSFER_DIALOG_CONTENT": m11,
        "IBC_TRANSFER_DIALOG_TITLE":
            MessageLookupByLibrary.simpleMessage("Starting IBC Transfer"),
        "IMPORT_TOKEN_INTO_METAMASK": m12,
        "IMPORT_TOKEN_INTO_METAMASK_TOOLTIP": MessageLookupByLibrary.simpleMessage(
            "Cosmos tokens are not automatically detected by Metamask and need to be imported"),
        "KEPLR": MessageLookupByLibrary.simpleMessage("Keplr"),
        "KEPLR_NOT_FOUND_WARNING_TEXT": MessageLookupByLibrary.simpleMessage(
            "Extension not found. Get Keplr on Chrome "),
        "LANGUAGE": MessageLookupByLibrary.simpleMessage("Language"),
        "LANGUAGE_ENGLISH": MessageLookupByLibrary.simpleMessage("English"),
        "LEDGER": MessageLookupByLibrary.simpleMessage("Ledger"),
        "LEGALESE": MessageLookupByLibrary.simpleMessage(
            "Copyright © 2022 Blockscape.Network. All rights reserved."),
        "MENU_ITEM_ABOUT": MessageLookupByLibrary.simpleMessage("About"),
        "MENU_ITEM_BATCHES": MessageLookupByLibrary.simpleMessage("Batches"),
        "MENU_ITEM_HOW_TO": MessageLookupByLibrary.simpleMessage("How To"),
        "MENU_ITEM_SETTINGS": MessageLookupByLibrary.simpleMessage("Settings"),
        "MENU_ITEM_TRANSACTIONS":
            MessageLookupByLibrary.simpleMessage("Transactions"),
        "MENU_ITEM_TRANSACTION_DETAIL":
            MessageLookupByLibrary.simpleMessage("Transaction Detail"),
        "MENU_ITEM_TRANSFER": MessageLookupByLibrary.simpleMessage("Transfer"),
        "MENU_ITEM_WHATS_NEW":
            MessageLookupByLibrary.simpleMessage("What\'s new"),
        "METAMASK_LOGIN_PROMPT":
            MessageLookupByLibrary.simpleMessage("Please log into Metamask."),
        "MINTSCAN_TEXT": MessageLookupByLibrary.simpleMessage("Mintscan"),
        "MISSING_EXTENSION": m13,
        "NETWORKS": MessageLookupByLibrary.simpleMessage("Networks"),
        "NETWORKS_ETHEREUM_MAINNET":
            MessageLookupByLibrary.simpleMessage("Ethereum Mainnet"),
        "NO": MessageLookupByLibrary.simpleMessage("No"),
        "NONCE": MessageLookupByLibrary.simpleMessage("NONCE"),
        "NOTICE": MessageLookupByLibrary.simpleMessage(
            "In the next step, your MetaMask Wallet will appear to approve your transfer. If you are not sure whether you really want to transfer your tokens, now is the best time to press the Cancel button. Please be patient, the transfer can take around 20 minutes before completion."),
        "NOTIFICATIONS": MessageLookupByLibrary.simpleMessage("Notifications"),
        "NO_RECENT_BATCHES":
            MessageLookupByLibrary.simpleMessage("No recent batches"),
        "NO_RECENT_TRANSACTION":
            MessageLookupByLibrary.simpleMessage("No recent transaction"),
        "NUM_OF_TXS": MessageLookupByLibrary.simpleMessage("Num of txs"),
        "OK": MessageLookupByLibrary.simpleMessage("OK"),
        "OPEN_IN": m14,
        "PENDING_APPROVAL":
            MessageLookupByLibrary.simpleMessage("Approval in progress."),
        "PENDING_APPROVAL_LONG": MessageLookupByLibrary.simpleMessage(
            "Its taking longer than usual. Be patient..."),
        "PERMISSION_GIVEN":
            MessageLookupByLibrary.simpleMessage("Permission given"),
        "PLEASE_CONFIRM_IN_THE_LEDGER": MessageLookupByLibrary.simpleMessage(
            "Please confirm it on the ledger display..."),
        "PLEASE_CONFIRM_IN_THE_POPUP": m15,
        "POPULAR_ROUTES":
            MessageLookupByLibrary.simpleMessage("Popular routes"),
        "PREFERENCES": MessageLookupByLibrary.simpleMessage("Preferences"),
        "PRICE_SERVER_STATUS_OFFLINE": MessageLookupByLibrary.simpleMessage(
            "Price Server is offline!\nBridge fee information cannot be fetched from the server."),
        "PRICE_SERVER_STATUS_ONLINE":
            MessageLookupByLibrary.simpleMessage("Price Server is online."),
        "PRICE_SERVER_TOOLTIP": MessageLookupByLibrary.simpleMessage(
            "Checking network activity every 10 seconds\nCurrent status: "),
        "PRICE_SERVER_WAITING_TOOLTIP": MessageLookupByLibrary.simpleMessage(
            "Trying to fetch bridge fees from the price server..."),
        "PUSH": MessageLookupByLibrary.simpleMessage("Push"),
        "READ_THIS": MessageLookupByLibrary.simpleMessage("Read this"),
        "RECENT_BATCHES":
            MessageLookupByLibrary.simpleMessage("Recent batches"),
        "RECENT_TRANSACTIONS":
            MessageLookupByLibrary.simpleMessage("Recent transactions"),
        "REMAINING": MessageLookupByLibrary.simpleMessage("REMAINING"),
        "ROUTE": MessageLookupByLibrary.simpleMessage("ROUTE"),
        "SELECT_CHAIN": MessageLookupByLibrary.simpleMessage("Select chain"),
        "SELECT_CHAIN_DIALOG_TITLE": MessageLookupByLibrary.simpleMessage(
            "Select a network to transact on"),
        "SELECT_TOKEN": MessageLookupByLibrary.simpleMessage("Select Token"),
        "SELECT_TYPE_FROM": MessageLookupByLibrary.simpleMessage("FROM"),
        "SELECT_TYPE_TO": MessageLookupByLibrary.simpleMessage("TO"),
        "SELECT_WALLET": MessageLookupByLibrary.simpleMessage("Select wallet"),
        "SHOW_DETAILS": MessageLookupByLibrary.simpleMessage("Show Details"),
        "SHOW_DETAILS_FOR_WIDGETS":
            MessageLookupByLibrary.simpleMessage("Show details"),
        "SMART_CONTRACT_USED": MessageLookupByLibrary.simpleMessage(
            "Smart contract used for this Bridge:"),
        "STARTED_AT": MessageLookupByLibrary.simpleMessage("STARTED AT"),
        "STATUS": MessageLookupByLibrary.simpleMessage("STATUS"),
        "SUPPLY_CHAIN_INFO_UNAVAILABLE": MessageLookupByLibrary.simpleMessage(
            "Supply chain info unavailable"),
        "SWAP": MessageLookupByLibrary.simpleMessage("Swap"),
        "SWAP_CREATE_ERROR_DESC": m16,
        "SWAP_CREATE_ERROR_TITLE":
            MessageLookupByLibrary.simpleMessage("Swap not created"),
        "SWAP_FAIL_DESC": MessageLookupByLibrary.simpleMessage(
            "ETH could not be transferred to WETH.\nCheck Etherscan for more information."),
        "SWAP_FAIL_TITLE": MessageLookupByLibrary.simpleMessage("Swap failed"),
        "SWAP_INSUFFICIENT_FUNDS_DESC": MessageLookupByLibrary.simpleMessage(
            "You do not have enough funds to make the swap."),
        "SWAP_INSUFFICIENT_FUNDS_TITLE":
            MessageLookupByLibrary.simpleMessage("Insufficient funds"),
        "SWAP_STATUS_REQUEST_ERROR_DESC": m17,
        "SWAP_STATUS_REQUEST_ERROR_TITLE":
            MessageLookupByLibrary.simpleMessage("Swap status unknown"),
        "SWAP_STATUS_UNKNOWN_DESC": MessageLookupByLibrary.simpleMessage(
            "Swap success could not be determined.\nCheck Etherscan for more information."),
        "SWAP_STATUS_UNKNOWN_TITLE":
            MessageLookupByLibrary.simpleMessage("Swap status unknown"),
        "SWAP_SUCCESS_DESC": MessageLookupByLibrary.simpleMessage(
            "ETH were successfully transferred to WETH.\nCheck Etherscan for more information."),
        "SWAP_SUCCESS_TITLE":
            MessageLookupByLibrary.simpleMessage("Swap succeeded"),
        "THEME": MessageLookupByLibrary.simpleMessage("Theme"),
        "TITLE": MessageLookupByLibrary.simpleMessage("GRAVITY BRIDGE PORTAL"),
        "TOKEN": MessageLookupByLibrary.simpleMessage("Token"),
        "TOKEN_BALANCE_NOT_ENOUGH_FOR_BRIDGE_FEE_WARNING":
            MessageLookupByLibrary.simpleMessage(
                "Available balance is not enough to cover the bridge fee"),
        "TOKEN_BALANCE_NOT_ENOUGH_WARNING":
            MessageLookupByLibrary.simpleMessage(
                "Amount is more than available balance"),
        "TOKEN_DIALOG_BALANCE_DEFAULT":
            MessageLookupByLibrary.simpleMessage("Unavailable"),
        "TOKEN_DIALOG_COPY_SUCCESS": MessageLookupByLibrary.simpleMessage(
            "Token address copied to clipboard"),
        "TOKEN_DIALOG_NO_TOKENS":
            MessageLookupByLibrary.simpleMessage("No tokens found!"),
        "TOKEN_DIALOG_SEARCH_HINT":
            MessageLookupByLibrary.simpleMessage("Search by name or address."),
        "TOKEN_DIALOG_TOOLTIP_COPY":
            MessageLookupByLibrary.simpleMessage("Copy address"),
        "TOKEN_HINT": MessageLookupByLibrary.simpleMessage(
            "Enter custom ERC-20 address or search for token denom"),
        "TOOLTIP_CLOSE": MessageLookupByLibrary.simpleMessage("Close"),
        "TOTAL_FEES": MessageLookupByLibrary.simpleMessage("Total fees"),
        "TRANSACTION_COMPLETE_TEXT_DESCRIPTION":
            MessageLookupByLibrary.simpleMessage(
                "Your transaction has been completed. Please check your wallet for the transaction receipt."),
        "TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT1":
            MessageLookupByLibrary.simpleMessage(
                "To check the status of your transaction, please navigate to the "),
        "TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT2":
            MessageLookupByLibrary.simpleMessage("transaction history page"),
        "TRANSACTION_ERROR": MessageLookupByLibrary.simpleMessage(
            "There was an error during the transaction. Please try again later."),
        "TRANSACTION_HASH":
            MessageLookupByLibrary.simpleMessage("Transaction hash"),
        "TRANSACTION_HISTORY":
            MessageLookupByLibrary.simpleMessage("Transaction history"),
        "TRANSACTION_HISTORY_CANCEL_DIALOG_DESC":
            MessageLookupByLibrary.simpleMessage(
                "This will abort its execution!"),
        "TRANSACTION_HISTORY_CANCEL_DIALOG_TITLE": m18,
        "TRANSACTION_HISTORY_CANCEL_ERROR_DIALOG_TITLE":
            MessageLookupByLibrary.simpleMessage(
                "Failed to cancel transaction"),
        "TRANSACTION_HISTORY_CANCEL_MENU_TEXT":
            MessageLookupByLibrary.simpleMessage("Cancel transaction"),
        "TRANSACTION_HISTORY_REMOVE_DIALOG_TITLE": m19,
        "TRANSACTION_HISTORY_REMOVE_MENU_TEXT":
            MessageLookupByLibrary.simpleMessage("Remove entry"),
        "TRANSACTION_HISTORY_STATUS_MENU_COPY_ADDRESS":
            MessageLookupByLibrary.simpleMessage("Copy address"),
        "TRANSACTION_HISTORY_STATUS_MENU_COPY_ADDRESS_SUCCESS":
            MessageLookupByLibrary.simpleMessage(
                "Transaction address copied to clipboard"),
        "TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH":
            MessageLookupByLibrary.simpleMessage("Copy transaction hash"),
        "TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH_SUCCESS":
            MessageLookupByLibrary.simpleMessage(
                "Transaction hash copied to clipboard"),
        "TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_ID":
            MessageLookupByLibrary.simpleMessage("Copy TransactionID"),
        "TRANSACTION_HISTORY_STATUS_TOOLTIP_CANCELED":
            MessageLookupByLibrary.simpleMessage(
                "Transaction was canceled by the user."),
        "TRANSACTION_HISTORY_STATUS_TOOLTIP_COMPLETED":
            MessageLookupByLibrary.simpleMessage("Transaction succeeded."),
        "TRANSACTION_HISTORY_STATUS_TOOLTIP_FAILED":
            MessageLookupByLibrary.simpleMessage("Transaction failed."),
        "TRANSACTION_HISTORY_STATUS_TOOLTIP_PENDING":
            MessageLookupByLibrary.simpleMessage(
                "Transaction was registered and tokens are being transferred."),
        "TRANSACTION_HISTORY_STATUS_TOOLTIP_PREPARING":
            MessageLookupByLibrary.simpleMessage(
                "Transaction is being registered."),
        "TRANSACTION_QUEUE":
            MessageLookupByLibrary.simpleMessage("Transaction queue"),
        "TRANSACTION_QUEUE_INFO_WIDGET_TOOLTIP_MESSAGE":
            MessageLookupByLibrary.simpleMessage(
                "These transactions are not yet in batches,\na batch will be requested when the fee amount\nexceeds the cost to execute on Ethereum"),
        "TRANSACTION_STARTED_TEXT": MessageLookupByLibrary.simpleMessage(
            "Transaction has been started..."),
        "TRANSACTION_TITLE_COMPLETE":
            MessageLookupByLibrary.simpleMessage("Transaction complete"),
        "TRANSACTION_TITLE_ERROR":
            MessageLookupByLibrary.simpleMessage("Transaction error"),
        "TRANSACTION_TITLE_PENDING":
            MessageLookupByLibrary.simpleMessage("Transaction pending"),
        "TRANSACTION_TITLE_PROGRESS":
            MessageLookupByLibrary.simpleMessage("Transaction in progress"),
        "TRANSACTION_TITLE_REJECTED":
            MessageLookupByLibrary.simpleMessage("Transaction rejected"),
        "TRANSACTION_TITLE_STARTED":
            MessageLookupByLibrary.simpleMessage("Transaction started"),
        "TRANSFER_ADDRESS":
            MessageLookupByLibrary.simpleMessage("TRANSFER ADDRESS"),
        "TRANSFER_ADDRESS_KEPLR": MessageLookupByLibrary.simpleMessage("keplr"),
        "TRANSFER_ADDRESS_LOCK":
            MessageLookupByLibrary.simpleMessage("Lock address"),
        "TRANSFER_ADDRESS_METAMASK":
            MessageLookupByLibrary.simpleMessage("metamask"),
        "TRANSFER_ADDRESS_UNLOCK":
            MessageLookupByLibrary.simpleMessage("Edit address"),
        "TRANSFER_TOKENS":
            MessageLookupByLibrary.simpleMessage("Transfer tokens"),
        "TRANSFER_TYPE_CONNECT":
            MessageLookupByLibrary.simpleMessage("Connect"),
        "TRANSFER_TYPE_DISCONNECT":
            MessageLookupByLibrary.simpleMessage("Disconnect"),
        "TRANSFER_TYPE_FROM": MessageLookupByLibrary.simpleMessage("From"),
        "TRANSFER_TYPE_KEPLR":
            MessageLookupByLibrary.simpleMessage("Gravity Bridge"),
        "TRANSFER_TYPE_METAMASK":
            MessageLookupByLibrary.simpleMessage("Ethereum"),
        "TRANSFER_TYPE_TO": MessageLookupByLibrary.simpleMessage("To"),
        "TYPE_OF_TRANSFER":
            MessageLookupByLibrary.simpleMessage("Type of transfer"),
        "VALIDATOR_MESSAGE_TRANSFERS_FROM_CANTO":
            MessageLookupByLibrary.simpleMessage(
                "(20 January 2023) Transfers from Canto accounts (generated by Keplr) are disabled. For more info check the \'What\'s new\' page."),
        "VALIDATOR_MESSAGE_TRANSFERS_TO_CANTO":
            MessageLookupByLibrary.simpleMessage(
                "(20 January 2023) Transfers to Canto are only possible by inputing the address manually. For more info check the \'What\'s new\' page."),
        "VIEW_ALL_BATCHES":
            MessageLookupByLibrary.simpleMessage("View all batches"),
        "VIEW_ALL_ROUTES":
            MessageLookupByLibrary.simpleMessage("View all routes"),
        "VIEW_ALL_TRANSACTIONS":
            MessageLookupByLibrary.simpleMessage("View all transactions"),
        "WAITING_RESPONSE":
            MessageLookupByLibrary.simpleMessage("Waiting response"),
        "WALLET_ADDRESS":
            MessageLookupByLibrary.simpleMessage("Wallet address"),
        "WARNING_MESSAGE": MessageLookupByLibrary.simpleMessage(
            "We recommend you try to send a small amount first before trying to send large amounts. This way you can make sure everything works as expected."),
        "WHAT_IS_HAPPENING":
            MessageLookupByLibrary.simpleMessage("What is happening?"),
        "WIDGETS": MessageLookupByLibrary.simpleMessage("Widgets"),
        "WRONG_NETWORK_TITLE":
            MessageLookupByLibrary.simpleMessage("Wrong Network"),
        "WRONG_NETWORK_WARNING": m20,
        "YES": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
