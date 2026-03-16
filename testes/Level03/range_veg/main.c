#include <stdio.h>
#include <stdlib.h>
int *range_veg(int start, int end);
int main(void) {
    int *arr1 = range_veg(1, 3);
    for(int i=0; i<3; i++) printf("%d ", arr1[i]);
    printf("\n");
    free(arr1);

    int *arr2 = range_veg(-1, 2);
    for(int i=0; i<4; i++) printf("%d ", arr2[i]);
    printf("\n");
    free(arr2);
    return 0;
}
