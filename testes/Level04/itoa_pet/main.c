#include <stdio.h>
#include <stdlib.h>
char *itoa_pet(int nbr);
int main(void) {
    char *s1 = itoa_pet(-2147483648);
    char *s2 = itoa_pet(42);
    char *s3 = itoa_pet(0);
    printf("%s\n%s\n%s\n", s1, s2, s3);
    free(s1); free(s2); free(s3);
    return 0;
}
