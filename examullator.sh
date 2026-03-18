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
        NO_ARGS="find_dog countdown_pet count_veggies hello_pets maff_cat maff_revcat only_zucchini"
        WITH_ARGS="first_veggie last_veggie"
        AVAILABLE_NO_ARGS=$(for ex in $NO_ARGS; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_WITH_ARGS=$(for ex in $WITH_ARGS; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        PART_1=$(sort_by_history "$AVAILABLE_NO_ARGS" 3)
        PART_2=$(sort_by_history "$AVAILABLE_WITH_ARGS" 2)
        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    elif [ "$LEVEL" == "01" ]; then
        BASE="first_seed bark_meow print_veg strcpy_pet strlen_pet swap_veg repeat_bark"
        ADVANCED="rev_veg rot_13_veg rotone_pet strcmp_pet search_treat ulstr_pet"
        AVAILABLE_BASE=$(for ex in $BASE; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_ADV=$(for ex in $ADVANCED; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        PART_1=$(sort_by_history "$AVAILABLE_BASE" 3)
        PART_2=$(sort_by_history "$AVAILABLE_ADV" 2)
        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    elif [ "$LEVEL" == "02" ]; then
        BASE="mirror_mon atoi_dbz calc_force strcmp_sith strdup_clone strrev_jedi inter_dex"
        ADVANCED="last_jedi max_power is_power_of_ssj print_scouter rev_scouter swap_scouter union_fusion digi_match"
        AVAILABLE_BASE=$(for ex in $BASE; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_ADV=$(for ex in $ADVANCED; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        PART_1=$(sort_by_history "$AVAILABLE_BASE" 3)
        PART_2=$(sort_by_history "$AVAILABLE_ADV" 2)
        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    elif [ "$LEVEL" == "03" ]; then
        BASE="senzu_sum jedi_clean kamehameha_expand scouter_base pokedex_size digi_range sith_rrange"
        ADVANCED="hidden_mew fusion_lcm clone_count jedi_pgcd hex_saber tail_whip_cap force_cap kaio_ken_mult"
        AVAILABLE_BASE=$(for ex in $BASE; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_ADV=$(for ex in $ADVANCED; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        PART_1=$(sort_by_history "$AVAILABLE_BASE" 3)
        PART_2=$(sort_by_history "$AVAILABLE_ADV" 2)
        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    elif [ "$LEVEL" == "04" ]; then
        BASE="jedi_mind_trick sith_checkmate water_gun_fill saiyan_prime pokedex_itoa scouter_itoa_base"
        ADVANCED="force_foreach order66_remove destructo_split yoda_rev_wstr force_push_rotate radar_sort archive_sort_list"
        AVAILABLE_BASE=$(for ex in $BASE; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_ADV=$(for ex in $ADVANCED; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        PART_1=$(sort_by_history "$AVAILABLE_BASE" 3)
        PART_2=$(sort_by_history "$AVAILABLE_ADV" 2)
        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')

    elif [ "$LEVEL" == "05" ]; then
        BASE="biggest_shenron capsule_brackets time_loop_sith"
        ADVANCED="pokedex_flags digicore_dump jedi_rpn"
        AVAILABLE_BASE=$(for ex in $BASE; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        AVAILABLE_ADV=$(for ex in $ADVANCED; do [ -d "$LEVEL_DIR/$ex" ] && echo "$LEVEL_DIR/$ex"; done)
        PART_1=$(sort_by_history "$AVAILABLE_BASE" 3)
        PART_2=$(sort_by_history "$AVAILABLE_ADV" 2)
        EXERCISES=$(echo -e "$PART_1\n$PART_2" | grep -v '^$')
    fi

    CURRENT_Q=1
    TOTAL_Q=$(echo "$EXERCISES" | wc -w)

    for EX_PATH in $EXERCISES; do
        EX_NAME=$(basename "$EX_PATH")
        PASSED=false

        # Reseta as flags do Mock Git a cada nova questão
        MOCK_ADDED=false
        MOCK_COMMITTED=false
        MOCK_PUSHED=false

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

            echo -ne ">>> Digite os comandos do git ou '${YELLOW}grademe${NC}' para avaliar ('${YELLOW}finish${NC}' para sair): "
            read RAW_CMD

            # Pega a primeira palavra para checar o comando base
            CMD=$(echo "$RAW_CMD" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')

            if [ "$CMD" == "finish" ]; then
                echo "Encerrando a sessão do examullator."
                exit 0

            # --- MÁQUINA DE ESTADO DO GIT SIMULADO ---
            elif [ "$CMD" == "git" ]; then
                SUB_CMD=$(echo "$RAW_CMD" | awk '{print $2}' | tr '[:upper:]' '[:lower:]')

                if [ "$SUB_CMD" == "add" ]; then
                    MOCK_ADDED=true
                    echo -e "${GREEN}[Mock Vogsphere] Arquivos rastreados (staging area).${NC}"
                    sleep 1
                elif [ "$SUB_CMD" == "commit" ]; then
                    if [ "$MOCK_ADDED" = true ]; then
                        MOCK_COMMITTED=true
                        MOCK_ADDED=false # Limpa o stage após o commit
                        echo -e "${GREEN}[Mock Vogsphere] Commit salvo localmente.${NC}"
                    else
                        echo -e "${RED}[Mock Vogsphere] Nada para commitar. Faltou o 'git add'.${NC}"
                    fi
                    sleep 1
                elif [ "$SUB_CMD" == "push" ]; then
                    if [ "$MOCK_COMMITTED" = true ]; then
                        MOCK_PUSHED=true
                        MOCK_COMMITTED=false # Limpa os commits pendentes
                        echo -e "${GREEN}[Mock Vogsphere] Push concluído! Código no servidor da prova.${NC}"
                    else
                        echo -e "${RED}[Mock Vogsphere] Tudo atualizado. Não há novos commits locais.${NC}"
                    fi
                    sleep 1
                else
                    echo -e "[!] Comando git não suportado no mock. Use add, commit ou push."
                    sleep 1
                fi

            # --- AVALIADOR ---
            elif [ "$CMD" == "grademe" ]; then

                # Bloqueio caso tente avaliar sem enviar para a Vogsphere
                if [ "$MOCK_PUSHED" = false ]; then
                    echo -e "\n${RED}[ERRO FATAL] A pasta no servidor está vazia ou desatualizada!${NC}"
                    echo -e "Antes de ser avaliado com grademe você precisa executar o fluxo de commits no simulador:"
                    echo -e "\n${RED}FAÇA O FLUXO DENTRO DO SIMULADOR E NÃO EM OUTRO TERMINAL${NC}"
					echo -e "1. git add ."
                    echo -e "2. git commit -m \"teste\""
                    echo -e "3. git push"
                    read -p ">>> Pressione [ENTER] para tentar de novo..."
                    continue
                fi

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
                    echo -e " ${GREEN}SUCESSO: Resposta exata. Lógica validada.${NC}"
                    echo -e "========================================="
                    read -p ">>> Pressione [ENTER] para avançar..."
                else
                    echo -e "\n>>> ${RED}Avaliação falhou.${NC}"

                    # Se falhar, reseta as flags para forçar você a fazer o push da correção
                    MOCK_ADDED=false
                    MOCK_COMMITTED=false
                    MOCK_PUSHED=false

                    read -p ">>> Pressione [ENTER] para corrigir seu código..."
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
