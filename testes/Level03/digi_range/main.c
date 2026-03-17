#include <stdio.h>
#include <stdlib.h>
int *digi_range(int start, int end);
int main(void) {
    int *arr = digi_range(-1, 2);
    for(int i=0; i<4; i++) printf("%d ", arr[i]);
    printf("\n");
    free(arr);
    return 0;
}
