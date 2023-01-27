# Running Unit-Tests

Executing flutter tests in the IDE throws in our case an error, because in our logic we often import and depend on 'dart:js', even for our simple data structures.
For example ChainInfo in keplr.dart -> import 'package:js/js.dart' -> import 'dart:js'.

If we want to test a function which works with the ChainInfo class, this test will import 'dart:js' and will fail because tests do not have a platform and therefore 'dart:js' cannot be found.
For now the simplest way to run tests is to do it using the CLI and specifying the platform
```bash
flutter test -r expanded --platform chrome
```

# Testing the Gravity-Bridge-Portal

Follow all the below steps to start testing the portal.

## Add Gravity Ethereum to Metamask

There is a private ethereum chain just for the Gravity Bridge.
Add it to Metamask as follows:

- Open Metamask
- Click on the network selection button
- Select 'add network' at the bottom
- fill in these details
  - Network Name: Gravity Ethereum
  - New RPC URL: http://116.203.110.207:8545
  - Chain ID : 0xf

## Add Account to Metamask

Next we need to add a the Miner account of the ethereum network.

- Open Metamask
- Click on the account button to the top right
- Select 'Import Account' and fill out the following data
  - Select Type: Private Key
  - Private Key: 0xb1bab011e03a9862664706fc3bbaa1b16651528e5f0e7fbfcbfdd8be302a13e7

## Add Custom Assets to the Account

At last we need to add the custom erc20 tokens of the chain. There are three different tokens:

- 0x0412C7c846bb6b7DC462CF6B453f76D8440b2609 (MAX)
- 0x30dA8589BFa1E509A319489E014d384b87815D89 (E2H)
- 0x9676519d99E390A180Ab1445d5d857E3f6869065 (BYE)

For each of these token addresses follow the next steps:

- Open Metamask
- Beneath you balance select the 'Assets' tab
- At the bottom of the Assets tab click on 'Import Tokens'
- Paste the token address, all other fields should be filled out automatically (make sure you switched to the Gravity Ethereum network)
- Click 'Add Custom Token'
- Click 'Import Tokens'

## Run 'gravity private testnet' launch config

Run the 'gravity private testnet' launch config. This will load in the correct configurtions for keplr and metamsk.
The tokens provided by the ui will not work, you need to choose one of the custom erc20 tokens listed above.
