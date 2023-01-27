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

// To parse this JSON data, do
//
//     final account = accountFromMap(jsonString);
import 'dart:convert';

AccountResp accountFromMap(String str) => AccountResp.fromMap(json.decode(str));

String accountToMap(AccountResp data) => json.encode(data.toMap());

/// This is a representation of the object that gets returned from cosmos-sdk chains when querying chain accounts
class AccountResp {
  AccountResp({
    required this.account,
  });

  Account account;

  factory AccountResp.fromMap(Map<String, dynamic> json) => AccountResp(
        account: Account.fromMap(json["account"]),
      );

  Map<String, dynamic> toMap() => {
        "account": account.toMap(),
      };
}

/// Completely describes a cosmos-sdk account
class Account {
  Account({
    required this.type,
    required this.address,
    required this.pubKey,
    required this.accountNumber,
    required this.sequence,
  });

  String type;
  String address;
  dynamic pubKey;
  String accountNumber;
  String sequence;

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        type: json["@type"],
        address: json["address"],
        pubKey: json["pub_key"],
        accountNumber: json["account_number"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toMap() => {
        "@type": type,
        "address": address,
        "pub_key": pubKey,
        "account_number": accountNumber,
        "sequence": sequence,
      };
}

// To parse this JSON data, do
//
//     final evmosAccount = evmosAccountFromJson(jsonString);

EvmosAccountResp evmosAccountFromJson(String str) =>
    EvmosAccountResp.fromJson(json.decode(str));

String evmosAccountToJson(EvmosAccountResp data) => json.encode(data.toJson());

/// This is a representation of the object that gets returned from evmos when querying chain accounts.
/// It's different from other cosmos-sdk chains.
class EvmosAccountResp {
  EvmosAccountResp({
    required this.account,
  });

  final EvmosAccount account;

  factory EvmosAccountResp.fromJson(Map<String, dynamic> json) =>
      EvmosAccountResp(
        account: EvmosAccount.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account.toJson(),
      };
}

/// Completely describes an evmos account
class EvmosAccount {
  EvmosAccount({
    required this.type,
    required this.baseAccount,
    required this.codeHash,
  });

  final String type;
  final BaseAccount baseAccount;
  final String codeHash;

  factory EvmosAccount.fromJson(Map<String, dynamic> json) => EvmosAccount(
        type: json["@type"],
        baseAccount: BaseAccount.fromJson(json["base_account"]),
        codeHash: json["code_hash"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "base_account": baseAccount.toJson(),
        "code_hash": codeHash,
      };
}

/// Basic account information of an evmos account
class BaseAccount {
  BaseAccount({
    required this.address,
    required this.pubKey,
    required this.accountNumber,
    required this.sequence,
  });

  final String address;
  final dynamic pubKey;
  final String accountNumber;
  final String sequence;

  factory BaseAccount.fromJson(Map<String, dynamic> json) => BaseAccount(
        address: json["address"],
        pubKey: json["pub_key"],
        accountNumber: json["account_number"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "pub_key": pubKey,
        "account_number": accountNumber,
        "sequence": sequence,
      };
}

// To parse this JSON data, do
//
//     final vestingAccountResp = vestingAccountRespFromJson(jsonString);
VestingAccountResp vestingAccountRespFromJson(String str) =>
    VestingAccountResp.fromJson(json.decode(str));

String vestingAccountRespToJson(VestingAccountResp data) =>
    json.encode(data.toJson());

class VestingAccountResp {
  VestingAccountResp({
    required this.account,
  });

  final VestingAccount account;

  factory VestingAccountResp.fromJson(Map<String, dynamic> json) =>
      VestingAccountResp(
        account: VestingAccount.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account.toJson(),
      };
}

class VestingAccount {
  VestingAccount({
    required this.type,
    required this.baseVestingAccount,
    required this.startTime,
  });

  final String type;
  final BaseVestingAccount baseVestingAccount;
  final String startTime;

  factory VestingAccount.fromJson(Map<String, dynamic> json) => VestingAccount(
        type: json["@type"],
        baseVestingAccount:
            BaseVestingAccount.fromJson(json["base_vesting_account"]),
        startTime: json["start_time"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "base_vesting_account": baseVestingAccount.toJson(),
        "start_time": startTime,
      };
}

class BaseVestingAccount {
  BaseVestingAccount({
    required this.baseAccount,
    required this.originalVesting,
    required this.delegatedFree,
    required this.delegatedVesting,
    required this.endTime,
  });

  final BaseAccount baseAccount;
  final List<OriginalVesting> originalVesting;
  final List<dynamic> delegatedFree;
  final List<dynamic> delegatedVesting;
  final String endTime;

  factory BaseVestingAccount.fromJson(Map<String, dynamic> json) =>
      BaseVestingAccount(
        baseAccount: BaseAccount.fromJson(json["base_account"]),
        originalVesting: List<OriginalVesting>.from(
            json["original_vesting"].map((x) => OriginalVesting.fromJson(x))),
        delegatedFree: List<dynamic>.from(json["delegated_free"].map((x) => x)),
        delegatedVesting:
            List<dynamic>.from(json["delegated_vesting"].map((x) => x)),
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "base_account": baseAccount.toJson(),
        "original_vesting":
            List<dynamic>.from(originalVesting.map((x) => x.toJson())),
        "delegated_free": List<dynamic>.from(delegatedFree.map((x) => x)),
        "delegated_vesting": List<dynamic>.from(delegatedVesting.map((x) => x)),
        "end_time": endTime,
      };
}

class OriginalVesting {
  OriginalVesting({
    required this.denom,
    required this.amount,
  });

  final String denom;
  final String amount;

  factory OriginalVesting.fromJson(Map<String, dynamic> json) =>
      OriginalVesting(
        denom: json["denom"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "denom": denom,
        "amount": amount,
      };
}

// To parse this JSON data, do
//
//     final minimalAccountResp = minimalAccountRespFromJson(jsonString);
MinimalAccountResp minimalAccountRespFromJson(String str) =>
    MinimalAccountResp.fromJson(json.decode(str));

String minimalAccountRespToJson(MinimalAccountResp data) =>
    json.encode(data.toJson());

class MinimalAccountResp {
  MinimalAccountResp({
    required this.account,
  });

  final MinimalAccount account;

  factory MinimalAccountResp.fromJson(Map<String, dynamic> json) =>
      MinimalAccountResp(
        account: MinimalAccount.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account.toJson(),
      };
}

class MinimalAccount {
  MinimalAccount({
    required this.type,
  });

  final String type;

  factory MinimalAccount.fromJson(Map<String, dynamic> json) => MinimalAccount(
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
      };
}
