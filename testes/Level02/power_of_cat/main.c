#include <stdio.h>
int power_of_cat(unsigned int n);
int main(void) {
    printf("%d\n", power_of_cat(1));
    printf("%d\n", power_of_cat(2));
    printf("%d\n", power_of_cat(64));
    printf("%d\n", power_of_cat(1024));
    printf("%d\n", power_of_cat(0));
    printf("%d\n", power_of_cat(3));
    printf("%d\n", power_of_cat(42));
    return 0;
}
