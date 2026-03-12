#!/bin/bash

SUBJECTS_DIR="./subject"
RENDU_DIR="./rendu"
GRADER="./grader.sh"
TRACES_DIR="./traces"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

mkdir -p "$RENDU_DIR"
mkdir -p "$TRACES_DIR"


for LEVEL in 00 01 02 03 04 05; do
    LEVEL_DIR="$SUBJECTS_DIR/Level$LEVEL"

    if [ ! -d "$LEVEL_DIR" ]; then
        continue
    fi

    # Sorteia os exercícios e armazena em array
    EXERCISES=$(find "$LEVEL_DIR" -mindepth 1 -maxdepth 1 -type d | shuf -n 5)
	# Inicia o ponteiro da questão atual
	CURRENT_Q=1
	# Conta dinamicamente a quantidade de diretórios que o find retornou
	TOTAL_Q=$(echo "$EXERCISES" | wc -w)

    for EX_PATH in $EXERCISES; do
        EX_NAME=$(basename "$EX_PATH")
        PASSED=false

        while [ "$PASSED" = false ]; do
            # Limpa o buffer do terminal a cada repetição do exercício
            clear

			echo -e "========================================="
			echo -e " ${GREEN}INICIANDO LEVEL $LEVEL${NC}"
			echo -e "========================================="
			echo -e "\n---------------------------------------------------"
			echo -e "Exercício $CURRENT_Q de $TOTAL_Q: $EX_NAME"
			echo -e "---------------------------------------------------"

            if [ -f "$EX_PATH/subject.txt" ]; then
                cat "$EX_PATH/subject.txt"
            else
                echo "[!] Enunciado (subject.txt) não encontrado em $EX_PATH"
            fi

            echo -e "\n---------------------------------------------------"
            echo -e ">>> Crie seu arquivo C dentro de: ${RED}$RENDU_DIR/$EX_NAME/${NC}"

            echo -ne ">>> Digite '${YELLOW}grademe${NC}' para avaliar ou '${YELLOW}finish${NC}' para sair: "
            read RAW_CMD

            # Conversão para letras minúsculas para aceitar 'Finish' ou 'Grademe'
            CMD=$(echo "$RAW_CMD" | tr '[:upper:]' '[:lower:]')

            if [ "$CMD" == "finish" ]; then
                echo "Encerrando a sessão do examshell."
                exit 0
            elif [ "$CMD" == "grademe" ]; then
                echo -e "\nIniciando correção..."

                $GRADER "$EX_NAME"

                if [ $? -eq 0 ]; then
                    PASSED=true
					((CURRENT_Q++)) # Incrementa o número da questão na RAM
                    echo -e "\n========================================="
    				echo -e " ${GREEN}SUCCESS: Avançando para o próximo desafio.${NC}"
                    echo -e "========================================="
                    # Pausa breve para o cadete ler a mensagem de sucesso antes do clear
                    sleep 2
                else
                    echo -e "\n>>> ${RED}Correção falhou.${NC}"
                    # Trava o I/O do terminal antes de limpar a tela novamente
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
