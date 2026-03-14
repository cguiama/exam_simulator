#include <unistd.h>

void putnbr_pet(int nb);

void ft_putchar(char c)
{
    write(1, &c, 1);
}

int main(void)
{
    putnbr_pet(0);
    ft_putchar('\n');
    putnbr_pet(42);
    ft_putchar('\n');
    putnbr_pet(-42);
    ft_putchar('\n');
    putnbr_pet(2147483647);
    ft_putchar('\n');
    putnbr_pet(-2147483648);
    ft_putchar('\n');
    return (0);
}
