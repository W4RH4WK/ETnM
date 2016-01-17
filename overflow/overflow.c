#include <stdio.h>

void mordor(void) {
    printf("One does not simply jump into mordor()!\n");
}

void echo(void) {
    char buffer[20] = {0};
    printf("Enter text:\n");
    scanf("%s", buffer);
    printf("You entered: %s\n", buffer);
}

int main(void) {
    echo();
    return 0;
}
