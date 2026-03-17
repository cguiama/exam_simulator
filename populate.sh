#!/bin/bash

SUJEITO_DIR="./sujeito/Level02"
TESTES_DIR="./testes/Level02"

EXERCISES="mirror_mon atoi_dbz calc_force strcmp_sith strdup_clone strrev_jedi inter_dex last_jedi max_power is_power_of_ssj print_scouter rev_scouter swap_scouter union_fusion digi_match"

# Limpa o diretório antigo para garantir que os 15 exercícios oficiais existam limpos
rm -rf "$SUJEITO_DIR" "$TESTES_DIR"

for ex in $EXERCISES; do
    mkdir -p "$SUJEITO_DIR/$ex"
    mkdir -p "$TESTES_DIR/$ex"
done

# ==========================================
# 1. mirror_mon (alpha_mirror) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/mirror_mon/sujeito.txt"
Assignment name  : mirror_mon
Expected files   : mirror_mon.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba uma string e a exiba após substituir cada caractere
alfabético pelo seu oposto no alfabeto, seguido de uma nova linha.

'a' torna-se 'z', 'Z' torna-se 'A'
'd' torna-se 'w', 'M' torna-se 'N'

A capitalização (maiúsculas/minúsculas) não deve ser alterada.
Se o número de argumentos não for 1, exiba apenas uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/mirror_mon/run_test.sh"
#!/bin/bash
"$1" "abc"
"$1" "My horse is Amazing."
"$1" ""
"$1" "Pikachu" "Agumon"
EOF
cat << 'EOF' > "$TESTES_DIR/mirror_mon/expected.txt"
zyx
Nb slihv rh Znzarmt.


EOF
chmod +x "$TESTES_DIR/mirror_mon/run_test.sh"

# ==========================================
# 2. atoi_dbz (ft_atoi) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/atoi_dbz/sujeito.txt"
Assignment name  : atoi_dbz
Expected files   : atoi_dbz.c
Allowed functions: None
--------------------------------------------------------------------------------
Escreva uma função que converta o argumento string str para um inteiro (tipo int) e o retorne.
Ela funciona de forma muito similar à função padrão atoi(const char *str).
Sua função deve ser declarada da seguinte forma:
int atoi_dbz(const char *str);
EOF
cat << 'EOF' > "$TESTES_DIR/atoi_dbz/main.c"
#include <stdio.h>
int atoi_dbz(const char *str);
int main(void) {
    printf("%d\n", atoi_dbz("   \t\n\r\v\f -42"));
    printf("%d\n", atoi_dbz("   -42abc"));
    printf("%d\n", atoi_dbz("  --42"));
    printf("%d\n", atoi_dbz("   +9001"));
    printf("%d\n", atoi_dbz("abc42"));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/atoi_dbz/expected.txt"
-42
-42
0
9001
0
EOF

# ==========================================
# 3. calc_force (do_op) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/calc_force/sujeito.txt"
Assignment name  : calc_force
Expected files   : calc_force.c
Allowed functions: atoi, printf, write
--------------------------------------------------------------------------------
Escreva um programa que receba três strings:
A primeira e a terceira são representações de inteiros com sinal na base 10.
A segunda é um operador aritmético escolhido entre: +, -, *, /, %.
O programa deve exibir o resultado da operação, seguido de uma nova linha.
Se o número de parâmetros não for 3, exiba apenas uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/calc_force/run_test.sh"
#!/bin/bash
"$1" "123" "*" "456"
"$1" "9828" "/" "234"
"$1" "1" "+" "-43"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/calc_force/expected.txt"
56088
42
-42

EOF
chmod +x "$TESTES_DIR/calc_force/run_test.sh"

# ==========================================
# 4. strcmp_sith (ft_strcmp) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/strcmp_sith/sujeito.txt"
Assignment name  : strcmp_sith
Expected files   : strcmp_sith.c
Allowed functions:
--------------------------------------------------------------------------------
Reproduza o comportamento da função strcmp (man strcmp).
Sua função deve ser declarada da seguinte forma:
int strcmp_sith(char *s1, char *s2);
EOF
cat << 'EOF' > "$TESTES_DIR/strcmp_sith/main.c"
#include <stdio.h>
int strcmp_sith(char *s1, char *s2);
int main(void) {
    printf("%d\n", strcmp_sith("Vader", "Vader"));
    printf("%d\n", strcmp_sith("Luke", "Leia"));
    printf("%d\n", strcmp_sith("Leia", "Luke"));
    printf("%d\n", strcmp_sith("", "Yoda"));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/strcmp_sith/expected.txt"
0
17
-17
-89
EOF

# ==========================================
# 5. strdup_clone (ft_strdup) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/strdup_clone/sujeito.txt"
Assignment name  : strdup_clone
Expected files   : strdup_clone.c
Allowed functions: malloc
--------------------------------------------------------------------------------
Reproduza o comportamento da função strdup (man strdup).
Sua função deve ser declarada da seguinte forma:
char *strdup_clone(char *src);
EOF
cat << 'EOF' > "$TESTES_DIR/strdup_clone/main.c"
#include <stdio.h>
#include <stdlib.h>
char *strdup_clone(char *src);
int main(void) {
    char *str = strdup_clone("Execute Order 66");
    if (str) { printf("%s\n", str); free(str); }
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/strdup_clone/expected.txt"
Execute Order 66
EOF

# ==========================================
# 6. strrev_jedi (ft_strrev) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/strrev_jedi/sujeito.txt"
Assignment name  : strrev_jedi
Expected files   : strrev_jedi.c
Allowed functions:
--------------------------------------------------------------------------------
Escreva uma função que inverta (in-place) uma string.
A função deve retornar o ponteiro recebido como parâmetro.
char *strrev_jedi(char *str);
EOF
cat << 'EOF' > "$TESTES_DIR/strrev_jedi/main.c"
#include <stdio.h>
char *strrev_jedi(char *str);
int main(void) {
    char s1[] = "Yoda"; printf("%s\n", strrev_jedi(s1));
    char s2[] = "o"; printf("%s\n", strrev_jedi(s2));
    char s3[] = ""; printf("%s\n", strrev_jedi(s3));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/strrev_jedi/expected.txt"
adoY
o

EOF

# ==========================================
# 7. inter_dex (inter) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/inter_dex/sujeito.txt"
Assignment name  : inter_dex
Expected files   : inter_dex.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba duas strings e exiba, sem duplicatas,
os caracteres que aparecem em ambas as strings, na ordem em que aparecem na primeira.
Se o número de argumentos não for 2, exiba apenas um \n.
EOF
cat << 'EOF' > "$TESTES_DIR/inter_dex/run_test.sh"
#!/bin/bash
"$1" "padinton" "paqefwtdjetyiytjneytjoeyjnejeyj"
"$1" "ddf6vewg64f" "gtwthgdwthdwfteewhrtag6h4ffdhsd"
"$1" "rien" "cette phrase ne cache rien"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/inter_dex/expected.txt"
padinto
df6ewg4
rien

EOF
chmod +x "$TESTES_DIR/inter_dex/run_test.sh"

# ==========================================
# 8. last_jedi (last_word) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/last_jedi/sujeito.txt"
Assignment name  : last_jedi
Expected files   : last_jedi.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba uma string e exiba sua última palavra, seguida de \n.
Uma palavra é uma seção da string delimitada por espaços/tabulações.
Se o número de parâmetros não for 1, exiba apenas uma nova linha.
EOF
cat << 'EOF' > "$TESTES_DIR/last_jedi/run_test.sh"
#!/bin/bash
"$1" "FOR PONY"
"$1" "this        ...       is sparta, then again, maybe    not"
"$1" "   "
"$1" "a" "b"
"$1" "  lorem,ipsum  "
EOF
cat << 'EOF' > "$TESTES_DIR/last_jedi/expected.txt"
PONY
not


lorem,ipsum
EOF
chmod +x "$TESTES_DIR/last_jedi/run_test.sh"

# ==========================================
# 9. max_power (max) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/max_power/sujeito.txt"
Assignment name  : max_power
Expected files   : max_power.c
Allowed functions:
--------------------------------------------------------------------------------
Escreva uma função que retorne o maior número encontrado num array de inteiros.
Se o array estiver vazio, retorne 0.
int max_power(int* tab, unsigned int len);
EOF
cat << 'EOF' > "$TESTES_DIR/max_power/main.c"
#include <stdio.h>
int max_power(int* tab, unsigned int len);
int main(void) {
    int tab[] = {10, 500, 9001, 3};
    printf("%d\n", max_power(tab, 4));
    printf("%d\n", max_power(NULL, 0));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/max_power/expected.txt"
9001
0
EOF

# ==========================================
# 10. is_power_of_ssj (is_power_of_2) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/is_power_of_ssj/sujeito.txt"
Assignment name  : is_power_of_ssj
Expected files   : is_power_of_ssj.c
Allowed functions: None
--------------------------------------------------------------------------------
Escreva uma função que determine se um dado número é uma potência de 2.
Retorna 1 se for, 0 caso contrário.
int is_power_of_ssj(unsigned int n);
EOF
cat << 'EOF' > "$TESTES_DIR/is_power_of_ssj/main.c"
#include <stdio.h>
int is_power_of_ssj(unsigned int n);
int main(void) {
    printf("%d\n", is_power_of_ssj(1));
    printf("%d\n", is_power_of_ssj(2));
    printf("%d\n", is_power_of_ssj(64));
    printf("%d\n", is_power_of_ssj(3));
    printf("%d\n", is_power_of_ssj(0));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/is_power_of_ssj/expected.txt"
1
1
1
0
0
EOF

# ==========================================
# 11. print_scouter (print_bits) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/print_scouter/sujeito.txt"
Assignment name  : print_scouter
Expected files   : print_scouter.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva uma função que receba um byte e o exiba em binário SEM NOVA LINHA NO FINAL.
void print_scouter(unsigned char octet);
EOF
cat << 'EOF' > "$TESTES_DIR/print_scouter/main.c"
#include <unistd.h>
void print_scouter(unsigned char octet);
int main(void) {
    print_scouter(2); write(1, "\n", 1);
    print_scouter(255); write(1, "\n", 1);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/print_scouter/expected.txt"
00000010
11111111
EOF

# ==========================================
# 12. rev_scouter (reverse_bits) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/rev_scouter/sujeito.txt"
Assignment name  : rev_scouter
Expected files   : rev_scouter.c
Allowed functions:
--------------------------------------------------------------------------------
Escreva uma função que receba um byte, inverta-o bit a bit e retorne o resultado.
unsigned char rev_scouter(unsigned char octet);
EOF
cat << 'EOF' > "$TESTES_DIR/rev_scouter/main.c"
#include <stdio.h>
unsigned char rev_scouter(unsigned char octet);
int main(void) {
    printf("%d\n", rev_scouter(38)); // 38 -> 100
    printf("%d\n", rev_scouter(0));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/rev_scouter/expected.txt"
100
0
EOF

# ==========================================
# 13. swap_scouter (swap_bits) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/swap_scouter/sujeito.txt"
Assignment name  : swap_scouter
Expected files   : swap_scouter.c
Allowed functions:
--------------------------------------------------------------------------------
Escreva uma função que receba um byte, troque suas metades (4 bits menos e mais
significativos) e retorne o resultado.
unsigned char swap_scouter(unsigned char octet);
EOF
cat << 'EOF' > "$TESTES_DIR/swap_scouter/main.c"
#include <stdio.h>
unsigned char swap_scouter(unsigned char octet);
int main(void) {
    printf("%d\n", swap_scouter(65)); // 65 -> 20
    printf("%d\n", swap_scouter(2));  // 2 -> 32
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/swap_scouter/expected.txt"
20
32
EOF

# ==========================================
# 14. union_fusion (union) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/union_fusion/sujeito.txt"
Assignment name  : union_fusion
Expected files   : union_fusion.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba duas strings e exiba, sem duplicatas,
os caracteres que aparecem em qualquer uma das strings, mantendo a ordem.
Se o número de argumentos não for 2, exiba apenas \n.
EOF
cat << 'EOF' > "$TESTES_DIR/union_fusion/run_test.sh"
#!/bin/bash
"$1" zpadinton "paqefwtdjetyiytjneytjoeyjnejeyj"
"$1" ddf6vewg64f gtwthgdwthdwfteewhrtag6h4ffdhsd
"$1" "rien" "cette phrase ne cache rien"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/union_fusion/expected.txt"
zpadintoqefwjy
df6vewg4thras
rienct phas

EOF
chmod +x "$TESTES_DIR/union_fusion/run_test.sh"

# ==========================================
# 15. digi_match (wdmatch) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/digi_match/sujeito.txt"
Assignment name  : digi_match
Expected files   : digi_match.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba duas strings e verifique se é possível escrever a
primeira string com os caracteres da segunda respeitando a ordem.
Se for possível, exiba a string. Caso contrário, exiba apenas \n.
EOF
cat << 'EOF' > "$TESTES_DIR/digi_match/run_test.sh"
#!/bin/bash
"$1" "faya" "fgvvfdxcacpolhyghbreda"
"$1" "faya" "fgvvfdxcacpolhyghbred"
"$1" "quarante deux" "qfqfsudf arzgsayns tsregfdgs sjytdekuoixq "
"$1" "error" "rrerrrfiiljdfxjyuifrrvcoojh"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/digi_match/expected.txt"
faya

quarante deux


EOF
chmod +x "$TESTES_DIR/digi_match/run_test.sh"

echo ">>> Level 02 reconstruído do zero. 15 chefões na pista (Temática Nerd Ativada)."
