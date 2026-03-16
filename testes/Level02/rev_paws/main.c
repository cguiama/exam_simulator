#include <stdio.h>
unsigned char rev_paws(unsigned char octet);
int main(void) {
    printf("%d\n", rev_paws(65));
    printf("%d\n", rev_paws(2));
    printf("%d\n", rev_paws(0));
    printf("%d\n", rev_paws(255));
    return 0;
}
