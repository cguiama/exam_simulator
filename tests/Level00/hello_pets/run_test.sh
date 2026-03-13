#!/bin/bash

BIN_PATH=$1

# Caso 1: Execução padrão (espelhando o exemplo do subject)
"$BIN_PATH"

# Caso 2: Edge case - Execução com argumento fantasma (deve ser ignorado)
"$BIN_PATH" "argumento_fantasma"
