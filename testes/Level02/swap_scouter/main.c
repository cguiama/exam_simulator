#include <stdio.h>
unsigned char swap_scouter(unsigned char octet);
int main(void) {
    printf("%d\n", swap_scouter(65)); // 65 -> 20
    printf("%d\n", swap_scouter(2));  // 2 -> 32
    return 0;
}
