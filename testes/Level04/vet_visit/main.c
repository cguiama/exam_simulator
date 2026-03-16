#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct s_list { struct s_list *next; void *data; } t_list;
void vet_visit(t_list **begin_list, void *data_ref, int (*cmp)());
int cmp(void *a, void *b) { return strcmp((char*)a, (char*)b); }
int main(void) {
    t_list *head = malloc(sizeof(t_list)); head->data = "cat";
    head->next = malloc(sizeof(t_list)); head->next->data = "dog";
    head->next->next = malloc(sizeof(t_list)); head->next->next->data = "cat";
    head->next->next->next = NULL;
    vet_visit(&head, "cat", cmp);
    for(t_list *tmp = head; tmp; tmp = tmp->next) printf("%s ", (char*)tmp->data);
    printf("\n");
    // Free the remaining node (dog)
    free(head);
    return 0;
}
