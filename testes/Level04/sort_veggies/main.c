#include <stdio.h>
void sort_veggies(int *tab, unsigned int size);
int main(void) {
    int tab[] = {5, -4, 3, -2, 1};
    sort_veggies(tab, 5);
    for(int i=0; i<5; i++) printf("%d ", tab[i]);
    printf("\n");
    return 0;
}
