#!/bin/bash
BIN_PATH=$1

# Caso 1: A string contém a letra 'd'
"$BIN_PATH" "cat, bird, dog"

# Caso 2: A string NÃO contém a letra 'd'
"$BIN_PATH" "cat, bird, fish"

# Caso 3: Zero argumentos passados (argc == 1)
"$BIN_PATH"

# Caso 4: Mais de um argumento passado (argc > 2)
"$BIN_PATH" "dog" "cat"
