#include <stdio.h>
int scouter_base(const char *str, int str_base);
int main(void) {
    printf("%d\n", scouter_base("12FDB3", 16));
    printf("%d\n", scouter_base("101", 2));
    printf("%d\n", scouter_base("-2A", 16));
    return 0;
}
