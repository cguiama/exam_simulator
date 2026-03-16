#include <stdio.h>
void swap_veg(char *a, char *b);
int main(void) {
    char s1[] = "abc"; char s2[] = "xyz";
    swap_veg(s1, s2);
    printf("%s %s\n", s1, s2);
    return 0;
}
