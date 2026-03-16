#include <stdio.h>
int strlen_pet(char *str);
int main(void) {
    printf("%d\n", strlen_pet("123456789"));
    printf("%d\n", strlen_pet(""));
    return 0;
}
