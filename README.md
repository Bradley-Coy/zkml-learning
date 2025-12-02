# My First Zero-Knowledge Proof Circuit

A simple ZK circuit that proves multiplication: `c = a * b`

## What This Does

- Proves I know two numbers that multiply to give a result
- WITHOUT revealing what those numbers are
- Uses Circom + snarkjs for zero-knowledge proofs

## Circuit
```circom
template Multiplier() {
    signal input a;    // Private
    signal input b;    // Private
    signal output c;   // Public
    
    c <== a * b;
}
```

## How to Run
```bash
# Compile circuit
circom multiplier.circom --r1cs --wasm --sym

# Generate witness
node multiplier_js/generate_witness.js multiplier_js/multiplier.wasm input.json witness.wtns

# Setup (download Powers of Tau first)
snarkjs groth16 setup multiplier.r1cs pot12_final.ptau circuit_0000.zkey

# Contribute randomness
snarkjs zkey contribute circuit_0000.zkey circuit_final.zkey

# Export verification key
snarkjs zkey export verificationkey circuit_final.zkey verification_key.json

# Generate proof
snarkjs groth16 prove circuit_final.zkey witness.wtns proof.json public.json

# Verify proof
snarkjs groth16 verify verification_key.json public.json proof.json
```

## Result

Proves that `5 * 7 = 35` without revealing 5 or 7.

---

**Learning ZK proofs and ZKML. This is day 1.**
