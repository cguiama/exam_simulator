#include <stdio.h>

void swap_veg(int *a, int *b);

int main(void)
{
    int a = 42;
    int b = 24;

    printf("Antes: a = %d, b = %d\n", a, b);
    swap_veg(&a, &b);
    printf("Depois: a = %d, b = %d\n", a, b);
    return (0);
}
