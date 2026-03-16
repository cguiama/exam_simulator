#include <stdio.h>
#include <stdlib.h>
char *itoa_base_veg(int value, int base);
int main(void) {
    char *s1 = itoa_base_veg(255, 16);
    char *s2 = itoa_base_veg(-42, 10);
    printf("%s\n%s\n", s1, s2);
    free(s1); free(s2);
    return 0;
}
