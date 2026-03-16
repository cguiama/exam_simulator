#include <stdio.h>
#include <stdlib.h>
typedef struct s_list { struct s_list *next; void *data; } t_list;
int pack_size(t_list *begin_list);
int main(void) {
    t_list *head = malloc(sizeof(t_list));
    head->next = malloc(sizeof(t_list));
    head->next->next = malloc(sizeof(t_list));
    head->next->next->next = NULL;
    printf("%d\n", pack_size(head));
    free(head->next->next); free(head->next); free(head);

    printf("%d\n", pack_size(NULL));
    return 0;
}
