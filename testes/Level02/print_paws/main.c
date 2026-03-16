#include <unistd.h>

void print_paws(unsigned char octet);

int main(void)
{
    print_paws(2);
    write(1, "\n", 1);
    print_paws(0);
    write(1, "\n", 1);
    print_paws(255);
    write(1, "\n", 1);
    print_paws(170); // 10101010
    write(1, "\n", 1);
    return (0);
}
