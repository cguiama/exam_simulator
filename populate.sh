#!/bin/bash

SUJEITO_DIR="./sujeito/Level03"
TESTES_DIR="./testes/Level03"

EXERCISES="senzu_sum jedi_clean kamehameha_expand scouter_base pokedex_size digi_range sith_rrange hidden_mew fusion_lcm clone_count jedi_pgcd hex_saber tail_whip_cap force_cap kaio_ken_mult"

rm -rf "$SUJEITO_DIR" "$TESTES_DIR"

for ex in $EXERCISES; do
    mkdir -p "$SUJEITO_DIR/$ex"
    mkdir -p "$TESTES_DIR/$ex"
done

# ==========================================
# 1. senzu_sum (add_prime_sum) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/senzu_sum/sujeito.txt"
Assignment name  : senzu_sum
Expected files   : senzu_sum.c
Allowed functions: write, exit
--------------------------------------------------------------------------------
Escreva um programa que receba um inteiro positivo e exiba a soma de todos os
números primos inferiores ou iguais a ele, seguida de um '\n'.
Se o número de argumentos não for 1, ou se não for um número positivo, exiba apenas 0 e um '\n'.
EOF
cat << 'EOF' > "$TESTES_DIR/senzu_sum/run_test.sh"
#!/bin/bash
"$1" "5"
"$1" "7"
"$1" "9"
"$1" "0"
"$1" ""
EOF
cat << 'EOF' > "$TESTES_DIR/senzu_sum/expected.txt"
10
17
17
0
0
EOF
chmod +x "$TESTES_DIR/senzu_sum/run_test.sh"

# ==========================================
# 2. jedi_clean (epur_str) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/jedi_clean/sujeito.txt"
Assignment name  : jedi_clean
Expected files   : jedi_clean.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba uma string e a exiba com exatamente um espaço
entre as palavras, sem espaços ou tabulações no início ou no fim.
Se o número de parâmetros não for 1, o programa exibe \n.
EOF
cat << 'EOF' > "$TESTES_DIR/jedi_clean/run_test.sh"
#!/bin/bash
"$1" "vous voyez c'est facile d'afficher la meme chose"
"$1" " seulement          la c'est      plus dur "
"$1" "comme c'est cocasse" "vous avez entendu, Mathilde ?"
"$1" ""
EOF
cat << 'EOF' > "$TESTES_DIR/jedi_clean/expected.txt"
vous voyez c'est facile d'afficher la meme chose
seulement la c'est plus dur


EOF
chmod +x "$TESTES_DIR/jedi_clean/run_test.sh"

# ==========================================
# 3. kamehameha_expand (expand_str) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/kamehameha_expand/sujeito.txt"
Assignment name  : kamehameha_expand
Expected files   : kamehameha_expand.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que receba uma string e a exiba com exatamente três espaços
entre as palavras, sem espaços ou tabulações no início ou no fim.
EOF
cat << 'EOF' > "$TESTES_DIR/kamehameha_expand/run_test.sh"
#!/bin/bash
"$1" "vous   voyez   c'est   facile   d'afficher   la   meme   chose"
"$1" " seulement          la c'est      plus dur "
"$1" "comme c'est cocasse" "vous avez entendu, Mathilde ?"
"$1" ""
EOF
cat << 'EOF' > "$TESTES_DIR/kamehameha_expand/expected.txt"
vous   voyez   c'est   facile   d'afficher   la   meme   chose
seulement   la   c'est   plus   dur


EOF
chmod +x "$TESTES_DIR/kamehameha_expand/run_test.sh"

# ==========================================
# 4. scouter_base (ft_atoi_base) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/scouter_base/sujeito.txt"
Assignment name  : scouter_base
Expected files   : scouter_base.c
Allowed functions: None
--------------------------------------------------------------------------------
Escreva uma função que converta a string str (base N <= 16) para inteiro (base 10).
Os caracteres reconhecidos são: 0123456789abcdef (inclusive maiúsculas).
int scouter_base(const char *str, int str_base);
EOF
cat << 'EOF' > "$TESTES_DIR/scouter_base/main.c"
#include <stdio.h>
int scouter_base(const char *str, int str_base);
int main(void) {
    printf("%d\n", scouter_base("12FDB3", 16));
    printf("%d\n", scouter_base("101", 2));
    printf("%d\n", scouter_base("-2A", 16));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/scouter_base/expected.txt"
1244595
5
-42
EOF

# ==========================================
# 5. pokedex_size (ft_list_size) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/pokedex_size/sujeito.txt"
Assignment name  : pokedex_size
Expected files   : pokedex_size.c, ft_list.h
Allowed functions:
--------------------------------------------------------------------------------
Retorne a quantidade de elementos de uma lista encadeada.
typedef struct s_list { struct s_list *next; void *data; } t_list;
int pokedex_size(t_list *begin_list);
EOF
cat << 'EOF' > "$TESTES_DIR/pokedex_size/main.c"
#include <stdio.h>
#include <stdlib.h>
typedef struct s_list { struct s_list *next; void *data; } t_list;
int pokedex_size(t_list *begin_list);
int main(void) {
    t_list *head = malloc(sizeof(t_list));
    head->next = malloc(sizeof(t_list));
    head->next->next = NULL;
    printf("%d\n", pokedex_size(head));
    free(head->next); free(head);
    printf("%d\n", pokedex_size(NULL));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/pokedex_size/expected.txt"
2
0
EOF

# ==========================================
# 6. digi_range (ft_range) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/digi_range/sujeito.txt"
Assignment name  : digi_range
Expected files   : digi_range.c
Allowed functions: malloc
--------------------------------------------------------------------------------
Aloque um array de inteiros e preencha com o intervalo do início ao fim (inclusivo).
int *digi_range(int start, int end);
EOF
cat << 'EOF' > "$TESTES_DIR/digi_range/main.c"
#include <stdio.h>
#include <stdlib.h>
int *digi_range(int start, int end);
int main(void) {
    int *arr = digi_range(-1, 2);
    for(int i=0; i<4; i++) printf("%d ", arr[i]);
    printf("\n");
    free(arr);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/digi_range/expected.txt"
-1 0 1 2
EOF

# ==========================================
# 7. sith_rrange (ft_rrange) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/sith_rrange/sujeito.txt"
Assignment name  : sith_rrange
Expected files   : sith_rrange.c
Allowed functions: malloc
--------------------------------------------------------------------------------
Aloque um array de inteiros e preencha com o intervalo do fim ao início (inclusivo).
int *sith_rrange(int start, int end);
EOF
cat << 'EOF' > "$TESTES_DIR/sith_rrange/main.c"
#include <stdio.h>
#include <stdlib.h>
int *sith_rrange(int start, int end);
int main(void) {
    int *arr = sith_rrange(1, 3);
    for(int i=0; i<3; i++) printf("%d ", arr[i]);
    printf("\n");
    free(arr);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/sith_rrange/expected.txt"
3 2 1
EOF

# ==========================================
# 8. hidden_mew (hidenp) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/hidden_mew/sujeito.txt"
Assignment name  : hidden_mew
Expected files   : hidden_mew.c
Allowed functions: write
--------------------------------------------------------------------------------
Se a primeira string estiver escondida dentro da segunda (respeitando a ordem), imprima 1.
Caso contrário, imprima 0.
EOF
cat << 'EOF' > "$TESTES_DIR/hidden_mew/run_test.sh"
#!/bin/bash
"$1" "fgex.;" "tyf34gdgf;'ektufjhgdgex.;.;rtjynur6"
"$1" "abc" "2altrb53c.sse"
"$1" "abc" "btarc"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/hidden_mew/expected.txt"
1
1
0

EOF
chmod +x "$TESTES_DIR/hidden_mew/run_test.sh"

# ==========================================
# 9. fusion_lcm (lcm) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/fusion_lcm/sujeito.txt"
Assignment name  : fusion_lcm
Expected files   : fusion_lcm.c
Allowed functions:
--------------------------------------------------------------------------------
Retorne o Mínimo Múltiplo Comum absoluto (LCM) entre dois inteiros sem sinal.
unsigned int fusion_lcm(unsigned int a, unsigned int b);
EOF
cat << 'EOF' > "$TESTES_DIR/fusion_lcm/main.c"
#include <stdio.h>
unsigned int fusion_lcm(unsigned int a, unsigned int b);
int main(void) {
    printf("%u\n", fusion_lcm(15, 20));
    printf("%u\n", fusion_lcm(0, 5));
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/fusion_lcm/expected.txt"
60
0
EOF

# ==========================================
# 10. clone_count (paramsum) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/clone_count/sujeito.txt"
Assignment name  : clone_count
Expected files   : clone_count.c
Allowed functions: write
--------------------------------------------------------------------------------
Escreva um programa que exiba o número de argumentos passados para ele.
Se não houver argumentos, exiba 0.
EOF
cat << 'EOF' > "$TESTES_DIR/clone_count/run_test.sh"
#!/bin/bash
"$1" 1 2 3 5 7 24
"$1" 6 12 24
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/clone_count/expected.txt"
6
3
0
EOF
chmod +x "$TESTES_DIR/clone_count/run_test.sh"

# ==========================================
# 11. jedi_pgcd (pgcd) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/jedi_pgcd/sujeito.txt"
Assignment name  : jedi_pgcd
Expected files   : jedi_pgcd.c
Allowed functions: printf, atoi, malloc, free
--------------------------------------------------------------------------------
Receba duas strings (representando inteiros), calcule e imprima o Maior Denominador Comum.
EOF
cat << 'EOF' > "$TESTES_DIR/jedi_pgcd/run_test.sh"
#!/bin/bash
"$1" "42" "10"
"$1" "42" "12"
"$1" "14" "77"
"$1" "17" "3"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/jedi_pgcd/expected.txt"
2
6
7
1

EOF
chmod +x "$TESTES_DIR/jedi_pgcd/run_test.sh"

# ==========================================
# 12. hex_saber (print_hex) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/hex_saber/sujeito.txt"
Assignment name  : hex_saber
Expected files   : hex_saber.c
Allowed functions: write
--------------------------------------------------------------------------------
Converta uma string (número base 10 positivo) em sua representação Hexadecimal (letras minúsculas).
EOF
cat << 'EOF' > "$TESTES_DIR/hex_saber/run_test.sh"
#!/bin/bash
"$1" "10"
"$1" "255"
"$1" "5156454"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/hex_saber/expected.txt"
a
ff
4eae66

EOF
chmod +x "$TESTES_DIR/hex_saber/run_test.sh"

# ==========================================
# 13. tail_whip_cap (rstr_capitalizer) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/tail_whip_cap/sujeito.txt"
Assignment name  : tail_whip_cap
Expected files   : tail_whip_cap.c
Allowed functions: write
--------------------------------------------------------------------------------
Transforme em maiúscula a última letra de cada palavra, e o resto minúscula.
EOF
cat << 'EOF' > "$TESTES_DIR/tail_whip_cap/run_test.sh"
#!/bin/bash
"$1"
"$1" "Premier PETIT TesT"
"$1" "DeuxiEmE tEST uN PEU moinS  facile" "   attention C'EST pas dur QUAND mEmE" "ALLer UN DeRNier 0123456789pour LA rouTE    E "
EOF
cat << 'EOF' > "$TESTES_DIR/tail_whip_cap/expected.txt"

premieR petiT tesT
deuxiemE tesT uN peU moinS  facilE
   attentioN c'esT paS duR quanD memE
alleR uN dernieR 0123456789pouR lA routE    E
EOF
chmod +x "$TESTES_DIR/tail_whip_cap/run_test.sh"

# ==========================================
# 14. force_cap (str_capitalizer) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/force_cap/sujeito.txt"
Assignment name  : force_cap
Expected files   : force_cap.c
Allowed functions: write
--------------------------------------------------------------------------------
Transforme em maiúscula a primeira letra de cada palavra, e o resto minúscula.
EOF
cat << 'EOF' > "$TESTES_DIR/force_cap/run_test.sh"
#!/bin/bash
"$1"
"$1" "Premier PETIT TesT"
"$1" "DeuxiEmE tEST uN PEU moinS  facile" "   attention C'EST pas dur QUAND mEmE" "ALLer UN DeRNier 0123456789pour LA rouTE    E "
EOF
cat << 'EOF' > "$TESTES_DIR/force_cap/expected.txt"

Premier Petit Test
Deuxieme Test Un Peu Moins  Facile
   Attention C'est Pas Dur Quand Meme
Aller Un Dernier 0123456789pour La Route    E
EOF
chmod +x "$TESTES_DIR/force_cap/run_test.sh"

# ==========================================
# 15. kaio_ken_mult (tab_mult) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/kaio_ken_mult/sujeito.txt"
Assignment name  : kaio_ken_mult
Expected files   : kaio_ken_mult.c
Allowed functions: write
--------------------------------------------------------------------------------
Gere a tabuada (até 9) do número passado como argumento.
EOF
cat << 'EOF' > "$TESTES_DIR/kaio_ken_mult/run_test.sh"
#!/bin/bash
"$1" "9"
"$1" "19"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/kaio_ken_mult/expected.txt"
1 x 9 = 9
2 x 9 = 18
3 x 9 = 27
4 x 9 = 36
5 x 9 = 45
6 x 9 = 54
7 x 9 = 63
8 x 9 = 72
9 x 9 = 81
1 x 19 = 19
2 x 19 = 38
3 x 19 = 57
4 x 19 = 76
5 x 19 = 95
6 x 19 = 114
7 x 19 = 133
8 x 19 = 152
9 x 19 = 171

EOF
chmod +x "$TESTES_DIR/kaio_ken_mult/run_test.sh"

echo ">>> Level 03 reconstruído e pronto para a compilação."
