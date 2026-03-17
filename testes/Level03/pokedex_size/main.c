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
