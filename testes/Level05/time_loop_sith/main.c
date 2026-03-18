#include <stdio.h>
#include <stdlib.h>
#include "list.h"
int time_loop_sith(const t_list *list);
int main(void) {
    t_list *node1 = malloc(sizeof(t_list));
    t_list *node2 = malloc(sizeof(t_list));
    t_list *node3 = malloc(sizeof(t_list));
    node1->next = node2; node2->next = node3; node3->next = NULL;
    printf("%d\n", time_loop_sith(node1)); // Sem ciclo
    node3->next = node1;
    printf("%d\n", time_loop_sith(node1)); // Com ciclo
    free(node1); free(node2); free(node3);
    return 0;
}
