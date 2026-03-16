#include <unistd.h>
void only_zucchini(int n);
int main(void) {
    only_zucchini(-5);
    write(1, "\n", 1);
    only_zucchini(0);
    write(1, "\n", 1);
    only_zucchini(42);
    write(1, "\n", 1);
    return 0;
}
