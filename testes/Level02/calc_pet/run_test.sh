#!/bin/bash
BIN_PATH=$1

"$BIN_PATH" "123" "*" "456"
"$BIN_PATH" "9828" "/" "234"
"$BIN_PATH" "1" "+" "-43"
"$BIN_PATH" "-5" "%" "3"
"$BIN_PATH" "89" "-" "19"
# --- CASOS HOSTIS ---
"$BIN_PATH" "apenas" "um"
"$BIN_PATH"
