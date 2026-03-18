#include <stdio.h>
#include <stdlib.h>
char *scouter_itoa_base(int value, int base);
int main(void) {
    char *s1 = scouter_itoa_base(255, 16);
    char *s2 = scouter_itoa_base(-42, 10);
    printf("%s\n%s\n", s1, s2);
    free(s1); free(s2);
    return 0;
}
