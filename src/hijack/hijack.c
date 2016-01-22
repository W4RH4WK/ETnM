#include <stdio.h>
#include <stdint.h>
#include <sys/mman.h>

void func1(void);
void func2(void);

void hijack(void) {

    void *page = (void *) ((uintptr_t) func1 & (uintptr_t) ~(4096-1));

    if (mprotect(page, 4096, PROT_READ | PROT_WRITE | PROT_EXEC) == 0) {
        /* calculate jump distance */
        intptr_t jmp = ((uintptr_t) func2) - ((uintptr_t) func1) - 5;

        /* change first instruction to relative jump */
        ((char *) func1)[0] = 0xe9;

        /* set jump distance (little endian) */
        ((char *) func1)[1] = (jmp&0xff);
        ((char *) func1)[2] = (jmp&0xff00) >> 8;
        ((char *) func1)[3] = (jmp&0xff0000) >> 16;
        ((char *) func1)[4] = jmp >> 24;
    }

}

void func1(void) {
    puts("func1");
}

void func2(void) {
    puts("func2");
}

int main(void) {
    func1();
    func2();
    hijack();
    func1();
    return 0;
}
