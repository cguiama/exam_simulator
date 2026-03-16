#include <unistd.h>
void print_vet_meds(const void *addr, size_t size);
int main(void) {
    // Array com bytes exatos para evitar problemas de endianness no diff
    unsigned char tab[16] = {0, 1, 2, 3, 255, 65, 66, 67, 10, 9, 32, 126, 127, 48, 49, 50};
    print_vet_meds(tab, 16);
    return 0;
}
