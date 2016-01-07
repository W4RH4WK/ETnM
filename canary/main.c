#include <stdio.h>

void fun(void) {
    char buf[8] = {0};
    fgets(buf, 32, stdin);
    /* break point */
    puts(buf);
}

int main(int argc, char *argv[]) {
    fun();
    return 0;
}
