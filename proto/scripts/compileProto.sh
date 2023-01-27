#!/bin/bash
set -o errexit -o nounset -o pipefail
command -v shellcheck >/dev/null && shellcheck "$0"

ROOT_PROTO_DIR="./proto"
GRAVITY_BRIDGE_DIR="$ROOT_PROTO_DIR/base/gravity/v1"
COSMOS_DIR="$ROOT_PROTO_DIR/base/cosmos"
THIRD_PARTY_PROTO_DIR="$ROOT_PROTO_DIR/third_party"
IBC_DIR="$ROOT_PROTO_DIR/base/ibc"
OUT_DIR="./lib/generated/proto"

mkdir -p "$OUT_DIR"

protoc \
  --dart_out="grpc:$OUT_DIR" \
  --proto_path="$ROOT_PROTO_DIR/base" \
  --proto_path="$THIRD_PARTY_PROTO_DIR" \
  "$GRAVITY_BRIDGE_DIR/msgs.proto" \
  "$GRAVITY_BRIDGE_DIR/types.proto" \
  "$GRAVITY_BRIDGE_DIR/query.proto" \
  "$GRAVITY_BRIDGE_DIR/genesis.proto" \
  "$GRAVITY_BRIDGE_DIR/pool.proto" \
  "$GRAVITY_BRIDGE_DIR/batch.proto" \
  "$GRAVITY_BRIDGE_DIR/attestation.proto" \
  "$COSMOS_DIR/base/v1beta1/coin.proto" \
  "$COSMOS_DIR/base/abci/v1beta1/abci.proto" \
  "$COSMOS_DIR/tx/v1beta1/tx.proto" \
  "$COSMOS_DIR/tx/v1beta1/service.proto" \
  "$COSMOS_DIR/crypto/multisig/v1beta1/multisig.proto" \
  "$COSMOS_DIR/tx/signing/v1beta1/signing.proto" \
  "$COSMOS_DIR/crypto/secp256k1/keys.proto" \
  "$COSMOS_DIR/bank/v1beta1/query.proto" \
  "$COSMOS_DIR/bank/v1beta1/bank.proto" \
  "$COSMOS_DIR/base/query/v1beta1/pagination.proto" \
  "$COSMOS_DIR/upgrade/v1beta1/upgrade.proto" \
  "$THIRD_PARTY_PROTO_DIR/gogoproto/gogo.proto" \
  "$THIRD_PARTY_PROTO_DIR/google/api/annotations.proto" \
  "$THIRD_PARTY_PROTO_DIR/google/api/http.proto" \
  "$THIRD_PARTY_PROTO_DIR/google/protobuf/any.proto"  \
  "$THIRD_PARTY_PROTO_DIR/google/protobuf/timestamp.proto"  \
  "$THIRD_PARTY_PROTO_DIR/google/protobuf/duration.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/abci/types.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/types/types.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/crypto/proof.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/types/params.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/crypto/keys.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/version/types.proto"  \
  "$THIRD_PARTY_PROTO_DIR/tendermint/libs/bits/types.proto"  \
  "$IBC_DIR/applications/transfer/v1/query.proto" \
  "$IBC_DIR/applications/transfer/v1/transfer.proto" \
  "$IBC_DIR/applications/transfer/v1/tx.proto" \
  "$IBC_DIR/core/client/v1/client.proto" \
  "$IBC_DIR/core/client/v1/query.proto" \

# Remove unnecessary codec files
rm -rf \
  src/codec/cosmos_proto/ \
  src/codec/gogoproto/ \
  src/codec/google/api/ \
  src/codec/google/protobuf/descriptor.ts
