#include <stdio.h>

void SignAndMagnitude(int decNum, int nBits);
void OneComplement(int decNum, int nBits);
void TwoComplement(int decNum, int nBits);

int main() {
    int nBits;
    printf("Enter the number of bit(s) >> ");
    scanf(" %d", &nBits);

    if (nBits < 0) {
        printf("Error: Invalid bit size.\n");
        return 0;
    }

    int decNum;
    int maxValue = (1 << (nBits - 1)) - 1;   // Maximum value for nBits
    int minValue = -(1 << (nBits - 1));      // Minimum value for nBits

    printf("Enter Decimal Number between %d to %d >> ", minValue, maxValue);
    scanf(" %d", &decNum);
    if (decNum > maxValue || decNum < minValue) {
        printf("Error: %d cannot be represented with %d bits.\n", decNum, nBits);
        return 0;
    }

    printf("Sign and Magnitude: ");
    SignAndMagnitude(decNum, nBits);
    printf("\n");

    printf("One's Complement: ");
    OneComplement(decNum, nBits);
    printf("\n");

    printf("Two's Complement: ");
    TwoComplement(decNum, nBits);
    printf("\n");

    return 0;
}

void SignAndMagnitude(int decNum, int nBits) {
    unsigned int mask = (1U << (nBits - 1)); // Mask for the sign bit
    unsigned int result = (decNum < 0 ? mask : 0) | (decNum < 0 ? -decNum : decNum);

    for (int i = nBits - 1; i >= 0; i--) {
        printf("%d", (result >> i) & 1); // Print each bit
    }
}

void OneComplement(int decNum, int nBits) {
    unsigned int magnitude = decNum < 0 ? -decNum : decNum;
    unsigned int result = decNum < 0 ? (~magnitude) : magnitude;

    for (int i = nBits - 1; i >= 0; i--) {
        printf("%d", (result >> i) & 1); // Print each bit
    }
}

void TwoComplement(int decNum, int nBits) {
    unsigned int magnitude = decNum < 0 ? -decNum : decNum;
    unsigned int result = decNum < 0 ? (~magnitude) + 1 : magnitude;

    for (int i = nBits - 1; i >= 0; i--) {
        printf("%d", (result >> i) & 1); // Print each bit
    }
}
