#include <stdio.h>
char *strrev_jedi(char *str);
int main(void) {
    char s1[] = "Yoda"; printf("%s\n", strrev_jedi(s1));
    char s2[] = "o"; printf("%s\n", strrev_jedi(s2));
    char s3[] = ""; printf("%s\n", strrev_jedi(s3));
    return 0;
}
