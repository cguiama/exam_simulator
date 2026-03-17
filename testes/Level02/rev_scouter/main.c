#include <stdio.h>
unsigned char rev_scouter(unsigned char octet);
int main(void) {
    printf("%d\n", rev_scouter(38)); // 38 -> 100
    printf("%d\n", rev_scouter(0));
    return 0;
}
