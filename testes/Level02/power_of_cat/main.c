#include <stdio.h>

int power_of_cat(unsigned int n);

int main(void)
{
    printf("%d\n", power_of_cat(1));    // 2^0
    printf("%d\n", power_of_cat(2));    // 2^1
    printf("%d\n", power_of_cat(64));   // 2^6
    printf("%d\n", power_of_cat(1024)); // 2^10
    // --- CASOS HOSTIS ---
    printf("%d\n", power_of_cat(0));
    printf("%d\n", power_of_cat(3));
    printf("%d\n", power_of_cat(42));
    return (0);
}
