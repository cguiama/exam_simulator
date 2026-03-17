#include <stdio.h>
int is_power_of_ssj(unsigned int n);
int main(void) {
    printf("%d\n", is_power_of_ssj(1));
    printf("%d\n", is_power_of_ssj(2));
    printf("%d\n", is_power_of_ssj(64));
    printf("%d\n", is_power_of_ssj(3));
    printf("%d\n", is_power_of_ssj(0));
    return 0;
}
