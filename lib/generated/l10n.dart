// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `GRAVITY BRIDGE PORTAL`
  String get TITLE {
    return Intl.message(
      'GRAVITY BRIDGE PORTAL',
      name: 'TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Type of transfer`
  String get TYPE_OF_TRANSFER {
    return Intl.message(
      'Type of transfer',
      name: 'TYPE_OF_TRANSFER',
      desc: '',
      args: [],
    );
  }

  /// `Chose token`
  String get CHOSE_TOKEN {
    return Intl.message(
      'Chose token',
      name: 'CHOSE_TOKEN',
      desc: '',
      args: [],
    );
  }

  /// `Connect to wallet`
  String get CONNECT_TO_WALLET {
    return Intl.message(
      'Connect to wallet',
      name: 'CONNECT_TO_WALLET',
      desc: '',
      args: [],
    );
  }

  /// `Press to copy address: {address}`
  String COPY_ADDRESS_HINT(Object address) {
    return Intl.message(
      'Press to copy address: $address',
      name: 'COPY_ADDRESS_HINT',
      desc: '',
      args: [address],
    );
  }

  /// `TRANSFER ADDRESS`
  String get TRANSFER_ADDRESS {
    return Intl.message(
      'TRANSFER ADDRESS',
      name: 'TRANSFER_ADDRESS',
      desc: '',
      args: [],
    );
  }

  /// `Enter the {toChain} address to receive tokens`
  String ADDRESS_HINT(Object toChain) {
    return Intl.message(
      'Enter the $toChain address to receive tokens',
      name: 'ADDRESS_HINT',
      desc: '',
      args: [toChain],
    );
  }

  /// `Waiting for extension...`
  String get EXTENSION_DIALOG_TITLE {
    return Intl.message(
      'Waiting for extension...',
      name: 'EXTENSION_DIALOG_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get ERROR_DIALOG_TITLE {
    return Intl.message(
      'An error occurred',
      name: 'ERROR_DIALOG_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Network`
  String get WRONG_NETWORK_TITLE {
    return Intl.message(
      'Wrong Network',
      name: 'WRONG_NETWORK_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Extension is not connected!`
  String get ERROR_EXTENSION_NOT_CONNECTED {
    return Intl.message(
      'Extension is not connected!',
      name: 'ERROR_EXTENSION_NOT_CONNECTED',
      desc: '',
      args: [],
    );
  }

  /// `Transfer amount is 0!`
  String get ERROR_TRANSFER_AMOUNT_IS_ZERO {
    return Intl.message(
      'Transfer amount is 0!',
      name: 'ERROR_TRANSFER_AMOUNT_IS_ZERO',
      desc: '',
      args: [],
    );
  }

  /// `You haven't selected a token!`
  String get ERROR_TRANSFER_NO_TOKEN_SELECTED {
    return Intl.message(
      'You haven\'t selected a token!',
      name: 'ERROR_TRANSFER_NO_TOKEN_SELECTED',
      desc: '',
      args: [],
    );
  }

  /// `Cannot be empty!`
  String get ERROR_CANNOT_BE_EMPTY {
    return Intl.message(
      'Cannot be empty!',
      name: 'ERROR_CANNOT_BE_EMPTY',
      desc: '',
      args: [],
    );
  }

  /// `Your input does not match the token schema!`
  String get ERROR_MISMATCHED_TOKEN_SCHEMA {
    return Intl.message(
      'Your input does not match the token schema!',
      name: 'ERROR_MISMATCHED_TOKEN_SCHEMA',
      desc: '',
      args: [],
    );
  }

  /// `Unrecognized token address!`
  String get ERROR_UNRECOGNIZED_TOKEN_ADDRESS {
    return Intl.message(
      'Unrecognized token address!',
      name: 'ERROR_UNRECOGNIZED_TOKEN_ADDRESS',
      desc: '',
      args: [],
    );
  }

  /// `Invalid transfer type ({transferType})!`
  String ERROR_INVALID_TRANSFER_TYPE(Object transferType) {
    return Intl.message(
      'Invalid transfer type ($transferType)!',
      name: 'ERROR_INVALID_TRANSFER_TYPE',
      desc: '',
      args: [transferType],
    );
  }

  /// `{address} is not a valid {addressType} address`
  String ERROR_INVALID_ADDRESS_FOR_ADDR_TYPE(
      Object address, Object addressType) {
    return Intl.message(
      '$address is not a valid $addressType address',
      name: 'ERROR_INVALID_ADDRESS_FOR_ADDR_TYPE',
      desc: '',
      args: [address, addressType],
    );
  }

  /// `Address is empty!`
  String get ERROR_ADDRESS_IS_EMPTY {
    return Intl.message(
      'Address is empty!',
      name: 'ERROR_ADDRESS_IS_EMPTY',
      desc: '',
      args: [],
    );
  }

  /// `Failed to receive token list!`
  String get ERROR_FAILED_TO_GET_TOKENLIST {
    return Intl.message(
      'Failed to receive token list!',
      name: 'ERROR_FAILED_TO_GET_TOKENLIST',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get ERROR_GENERIC {
    return Intl.message(
      'Something went wrong!',
      name: 'ERROR_GENERIC',
      desc: '',
      args: [],
    );
  }

  /// `Amount cannot be empty!`
  String get ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_EMPTY {
    return Intl.message(
      'Amount cannot be empty!',
      name: 'ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_EMPTY',
      desc: '',
      args: [],
    );
  }

  /// `Amount cannot be zero!`
  String get ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_ZERO {
    return Intl.message(
      'Amount cannot be zero!',
      name: 'ERROR_AMOUNT_OF_TRANSFER_CANNOT_BE_ZERO',
      desc: '',
      args: [],
    );
  }

  /// `No token selected or failed to get token info!`
  String get ERROR_AMOUNT_OF_TRANSFER_NO_TOKEN_SELECTED {
    return Intl.message(
      'No token selected or failed to get token info!',
      name: 'ERROR_AMOUNT_OF_TRANSFER_NO_TOKEN_SELECTED',
      desc: '',
      args: [],
    );
  }

  /// `To many decimals for selected token!`
  String get ERROR_AMOUNT_OF_TRANSFER_TO_MANY_DECIMALS {
    return Intl.message(
      'To many decimals for selected token!',
      name: 'ERROR_AMOUNT_OF_TRANSFER_TO_MANY_DECIMALS',
      desc: '',
      args: [],
    );
  }

  /// `Bridge between or send within Ethereum, Gravity and Osmosis!`
  String get HEADLINE {
    return Intl.message(
      'Bridge between or send within Ethereum, Gravity and Osmosis!',
      name: 'HEADLINE',
      desc: '',
      args: [],
    );
  }

  /// `Connect your wallet to get started.`
  String get HEADLINE_SUB {
    return Intl.message(
      'Connect your wallet to get started.',
      name: 'HEADLINE_SUB',
      desc: '',
      args: [],
    );
  }

  /// `Enter custom ERC-20 address or search for token denom`
  String get TOKEN_HINT {
    return Intl.message(
      'Enter custom ERC-20 address or search for token denom',
      name: 'TOKEN_HINT',
      desc: '',
      args: [],
    );
  }

  /// `Cosmos to ETH`
  String get COSMOS_TO_ETHERIUM {
    return Intl.message(
      'Cosmos to ETH',
      name: 'COSMOS_TO_ETHERIUM',
      desc: '',
      args: [],
    );
  }

  /// `ETH to Cosmos`
  String get ETHERIUM_TO_COSMOS {
    return Intl.message(
      'ETH to Cosmos',
      name: 'ETHERIUM_TO_COSMOS',
      desc: '',
      args: [],
    );
  }

  /// `Select Token`
  String get SELECT_TOKEN {
    return Intl.message(
      'Select Token',
      name: 'SELECT_TOKEN',
      desc: '',
      args: [],
    );
  }

  /// `Select wallet`
  String get SELECT_WALLET {
    return Intl.message(
      'Select wallet',
      name: 'SELECT_WALLET',
      desc: '',
      args: [],
    );
  }

  /// `Amount of transfer`
  String get AMOUNT_OF_TRANSFER {
    return Intl.message(
      'Amount of transfer',
      name: 'AMOUNT_OF_TRANSFER',
      desc: '',
      args: [],
    );
  }

  /// `Confirm transfer`
  String get CONFIRM_TRANSFER {
    return Intl.message(
      'Confirm transfer',
      name: 'CONFIRM_TRANSFER',
      desc: '',
      args: [],
    );
  }

  /// `{extensionName} extension couldn't be found`
  String MISSING_EXTENSION(Object extensionName) {
    return Intl.message(
      '$extensionName extension couldn\'t be found',
      name: 'MISSING_EXTENSION',
      desc: '',
      args: [extensionName],
    );
  }

  /// `Extension could not be found`
  String get EXTENSION_COULD_NOT_BE_FOUND {
    return Intl.message(
      'Extension could not be found',
      name: 'EXTENSION_COULD_NOT_BE_FOUND',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get FAQ {
    return Intl.message(
      'FAQ',
      name: 'FAQ',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get TOOLTIP_CLOSE {
    return Intl.message(
      'Close',
      name: 'TOOLTIP_CLOSE',
      desc: '',
      args: [],
    );
  }

  /// `How to`
  String get HOW_TO {
    return Intl.message(
      'How to',
      name: 'HOW_TO',
      desc: '',
      args: [],
    );
  }

  /// `Based on Gravity Bridge by Althea`
  String get FOOTER_INFO {
    return Intl.message(
      'Based on Gravity Bridge by Althea',
      name: 'FOOTER_INFO',
      desc: '',
      args: [],
    );
  }

  /// `Get Keplr on Chrome`
  String get GET_KEPLR_CHROME {
    return Intl.message(
      'Get Keplr on Chrome',
      name: 'GET_KEPLR_CHROME',
      desc: '',
      args: [],
    );
  }

  /// `Get MetaMask on Chrome`
  String get GET_METAMASK_CHROME {
    return Intl.message(
      'Get MetaMask on Chrome',
      name: 'GET_METAMASK_CHROME',
      desc: '',
      args: [],
    );
  }

  /// `Extension not found. Get Keplr on Chrome `
  String get KEPLR_NOT_FOUND_WARNING_TEXT {
    return Intl.message(
      'Extension not found. Get Keplr on Chrome ',
      name: 'KEPLR_NOT_FOUND_WARNING_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `Please log into Metamask.`
  String get METAMASK_LOGIN_PROMPT {
    return Intl.message(
      'Please log into Metamask.',
      name: 'METAMASK_LOGIN_PROMPT',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message(
      'OK',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get CANCEL {
    return Intl.message(
      'Cancel',
      name: 'CANCEL',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get YES {
    return Intl.message(
      'Yes',
      name: 'YES',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get NO {
    return Intl.message(
      'No',
      name: 'NO',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get BACK {
    return Intl.message(
      'Back',
      name: 'BACK',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get DETAILS {
    return Intl.message(
      'Details',
      name: 'DETAILS',
      desc: '',
      args: [],
    );
  }

  /// `DATE - TIME`
  String get DATE_AND_TIME {
    return Intl.message(
      'DATE - TIME',
      name: 'DATE_AND_TIME',
      desc: '',
      args: [],
    );
  }

  /// `copy`
  String get COPY {
    return Intl.message(
      'copy',
      name: 'COPY',
      desc: '',
      args: [],
    );
  }

  /// `Keplr`
  String get KEPLR {
    return Intl.message(
      'Keplr',
      name: 'KEPLR',
      desc: '',
      args: [],
    );
  }

  /// `Ledger`
  String get LEDGER {
    return Intl.message(
      'Ledger',
      name: 'LEDGER',
      desc: '',
      args: [],
    );
  }

  /// `Show Details`
  String get SHOW_DETAILS {
    return Intl.message(
      'Show Details',
      name: 'SHOW_DETAILS',
      desc: '',
      args: [],
    );
  }

  /// `Show details`
  String get SHOW_DETAILS_FOR_WIDGETS {
    return Intl.message(
      'Show details',
      name: 'SHOW_DETAILS_FOR_WIDGETS',
      desc: '',
      args: [],
    );
  }

  /// `Please accept our Terms of Service`
  String get AGREEMENT_TITLE {
    return Intl.message(
      'Please accept our Terms of Service',
      name: 'AGREEMENT_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `This is a newly developed tool and Blockscape.Network assumes no responsibility for bugs or token losses due to inappropriate use of it.\n\nYou are responsible for doing your own diligence on those interfaces to understand the fees and risks they present.\n\nBefore executing transactions with a large amount of tokens it is highly recommended to test the tool with smaller amounts.\n\nTHE BLOCKSCAPE.NETWORK BRIDGE IS PROVIDED “AS IS”, AT YOUR OWN RISK, AND WITHOUT WARRANTIES OF ANY KIND. The Gravity Bridge Portal is based primarily on the Code of the Gravity Bridge from Althea Inc. (“Althea”). Gravity Bridge Portal is one of several interfaces to get access to the Gravity Bridge Protocol. Althea developed much of the initial code from the Gravity Bridge Foundation, it does not provide, own, or control the Gravity Bridge protocol, which is run by a decentralized validator set. Upgrades and modifications to the protocol are managed in a community-driven way by holders of the GRAVITON governance token. No developer or entity involved in creating or building on top of the Gravity Bridge protocol will be liable for any claims or damages whatsoever associated with your use, inability to use, or your interaction with other users of the Gravity Bridge protocol, including any direct, indirect, incidental, special, exemplary, punitive or consequential damages, or loss of profits, cryptocurrencies, tokens, or anything else of value.`
  String get AGREEMENT_TEXT {
    return Intl.message(
      'This is a newly developed tool and Blockscape.Network assumes no responsibility for bugs or token losses due to inappropriate use of it.\n\nYou are responsible for doing your own diligence on those interfaces to understand the fees and risks they present.\n\nBefore executing transactions with a large amount of tokens it is highly recommended to test the tool with smaller amounts.\n\nTHE BLOCKSCAPE.NETWORK BRIDGE IS PROVIDED “AS IS”, AT YOUR OWN RISK, AND WITHOUT WARRANTIES OF ANY KIND. The Gravity Bridge Portal is based primarily on the Code of the Gravity Bridge from Althea Inc. (“Althea”). Gravity Bridge Portal is one of several interfaces to get access to the Gravity Bridge Protocol. Althea developed much of the initial code from the Gravity Bridge Foundation, it does not provide, own, or control the Gravity Bridge protocol, which is run by a decentralized validator set. Upgrades and modifications to the protocol are managed in a community-driven way by holders of the GRAVITON governance token. No developer or entity involved in creating or building on top of the Gravity Bridge protocol will be liable for any claims or damages whatsoever associated with your use, inability to use, or your interaction with other users of the Gravity Bridge protocol, including any direct, indirect, incidental, special, exemplary, punitive or consequential damages, or loss of profits, cryptocurrencies, tokens, or anything else of value.',
      name: 'AGREEMENT_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `I have read the alert and understood the risks`
  String get ACCEPT_AGREEMENT_CHECKBOX {
    return Intl.message(
      'I have read the alert and understood the risks',
      name: 'ACCEPT_AGREEMENT_CHECKBOX',
      desc: '',
      args: [],
    );
  }

  /// `Accept and proceed`
  String get ACCEPT_AND_PROCEED {
    return Intl.message(
      'Accept and proceed',
      name: 'ACCEPT_AND_PROCEED',
      desc: '',
      args: [],
    );
  }

  /// `We recommend you try to send a small amount first before trying to send large amounts. This way you can make sure everything works as expected.`
  String get WARNING_MESSAGE {
    return Intl.message(
      'We recommend you try to send a small amount first before trying to send large amounts. This way you can make sure everything works as expected.',
      name: 'WARNING_MESSAGE',
      desc: '',
      args: [],
    );
  }

  /// `BRIDGE FEE`
  String get BRIDGE_FEE {
    return Intl.message(
      'BRIDGE FEE',
      name: 'BRIDGE_FEE',
      desc: '',
      args: [],
    );
  }

  /// `Transaction history`
  String get TRANSACTION_HISTORY {
    return Intl.message(
      'Transaction history',
      name: 'TRANSACTION_HISTORY',
      desc: '',
      args: [],
    );
  }

  /// `No recent transaction`
  String get NO_RECENT_TRANSACTION {
    return Intl.message(
      'No recent transaction',
      name: 'NO_RECENT_TRANSACTION',
      desc: '',
      args: [],
    );
  }

  /// `No recent batches`
  String get NO_RECENT_BATCHES {
    return Intl.message(
      'No recent batches',
      name: 'NO_RECENT_BATCHES',
      desc: '',
      args: [],
    );
  }

  /// `Supply chain info unavailable`
  String get SUPPLY_CHAIN_INFO_UNAVAILABLE {
    return Intl.message(
      'Supply chain info unavailable',
      name: 'SUPPLY_CHAIN_INFO_UNAVAILABLE',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get MENU_ITEM_TRANSFER {
    return Intl.message(
      'Transfer',
      name: 'MENU_ITEM_TRANSFER',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get MENU_ITEM_ABOUT {
    return Intl.message(
      'About',
      name: 'MENU_ITEM_ABOUT',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get MENU_ITEM_TRANSACTIONS {
    return Intl.message(
      'Transactions',
      name: 'MENU_ITEM_TRANSACTIONS',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Detail`
  String get MENU_ITEM_TRANSACTION_DETAIL {
    return Intl.message(
      'Transaction Detail',
      name: 'MENU_ITEM_TRANSACTION_DETAIL',
      desc: '',
      args: [],
    );
  }

  /// `How To`
  String get MENU_ITEM_HOW_TO {
    return Intl.message(
      'How To',
      name: 'MENU_ITEM_HOW_TO',
      desc: '',
      args: [],
    );
  }

  /// `What's new`
  String get MENU_ITEM_WHATS_NEW {
    return Intl.message(
      'What\'s new',
      name: 'MENU_ITEM_WHATS_NEW',
      desc: '',
      args: [],
    );
  }

  /// `Batches`
  String get MENU_ITEM_BATCHES {
    return Intl.message(
      'Batches',
      name: 'MENU_ITEM_BATCHES',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get MENU_ITEM_SETTINGS {
    return Intl.message(
      'Settings',
      name: 'MENU_ITEM_SETTINGS',
      desc: '',
      args: [],
    );
  }

  /// `FROM`
  String get SELECT_TYPE_FROM {
    return Intl.message(
      'FROM',
      name: 'SELECT_TYPE_FROM',
      desc: '',
      args: [],
    );
  }

  /// `TO`
  String get SELECT_TYPE_TO {
    return Intl.message(
      'TO',
      name: 'SELECT_TYPE_TO',
      desc: '',
      args: [],
    );
  }

  /// `Available: {balance}`
  String BALANCE(Object balance) {
    return Intl.message(
      'Available: $balance',
      name: 'BALANCE',
      desc: '',
      args: [balance],
    );
  }

  /// `Connect your wallet to see the available amount`
  String get BALANCE_TEXT_BEFORE_CONNECTING_WALLET {
    return Intl.message(
      'Connect your wallet to see the available amount',
      name: 'BALANCE_TEXT_BEFORE_CONNECTING_WALLET',
      desc: '',
      args: [],
    );
  }

  /// `keplr`
  String get TRANSFER_ADDRESS_KEPLR {
    return Intl.message(
      'keplr',
      name: 'TRANSFER_ADDRESS_KEPLR',
      desc: '',
      args: [],
    );
  }

  /// `metamask`
  String get TRANSFER_ADDRESS_METAMASK {
    return Intl.message(
      'metamask',
      name: 'TRANSFER_ADDRESS_METAMASK',
      desc: '',
      args: [],
    );
  }

  /// `Lock address`
  String get TRANSFER_ADDRESS_LOCK {
    return Intl.message(
      'Lock address',
      name: 'TRANSFER_ADDRESS_LOCK',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get TRANSFER_ADDRESS_UNLOCK {
    return Intl.message(
      'Edit address',
      name: 'TRANSFER_ADDRESS_UNLOCK',
      desc: '',
      args: [],
    );
  }

  /// `Token`
  String get TOKEN {
    return Intl.message(
      'Token',
      name: 'TOKEN',
      desc: '',
      args: [],
    );
  }

  /// `Batch`
  String get BATCH {
    return Intl.message(
      'Batch',
      name: 'BATCH',
      desc: '',
      args: [],
    );
  }

  /// `AMOUNT`
  String get AMOUNT {
    return Intl.message(
      'AMOUNT',
      name: 'AMOUNT',
      desc: '',
      args: [],
    );
  }

  /// `STATUS`
  String get STATUS {
    return Intl.message(
      'STATUS',
      name: 'STATUS',
      desc: '',
      args: [],
    );
  }

  /// `REMAINING`
  String get REMAINING {
    return Intl.message(
      'REMAINING',
      name: 'REMAINING',
      desc: '',
      args: [],
    );
  }

  /// `STARTED AT`
  String get STARTED_AT {
    return Intl.message(
      'STARTED AT',
      name: 'STARTED_AT',
      desc: '',
      args: [],
    );
  }

  /// `ROUTE`
  String get ROUTE {
    return Intl.message(
      'ROUTE',
      name: 'ROUTE',
      desc: '',
      args: [],
    );
  }

  /// `NONCE`
  String get NONCE {
    return Intl.message(
      'NONCE',
      name: 'NONCE',
      desc: '',
      args: [],
    );
  }

  /// `BLOCK`
  String get BLOCK {
    return Intl.message(
      'BLOCK',
      name: 'BLOCK',
      desc: '',
      args: [],
    );
  }

  /// `FEE`
  String get FEE {
    return Intl.message(
      'FEE',
      name: 'FEE',
      desc: '',
      args: [],
    );
  }

  /// `Wallet address`
  String get WALLET_ADDRESS {
    return Intl.message(
      'Wallet address',
      name: 'WALLET_ADDRESS',
      desc: '',
      args: [],
    );
  }

  /// `Give permission to transfer {token}`
  String GIVE_PERMISSION_FOR_TOKEN(Object token) {
    return Intl.message(
      'Give permission to transfer $token',
      name: 'GIVE_PERMISSION_FOR_TOKEN',
      desc: '',
      args: [token],
    );
  }

  /// `To execute a transfer Gravity-Bridge needs your permission to send out a token. For each token you need to do this only once.`
  String get GIVE_PERMISSION_FOR_TOKEN_HINT {
    return Intl.message(
      'To execute a transfer Gravity-Bridge needs your permission to send out a token. For each token you need to do this only once.',
      name: 'GIVE_PERMISSION_FOR_TOKEN_HINT',
      desc: '',
      args: [],
    );
  }

  /// `Why do I need to give permission`
  String get GIVE_PERMISSION_TITLE_FOR_MOBILE {
    return Intl.message(
      'Why do I need to give permission',
      name: 'GIVE_PERMISSION_TITLE_FOR_MOBILE',
      desc: '',
      args: [],
    );
  }

  /// `Permission given`
  String get PERMISSION_GIVEN {
    return Intl.message(
      'Permission given',
      name: 'PERMISSION_GIVEN',
      desc: '',
      args: [],
    );
  }

  /// `Failed to approve permissions for transfer.`
  String get ERROR_APPROVAL {
    return Intl.message(
      'Failed to approve permissions for transfer.',
      name: 'ERROR_APPROVAL',
      desc: '',
      args: [],
    );
  }

  /// `Approve transfer`
  String get APPROVE_TRANSFER {
    return Intl.message(
      'Approve transfer',
      name: 'APPROVE_TRANSFER',
      desc: '',
      args: [],
    );
  }

  /// `Approval complete`
  String get APPROVAL_COMPLETE_TITLE {
    return Intl.message(
      'Approval complete',
      name: 'APPROVAL_COMPLETE_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `You may continue with the transfer.`
  String get APPROVAL_COMPLETE {
    return Intl.message(
      'You may continue with the transfer.',
      name: 'APPROVAL_COMPLETE',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm (or decline) confirmation in Metamask to continue.`
  String get APPROVAL_START {
    return Intl.message(
      'Please confirm (or decline) confirmation in Metamask to continue.',
      name: 'APPROVAL_START',
      desc: '',
      args: [],
    );
  }

  /// `Approval pending`
  String get APPROVAL_START_TITLE {
    return Intl.message(
      'Approval pending',
      name: 'APPROVAL_START_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Approval in progress.`
  String get PENDING_APPROVAL {
    return Intl.message(
      'Approval in progress.',
      name: 'PENDING_APPROVAL',
      desc: '',
      args: [],
    );
  }

  /// `Its taking longer than usual. Be patient...`
  String get PENDING_APPROVAL_LONG {
    return Intl.message(
      'Its taking longer than usual. Be patient...',
      name: 'PENDING_APPROVAL_LONG',
      desc: '',
      args: [],
    );
  }

  /// `Begin transfer`
  String get BEGIN_TRANSFER {
    return Intl.message(
      'Begin transfer',
      name: 'BEGIN_TRANSFER',
      desc: '',
      args: [],
    );
  }

  /// `Swap`
  String get SWAP {
    return Intl.message(
      'Swap',
      name: 'SWAP',
      desc: '',
      args: [],
    );
  }

  /// `In the next step, your MetaMask Wallet will appear to approve your transfer. If you are not sure whether you really want to transfer your tokens, now is the best time to press the Cancel button. Please be patient, the transfer can take around 20 minutes before completion.`
  String get NOTICE {
    return Intl.message(
      'In the next step, your MetaMask Wallet will appear to approve your transfer. If you are not sure whether you really want to transfer your tokens, now is the best time to press the Cancel button. Please be patient, the transfer can take around 20 minutes before completion.',
      name: 'NOTICE',
      desc: '',
      args: [],
    );
  }

  /// `API provided by `
  String get API_PROVIDED_BY {
    return Intl.message(
      'API provided by ',
      name: 'API_PROVIDED_BY',
      desc: '',
      args: [],
    );
  }

  /// `Unavailable`
  String get TOKEN_DIALOG_BALANCE_DEFAULT {
    return Intl.message(
      'Unavailable',
      name: 'TOKEN_DIALOG_BALANCE_DEFAULT',
      desc: '',
      args: [],
    );
  }

  /// `No tokens found!`
  String get TOKEN_DIALOG_NO_TOKENS {
    return Intl.message(
      'No tokens found!',
      name: 'TOKEN_DIALOG_NO_TOKENS',
      desc: '',
      args: [],
    );
  }

  /// `Search by name or address.`
  String get TOKEN_DIALOG_SEARCH_HINT {
    return Intl.message(
      'Search by name or address.',
      name: 'TOKEN_DIALOG_SEARCH_HINT',
      desc: '',
      args: [],
    );
  }

  /// `Copy address`
  String get TOKEN_DIALOG_TOOLTIP_COPY {
    return Intl.message(
      'Copy address',
      name: 'TOKEN_DIALOG_TOOLTIP_COPY',
      desc: '',
      args: [],
    );
  }

  /// `Token address copied to clipboard`
  String get TOKEN_DIALOG_COPY_SUCCESS {
    return Intl.message(
      'Token address copied to clipboard',
      name: 'TOKEN_DIALOG_COPY_SUCCESS',
      desc: '',
      args: [],
    );
  }

  /// `CoinGecko`
  String get COINGECKO {
    return Intl.message(
      'CoinGecko',
      name: 'COINGECKO',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © 2022 Blockscape.Network. All rights reserved.`
  String get LEGALESE {
    return Intl.message(
      'Copyright © 2022 Blockscape.Network. All rights reserved.',
      name: 'LEGALESE',
      desc: '',
      args: [],
    );
  }

  /// `Blockscapes Gravity Bridge, baby! 🖖🏻`
  String get ABOUT_INFO {
    return Intl.message(
      'Blockscapes Gravity Bridge, baby! 🖖🏻',
      name: 'ABOUT_INFO',
      desc: '',
      args: [],
    );
  }

  /// `Transaction rejected`
  String get TRANSACTION_TITLE_REJECTED {
    return Intl.message(
      'Transaction rejected',
      name: 'TRANSACTION_TITLE_REJECTED',
      desc: '',
      args: [],
    );
  }

  /// `Transaction pending`
  String get TRANSACTION_TITLE_PENDING {
    return Intl.message(
      'Transaction pending',
      name: 'TRANSACTION_TITLE_PENDING',
      desc: '',
      args: [],
    );
  }

  /// `Transaction started`
  String get TRANSACTION_TITLE_STARTED {
    return Intl.message(
      'Transaction started',
      name: 'TRANSACTION_TITLE_STARTED',
      desc: '',
      args: [],
    );
  }

  /// `Transaction in progress`
  String get TRANSACTION_TITLE_PROGRESS {
    return Intl.message(
      'Transaction in progress',
      name: 'TRANSACTION_TITLE_PROGRESS',
      desc: '',
      args: [],
    );
  }

  /// `Transaction complete`
  String get TRANSACTION_TITLE_COMPLETE {
    return Intl.message(
      'Transaction complete',
      name: 'TRANSACTION_TITLE_COMPLETE',
      desc: '',
      args: [],
    );
  }

  /// `Transaction error`
  String get TRANSACTION_TITLE_ERROR {
    return Intl.message(
      'Transaction error',
      name: 'TRANSACTION_TITLE_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Batched transaction created`
  String get BATCH_TRANSACTION_CREATED_TITLE {
    return Intl.message(
      'Batched transaction created',
      name: 'BATCH_TRANSACTION_CREATED_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Transaction hash`
  String get TRANSACTION_HASH {
    return Intl.message(
      'Transaction hash',
      name: 'TRANSACTION_HASH',
      desc: '',
      args: [],
    );
  }

  /// `Your transaction has been completed. Please check your wallet for the transaction receipt.`
  String get TRANSACTION_COMPLETE_TEXT_DESCRIPTION {
    return Intl.message(
      'Your transaction has been completed. Please check your wallet for the transaction receipt.',
      name: 'TRANSACTION_COMPLETE_TEXT_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Your batched transaction has been created, and may take up to {durationInHours} hours to complete.`
  String BATCHED_TRANSACTION_CREATED_TEXT_DESCRIPTION(Object durationInHours) {
    return Intl.message(
      'Your batched transaction has been created, and may take up to $durationInHours hours to complete.',
      name: 'BATCHED_TRANSACTION_CREATED_TEXT_DESCRIPTION',
      desc: '',
      args: [durationInHours],
    );
  }

  /// `To check the status of your transaction, please navigate to the `
  String get TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT1 {
    return Intl.message(
      'To check the status of your transaction, please navigate to the ',
      name: 'TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT1',
      desc: '',
      args: [],
    );
  }

  /// `transaction history page`
  String get TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT2 {
    return Intl.message(
      'transaction history page',
      name: 'TRANSACTION_COMPLETE_TRANSACTION_HISTORY_HINT2',
      desc: '',
      args: [],
    );
  }

  /// `Transaction has been started...`
  String get TRANSACTION_STARTED_TEXT {
    return Intl.message(
      'Transaction has been started...',
      name: 'TRANSACTION_STARTED_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `There was an error during the transaction. Please try again later.`
  String get TRANSACTION_ERROR {
    return Intl.message(
      'There was an error during the transaction. Please try again later.',
      name: 'TRANSACTION_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Etherscan`
  String get ETHERSCAN_TEXT {
    return Intl.message(
      'Etherscan',
      name: 'ETHERSCAN_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `Mintscan`
  String get MINTSCAN_TEXT {
    return Intl.message(
      'Mintscan',
      name: 'MINTSCAN_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `What is happening?`
  String get WHAT_IS_HAPPENING {
    return Intl.message(
      'What is happening?',
      name: 'WHAT_IS_HAPPENING',
      desc: '',
      args: [],
    );
  }

  /// `Read this`
  String get READ_THIS {
    return Intl.message(
      'Read this',
      name: 'READ_THIS',
      desc: '',
      args: [],
    );
  }

  /// `Smart contract used for this Bridge:`
  String get SMART_CONTRACT_USED {
    return Intl.message(
      'Smart contract used for this Bridge:',
      name: 'SMART_CONTRACT_USED',
      desc: '',
      args: [],
    );
  }

  /// `Gravity Bridge`
  String get TRANSFER_TYPE_KEPLR {
    return Intl.message(
      'Gravity Bridge',
      name: 'TRANSFER_TYPE_KEPLR',
      desc: '',
      args: [],
    );
  }

  /// `Ethereum`
  String get TRANSFER_TYPE_METAMASK {
    return Intl.message(
      'Ethereum',
      name: 'TRANSFER_TYPE_METAMASK',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get TRANSFER_TYPE_CONNECT {
    return Intl.message(
      'Connect',
      name: 'TRANSFER_TYPE_CONNECT',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect`
  String get TRANSFER_TYPE_DISCONNECT {
    return Intl.message(
      'Disconnect',
      name: 'TRANSFER_TYPE_DISCONNECT',
      desc: '',
      args: [],
    );
  }

  /// `Connect to Keplr`
  String get CONNECT_TO_KEPLR {
    return Intl.message(
      'Connect to Keplr',
      name: 'CONNECT_TO_KEPLR',
      desc: '',
      args: [],
    );
  }

  /// `Connect to Ledger`
  String get CONNECT_TO_LEDGER {
    return Intl.message(
      'Connect to Ledger',
      name: 'CONNECT_TO_LEDGER',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get TRANSFER_TYPE_FROM {
    return Intl.message(
      'From',
      name: 'TRANSFER_TYPE_FROM',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get TRANSFER_TYPE_TO {
    return Intl.message(
      'To',
      name: 'TRANSFER_TYPE_TO',
      desc: '',
      args: [],
    );
  }

  /// `Please change your network from "{previous}" to "{next}"!`
  String CHANGE_NETWORK_REQUEST(Object previous, Object next) {
    return Intl.message(
      'Please change your network from "$previous" to "$next"!',
      name: 'CHANGE_NETWORK_REQUEST',
      desc: '',
      args: [previous, next],
    );
  }

  /// `You are on the wrong ethereum network, please switch to {requiredNetwork}.`
  String WRONG_NETWORK_WARNING(Object requiredNetwork) {
    return Intl.message(
      'You are on the wrong ethereum network, please switch to $requiredNetwork.',
      name: 'WRONG_NETWORK_WARNING',
      desc: '',
      args: [requiredNetwork],
    );
  }

  /// `Select token to see bridge fee options`
  String get BRIDGE_FEE_SELECT_TOKEN {
    return Intl.message(
      'Select token to see bridge fee options',
      name: 'BRIDGE_FEE_SELECT_TOKEN',
      desc: '',
      args: [],
    );
  }

  /// `There was an error fetching the bridge fee.`
  String get BRIDGE_FEE_ERROR {
    return Intl.message(
      'There was an error fetching the bridge fee.',
      name: 'BRIDGE_FEE_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Standard`
  String get BRIDGE_FEE_STANDARD_TYPE {
    return Intl.message(
      'Standard',
      name: 'BRIDGE_FEE_STANDARD_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `batched transfer`
  String get BRIDGE_FEE_STANDARD_TYPE_DESCRIPTION {
    return Intl.message(
      'batched transfer',
      name: 'BRIDGE_FEE_STANDARD_TYPE_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Slow`
  String get BRIDGE_FEE_LOW_TYPE {
    return Intl.message(
      'Slow',
      name: 'BRIDGE_FEE_LOW_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `batched transfer`
  String get BRIDGE_FEE_LOW_TYPE_DESCRIPTION {
    return Intl.message(
      'batched transfer',
      name: 'BRIDGE_FEE_LOW_TYPE_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get BRIDGE_FEE_PREMIUM_TYPE {
    return Intl.message(
      'Premium',
      name: 'BRIDGE_FEE_PREMIUM_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `individual transfer`
  String get BRIDGE_FEE_PREMIUM_TYPE_DESCRIPTION {
    return Intl.message(
      'individual transfer',
      name: 'BRIDGE_FEE_PREMIUM_TYPE_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `up to {durationInHours}h`
  String BRIDGE_FEE_SPEED_DESCRIPTION(Object durationInHours) {
    return Intl.message(
      'up to ${durationInHours}h',
      name: 'BRIDGE_FEE_SPEED_DESCRIPTION',
      desc: '',
      args: [durationInHours],
    );
  }

  /// `instant`
  String get BRIDGE_FEE_PREMIUM_SPEED_DESCRIPTION {
    return Intl.message(
      'instant',
      name: 'BRIDGE_FEE_PREMIUM_SPEED_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Amount to transfer`
  String get BRIDGE_FEE_TRANSFER_AMOUNT {
    return Intl.message(
      'Amount to transfer',
      name: 'BRIDGE_FEE_TRANSFER_AMOUNT',
      desc: '',
      args: [],
    );
  }

  /// `Bridge fee cost (paid to relayers)`
  String get BRIDGE_FEE_TRANSFER_BRIDGE_FEE_COST {
    return Intl.message(
      'Bridge fee cost (paid to relayers)',
      name: 'BRIDGE_FEE_TRANSFER_BRIDGE_FEE_COST',
      desc: '',
      args: [],
    );
  }

  /// `Chain fee cost (paid to validators)`
  String get CHAIN_FEE_COST {
    return Intl.message(
      'Chain fee cost (paid to validators)',
      name: 'CHAIN_FEE_COST',
      desc: '',
      args: [],
    );
  }

  /// `Total transfer cost`
  String get BRIDGE_FEE_TRANSFER_TOTAL_COST {
    return Intl.message(
      'Total transfer cost',
      name: 'BRIDGE_FEE_TRANSFER_TOTAL_COST',
      desc: '',
      args: [],
    );
  }

  /// `Amount is more than available balance`
  String get TOKEN_BALANCE_NOT_ENOUGH_WARNING {
    return Intl.message(
      'Amount is more than available balance',
      name: 'TOKEN_BALANCE_NOT_ENOUGH_WARNING',
      desc: '',
      args: [],
    );
  }

  /// `Available balance is not enough to cover the bridge fee`
  String get TOKEN_BALANCE_NOT_ENOUGH_FOR_BRIDGE_FEE_WARNING {
    return Intl.message(
      'Available balance is not enough to cover the bridge fee',
      name: 'TOKEN_BALANCE_NOT_ENOUGH_FOR_BRIDGE_FEE_WARNING',
      desc: '',
      args: [],
    );
  }

  /// `chain fees deducted`
  String get CHAIN_FEES_DEDUCTED {
    return Intl.message(
      'chain fees deducted',
      name: 'CHAIN_FEES_DEDUCTED',
      desc: '',
      args: [],
    );
  }

  /// `bridge fee deducted`
  String get BRIDGE_FEE_DEDUCTED_TEXT {
    return Intl.message(
      'bridge fee deducted',
      name: 'BRIDGE_FEE_DEDUCTED_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `Select chain`
  String get SELECT_CHAIN {
    return Intl.message(
      'Select chain',
      name: 'SELECT_CHAIN',
      desc: '',
      args: [],
    );
  }

  /// `Select a network to transact on`
  String get SELECT_CHAIN_DIALOG_TITLE {
    return Intl.message(
      'Select a network to transact on',
      name: 'SELECT_CHAIN_DIALOG_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Starting IBC Transfer`
  String get IBC_TRANSFER_DIALOG_TITLE {
    return Intl.message(
      'Starting IBC Transfer',
      name: 'IBC_TRANSFER_DIALOG_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `You are about to start the IBC transfer from {chain1} to {chain2}. If you've made it this far, then you've probably also double-checked the input fields. If yes, proceed with pressing the button below.`
  String IBC_TRANSFER_DIALOG_CONTENT(Object chain1, Object chain2) {
    return Intl.message(
      'You are about to start the IBC transfer from $chain1 to $chain2. If you\'ve made it this far, then you\'ve probably also double-checked the input fields. If yes, proceed with pressing the button below.',
      name: 'IBC_TRANSFER_DIALOG_CONTENT',
      desc: '',
      args: [chain1, chain2],
    );
  }

  /// `Cancel transaction`
  String get TRANSACTION_HISTORY_CANCEL_MENU_TEXT {
    return Intl.message(
      'Cancel transaction',
      name: 'TRANSACTION_HISTORY_CANCEL_MENU_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `Failed to cancel transaction`
  String get TRANSACTION_HISTORY_CANCEL_ERROR_DIALOG_TITLE {
    return Intl.message(
      'Failed to cancel transaction',
      name: 'TRANSACTION_HISTORY_CANCEL_ERROR_DIALOG_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Cancel transaction {id}?`
  String TRANSACTION_HISTORY_CANCEL_DIALOG_TITLE(Object id) {
    return Intl.message(
      'Cancel transaction $id?',
      name: 'TRANSACTION_HISTORY_CANCEL_DIALOG_TITLE',
      desc: '',
      args: [id],
    );
  }

  /// `Cancel the following transaction?`
  String get CANCEL_THE_FOLLOWING_TRANSACTION {
    return Intl.message(
      'Cancel the following transaction?',
      name: 'CANCEL_THE_FOLLOWING_TRANSACTION',
      desc: '',
      args: [],
    );
  }

  /// `This will abort its execution!`
  String get TRANSACTION_HISTORY_CANCEL_DIALOG_DESC {
    return Intl.message(
      'This will abort its execution!',
      name: 'TRANSACTION_HISTORY_CANCEL_DIALOG_DESC',
      desc: '',
      args: [],
    );
  }

  /// `Copy address`
  String get TRANSACTION_HISTORY_STATUS_MENU_COPY_ADDRESS {
    return Intl.message(
      'Copy address',
      name: 'TRANSACTION_HISTORY_STATUS_MENU_COPY_ADDRESS',
      desc: '',
      args: [],
    );
  }

  /// `Copy TransactionID`
  String get TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_ID {
    return Intl.message(
      'Copy TransactionID',
      name: 'TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_ID',
      desc: '',
      args: [],
    );
  }

  /// `Copy transaction hash`
  String get TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH {
    return Intl.message(
      'Copy transaction hash',
      name: 'TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH',
      desc: '',
      args: [],
    );
  }

  /// `Transaction hash copied to clipboard`
  String get TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH_SUCCESS {
    return Intl.message(
      'Transaction hash copied to clipboard',
      name: 'TRANSACTION_HISTORY_STATUS_MENU_COPY_TRANSACTION_HASH_SUCCESS',
      desc: '',
      args: [],
    );
  }

  /// `Transaction address copied to clipboard`
  String get TRANSACTION_HISTORY_STATUS_MENU_COPY_ADDRESS_SUCCESS {
    return Intl.message(
      'Transaction address copied to clipboard',
      name: 'TRANSACTION_HISTORY_STATUS_MENU_COPY_ADDRESS_SUCCESS',
      desc: '',
      args: [],
    );
  }

  /// `Remove entry`
  String get TRANSACTION_HISTORY_REMOVE_MENU_TEXT {
    return Intl.message(
      'Remove entry',
      name: 'TRANSACTION_HISTORY_REMOVE_MENU_TEXT',
      desc: '',
      args: [],
    );
  }

  /// `Remove entry {id} from this table?`
  String TRANSACTION_HISTORY_REMOVE_DIALOG_TITLE(Object id) {
    return Intl.message(
      'Remove entry $id from this table?',
      name: 'TRANSACTION_HISTORY_REMOVE_DIALOG_TITLE',
      desc: '',
      args: [id],
    );
  }

  /// `Transaction is being registered.`
  String get TRANSACTION_HISTORY_STATUS_TOOLTIP_PREPARING {
    return Intl.message(
      'Transaction is being registered.',
      name: 'TRANSACTION_HISTORY_STATUS_TOOLTIP_PREPARING',
      desc: '',
      args: [],
    );
  }

  /// `Transaction was registered and tokens are being transferred.`
  String get TRANSACTION_HISTORY_STATUS_TOOLTIP_PENDING {
    return Intl.message(
      'Transaction was registered and tokens are being transferred.',
      name: 'TRANSACTION_HISTORY_STATUS_TOOLTIP_PENDING',
      desc: '',
      args: [],
    );
  }

  /// `Transaction succeeded.`
  String get TRANSACTION_HISTORY_STATUS_TOOLTIP_COMPLETED {
    return Intl.message(
      'Transaction succeeded.',
      name: 'TRANSACTION_HISTORY_STATUS_TOOLTIP_COMPLETED',
      desc: '',
      args: [],
    );
  }

  /// `Transaction failed.`
  String get TRANSACTION_HISTORY_STATUS_TOOLTIP_FAILED {
    return Intl.message(
      'Transaction failed.',
      name: 'TRANSACTION_HISTORY_STATUS_TOOLTIP_FAILED',
      desc: '',
      args: [],
    );
  }

  /// `Transaction was canceled by the user.`
  String get TRANSACTION_HISTORY_STATUS_TOOLTIP_CANCELED {
    return Intl.message(
      'Transaction was canceled by the user.',
      name: 'TRANSACTION_HISTORY_STATUS_TOOLTIP_CANCELED',
      desc: '',
      args: [],
    );
  }

  /// `Transfer tokens`
  String get TRANSFER_TOKENS {
    return Intl.message(
      'Transfer tokens',
      name: 'TRANSFER_TOKENS',
      desc: '',
      args: [],
    );
  }

  /// `Widgets`
  String get WIDGETS {
    return Intl.message(
      'Widgets',
      name: 'WIDGETS',
      desc: '',
      args: [],
    );
  }

  /// `Graviton`
  String get GRAVITON {
    return Intl.message(
      'Graviton',
      name: 'GRAVITON',
      desc: '',
      args: [],
    );
  }

  /// `Popular routes`
  String get POPULAR_ROUTES {
    return Intl.message(
      'Popular routes',
      name: 'POPULAR_ROUTES',
      desc: '',
      args: [],
    );
  }

  /// `Recent transactions`
  String get RECENT_TRANSACTIONS {
    return Intl.message(
      'Recent transactions',
      name: 'RECENT_TRANSACTIONS',
      desc: '',
      args: [],
    );
  }

  /// `Recent batches`
  String get RECENT_BATCHES {
    return Intl.message(
      'Recent batches',
      name: 'RECENT_BATCHES',
      desc: '',
      args: [],
    );
  }

  /// `Gravity supply info`
  String get GRAVITY_SUPPLY_INFO {
    return Intl.message(
      'Gravity supply info',
      name: 'GRAVITY_SUPPLY_INFO',
      desc: '',
      args: [],
    );
  }

  /// `Liquid (not vesting)`
  String get GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING {
    return Intl.message(
      'Liquid (not vesting)',
      name: 'GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING',
      desc: '',
      args: [],
    );
  }

  /// `Liquid (not vesting) and staked`
  String get GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING_AND_STAKED {
    return Intl.message(
      'Liquid (not vesting) and staked',
      name: 'GRAVITY_SUPPLY_INFO_LIQUID_NOT_VESTING_AND_STAKED',
      desc: '',
      args: [],
    );
  }

  /// `Unclaimed staking rewards`
  String get GRAVITY_SUPPLY_INFO_UNCLAIMED_STAKING_REWARDS {
    return Intl.message(
      'Unclaimed staking rewards',
      name: 'GRAVITY_SUPPLY_INFO_UNCLAIMED_STAKING_REWARDS',
      desc: '',
      args: [],
    );
  }

  /// `Unvested`
  String get GRAVITY_SUPPLY_INFO_UNVESTED {
    return Intl.message(
      'Unvested',
      name: 'GRAVITY_SUPPLY_INFO_UNVESTED',
      desc: '',
      args: [],
    );
  }

  /// `Unvested staked`
  String get GRAVITY_SUPPLY_INFO_UNVESTED_STAKED {
    return Intl.message(
      'Unvested staked',
      name: 'GRAVITY_SUPPLY_INFO_UNVESTED_STAKED',
      desc: '',
      args: [],
    );
  }

  /// `Vested`
  String get GRAVITY_SUPPLY_INFO_VESTED {
    return Intl.message(
      'Vested',
      name: 'GRAVITY_SUPPLY_INFO_VESTED',
      desc: '',
      args: [],
    );
  }

  /// `Gravity Chain supply info fetching..`
  String get GRAVITY_SUPPLY_INFO_FETCHING {
    return Intl.message(
      'Gravity Chain supply info fetching..',
      name: 'GRAVITY_SUPPLY_INFO_FETCHING',
      desc: '',
      args: [],
    );
  }

  /// `Gravity Chain volume info fetching..`
  String get GRAVITY_VOLUME_INFO_FETCHING {
    return Intl.message(
      'Gravity Chain volume info fetching..',
      name: 'GRAVITY_VOLUME_INFO_FETCHING',
      desc: '',
      args: [],
    );
  }

  /// `Gravity Chain transaction queue info fetching..`
  String get GRAVITY_TRANSACTION_QUEUE_INFO_FETCHING {
    return Intl.message(
      'Gravity Chain transaction queue info fetching..',
      name: 'GRAVITY_TRANSACTION_QUEUE_INFO_FETCHING',
      desc: '',
      args: [],
    );
  }

  /// `Gravity volume`
  String get GRAVITY_VOLUME_INFO {
    return Intl.message(
      'Gravity volume',
      name: 'GRAVITY_VOLUME_INFO',
      desc: '',
      args: [],
    );
  }

  /// `Daily volume`
  String get GRAVITY_VOLUME_INFO_DAILY_VOLUME {
    return Intl.message(
      'Daily volume',
      name: 'GRAVITY_VOLUME_INFO_DAILY_VOLUME',
      desc: '',
      args: [],
    );
  }

  /// `Daily inflow`
  String get GRAVITY_VOLUME_INFO_DAILY_INFLOW {
    return Intl.message(
      'Daily inflow',
      name: 'GRAVITY_VOLUME_INFO_DAILY_INFLOW',
      desc: '',
      args: [],
    );
  }

  /// `Daily outflow`
  String get GRAVITY_VOLUME_INFO_DAILY_OUTFLOW {
    return Intl.message(
      'Daily outflow',
      name: 'GRAVITY_VOLUME_INFO_DAILY_OUTFLOW',
      desc: '',
      args: [],
    );
  }

  /// `Weekly volume`
  String get GRAVITY_VOLUME_INFO_WEEKLY_VOLUME {
    return Intl.message(
      'Weekly volume',
      name: 'GRAVITY_VOLUME_INFO_WEEKLY_VOLUME',
      desc: '',
      args: [],
    );
  }

  /// `Weekly inflow`
  String get GRAVITY_VOLUME_INFO_WEEKLY_INFLOW {
    return Intl.message(
      'Weekly inflow',
      name: 'GRAVITY_VOLUME_INFO_WEEKLY_INFLOW',
      desc: '',
      args: [],
    );
  }

  /// `Weekly outflow`
  String get GRAVITY_VOLUME_INFO_WEEKLY_OUTFLOW {
    return Intl.message(
      'Weekly outflow',
      name: 'GRAVITY_VOLUME_INFO_WEEKLY_OUTFLOW',
      desc: '',
      args: [],
    );
  }

  /// `Transaction queue`
  String get TRANSACTION_QUEUE {
    return Intl.message(
      'Transaction queue',
      name: 'TRANSACTION_QUEUE',
      desc: '',
      args: [],
    );
  }

  /// `These transactions are not yet in batches,\na batch will be requested when the fee amount\nexceeds the cost to execute on Ethereum`
  String get TRANSACTION_QUEUE_INFO_WIDGET_TOOLTIP_MESSAGE {
    return Intl.message(
      'These transactions are not yet in batches,\na batch will be requested when the fee amount\nexceeds the cost to execute on Ethereum',
      name: 'TRANSACTION_QUEUE_INFO_WIDGET_TOOLTIP_MESSAGE',
      desc: '',
      args: [],
    );
  }

  /// `Num of txs`
  String get NUM_OF_TXS {
    return Intl.message(
      'Num of txs',
      name: 'NUM_OF_TXS',
      desc: '',
      args: [],
    );
  }

  /// `Total fees`
  String get TOTAL_FEES {
    return Intl.message(
      'Total fees',
      name: 'TOTAL_FEES',
      desc: '',
      args: [],
    );
  }

  /// `View all routes`
  String get VIEW_ALL_ROUTES {
    return Intl.message(
      'View all routes',
      name: 'VIEW_ALL_ROUTES',
      desc: '',
      args: [],
    );
  }

  /// `View all transactions`
  String get VIEW_ALL_TRANSACTIONS {
    return Intl.message(
      'View all transactions',
      name: 'VIEW_ALL_TRANSACTIONS',
      desc: '',
      args: [],
    );
  }

  /// `View all batches`
  String get VIEW_ALL_BATCHES {
    return Intl.message(
      'View all batches',
      name: 'VIEW_ALL_BATCHES',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard!`
  String get COPY_TO_CLIPBOARD_CONFIRMATION {
    return Intl.message(
      'Copied to clipboard!',
      name: 'COPY_TO_CLIPBOARD_CONFIRMATION',
      desc: '',
      args: [],
    );
  }

  /// `Waiting response`
  String get WAITING_RESPONSE {
    return Intl.message(
      'Waiting response',
      name: 'WAITING_RESPONSE',
      desc: '',
      args: [],
    );
  }

  /// `Trying to fetch bridge fees from the price server...`
  String get PRICE_SERVER_WAITING_TOOLTIP {
    return Intl.message(
      'Trying to fetch bridge fees from the price server...',
      name: 'PRICE_SERVER_WAITING_TOOLTIP',
      desc: '',
      args: [],
    );
  }

  /// `Checking network activity every 10 seconds\nCurrent status: `
  String get PRICE_SERVER_TOOLTIP {
    return Intl.message(
      'Checking network activity every 10 seconds\nCurrent status: ',
      name: 'PRICE_SERVER_TOOLTIP',
      desc: '',
      args: [],
    );
  }

  /// `Price Server is online.`
  String get PRICE_SERVER_STATUS_ONLINE {
    return Intl.message(
      'Price Server is online.',
      name: 'PRICE_SERVER_STATUS_ONLINE',
      desc: '',
      args: [],
    );
  }

  /// `Price Server is offline!\nBridge fee information cannot be fetched from the server.`
  String get PRICE_SERVER_STATUS_OFFLINE {
    return Intl.message(
      'Price Server is offline!\nBridge fee information cannot be fetched from the server.',
      name: 'PRICE_SERVER_STATUS_OFFLINE',
      desc: '',
      args: [],
    );
  }

  /// `Waiting response from Chain RPC service..`
  String get CHAIN_RPC_URL_WAITING_RESPONSE {
    return Intl.message(
      'Waiting response from Chain RPC service..',
      name: 'CHAIN_RPC_URL_WAITING_RESPONSE',
      desc: '',
      args: [],
    );
  }

  /// `Chain client is offline.`
  String get CHAIN_RPC_URL_OFFLINE {
    return Intl.message(
      'Chain client is offline.',
      name: 'CHAIN_RPC_URL_OFFLINE',
      desc: '',
      args: [],
    );
  }

  /// `Chain client is not active.`
  String get CHAIN_RPC_URL_INACTIVE {
    return Intl.message(
      'Chain client is not active.',
      name: 'CHAIN_RPC_URL_INACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `Network success!`
  String get CHAIN_RPC_URL_SUCCESS {
    return Intl.message(
      'Network success!',
      name: 'CHAIN_RPC_URL_SUCCESS',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient funds`
  String get SWAP_INSUFFICIENT_FUNDS_TITLE {
    return Intl.message(
      'Insufficient funds',
      name: 'SWAP_INSUFFICIENT_FUNDS_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `You do not have enough funds to make the swap.`
  String get SWAP_INSUFFICIENT_FUNDS_DESC {
    return Intl.message(
      'You do not have enough funds to make the swap.',
      name: 'SWAP_INSUFFICIENT_FUNDS_DESC',
      desc: '',
      args: [],
    );
  }

  /// `Swap not created`
  String get SWAP_CREATE_ERROR_TITLE {
    return Intl.message(
      'Swap not created',
      name: 'SWAP_CREATE_ERROR_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Could not create swap transaction.\nError: {error}`
  String SWAP_CREATE_ERROR_DESC(Object error) {
    return Intl.message(
      'Could not create swap transaction.\nError: $error',
      name: 'SWAP_CREATE_ERROR_DESC',
      desc: '',
      args: [error],
    );
  }

  /// `Swap succeeded`
  String get SWAP_SUCCESS_TITLE {
    return Intl.message(
      'Swap succeeded',
      name: 'SWAP_SUCCESS_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `ETH were successfully transferred to WETH.\nCheck Etherscan for more information.`
  String get SWAP_SUCCESS_DESC {
    return Intl.message(
      'ETH were successfully transferred to WETH.\nCheck Etherscan for more information.',
      name: 'SWAP_SUCCESS_DESC',
      desc: '',
      args: [],
    );
  }

  /// `Swap failed`
  String get SWAP_FAIL_TITLE {
    return Intl.message(
      'Swap failed',
      name: 'SWAP_FAIL_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `ETH could not be transferred to WETH.\nCheck Etherscan for more information.`
  String get SWAP_FAIL_DESC {
    return Intl.message(
      'ETH could not be transferred to WETH.\nCheck Etherscan for more information.',
      name: 'SWAP_FAIL_DESC',
      desc: '',
      args: [],
    );
  }

  /// `Swap status unknown`
  String get SWAP_STATUS_UNKNOWN_TITLE {
    return Intl.message(
      'Swap status unknown',
      name: 'SWAP_STATUS_UNKNOWN_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Swap success could not be determined.\nCheck Etherscan for more information.`
  String get SWAP_STATUS_UNKNOWN_DESC {
    return Intl.message(
      'Swap success could not be determined.\nCheck Etherscan for more information.',
      name: 'SWAP_STATUS_UNKNOWN_DESC',
      desc: '',
      args: [],
    );
  }

  /// `Swap status unknown`
  String get SWAP_STATUS_REQUEST_ERROR_TITLE {
    return Intl.message(
      'Swap status unknown',
      name: 'SWAP_STATUS_REQUEST_ERROR_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Checking the swap status threw an error, please check it on Etherscan.\nError: {error}`
  String SWAP_STATUS_REQUEST_ERROR_DESC(Object error) {
    return Intl.message(
      'Checking the swap status threw an error, please check it on Etherscan.\nError: $error',
      name: 'SWAP_STATUS_REQUEST_ERROR_DESC',
      desc: '',
      args: [error],
    );
  }

  /// `Open in {smth}`
  String OPEN_IN(Object smth) {
    return Intl.message(
      'Open in $smth',
      name: 'OPEN_IN',
      desc: '',
      args: [smth],
    );
  }

  /// `Add {token}`
  String IMPORT_TOKEN_INTO_METAMASK(Object token) {
    return Intl.message(
      'Add $token',
      name: 'IMPORT_TOKEN_INTO_METAMASK',
      desc: '',
      args: [token],
    );
  }

  /// `Cosmos tokens are not automatically detected by Metamask and need to be imported`
  String get IMPORT_TOKEN_INTO_METAMASK_TOOLTIP {
    return Intl.message(
      'Cosmos tokens are not automatically detected by Metamask and need to be imported',
      name: 'IMPORT_TOKEN_INTO_METAMASK_TOOLTIP',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get COMING_SOON {
    return Intl.message(
      'Coming soon',
      name: 'COMING_SOON',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get PREFERENCES {
    return Intl.message(
      'Preferences',
      name: 'PREFERENCES',
      desc: '',
      args: [],
    );
  }

  /// `Base currency`
  String get BASE_CURRENCY {
    return Intl.message(
      'Base currency',
      name: 'BASE_CURRENCY',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get BASE_CURRENCY_USD {
    return Intl.message(
      'USD',
      name: 'BASE_CURRENCY_USD',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get LANGUAGE {
    return Intl.message(
      'Language',
      name: 'LANGUAGE',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get LANGUAGE_ENGLISH {
    return Intl.message(
      'English',
      name: 'LANGUAGE_ENGLISH',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get THEME {
    return Intl.message(
      'Theme',
      name: 'THEME',
      desc: '',
      args: [],
    );
  }

  /// `Networks`
  String get NETWORKS {
    return Intl.message(
      'Networks',
      name: 'NETWORKS',
      desc: '',
      args: [],
    );
  }

  /// `Ethereum Mainnet`
  String get NETWORKS_ETHEREUM_MAINNET {
    return Intl.message(
      'Ethereum Mainnet',
      name: 'NETWORKS_ETHEREUM_MAINNET',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get NOTIFICATIONS {
    return Intl.message(
      'Notifications',
      name: 'NOTIFICATIONS',
      desc: '',
      args: [],
    );
  }

  /// `Desktop`
  String get DESKTOP {
    return Intl.message(
      'Desktop',
      name: 'DESKTOP',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get EMAIL {
    return Intl.message(
      'Email',
      name: 'EMAIL',
      desc: '',
      args: [],
    );
  }

  /// `Push`
  String get PUSH {
    return Intl.message(
      'Push',
      name: 'PUSH',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm it in the {extension} popup...`
  String PLEASE_CONFIRM_IN_THE_POPUP(Object extension) {
    return Intl.message(
      'Please confirm it in the $extension popup...',
      name: 'PLEASE_CONFIRM_IN_THE_POPUP',
      desc: '',
      args: [extension],
    );
  }

  /// `Please confirm it on the ledger display...`
  String get PLEASE_CONFIRM_IN_THE_LEDGER {
    return Intl.message(
      'Please confirm it on the ledger display...',
      name: 'PLEASE_CONFIRM_IN_THE_LEDGER',
      desc: '',
      args: [],
    );
  }

  /// `Oh no...`
  String get GRAVITY_VOLUME_WIDGET_ERROR_TITLE {
    return Intl.message(
      'Oh no...',
      name: 'GRAVITY_VOLUME_WIDGET_ERROR_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `We can't fetch the data at the moment -\rplease try again later.`
  String get GRAVITY_VOLUME_WIDGET_ERROR_DESC {
    return Intl.message(
      'We can\'t fetch the data at the moment -\rplease try again later.',
      name: 'GRAVITY_VOLUME_WIDGET_ERROR_DESC',
      desc: '',
      args: [],
    );
  }

  /// `Ledger does not support the {chain} chain (incompatible bip44 numbers).`
  String CHAIN_NOT_SUPPORTED_BY_LEDGER(Object chain) {
    return Intl.message(
      'Ledger does not support the $chain chain (incompatible bip44 numbers).',
      name: 'CHAIN_NOT_SUPPORTED_BY_LEDGER',
      desc: '',
      args: [chain],
    );
  }

  /// `Some tokens in an Evmos account may not be listed because of technical limitations. If you do not see all your tokens, please check `
  String get EVMOS_TOKEN_HINT {
    return Intl.message(
      'Some tokens in an Evmos account may not be listed because of technical limitations. If you do not see all your tokens, please check ',
      name: 'EVMOS_TOKEN_HINT',
      desc: '',
      args: [],
    );
  }

  /// `(20 January 2023) Transfers from Canto accounts (generated by Keplr) are disabled. For more info check the 'What's new' page.`
  String get VALIDATOR_MESSAGE_TRANSFERS_FROM_CANTO {
    return Intl.message(
      '(20 January 2023) Transfers from Canto accounts (generated by Keplr) are disabled. For more info check the \'What\'s new\' page.',
      name: 'VALIDATOR_MESSAGE_TRANSFERS_FROM_CANTO',
      desc: '',
      args: [],
    );
  }

  /// `(20 January 2023) Transfers to Canto are only possible by inputing the address manually. For more info check the 'What's new' page.`
  String get VALIDATOR_MESSAGE_TRANSFERS_TO_CANTO {
    return Intl.message(
      '(20 January 2023) Transfers to Canto are only possible by inputing the address manually. For more info check the \'What\'s new\' page.',
      name: 'VALIDATOR_MESSAGE_TRANSFERS_TO_CANTO',
      desc: '',
      args: [],
    );
  }

  /// `({dateString}) {chainName} updated its fees. Please remove it from Keplr, and re-connect to it, to ensure transfers are always successful.`
  String FEE_UPDATE_ALERT(Object dateString, Object chainName) {
    return Intl.message(
      '($dateString) $chainName updated its fees. Please remove it from Keplr, and re-connect to it, to ensure transfers are always successful.',
      name: 'FEE_UPDATE_ALERT',
      desc: '',
      args: [dateString, chainName],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
