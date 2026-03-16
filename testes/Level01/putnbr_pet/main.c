#include <unistd.h>
void putnbr_pet(int n);
int main(void) {
    putnbr_pet(42); write(1, "\n", 1);
    putnbr_pet(-2147483648); write(1, "\n", 1);
    putnbr_pet(0); write(1, "\n", 1);
    return 0;
}
