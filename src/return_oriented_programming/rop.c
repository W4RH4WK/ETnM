#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *not_used = "/bin/sh";

void not_called(void) {
    puts("Not quite a shell...");
    system("/bin/date");
}

void vulnerable_function(char* string) {
    char buffer[100] = {0};
    strcpy(buffer, string);
}

int main(int argc, char *argv[]) {
    if (argc == 2) {
        vulnerable_function(argv[1]);
    }
    return 0;
}
