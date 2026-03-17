#include <stdio.h>
int atoi_dbz(const char *str);
int main(void) {
    printf("%d\n", atoi_dbz("   \t\n\r\v\f -42"));
    printf("%d\n", atoi_dbz("   -42abc"));
    printf("%d\n", atoi_dbz("  --42"));
    printf("%d\n", atoi_dbz("   +9001"));
    printf("%d\n", atoi_dbz("abc42"));
    return 0;
}
