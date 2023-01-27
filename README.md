# Gravity Bridge Portal by blockscape

A Flutter web UI for the cosmos gravity bridge. It uses Metamask to sign transfers from ethereum to cosmos and Keplr to sign transfers from cosmos to ethereum. This Flutter project can't be compiled to native apps, as the Chrome wallet extensions are required.

## Building and running

Currently, there are two possible enviroments (configuration) you can use:

```
flutter run web -t main.dart // this will run prod
flutter run web -t main_test_gravity_private.dart // this will run beta/testnet version
```

## Running the portal locally

Right now we need to use flutter 3.0.

To run this app use the command: flutter run --device-id chrome --web-renderer html

This will open the portal in a debug chrome browser. You have to copy the address from the debug browser and paste it into your standard chrome browser (for the extensions).
The portal requires the metamask and keplr extensions. Both extensions must be setup with at least one address.

--web-renderer html is required for the token icons to be displayed (other renderers will cause CORS issues).

### Hot reload

Hot reload works, but on each reload you have to switch to the debug browser window first, to trigger the reload. After that you can refresh the page in your default chrome browser.

## Keplr Signing

If you run into issues with the implementation of the keplr interaction you can always look at cosmjs, and how they handle proto signing. Cosmjs was basically the blueprint for this dart implementation. (https://github.com/cosmos/cosmjs)

## Protobuf

The Keplr extension expects protobuf input. To generate protobuf (if .proto files should chane in the future) you have to use the protoc(https://developers.google.com/protocol-buffers/docs/downloads) tool with the proto dart backend(https://github.com/google/protobuf.dart). Since the dart backend is written in dart, you need to have dart in your Path as well.
The script expects the packend to be installed via

```
$ pub global activate protoc_plugin
```

There are two scripts that help you compile the dart files:

- getGravityProto.sh: this downloads the gravity proto files that are required.
- compileProto.sh: this compiles the downloaded .proto files to dart and saves them to lib/services/gravity/proto (protoc and dart backend required).

## Splashscreen

We are using own logic to show the splash screen at start. Please see the index.html, styles.css where we reference on "splash".

## Useful Resources

### Cosmos RPC

https://docs.tendermint.com/master/rpc/#/Info/tx
https://docs.tendermint.com/master/tendermint-core/using-tendermint.html#formatting

## How to translate

To translate a label of message

## Run extensions in chrome developer mode

Copy next function in `.bash_profile` or `.zshrc` file in your user root:

```bash
function flutter_web_enable_extensions() {
  FLUTTER_SDK_DIR=$@;

  echo "Flutter SDK dir: $FLUTTER_SDK_DIR";

  sed -i '' "s/'--disable-extensions'/\/\/'--disable-extensions'/g" $FLUTTER_SDK_DIR/packages/flutter_tools/lib/src/web/chrome.dart
  rm $FLUTTER_SDK_DIR/bin/cache/flutter_tools.stamp
}
```

Source it (or reopen terminal), then execute: `flutter_web_enable_extensions /path/to/flutter/sdk`

## Adding Configurations

### Adding tokens that can be bridged

Add the token to the GravityTokens list in the keplr config. This will allow the token to be selected for transfer from gravity too ethereum. To get the ibc denom you need the gravity ibc channel and the denom of the token. Then you can execute a query with the gravity binary:

```
 gravity q ibc-transfer denom-hash "transfer/channel-{channel_No}/{denom}"

// e.g gravity q ibc-transfer denom-hash "transfer/channel-79/uscrt"
```

There must be a deployed and registered erc20 contract to do this.

### Adding a Forward chain

Add a Forward Chain configuration to the keplr configuration. Additionally you have to extend the Chain enum to include the new chain, as well es create a chain config and map it to the enum in chain_config.dart file. There is also a mapping from enum to asset. A proposal to enable this must have passed before.

### IBC Connection

To add a IBC connection extend the ibcChains in the keplr config. Channels can be found here: https://github.com/Gravity-Bridge/Gravity-Docs/blob/main/docs/list_of_IBC_channels.md

### Token Registry

If a token is expected to end up on Gravity, please add its info to the currency-registry in the keplr config, so it can be displayed correctly.
