#include <stdio.h>
#include <stdlib.h>
int *sith_rrange(int start, int end);
int main(void) {
    int *arr = sith_rrange(1, 3);
    for(int i=0; i<3; i++) printf("%d ", arr[i]);
    printf("\n");
    free(arr);
    return 0;
}
