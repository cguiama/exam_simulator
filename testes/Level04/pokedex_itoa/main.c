#include <stdio.h>
#include <stdlib.h>
char *pokedex_itoa(int nbr);
int main(void) {
    char *s1 = pokedex_itoa(-2147483648);
    char *s2 = pokedex_itoa(42);
    char *s3 = pokedex_itoa(0);
    printf("%s\n%s\n%s\n", s1, s2, s3);
    free(s1); free(s2); free(s3);
    return 0;
}
