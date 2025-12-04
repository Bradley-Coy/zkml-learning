pragma circom 2.0.0;

// Simple comparison: is a > b?
// This is a simplified version - production circuits use more robust methods

template GreaterThan() {
    signal input in[2];
    signal output out;

    // For simplicity: assume inputs are small positive integers
    // Real implementation would use bit decomposition
    signal diff;
    diff <== in[0] - in[1];

    // This is simplified - just checking if diff is non-zero
    // Real circuits use range proofs
    out <== diff * diff; // Non-zero if different
}

// ReLU: ma(0, x)
template ReLU() {
    signal input in;
    signal output out;

    // For learning purposes: simplified version
    // Assumes input is positive (will extend later)
    // Real ReLU needs comparison circuits

    // Improve in future iterations
}

// 2-layer network WITH activation function
template NetworkWithActivation() {
    signal input x;
    signal output y;

    // Layer 1
    var w1 = 3;
    var b1 = -2; // Negative bias to demo ReLU effect

    // Layer 2
    var w2 = 2;
    var b2 = 1;

    signal h1_mult, h1_raw, h1_activated;
    signal y_mult;

    // Layer 1 computation
    h1_mult <== x * w1;
    h1_raw <== h1_mult + b1;

    // Apply ReLU activation
    component relu = ReLU();
    relu.in <== h1_raw;
    h1_activated <== relu.out;
    
    // Layer 2 computation
    y_mult <== h1_activated * w2;
    y <== y_mult + b2;
}

component main = NetworkWithActivation();