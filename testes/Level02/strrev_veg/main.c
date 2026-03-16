#include <stdio.h>

char *strrev_veg(char *str);

int main(void)
{
    char s1[] = "abacate";
    printf("%s\n", strrev_veg(s1));

    char s2[] = "gato";
    printf("%s\n", strrev_veg(s2));

    char s3[] = "o";
    printf("%s\n", strrev_veg(s3));

    char s4[] = "";
    printf("%s\n", strrev_veg(s4));

    return (0);
}
