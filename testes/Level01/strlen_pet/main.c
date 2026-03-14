#include <stdio.h>

int strlen_pet(char *str);

int main(void)
{
    printf("%d\n", strlen_pet("Cachorrinho\n"));
    printf("%d\n", strlen_pet(""));
    printf("%d\n", strlen_pet("A"));
    return (0);
}
