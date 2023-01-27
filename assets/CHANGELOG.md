### Version 1.1.33 - 27 January 2023

- Feature: Enabled NYM token for Grav-ETH transfers

### Version 1.1.32 - 26 January 2023

- Feature: Adopted Keplr's new data structure for alternative fees with different tokens
- Feature: Updated Terra-Classic's fees
- Feature: Updated Ki-chain's fees
- Feature: Updated config for Iris
- Feature: Disabled Bostrom and Sifchain because of expired IBC-clients
- Bugfix: Fixed explorer link generation for Terra-Classic transactions and accounts
- Bugfix: Improved balance requests for Regen

### Version 1.1.31 - 20 January 2023

- Bugfix: Disabled connecting to a Canto account through Keplr because of incorrect integration between the two. This lead to transfers from Canto being signed incorrectly and failing.
- Bugfix: Improved balance requests for Evmos and Iris.
- Feature: Small UI improvements.

### Version 1.1.30 - 17 January 2023

- Bugfix: "Recent batches" widget, "Transaction queue" widget, and "Batches" page throw UI error when the Metamask network is not "Ethereum Mainnet"
- Bugfix: Modified error message shown when the bridge fee dollar price can not be requested

### Version 1.1.29 - 13 January 2023

- Feature: CHEQD tokens are enabled for transfers to Ethereum
- Feature: Added hint about the special nature of Evmos tokens
- Feature: Disabled ledger connecting for chains that have incompatible bip44 numbers
- Feature: Added alerts about updated fees
- Bugfix: Transactions Gravity-to-Canto are unsuccesful
- Feature: Added alert, which notifies the user that the Canto-bugfix will lead to Keplr generating a new (and empty) Canto account
- Bugfix: Evmos balance requests throw error
- Bugfix: Correct number formatting of chain fees
- Bugfix: Small UI simplifications

### Version 1.1.28 - 30 December 2022

- Bugfix: Fix Luna Classic configurations to enable IBC transfers

### Version 1.1.27 - 15 December 2022

- Bugfix: Amounts in "Recent batches" widget and "Batches" page have sometimes a rounding error
- Bugfix: Widgets are grey when the gravity API returns an error
- Feature: Format numbers according to default browser language
- Feature: Added "Transaction rejected" dialog for Ledger
- Bugfix: Small UI fixes and simplifications in "Batches" page

### Version 1.1.26 - 09 December 2022

- Feature: Ledger support for Cosmos accounts
- Feature: Gravity chain transaction queue widget created
- Bugfix: Batches with tokens not from Uniswap show wrong amount formating and no token name
- Bugfix: Bridge fee selector appears blank after switching transfer route from GRAV-ETH to GRAV-CHI to GRAV-ETH
- Bugfix: Paddings fixed and scrollbars added

### Version 1.1.25 - 02 December 2022

- Feature: Updated gas prices for Chihuahua
- Feature: Added notice about the recent Chihuahua gas changes
- Bugfix: Show an error dialog if cancellation of a transaction fails
- Bugfix: Gravity supply info and volume info widgets toggle size fix
- Bugfix: Some small UI bugs fixed & small improvements

### Version 1.1.24 - 25 November 2022

- Feature: Animated progress icons
- Feature: Number formatting depending on the locale
- Bugfix: Token dialog overflows with very long token names
- Bugfix: Token dialog renders icons incorrectly for unknown tokens

### Version 1.1.23 - 18 November 2022

- Feature: Add FUND token
- Feature: Gravity supply info and volume info widgets created
- Feature: Redirect links added to recent batches and recent transactions widgets rows
- Bugfix: Rounding error when sending the maximally available tokens
- Bugfix: Mobile/desktop form factor edited and UI adjusted
- Bugfix: Popup menu re-ordered

### Version 1.1.22 - 14 November 2022

- Bugfix: Transaction fees for Gravity-ETH transactions disabled

### Version 1.1.21 - 11 November 2022

- Feature: Add transaction fee to Gravity-ETH transactions
- Feature: Show block progress for unfinished ETH-Cosmos transactions
- Feature: Show date and time outputs in local date-time format
- Feature: Transactions and batches pages include links to blockchain accounts
- Bugfix: Improved remaining time calculation in batches view
- Bugfix: When batches still loading, show shimmer effect for recent batches widget and batches page
- Bugfix: Transaction history page UI improvements

### Version 1.1.20 - 04 November 2022

- Feature: Bridge fee selector widget redesign for mobile and desktop views
- Bugfix: Amount text-field warning messages do not show in direction ETH-GRA
- Bugfix: Refresh remaining time of a batch
- Bugfix: Remaining batch time fix

### Version 1.1.19 - 28 October 2022

- Feature: Show batch started time as smalltext
- Feature: Adapted dialogs for slow and standard batch transfers
- Feature: Transfer and batch statistics panels created for mobile and desktop views
- Feature: Transaction history: show remaining time until batch completion
- Bugfix: Connection buttons appear connected despite login in Metamask/Keplr being interrupted
- Bugfix: Re-added token denominations in transaction history
- Bugfix: Fixed card switching inconsistent bug in mobile view of transfer page

### Version 1.1.18.1 - 24 October 2022

- Bugfix: Transaction history throws an error in a special case with old data

### Version 1.1.18 - 21 October 2022

- Feature: Batches monitoring for mobile and desktop view
- Feature: Transaction history redesign for mobile and desktop view
- Feature: Added button to import a Cosmos token into Metamask
- Bugfix: Cosmos-chains whose clients are inactive have been disabled
- Feature: Adapted price and time constraints for the standard batched transfer

### Version 1.1.17 - 10 October 2022

- Bugfix: Connect buttons not being clicked issue fixed
- Bugfix: Popup menu adjustment for desktop view

### Version 1.1.16 - 07 October 2022

- Redesign: Popup menu and entries
- Bugfix: Improved error dialog about wrong Metamask network

### Version 1.1.15.1 - 07 October 2022

- Bugfix: Going back to the home-page reloads it unnecessarily

### Version 1.1.15 - 06 October 2022

- Redesign: Colors update and widget adjustments
- Redesign: All images replaced with our new custom images. Splash screen and favicon image updated
- Redesign: Mobile view support
- Update: Beginner's Guide Medium article has been replaced with the updated version
- Feature: Wallet address is switched automatically when switching a chain
- Bugfix: Bridge fee is inconsistent after changing the selected token multiple times
- Bugfix: Transfer button is active despite errors under the amount text field
- Feature: Agoric bridging support

### Version 1.1.14 - 21 September 2022

- Bugfix: Transfer address validator warning message fix
- Bugfix: Update all notional RPC and REST addresses

### Version 1.1.13 - 16 September 2022

- Update: Bridge operations resume after successful Ethereum network update

### Version 1.1.12 - 13 September 2022

- Update: Bridge operations are paused due to The Ethereum Merge

### Version 1.1.11 - 12 September 2022

- Feature: Better dialogs when a transaction is rejected or fails
- Feature: Button to remove entry from the transaction history
- Bugfix: Auto deducting the fee to avoid bridge fees and warning text adjustments
- Bugfix: Dollar prices in the select token dialog are cached for 10 minutes
- Bugfix: Gas prices updated

### Version 1.1.10 - 08 September 2022

- Feature: Regen Network bridging support
- Bugfix: Dollar conversion works for all tokens
- Bugfix: Gravity fee warning message visibility depends on GRAV amount in the wallet
- Bugfix: Refresh available value after succesfully sending token
- Bugfix: Price server being offline prevents GRAV to Cosmos transactions

### Version 1.1.9 - 02 September 2022

- Feature: Monitor Network Status in the select network dialog
- Feature: Extended the Swap-UI

### Version 1.1.8 - 01 September 2022

- Bugfix: Use proto signing for evmos transactions, since amino is not supported (You can't use Ledger for evmos ibc transactions)
- Bugfix: Fix display issues with Axelar tokens
- Bugfix: fix issue with ibc transfers to chains with chain IDs not ending with a number
- Change: temporarily disable Nyx Network IBC connection because of connection problems

### Version 1.1.7 - 25 August 2022

- Feature: Price server activity monitoring
- Feature: Show bridge fee fetch error, depends on error type
- Feature: Overwrite fees on the gravity chain to allow for zero fees
- Bugfix: Select token dialog Keplr tokens search issue has been fixed

### Version 1.1.6 - 22 August 2022

- Feature: AssetMantle bridging support
- Bugfix: fix incoming ibc txs

### Version 1.1.5 - 19 August 2022

- Feature: Implemented Ledger support for Keplr
- Feature: Whitelisted custom tokens should always appear
- Feature: Swap Ether to WETH
- Bugfix: Update Canto config
- Bugfix: Transfering Tokens to EVMOS has been fixed

### Version 1.1.4 - 15 August 2022

- Bugfix: Transaction status logic improved
- Bugfix: Design improvements

### Version 1.1.3 - 03 August 2022

- Bugfix: Improved transaction status requests to better deal with errors from token explorers
- Bugfix: Mintscan button will be visible for all successful completed IBC transactions

### Version 1.1.2 - 27 July 2022

- Feature: Add separate button to request approval for ERC20 tokens
- Feature: Show mintscan link in the transaction progress dialog
- Feature: Small UI improvements. 'From' and 'To' cards order changed from left/right to top/bottom
- Feature: Imprint link removed from pop-up menu
- Bugfix: Page reacts correctly to account changes in the Metamask/Keplr extensions
- Bugfix: Fix available amount per token in the select token dialog

### Version 1.1.1 - 20 July 2022

- Feature: Add bech32 auto forwarding for the evmos chain
- Feature: Add bech32 auto forwarding for the AssetMantle chain
- Feature: Add IBC transactions between the AssetMantle chain and gravity chain
- Bugfix: Fix IBC transactions between the evmos chain and gravity chain
- Bugfix: Refresh available token amount after a transfer has been approved

### Version 1.1.0 - 15 July 2022

- Feature: Add ability to cancel preparing send-to-eth transactions
- Feature: Add bech32 auto forwarding for the Canto chain

### Version 1.0.7 - 8 July 2022

- Feature: Additionally showing balance of token in USD when selecting a token

### Version 1.0.6 - 28 June 2022

- Feature: Token dialog will use shimmer effect for loading data instead of circular progress indicator,
- Bugfix: Token dialog is more responsive when filtering,
- Bugfix: Reduced padding inside cards to fix the text-trimming issue,
- Feature: Transfer Success dialog now also shows direct link to transaction history page,
- Bugfix: Consistent error messages if one of two extensions aren't installed (Keplr or Metamask),
- Bugfix: State management issues when switching IBC/Eth/Forward Chain or direction,
- Feature: Select token dialog will now also show Amount for Ethereum-based tokens.
- Feature: Support for Secret token (bech32 forwarding, ibc) has been added.

### Version 1.0.5 - 23 June 2022

- Feature: ibc transactions are now available for pre-defined chains.

### Version 1.0.4 - 03 June 2022

- Feature: bech32 forwarding has been implemented with specific chains,
- Bugfix: Error handling for select token dialog.

### Version 1.0.3 - 27 May 2022

- Bugfix: We now register account changes in Keplr/metamask and update the UI accordingly.

### Version 1.0.2 - 25 May 2022

- Feature: Manual bech32 forwarding,
- Feature: What's new page,
- Bugfix: A-lot of them ;)

### Version 1.0.1 - 23 May 2022

- Bugfix: Fetching tokens dialog not getting data.

### Version 1.0.0 - 20 May 2022

- Initial, feature complete release.
