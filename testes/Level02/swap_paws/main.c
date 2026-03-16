#include <stdio.h>

unsigned char swap_paws(unsigned char octet);

int main(void)
{
    // 2 (0000 0010) vira 32 (0010 0000)
    printf("%d\n", swap_paws(2));
    // 65 'A' (0100 0001) vira 20 (0001 0100)
    printf("%d\n", swap_paws(65));
    // 0 continua 0
    printf("%d\n", swap_paws(0));
    // 255 (1111 1111) continua 255
    printf("%d\n", swap_paws(255));
    return (0);
}
