#include <stdio.h>
unsigned char swap_paws(unsigned char octet);
int main(void) {
    printf("%d\n", swap_paws(2));
    printf("%d\n", swap_paws(65));
    printf("%d\n", swap_paws(0));
    printf("%d\n", swap_paws(255));
    return 0;
}
