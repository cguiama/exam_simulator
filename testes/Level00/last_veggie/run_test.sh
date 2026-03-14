#!/bin/bash
BIN_PATH=$1

# Caso 1: Múltiplos legumes
"$BIN_PATH" "carrot" "potato" "broccoli"

# Caso 2: Apenas um legume (string com espaço)
"$BIN_PATH" "sweet potato"

# Caso 3: Zero argumentos passados (deve printar apenas \n)
"$BIN_PATH"
