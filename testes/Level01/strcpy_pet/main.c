#include <stdio.h>
#include <stdlib.h>

char *strcpy_pet(char *s1, char *s2);

int main(void)
{
    char dest[100];
    char *src = "Gatinho copiado com sucesso.";
    char *ret;

    ret = strcpy_pet(dest, src);

    printf("%s\n", dest);
    printf("Retorno do ponteiro: %s\n", ret);

    return (0);
}
