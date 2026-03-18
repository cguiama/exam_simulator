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
