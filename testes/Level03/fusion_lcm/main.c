#include <stdio.h>
unsigned int fusion_lcm(unsigned int a, unsigned int b);
int main(void) {
    printf("%u\n", fusion_lcm(15, 20));
    printf("%u\n", fusion_lcm(0, 5));
    return 0;
}
