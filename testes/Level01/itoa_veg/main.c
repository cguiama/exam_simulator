#include <stdio.h>
#include <stdlib.h>

char *itoa_veg(int nbr);

int main(void)
{
    char *res;

    res = itoa_veg(42);
    printf("%s\n", res);
    free(res);

    res = itoa_veg(-42);
    printf("%s\n", res);
    free(res);

    res = itoa_veg(0);
    printf("%s\n", res);
    free(res);

    res = itoa_veg(-2147483648);
    printf("%s\n", res);
    free(res);

    res = itoa_veg(2147483647);
    printf("%s\n", res);
    free(res);

    return (0);
}
