#include <stdio.h>
char *strcpy_pet(char *s1, char *s2);
int main(void) {
    char dest[100];
    printf("%s\n", strcpy_pet(dest, "Gato e Cachorro"));
    return 0;
}
