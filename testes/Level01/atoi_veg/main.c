#include <stdio.h>
#include <stdlib.h>

int atoi_veg(char *str);

int main(void)
{
    printf("%d\n", atoi_veg("   \t\n\r\v\f 42"));
    printf("%d\n", atoi_veg("   -42abc"));
    printf("%d\n", atoi_veg("  --42"));
    printf("%d\n", atoi_veg("   +123"));
    printf("%d\n", atoi_veg("abc42"));
    printf("%d\n", atoi_veg("-2147483648"));
    printf("%d\n", atoi_veg("2147483647"));
    // --- CASOS HOSTIS ABAIXO ---
    printf("%d\n", atoi_veg("+-42"));
    printf("%d\n", atoi_veg("   + 42"));
    printf("%d\n", atoi_veg("    -000042"));
    return (0);
}
