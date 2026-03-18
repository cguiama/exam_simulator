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
