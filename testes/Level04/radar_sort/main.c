#include <stdio.h>
void radar_sort(int *tab, unsigned int size);
int main(void) {
    int tab[] = {5, -4, 3, -2, 1, 3};
    radar_sort(tab, 6);
    for(int i=0; i<6; i++) printf("%d ", tab[i]);
    printf("\n");
    return 0;
}
