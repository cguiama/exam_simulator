#include <stdio.h>

int even_pet(int n);

int main(void)
{
    printf("%d\n", even_pet(42));
    printf("%d\n", even_pet(13));
    printf("%d\n", even_pet(0));
    printf("%d\n", even_pet(-7));
    printf("%d\n", even_pet(-100));
    return (0);
}
