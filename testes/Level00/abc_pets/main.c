#include <stdio.h>
void abc_pets(int *nbr);
int main(void) {
    int n = 0;
    abc_pets(&n);
    printf("%d\n", n);
    return 0;
}
