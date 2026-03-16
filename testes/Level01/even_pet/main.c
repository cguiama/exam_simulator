#include <stdio.h>
int even_pet(int n);
int main(void) {
    printf("%d\n%d\n%d\n", even_pet(2), even_pet(3), even_pet(-4));
    return 0;
}
