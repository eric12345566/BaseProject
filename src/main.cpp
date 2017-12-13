#include <stdio.h>

#ifndef TEST
int main() {
    printf("Rule Breaker!!!\n");
    printf("5 + 2 = %d\n", addNumber(5 + 2));
    return 0;
}
#endif // TEST

int addNumber(int a, int b) {
    return a + b;
}
