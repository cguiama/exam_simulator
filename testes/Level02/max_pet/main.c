#include <stdio.h>
int max_pet(int* tab, unsigned int len);
int main(void) {
    int tab1[] = {1, 2, 3, 4, 5};
    int tab2[] = {-5, -2, -9, -1};
    int tab3[] = {42};
    printf("%d\n", max_pet(tab1, 5));
    printf("%d\n", max_pet(tab2, 4));
    printf("%d\n", max_pet(tab3, 1));
    printf("%d\n", max_pet(NULL, 0));
    return 0;
}
