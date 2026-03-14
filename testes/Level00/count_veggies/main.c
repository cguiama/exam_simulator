#include <unistd.h>

void count_veggies(void);

int main(void)
{
    count_veggies();
    write(1, "\n", 1);
    return (0);
}
