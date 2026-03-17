#include <stdio.h>
int strcmp_sith(char *s1, char *s2);
int main(void) {
    printf("%d\n", strcmp_sith("Vader", "Vader"));
    printf("%d\n", strcmp_sith("Luke", "Leia"));
    printf("%d\n", strcmp_sith("Leia", "Luke"));
    printf("%d\n", strcmp_sith("", "Yoda"));
    return 0;
}
