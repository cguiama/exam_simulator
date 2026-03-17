#!/bin/bash

SUJEITO_DIR="./sujeito/Level00"
TESTES_DIR="./testes/Level00"

EXERCISES="find_dog first_veggie last_veggie countdown_pet count_veggies hello_pets maff_cat maff_revcat only_zucchini"

# Limpa tudo e recria para evitar lixo de memória
rm -rf "$SUJEITO_DIR" "$TESTES_DIR"

for ex in $EXERCISES; do
    mkdir -p "$SUJEITO_DIR/$ex"
    mkdir -p "$TESTES_DIR/$ex"
done

# ==========================================
# 1. find_dog (aff_a) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/find_dog/sujeito.txt"
Assignment name  : find_dog
Expected files   : find_dog.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que recebe uma string e exibe o primeiro caractere 'a'
que encontrar nela, seguido de uma nova linha.
Se não houver nenhum caractere 'a' na string, exiba apenas uma nova linha (siga o exemplo).
Se o número de parâmetros não for 1, o programa exibe 'a' seguido de uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/find_dog/run_test.sh"
#!/bin/bash
"$1" "abc"
"$1" "dubO a POIL"
"$1" "zz sent le poney"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/find_dog/expected.txt"
a
a

a
EOF
chmod +x "$TESTES_DIR/find_dog/run_test.sh"

# ==========================================
# 2. first_veggie (aff_first_param) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/first_veggie/sujeito.txt"
Assignment name  : first_veggie
Expected files   : first_veggie.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que recebe strings como argumentos e exibe seu primeiro argumento seguido de um \n.
Se o número de argumentos for menor que 1, o programa exibe \n.
EOF
cat << 'EOF' > "$TESTES_DIR/first_veggie/run_test.sh"
#!/bin/bash
"$1" vincent mit "l'ane" dans un pre et "s'en" vint
"$1" "j'aime le fromage de chevre"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/first_veggie/expected.txt"
vincent
j'aime le fromage de chevre

EOF
chmod +x "$TESTES_DIR/first_veggie/run_test.sh"

# ==========================================
# 3. last_veggie (aff_last_param) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/last_veggie/sujeito.txt"
Assignment name  : last_veggie
Expected files   : last_veggie.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que recebe strings como argumentos e exibe seu último argumento seguido de uma nova linha.
Se o número de argumentos for menor que 1, o programa exibe uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/last_veggie/run_test.sh"
#!/bin/bash
"$1" "zaz" "mange" "des" "chats"
"$1" "j'aime le savon"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/last_veggie/expected.txt"
chats
j'aime le savon

EOF
chmod +x "$TESTES_DIR/last_veggie/run_test.sh"

# ==========================================
# 4. countdown_pet (ft_countdown) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/countdown_pet/sujeito.txt"
Assignment name  : countdown_pet
Expected files   : countdown_pet.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que exibe todos os dígitos em ordem decrescente, seguido de uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/countdown_pet/run_test.sh"
#!/bin/bash
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/countdown_pet/expected.txt"
9876543210
EOF
chmod +x "$TESTES_DIR/countdown_pet/run_test.sh"

# ==========================================
# 5. count_veggies (ft_print_numbers) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/count_veggies/sujeito.txt"
Assignment name  : count_veggies
Expected files   : count_veggies.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva uma função que exibe todos os dígitos em ordem crescente.
void count_veggies(void);
EOF
cat << 'EOF' > "$TESTES_DIR/count_veggies/main.c"
void count_veggies(void);
int main(void) {
    count_veggies();
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/count_veggies/expected.txt"
0123456789EOF

# ==========================================
# 6. hello_pets (hello) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/hello_pets/sujeito.txt"
Assignment name  : hello_pets
Expected files   : hello_pets.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que exibe "Hello World!" seguido de um \n.
EOF
cat << 'EOF' > "$TESTES_DIR/hello_pets/run_test.sh"
#!/bin/bash
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/hello_pets/expected.txt"
Hello World!
EOF
chmod +x "$TESTES_DIR/hello_pets/run_test.sh"

# ==========================================
# 7. maff_cat (maff_alpha) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/maff_cat/sujeito.txt"
Assignment name  : maff_cat
Expected files   : maff_cat.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que exibe o alfabeto, com as letras de posição par em maiúsculo
e as letras de posição ímpar em minúsculo, seguido de uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/maff_cat/run_test.sh"
#!/bin/bash
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/maff_cat/expected.txt"
aBcDeFgHiJkLmNoPqRsTuVwXyZ
EOF
chmod +x "$TESTES_DIR/maff_cat/run_test.sh"

# ==========================================
# 8. maff_revcat (maff_revalpha) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/maff_revcat/sujeito.txt"
Assignment name  : maff_revcat
Expected files   : maff_revcat.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que exibe o alfabeto ao contrário, com as letras de posição par
em maiúsculo e as letras de posição ímpar em minúsculo, seguido de uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/maff_revcat/run_test.sh"
#!/bin/bash
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/maff_revcat/expected.txt"
zYxWvUtSrQpOnMlKjIhGfEdCbA
EOF
chmod +x "$TESTES_DIR/maff_revcat/run_test.sh"

# ==========================================
# 9. only_zucchini (only_z) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/only_zucchini/sujeito.txt"
Assignment name  : only_zucchini
Expected files   : only_zucchini.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que exibe o caractere 'z' na saída padrão seguido de uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/only_zucchini/run_test.sh"
#!/bin/bash
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/only_zucchini/expected.txt"
z
EOF
chmod +x "$TESTES_DIR/only_zucchini/run_test.sh"

echo ">>> Level 00 corrigido e cravado com os subjects originais."
