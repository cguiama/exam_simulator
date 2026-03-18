#include <stdio.h>
#include <stdlib.h>
char **destructo_split(char *str);
int main(void) {
    char **arr = destructo_split("   Kuririn   Goku Vegeta  ");
    for(int i = 0; arr[i] != NULL; i++) {
        printf("%s\n", arr[i]);
        free(arr[i]);
    }
    free(arr);
    return 0;
}
