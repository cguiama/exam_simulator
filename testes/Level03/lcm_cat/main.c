#include <stdio.h>
unsigned int lcm_cat(unsigned int a, unsigned int b);
int main(void) {
    printf("%u\n", lcm_cat(15, 20));
    printf("%u\n", lcm_cat(0, 5));
    printf("%u\n", lcm_cat(12, 18));
    return 0;
}
