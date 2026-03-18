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
