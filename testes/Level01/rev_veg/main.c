#include <stdio.h>

char *rev_veg(char *str);

int main(void)
{
    char veg[] = "cenouras e brocolis";
    char *ret;

    ret = rev_veg(veg);
    printf("Retorno: %s\n", ret);
    return (0);
}
