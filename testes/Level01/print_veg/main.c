#include <unistd.h>
void print_veg(char *str);
int main(void) {
    print_veg("Cenoura e Ervilha");
    write(1, "\n", 1);
    return 0;
}
