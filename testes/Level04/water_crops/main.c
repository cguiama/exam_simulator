#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct s_point { int x; int y; } t_point;
void water_crops(char **tab, t_point size, t_point begin);
int main(void) {
    char *zone[] = { strdup("11111"), strdup("10001"), strdup("10101"), strdup("11111") };
    t_point size = {5, 4}; t_point begin = {1, 1};
    water_crops(zone, size, begin);
    for (int i = 0; i < 4; i++) { printf("%s\n", zone[i]); free(zone[i]); }
    return 0;
}
