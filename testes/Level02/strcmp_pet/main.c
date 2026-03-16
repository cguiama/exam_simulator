#include <stdio.h>

int strcmp_pet(char *s1, char *s2);

int main(void)
{
    printf("%d\n", strcmp_pet("gato", "gato"));
    printf("%d\n", strcmp_pet("abc", "abd"));
    printf("%d\n", strcmp_pet("abd", "abc"));
    printf("%d\n", strcmp_pet("z", "a"));
    printf("%d\n", strcmp_pet("", "a"));
    printf("%d\n", strcmp_pet("a", ""));
    return (0);
}
