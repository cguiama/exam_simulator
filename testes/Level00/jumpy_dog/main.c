#include <stdio.h>
void jumpy_dog(int *a, int *b);
int main(void) {
    int a = 10;
    int b = 42;
    jumpy_dog(&a, &b);
    printf("%d %d\n", a, b);
    return 0;
}
