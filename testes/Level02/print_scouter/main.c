#include <unistd.h>
void print_scouter(unsigned char octet);
int main(void) {
    print_scouter(2); write(1, "\n", 1);
    print_scouter(255); write(1, "\n", 1);
    return 0;
}
