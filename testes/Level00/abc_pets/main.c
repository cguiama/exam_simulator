#include <unistd.h>

void abc_pets(void);

int main(void)
{
    abc_pets();
    write(1, "\n", 1);
    return (0);
}
