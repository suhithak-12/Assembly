#include <stdio.h>

int main() {
    int number = 5;
    long long factorial = 1;

    for (int i = 1; i <= number; i++) {
        factorial *= i;
    }

    printf("The factorial of %d is %lld\n", number, factorial);

    return 0;
}

