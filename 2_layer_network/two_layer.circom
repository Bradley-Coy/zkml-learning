pragma circom 2.0.0;

// 2-layer feedforward neural network
// Architecture: input -> hidden layer (2 neurons) -> output
template TwoLayerNetwork() {
    signal input x;
    signal output y;

    // Layer 1: 1 input -> 2 hidden neurons
    var w1_1 = 3; // weight for hidden neuron 1
    var w1_2 = 2; // hidden neuron 2
    var b1_1 = 1; // bias, hidden neuron 1
    var b1_2 = 4; // hidden neuron 2

    // Layer 2: 2 hidden -> 1 output
    var w2_1 = 2; // weight from hidden 1 to output
    var w2_2 = 3; // weight from hidden 2 to ouput
    var b2 = 5; // output bias

    // Hidden layer signals
    signal h1_mult, h1;
    signal h2_mult, h2;
    
    // Output layer signals
    signal y_temp1, y_temp2, y_sum;

    // === LAYER 1 ===
    // Hidden neuron 1: h1 = (x * w1_1) + b1_1
    h1_mult <== x * w1_1;
    h1 <== h1_mult + b1_1;

    //Hidden neuron 2: h2 = (x * w1_2) + b1_2
    h2_mult <== x * w1_2;
    h2 <== h2_mult + b1_2;

    // === LAYER 2 ===
    // Combine hidden neurons: y = (h1 * w2_1) + (h2 * w2_2) + b2
    y_temp1 <== h1 * w2_1;
    y_temp2 <== h2 * w2_2;
    y_sum <== y_temp1 + y_temp2;
    y <== y_sum + b2;
}

component main = TwoLayerNetwork();