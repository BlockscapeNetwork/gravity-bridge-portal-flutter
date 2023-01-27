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

/// Stores static const like URLS etc.
class Constants {
  static const String blockscapeNetworkURL = "https://blockscape.network/";
  static const String blockscapeTwitterURL =
      "https://twitter.com/blockscapeLab";
  static const String blockscapeMediumURL =
      "https://blockscape-network.medium.com";
  static const String blockscapeGitHubURL =
      "https://github.com/BlockscapeNetwork";

  static const String discordURL = "https://discord.com/invite/d3DshmHpXA";

  static const String gravityBridgeHowTo =
      "https://blockscape-network.medium.com/a-beginners-guide-when-and-how-to-use-the-gravity-bridge-portal-97d5745025dd";

  static const String keplrChromeExtensionLink =
      "https://chrome.google.com/webstore/detail/keplr/dmkamcknogkgcdfhhbddcghachkejeap?hl=en";
  static const String metamaskChromeExtensionLink =
      "https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en";

  static const String coinGeckoLink = "https://www.coingecko.com/";
  static const String cliInstructions =
      "https://github.com/Gravity-Bridge/Gravity-Docs/blob/main/docs/cli-usage.md";

  static const String cliGravityBridgeToEthereum =
      "https://github.com/Gravity-Bridge/Gravity-Docs/blob/main/docs/cli-usage.md#sending-tokens-on-gravity-bridge-to-ethereum";

  static const String etherscanLink = "https://etherscan.io";
  static const String etherscanTxPath = "/tx/";
  static const String etherscanAccountPath = "/address/";
  static const String mintscanLink = "https://www.mintscan.io/";
  static const String mintscanTxPath = "/txs/";
  static const String mintscanAccountPath = "/account/";

  static const String gravityChainUrl = "https://info.gravitychain.io:9000";

  /// Maximally approvable sum of transferred amounts per ERC20-token.
  ///
  /// To send ERC20(ethereum)-Tokens through Metamask a total sum must be approved by the user.
  /// Once done, transfers can be done without approval until this sum is reached.
  /// Once reached it must be approved again.
  /// We use the maximally possible number for approval requests so that it needs to be done only once (and practically never repeated).
  static const String erc20MaxApprovableTransferTotal =
      "115792089237316195423570985008687907853269984665640564039457584007913129639935";

  /// WETH-Smart-Contract-Address in Ehereum Mainnet
  static const String wethContractAddress =
      "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2";

  static const Duration maxPriceCacheStaleness = Duration(minutes: 10);

  // average ethereum block time set hardcoded to 14
  // this value should be dynamic
  static const int averageEthereumBlockTime = 12;
}
