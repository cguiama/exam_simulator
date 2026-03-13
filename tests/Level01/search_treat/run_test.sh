#!/bin/bash
BIN_PATH=$1

# Caso 1: Substituição normal
"$BIN_PATH" "gato come racao" "a" "o"

# Caso 2: Substituição única
"$BIN_PATH" "cao" "a" "u"

# Caso 3: O terceiro argumento (ou o segundo) tem mais de um caractere -> não faz nada, só exibe a original
"$BIN_PATH" "cao" "a" "uu"

# Caso 4: Erro de argumentos -> \n
"$BIN_PATH"
