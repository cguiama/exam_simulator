#!/bin/bash

SUBJECTS_DIR="./sujeito"
RENDU_DIR="./ryu"
GRADER="./grader.sh"
TRACES_DIR="./trechos"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

mkdir -p "$RENDU_DIR"
mkdir -p "$TRACES_DIR"
touch .ryu_history # Garante que o arquivo de histórico exista

# Função de ordenação ponderada pelo histórico
sort_by_history() {
    local POOL="$1"
    local QTD="$2"

    # Se a pool estiver vazia, não faz nada
    if [ -z "$POOL" ]; then return; fi

    for ex in $POOL; do
        local ex_name=$(basename "$ex")
        # Busca a contagem no disco; se não existir, assume 0
        local count=$(grep "^$ex_name:" .ryu_history 2>/dev/null | cut -d':' -f2)
        echo "${count:-0} $RANDOM $ex"
    done | sort -n -k1,1 -k2,2 | head -n "$QTD" | awk '{print $3}'
}

for LEVEL in 00 01 02 03 04 05; do
    LEVEL_DIR="$SUBJECTS_DIR/Level$LEVEL"

    if [ ! -d "$LEVEL_DIR" ]; then
        continue
    fi

    if [ "$LEVEL" == "00" ]; then
        # Level 00: Fila Curada
        NO_ARGS="abc_pets count_veggies hello_pets jumpy_dog moonwalk_dog only_zucchini pet_countdown find_dog"
        WITH_ARGS="first_veggie last_veggie"

        AVAILABLE_NO_ARGS=$(for ex in $NO_ARGS; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_WITH_ARGS=$(for ex in $WITH_ARGS; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)

        PART_1=$(sort_by_history "$AVAILABLE_NO_ARGS" 3)
        PART_2=$(sort_by_history "$AVAILABLE_WITH_ARGS" 2)

        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    elif [ "$LEVEL" == "01" ]; then
        # Level 01: Fila Curada
        BASE="first_seed bark_meow print_veg strcpy_pet strlen_pet swap_veg repeat_bark rev_veg rotone_pet rot_13_veg search_treat ulstr_pet even_pet putnbr_pet"
        ADVANCED="last_seed title_pet count_seeds atoi_veg itoa_veg"

        AVAILABLE_BASE=$(for ex in $BASE; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_ADV=$(for ex in $ADVANCED; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)

        PART_1=$(sort_by_history "$AVAILABLE_BASE" 3)
        PART_2=$(sort_by_history "$AVAILABLE_ADV" 2)

        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    else
        # Para os próximos níveis (02, 03...), pega tudo e passa pelo filtro histórico
        ALL_AVAILABLE=$(find "$LEVEL_DIR" -mindepth 1 -maxdepth 1 -type d)
        EXERCISES=$(sort_by_history "$ALL_AVAILABLE" 5)
    fi

    CURRENT_Q=1
    TOTAL_Q=$(echo "$EXERCISES" | wc -w)

    for EX_PATH in $EXERCISES; do
        EX_NAME=$(basename "$EX_PATH")
        PASSED=false

        while [ "$PASSED" = false ]; do
            clear

            echo -e "========================================="
            echo -e " ${GREEN}INICIANDO LEVEL $LEVEL${NC}"
            echo -e "========================================="
            echo -e "\n---------------------------------------------------"
            echo -e "Desafio $CURRENT_Q de $TOTAL_Q: $EX_NAME"
            echo -e "---------------------------------------------------"

            if [ -f "$EX_PATH/sujeito.txt" ]; then
                cat "$EX_PATH/sujeito.txt"
            else
                echo "[!] Enunciado (sujeito.txt) não encontrado em $EX_PATH"
            fi

            echo -e "\n---------------------------------------------------"
            echo -e ">>> Crie seu arquivo C dentro de: ${RED}$RENDU_DIR/$EX_NAME/${NC}"

            echo -ne ">>> Digite '${YELLOW}testme${NC}' para avaliar ou '${YELLOW}finite${NC}' para sair: "
            read RAW_CMD

            CMD=$(echo "$RAW_CMD" | tr '[:upper:]' '[:lower:]')

            if [ "$CMD" == "finite" ]; then
                echo "Encerrando a sessão do examullator."
                exit 0
            elif [ "$CMD" == "testme" ]; then
                echo -e "\nIniciando avaliação..."

                $GRADER "$EX_NAME"

                if [ $? -eq 0 ]; then
                    PASSED=true
                    ((CURRENT_Q++))

                    # -----------------------------------------------------
                    # ATUALIZA A PERSISTÊNCIA NO DISCO
                    # -----------------------------------------------------
                    CURR_COUNT=$(grep "^$EX_NAME:" .ryu_history 2>/dev/null | cut -d':' -f2)
                    CURR_COUNT=${CURR_COUNT:-0}
                    grep -v "^$EX_NAME:" .ryu_history > .ryu_history.tmp 2>/dev/null
                    echo "$EX_NAME:$((CURR_COUNT + 1))" >> .ryu_history.tmp
                    mv .ryu_history.tmp .ryu_history
                    # -----------------------------------------------------

                    echo -e "\n========================================="
                    echo -e " ${GREEN}SUCESSO: Avançando para o próximo desafio.${NC}"
                    echo -e "========================================="
                    sleep 2
                else
                    echo -e "\n>>> ${RED}Avaliação falhou.${NC}"
                    read -p ">>> Pressione [ENTER] para tentar novamente..."
                fi
            else
                echo -e "\n[!] Comando não reconhecido."
                sleep 1
            fi
        done
    done
done

clear
echo "========================================="
echo "        PROVA FINALIZADA                 "
