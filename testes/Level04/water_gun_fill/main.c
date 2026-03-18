#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_point.h"
void flood_fill(char **tab, t_point size, t_point begin);
int main(void) {
    char *zone[] = { strdup("11111111"), strdup("10001001"), strdup("10010001"), strdup("10110001"), strdup("11100001") };
    t_point size = {8, 5}; t_point begin = {2, 2};
    flood_fill(zone, size, begin);
    for (int i = 0; i < 5; i++) { printf("%s\n", zone[i]); free(zone[i]); }
    return 0;
}
