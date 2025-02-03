int main() {
    int n = 44;  // Define the position (n) of the Fibonacci sequence to compute
    
    int a = 0, b = 1, temp;  // Initialize first two Fibonacci numbers and define a temporary variable

    // Loop from 2 to 44 to compute the Fibonacci number at position n
    // Since the first two Fibonacci numbers (0 and 1) are already initialized,
    // the loop starts from the 2nd index.
    for (int i = 2; i <= n; i++) {
        temp = a + b;   // Compute the next Fibonacci number as the sum of the previous two
        a = b;  // Shift 'b' to 'a' for the next iteration
        b = temp; // Assign the computed Fibonacci number to 'b'
    }

    int Fibonacci44th = b; // Store the 44th Fibonacci number in the variable Fibonacci44th
    return 0; // Exit the program successfully
}
