#include <stdio.h>
#include <stdlib.h>

char *strdup_veg(char *src);

int main(void)
{
    char *str1 = strdup_veg("cenoura");
    if (str1)
    {
        printf("%s\n", str1);
        free(str1); // O sistema precisa liberar a Heap
    }

    char *str2 = strdup_veg("");
    if (str2)
    {
        printf("%s\n", str2);
        free(str2);
    }
    return (0);
}
