#!/bin/bash

SUJEITO_DIR="./sujeito/Level04"
TESTES_DIR="./testes/Level04"

EXERCISES="jedi_mind_trick sith_checkmate water_gun_fill saiyan_prime pokedex_itoa scouter_itoa_base force_foreach order66_remove destructo_split yoda_rev_wstr force_push_rotate radar_sort archive_sort_list"

rm -rf "$SUJEITO_DIR" "$TESTES_DIR"

for ex in $EXERCISES; do
    mkdir -p "$SUJEITO_DIR/$ex"
    mkdir -p "$TESTES_DIR/$ex"
done

# ==========================================
# 1. jedi_mind_trick (brainfuck) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/jedi_mind_trick/sujeito.txt"
Assignment name  : jedi_mind_trick
Expected files   : *.c, *.h
Allowed functions: write, malloc, free
--------------------------------------------------------------------------------
Escreva um interpretador da linguagem minimalista Brainfuck.
A memória consiste em um array de 2048 bytes inicializado com zeros e um ponteiro.
Comandos: > < + - . [ ]
EOF
cat << 'EOF' > "$TESTES_DIR/jedi_mind_trick/run_test.sh"
#!/bin/bash
"$1" "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
"$1" "+++++[>++++[>++++H>+++++i<<-]>>>++\n<<<<-]>>--------.>+++++.>."
"$1" ""
EOF
cat << 'EOF' > "$TESTES_DIR/jedi_mind_trick/expected.txt"
Hello World!
Hi

EOF
chmod +x "$TESTES_DIR/jedi_mind_trick/run_test.sh"

# ==========================================
# 2. sith_checkmate (checkmate) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/sith_checkmate/sujeito.txt"
Assignment name  : sith_checkmate
Expected files   : *.c, *.h
Allowed functions: write, malloc, free
--------------------------------------------------------------------------------
Receba linhas representando um tabuleiro de xadrez (Rei 'K', Peão 'P', Bispo 'B', Torre 'R', Rainha 'Q').
Imprima "Success" se o Rei estiver em xeque, caso contrário "Fail".
EOF
cat << 'EOF' > "$TESTES_DIR/sith_checkmate/run_test.sh"
#!/bin/bash
"$1" ".." ".K"
"$1" "R..." ".K.." "..P." "...."
"$1" "R..." "iheK" "...." "jeiR"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/sith_checkmate/expected.txt"
Fail
Success
Success

EOF
chmod +x "$TESTES_DIR/sith_checkmate/run_test.sh"

# ==========================================
# 3. water_gun_fill (flood_fill) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/water_gun_fill/sujeito.txt"
Assignment name  : water_gun_fill
Expected files   : *.c, *.h
Allowed functions: -
--------------------------------------------------------------------------------
Escreva uma função que receba uma matriz 2D (char **), suas dimensões e um ponto de início.
Ela deve preencher recursivamente a área delimitada usando o caractere 'F'.
void flood_fill(char **tab, t_point size, t_point begin);
EOF
cat << 'EOF' > "$TESTES_DIR/water_gun_fill/t_point.h"
#ifndef T_POINT_H
#define T_POINT_H
typedef struct s_point { int x; int y; } t_point;
#endif
EOF
cat << 'EOF' > "$TESTES_DIR/water_gun_fill/main.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_point.h"
void flood_fill(char **tab, t_point size, t_point begin);
int main(void) {
    char *zone[] = { strdup("11111111"), strdup("10001001"), strdup("10010001"), strdup("10110001"), strdup("11100001") };
    t_point size = {8, 5}; t_point begin = {2, 2};
    flood_fill(zone, size, begin);
    for (int i = 0; i < 5; i++) { printf("%s\n", zone[i]); free(zone[i]); }
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/water_gun_fill/expected.txt"
11111111
1FFF1001
1FF10001
1F110001
11100001
EOF

# ==========================================
# 4. saiyan_prime (fprime) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/saiyan_prime/sujeito.txt"
Assignment name  : saiyan_prime
Expected files   : saiyan_prime.c
Allowed functions: printf, atoi
--------------------------------------------------------------------------------
Escreva um programa que receba um int positivo e exiba seus fatores primos separados por '*'.
EOF
cat << 'EOF' > "$TESTES_DIR/saiyan_prime/run_test.sh"
#!/bin/bash
"$1" "225225"
"$1" "8333325"
"$1" "42"
"$1" "1"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/saiyan_prime/expected.txt"
3*3*5*5*7*11*13
3*3*5*5*7*11*13*37
2*3*7
1

EOF
chmod +x "$TESTES_DIR/saiyan_prime/run_test.sh"

# ==========================================
# 5. pokedex_itoa (ft_itoa) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/pokedex_itoa/sujeito.txt"
Assignment name  : pokedex_itoa
Expected files   : pokedex_itoa.c
Allowed functions: malloc
--------------------------------------------------------------------------------
Converta um int em uma string alocada dinamicamente com terminação nula.
char *pokedex_itoa(int nbr);
EOF
cat << 'EOF' > "$TESTES_DIR/pokedex_itoa/main.c"
#include <stdio.h>
#include <stdlib.h>
char *pokedex_itoa(int nbr);
int main(void) {
    char *s1 = pokedex_itoa(-2147483648);
    char *s2 = pokedex_itoa(42);
    char *s3 = pokedex_itoa(0);
    printf("%s\n%s\n%s\n", s1, s2, s3);
    free(s1); free(s2); free(s3);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/pokedex_itoa/expected.txt"
-2147483648
42
0
EOF

# ==========================================
# 6. scouter_itoa_base (ft_itoa_base) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/scouter_itoa_base/sujeito.txt"
Assignment name  : scouter_itoa_base
Expected files   : scouter_itoa_base.c
Allowed functions: malloc
--------------------------------------------------------------------------------
Converta um int em string alocada (base 2 a 16).
Se base 10 e valor negativo, inclua o sinal '-'. Qualquer outra base é tratada como unsigned.
Base 16 usa "0123456789ABCDEF".
char *scouter_itoa_base(int value, int base);
EOF
cat << 'EOF' > "$TESTES_DIR/scouter_itoa_base/main.c"
#include <stdio.h>
#include <stdlib.h>
char *scouter_itoa_base(int value, int base);
int main(void) {
    char *s1 = scouter_itoa_base(255, 16);
    char *s2 = scouter_itoa_base(-42, 10);
    printf("%s\n%s\n", s1, s2);
    free(s1); free(s2);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/scouter_itoa_base/expected.txt"
FF
-42
EOF

# ==========================================
# 7. force_foreach (ft_list_foreach) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/force_foreach/sujeito.txt"
Assignment name  : force_foreach
Expected files   : force_foreach.c, ft_list.h
Allowed functions:
--------------------------------------------------------------------------------
Aplique a função 'f' recebida como parâmetro aos dados de todos os nós da lista.
void force_foreach(t_list *begin_list, void (*f)(void *));
EOF
cat << 'EOF' > "$TESTES_DIR/force_foreach/ft_list.h"
#ifndef FT_LIST_H
#define FT_LIST_H
typedef struct s_list { struct s_list *next; void *data; } t_list;
#endif
EOF
cat << 'EOF' > "$TESTES_DIR/force_foreach/main.c"
#include <stdio.h>
#include <stdlib.h>
#include "ft_list.h"
void force_foreach(t_list *begin_list, void (*f)(void *));
void print_data(void *data) { printf("%s ", (char *)data); }
int main(void) {
    t_list *node = malloc(sizeof(t_list)); node->data = "Luke";
    node->next = malloc(sizeof(t_list)); node->next->data = "Leia";
    node->next->next = NULL;
    force_foreach(node, print_data);
    printf("\n");
    free(node->next); free(node);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/force_foreach/expected.txt"
Luke Leia
EOF

# ==========================================
# 8. order66_remove (ft_list_remove_if) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/order66_remove/sujeito.txt"
Assignment name  : order66_remove
Expected files   : order66_remove.c, ft_list.h
Allowed functions: free
--------------------------------------------------------------------------------
Remova os nós da lista se a função 'cmp' retornar 0 ao comparar seus dados com 'data_ref'.
void order66_remove(t_list **begin_list, void *data_ref, int (*cmp)());
EOF
cat << 'EOF' > "$TESTES_DIR/order66_remove/ft_list.h"
#ifndef FT_LIST_H
#define FT_LIST_H
typedef struct s_list { struct s_list *next; void *data; } t_list;
#endif
EOF
cat << 'EOF' > "$TESTES_DIR/order66_remove/main.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ft_list.h"
void order66_remove(t_list **begin_list, void *data_ref, int (*cmp)());
int cmp(void *a, void *b) { return strcmp((char*)a, (char*)b); }
int main(void) {
    t_list *head = malloc(sizeof(t_list)); head->data = "Jedi";
    head->next = malloc(sizeof(t_list)); head->next->data = "Sith";
    head->next->next = malloc(sizeof(t_list)); head->next->next->data = "Jedi";
    head->next->next->next = NULL;
    order66_remove(&head, "Jedi", cmp);
    for(t_list *tmp = head; tmp; tmp = tmp->next) printf("%s ", (char*)tmp->data);
    printf("\n");
    free(head); // Limpa o Sith que sobrou
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/order66_remove/expected.txt"
Sith
EOF

# ==========================================
# 9. destructo_split (ft_split) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/destructo_split/sujeito.txt"
Assignment name  : destructo_split
Expected files   : destructo_split.c
Allowed functions: malloc
--------------------------------------------------------------------------------
Fatie uma string em palavras separadas por espaços/tabs/newlines, retornando um array nulo-terminado.
char **destructo_split(char *str);
EOF
cat << 'EOF' > "$TESTES_DIR/destructo_split/main.c"
#include <stdio.h>
#include <stdlib.h>
char **destructo_split(char *str);
int main(void) {
    char **arr = destructo_split("   Kuririn   Goku Vegeta  ");
    for(int i = 0; arr[i] != NULL; i++) {
        printf("%s\n", arr[i]);
        free(arr[i]);
    }
    free(arr);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/destructo_split/expected.txt"
Kuririn
Goku
Vegeta
EOF

# ==========================================
# 10. yoda_rev_wstr (rev_wstr) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/yoda_rev_wstr/sujeito.txt"
Assignment name  : yoda_rev_wstr
Expected files   : yoda_rev_wstr.c
Allowed functions: write, malloc, free
--------------------------------------------------------------------------------
Exiba as palavras de uma string na ordem inversa, separadas por exatamente um espaço.
EOF
cat << 'EOF' > "$TESTES_DIR/yoda_rev_wstr/run_test.sh"
#!/bin/bash
"$1" "le temps du mepris precede celui de l'indifference"
"$1" "abcdefghijklm"
"$1" "il contempla le mont"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/yoda_rev_wstr/expected.txt"
l'indifference de celui precede mepris du temps le
abcdefghijklm
mont le contempla il

EOF
chmod +x "$TESTES_DIR/yoda_rev_wstr/run_test.sh"

# ==========================================
# 11. force_push_rotate (rostring) -> Program
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/force_push_rotate/sujeito.txt"
Assignment name  : force_push_rotate
Expected files   : force_push_rotate.c
Allowed functions: write, malloc, free
--------------------------------------------------------------------------------
Escreva um programa que rotacione uma string empurrando a primeira palavra para o final.
As palavras devem ser separadas por exatamente um espaço.
EOF
cat << 'EOF' > "$TESTES_DIR/force_push_rotate/run_test.sh"
#!/bin/bash
"$1" "abc   "
"$1" "Que la      lumiere soit et la lumiere fut"
"$1" "     AkjhZ zLKIJz , 23y"
"$1"
EOF
cat << 'EOF' > "$TESTES_DIR/force_push_rotate/expected.txt"
abc
la lumiere soit et la lumiere fut Que
zLKIJz , 23y AkjhZ

EOF
chmod +x "$TESTES_DIR/force_push_rotate/run_test.sh"

# ==========================================
# 12. radar_sort (sort_int_tab) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/radar_sort/sujeito.txt"
Assignment name  : radar_sort
Expected files   : radar_sort.c
Allowed functions:
--------------------------------------------------------------------------------
Ordene um array de inteiros em ordem crescente (in-place). Preservando duplicatas.
void radar_sort(int *tab, unsigned int size);
EOF
cat << 'EOF' > "$TESTES_DIR/radar_sort/main.c"
#include <stdio.h>
void radar_sort(int *tab, unsigned int size);
int main(void) {
    int tab[] = {5, -4, 3, -2, 1, 3};
    radar_sort(tab, 6);
    for(int i=0; i<6; i++) printf("%d ", tab[i]);
    printf("\n");
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/radar_sort/expected.txt"
-4 -2 1 3 3 5
EOF

# ==========================================
# 13. archive_sort_list (sort_list) -> Function
# ==========================================
cat << 'EOF' > "$SUJEITO_DIR/archive_sort_list/sujeito.txt"
Assignment name  : archive_sort_list
Expected files   : archive_sort_list.c, list.h
Allowed functions:
--------------------------------------------------------------------------------
Ordene uma lista encadeada usando a função de comparação passada por ponteiro (que retorna true/false).
O retorno é o ponteiro para o novo head da lista.
t_list *archive_sort_list(t_list* lst, int (*cmp)(int, int));
EOF
cat << 'EOF' > "$TESTES_DIR/archive_sort_list/list.h"
#ifndef LIST_H
#define LIST_H
typedef struct s_list { struct s_list *next; int data; } t_list;
#endif
EOF
cat << 'EOF' > "$TESTES_DIR/archive_sort_list/main.c"
#include <stdio.h>
#include <stdlib.h>
#include "list.h"
t_list *archive_sort_list(t_list *lst, int (*cmp)(int, int));
int cmp(int a, int b) { return a <= b; }
int main(void) {
    t_list *node1 = malloc(sizeof(t_list)); node1->data = 9001;
    t_list *node2 = malloc(sizeof(t_list)); node2->data = 42;
    t_list *node3 = malloc(sizeof(t_list)); node3->data = 10;
    node1->next = node2; node2->next = node3; node3->next = NULL;
    t_list *sorted = archive_sort_list(node1, cmp);
    for(t_list *t = sorted; t; t = t->next) printf("%d ", t->data);
    printf("\n");
    free(node1); free(node2); free(node3);
    return 0;
}
EOF
cat << 'EOF' > "$TESTES_DIR/archive_sort_list/expected.txt"
10 42 9001
EOF

echo ">>> Level 04 reconstruído com a Força e o Ki máximos. 13 exercícios prontos!"
