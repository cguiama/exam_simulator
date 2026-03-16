#include <stdio.h>
#include <stdlib.h>
char **split_veg(char *str);
int main(void) {
    char **arr = split_veg("   salmao   atum sardinha  ");
    for(int i = 0; arr[i] != NULL; i++) {
        printf("%s\n", arr[i]);
        free(arr[i]);
    }
    free(arr);
    return 0;
}
