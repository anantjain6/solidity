#!/bin/sh

SCRIPT_DIR="$(realpath $(dirname $0))"
SOLJSON_JS="$1"
SOLJSON_WASM="$2"
OUTPUT="$3"

echo -n "\"use strict\";" > "${OUTPUT}"
echo -n "var wasmBase64 = \"" >> "${OUTPUT}"
base64 -w 0 "${SOLJSON_WASM}" >> "${OUTPUT}"
echo -n "\";" >> "${OUTPUT}"
cat "${SCRIPT_DIR}/base64.js" >> "${OUTPUT}"
echo -n "var Module = Module || {}; Module[\"wasmBinary\"] = base64DecToArr(wasmBase64);" >> "${OUTPUT}"
sed -e 's/"use strict";//' "${SOLJSON_JS}" >> "${OUTPUT}"
