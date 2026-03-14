#!/bin/bash
BIN_PATH=$1

# Caso 1: Vários legumes
"$BIN_PATH" "tomato" "onion" "garlic"

# Caso 2: Um único legume com espaços
"$BIN_PATH" "green bell pepper"

# Caso 3: Nenhum argumento (deve printar apenas \n)
"$BIN_PATH"
