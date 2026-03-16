#include <stdio.h>
int count_seeds(char *str);
int main(void) {
    printf("%d\n", count_seeds("  milho   feijao soja "));
    printf("%d\n", count_seeds("abobora"));
    printf("%d\n", count_seeds(" \t \n "));
    printf("%d\n", count_seeds("uma semente, duas sementes   ! "));
    printf("%d\n", count_seeds(""));
    printf("%d\n", count_seeds("       "));
    printf("%d\n", count_seeds("uma"));
    return 0;
}
