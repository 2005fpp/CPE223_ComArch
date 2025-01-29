int main() {
    int n = 44;
    int a = 0, b = 1, temp;

    for (int i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }

    int result = b;
    return 0;
}

// Using Arm 32-bit GCC 14.2.0 compiler
