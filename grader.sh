#!/bin/bash

RENDU_DIR="./ryu"
TESTS_DIR="./testes"
TRACES_DIR="./trechos"
CC="gcc"
CFLAGS="-Wall -Wextra -Werror"
TARGET_EX=$1

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "========================================="
echo "        INICIANDO AVALIADOR              "
echo "========================================="

if [ -z "$TARGET_EX" ]; then
    echo "[ERRO] Nenhum exercício especificado."
    exit 1
fi

EX_PATH="$RENDU_DIR/$TARGET_EX"
TEST_DIR_PATH=$(find "$TESTS_DIR" -type d -name "$TARGET_EX" | head -n 1)

if [ -z "$TEST_DIR_PATH" ]; then
    echo -e "\n[ERRO] Pasta de testes para $TARGET_EX não encontrada."
    exit 1
fi

EXPECTED_OUT="$TEST_DIR_PATH/expected.txt"
BIN_PATH="/tmp/${TARGET_EX}_bin"
USER_OUT="/tmp/${TARGET_EX}_out.txt"

if [ ! -d "$EX_PATH" ]; then
    echo -e "\n[FALHOU] Diretório não encontrado. Você criou a pasta $RENDU_DIR/$TARGET_EX ?"
    exit 1
fi

USER_FILES=$(find "$EX_PATH" -name "*.c")

if [ ! -f "$EXPECTED_OUT" ]; then
    echo -e "\n[ERRO] Arquivo expected.txt ausente na base de testes."
    exit 1
fi

if [ -z "$USER_FILES" ]; then
    echo -e "\n[FALHOU] Nenhum arquivo .c encontrado na sua pasta."
    exit 1
fi

# Linkagem Dinâmica ou Compilação Standalone
if [ -f "$TEST_DIR_PATH/main.c" ]; then
    $CC $CFLAGS $USER_FILES "$TEST_DIR_PATH/main.c" -o "$BIN_PATH" 2> /dev/null
    if [ $? -ne 0 ]; then
        echo -e "\n[FALHOU] Erro de compilação ou linkagem. Falhou na regra das flags."
        exit 1
    fi
    timeout 2 "$BIN_PATH" > "$USER_OUT"
    EXIT_CODE=$?
elif [ -f "$TEST_DIR_PATH/run_test.sh" ]; then
    $CC $CFLAGS $USER_FILES -o "$BIN_PATH" 2> /dev/null
    if [ $? -ne 0 ]; then
        echo -e "\n[FALHOU] Erro de compilação. Código não respeita as flags estritas."
        exit 1
    fi
    timeout 2 "$TEST_DIR_PATH/run_test.sh" "$BIN_PATH" > "$USER_OUT"
    EXIT_CODE=$?
else
    echo -e "\n[ERRO] Nenhuma estratégia de teste configurada."
    exit 1
fi

# Tratamento de Sinais
TRACE_FILE="$TRACES_DIR/${TARGET_EX}.trace"

if [ $EXIT_CODE -eq 124 ]; then
    echo -e "\n[FALHOU] Timeout. Seu código entrou em loop infinito."
    echo "CRITICAL FAULT: Timeout." > "$TRACE_FILE"
    echo "O programa excedeu o tempo limite de 2 segundos. Verifique as condições de avanço do seu loop (ex: esquecer de fazer i++ ou ptr++)." >> "$TRACE_FILE"
    echo -e "\n>>> Trace de erro salvo em: ${RED}$TRACE_FILE${NC}"
    rm -f "$BIN_PATH" "$USER_OUT"
    exit 1
elif [ $EXIT_CODE -gt 128 ]; then
    echo -e "\n[FALHOU] Erro de memória (Segfault ou Bus Error)."
    echo "CRITICAL FAULT: Memory Violation (Exit Code $EXIT_CODE)." > "$TRACE_FILE"
    echo "O processo foi morto pelo Kernel. Possíveis causas:" >> "$TRACE_FILE"
    echo "1. Tentativa de acessar um índice fora do array (ex: ler string após o \0)." >> "$TRACE_FILE"
    echo "2. Desreferenciar um ponteiro nulo (NULL pointer)." >> "$TRACE_FILE"
    echo "3. Escrever em memória Read-Only (seção .rodata)." >> "$TRACE_FILE"
    echo -e "\n>>> Trace de memória salvo em: ${RED}$TRACE_FILE${NC}"
    rm -f "$BIN_PATH" "$USER_OUT"
    exit 1
fi

# Análise de Diferenças
diff -q "$USER_OUT" "$EXPECTED_OUT" > /dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[PASSOU] Sucesso absoluto. Comportamento validado.${NC}"
    rm -f "$BIN_PATH" "$USER_OUT"
    exit 0
else
    echo -e "\n${RED}[FALHOU] A saída lógica do seu programa está incorreta.${NC}"

    TRACE_FILE="$TRACES_DIR/${TARGET_EX}.trace"
    diff -u "$EXPECTED_OUT" "$USER_OUT" > "$TRACE_FILE"

    echo -e ">>> Rastro da diferença gerado. O que tem '-' era o esperado, o que tem '+' foi o que você fez:\n"
    cat "$TRACE_FILE"
    echo -e "\n>>> Trace salvo em: ${RED}$TRACE_FILE${NC}"

    rm -f "$BIN_PATH" "$USER_OUT"
    exit 1
fi
