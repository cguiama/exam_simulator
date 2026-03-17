#include <stdio.h>
int max_power(int* tab, unsigned int len);
int main(void) {
    int tab[] = {10, 500, 9001, 3};
    printf("%d\n", max_power(tab, 4));
    printf("%d\n", max_power(NULL, 0));
    return 0;
}
