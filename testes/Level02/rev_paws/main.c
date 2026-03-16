#include <stdio.h>

unsigned char rev_paws(unsigned char octet);

int main(void)
{
    // 65 'A' (0100 0001) vira 130 (1000 0010)
    printf("%d\n", rev_paws(65));
    // 2 (0000 0010) vira 64 (0100 0000)
    printf("%d\n", rev_paws(2));
    // Limites
    printf("%d\n", rev_paws(0));
    printf("%d\n", rev_paws(255));
    return (0);
}
