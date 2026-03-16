#include <stdio.h>
#include <stdlib.h>
typedef struct s_list { struct s_list *next; void *data; } t_list;
void walk_pack(t_list *begin_list, void (*f)(void *));
void print_data(void *data) { printf("%s ", (char *)data); }
int main(void) {
    t_list *node = malloc(sizeof(t_list)); node->data = "A";
    node->next = malloc(sizeof(t_list)); node->next->data = "B";
    node->next->next = NULL;
    walk_pack(node, print_data);
    printf("\n");
    free(node->next); free(node);
    return 0;
}
