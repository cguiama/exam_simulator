#include <stdio.h>
#include <stdlib.h>
char *strdup_clone(char *src);
int main(void) {
    char *str = strdup_clone("Execute Order 66");
    if (str) { printf("%s\n", str); free(str); }
    return 0;
}
