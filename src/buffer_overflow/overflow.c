#include <stdio.h>

void mordor(void) {
    puts("One does not simply"
         "jump into mordor()!");
}

void echo(void) {
    char buffer[20] = {0};
    puts("Enter text:");
    scanf("%s", buffer);
    printf("You entered: %s\n", buffer);
}

int main(void) {
    echo();
    return 0;
}
