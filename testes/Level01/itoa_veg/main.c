#include <stdio.h>
#include <stdlib.h>
char *itoa_veg(int nbr);
int main(void) {
    char *s1 = itoa_veg(-2147483648);
    char *s2 = itoa_veg(42);
    char *s3 = itoa_veg(0);
    printf("%s\n%s\n%s\n", s1, s2, s3);
    free(s1); free(s2); free(s3);
    return 0;
}
