#include <stdio.h>
#include <stdlib.h>
typedef struct s_list { const void *data; struct s_list *next; } t_list;
int chase_tail(const t_list *list);
int main(void) {
    t_list *node1 = malloc(sizeof(t_list));
    t_list *node2 = malloc(sizeof(t_list));
    t_list *node3 = malloc(sizeof(t_list));
    node1->next = node2; node2->next = node3;

    // Sem ciclo
    node3->next = NULL;
    printf("%d\n", chase_tail(node1));

    // Com ciclo
    node3->next = node1;
    printf("%d\n", chase_tail(node1));

    free(node1); free(node2); free(node3);
    return 0;
}
