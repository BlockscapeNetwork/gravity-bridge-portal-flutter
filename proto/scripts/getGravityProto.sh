  
#!/bin/bash
set -o errexit -o nounset -o pipefail
command -v shellcheck >/dev/null && shellcheck "$0"

PROTO_DIR="./proto"
ALTHEA_DIR="$PROTO_DIR/althea-net"
COSMOS_GRAVITY_BRIDGE_DIR="$ALTHEA_DIR/Gravity-Bridge"
ZIP_FILE="$ALTHEA_DIR/tmp.zip"
GRAVITY_BRIDGE_REF=v1.4.1
SUFFIX=${GRAVITY_BRIDGE_REF}

GRAVITY_TARGET_DIR="./proto/base/gravity/v1"
COSMOS_TARGET_DIR="./proto/base/cosmos/"
COSMOS_PROTO_TARGET_DIR="./proto/base/cosmos_proto"
IBC_TARGET_DIR="./proto/base/ibc"
THIRD_PARTY_TARGET_DIR="./proto/third_party/"

[[ $SUFFIX =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-.+)?$ ]] && SUFFIX=${SUFFIX#v}

mkdir -p "$ALTHEA_DIR"

wget -qO "$ZIP_FILE" "https://github.com/Gravity-Bridge/Gravity-Bridge/archive/refs/tags/$GRAVITY_BRIDGE_REF.zip"
unzip "$ZIP_FILE" "*.proto" -d "$ALTHEA_DIR"

#clean up before organizing
rm -rf $GRAVITY_TARGET_DIR/*
rm -rf $COSMOS_TARGET_DIR/*
rm -rf $THIRD_PARTY_TARGET_DIR/*
rm -rf $IBC_TARGET_DIR/*

mv $COSMOS_GRAVITY_BRIDGE_DIR-$SUFFIX/module/proto/gravity/v1/* $GRAVITY_TARGET_DIR
#mv $COSMOS_GRAVITY_BRIDGE_DIR-$SUFFIX/module/third_party/proto/cosmos/* $COSMOS_TARGET_DIR
mv $COSMOS_GRAVITY_BRIDGE_DIR-$SUFFIX/module/third_party/proto/cosmos_proto/* $COSMOS_PROTO_TARGET_DIR
mv $COSMOS_GRAVITY_BRIDGE_DIR-$SUFFIX/module/third_party/proto/gogoproto $THIRD_PARTY_TARGET_DIR
mv $COSMOS_GRAVITY_BRIDGE_DIR-$SUFFIX/module/third_party/proto/google $THIRD_PARTY_TARGET_DIR
mv $COSMOS_GRAVITY_BRIDGE_DIR-$SUFFIX/module/third_party/proto/tendermint $THIRD_PARTY_TARGET_DIR

rm "$ZIP_FILE"

rm -rf ./proto/althea-net
mkdir -p "$ALTHEA_DIR"

wget -qO "$ZIP_FILE" "https://github.com/cosmos/cosmos-sdk/archive/refs/tags/v0.44.5.zip"
unzip "$ZIP_FILE" "*.proto" -d "$ALTHEA_DIR"
mv $ALTHEA_DIR/cosmos-sdk-0.44.5/proto/cosmos/* $COSMOS_TARGET_DIR
rm -rf $ALTHEA_DIR

mkdir $ALTHEA_DIR
wget -qO "$ZIP_FILE" "https://github.com/cosmos/ibc-go/archive/refs/tags/v3.0.0.zip"
unzip "$ZIP_FILE" "*.proto" -d "$ALTHEA_DIR"
mv $ALTHEA_DIR/ibc-go-3.0.0/proto/ibc/* $IBC_TARGET_DIR
rm -rf $ALTHEA_DIR

mkdir $ALTHEA_DIR
wget -qO "$ZIP_FILE" "https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.1.zip"
unzip "$ZIP_FILE" "*.proto" -d "$ALTHEA_DIR"
mv $ALTHEA_DIR/protobuf-21.1/src/google/protobuf/timestamp.proto $THIRD_PARTY_TARGET_DIR/google/protobuf/
mv $ALTHEA_DIR/protobuf-21.1/src/google/protobuf/duration.proto $THIRD_PARTY_TARGET_DIR/google/protobuf/
rm -rf $ALTHEA_DIR

