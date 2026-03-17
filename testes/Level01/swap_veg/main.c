#include <stdio.h>
void swap_veg(int *a, int *b);
int main(void) {
    int a = 10;
    int b = 42;
    swap_veg(&a, &b);
    printf("%d %d\n", a, b);
    return 0;
}
