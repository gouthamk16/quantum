# Random Number Generator
Leveraging quantum mechanics to produce a random number.

## Problem
Classsical computers (binary) don't produce random numbers as such, they produce pseudo-random numbers, ie., a deterministic sequence of numbers based on some initial value (seed). The seed is in turn derived from the CPU's clock. Since most of the cryptographic methods we have today make use of these pseudo-random numbers, we need a more undeterminstic, truly random number generator

On the other hand, quantum computers can generate truly random numbers since measurement of a qubit (unit of quantum information) in superposition is a probabilistic occurence. The result of this measurement is random, no way to predict the outcome. When measured we will get a value of ZERO or ONE, but before measurement, the state of a qubit represents the prpbability of reading either a ZERO or ONE.

## Process
- Take a qubit in a basis state (ZERO or ONE) -> analogous to an electron spin state about an axis (x or z).
- Qubit -> Hadamard Operation (Quantum gate) -> Equal superposition
- Measurement of the qubit state results in a ZERO or ONE with 50% prob of each outcome, hence a truly random bit.
- Leverage this property to genrate large random numbers. -> Repeat the above process n times to generate n random bits -> concat to form an bin integer.

## Algorithm
1. Define `max` as the maximum number you want to generate.
2. Define the number of random bits you want to generate -> calculating how many bits you need (n) to express integers upto max.
3. Generate the random bit string (n bits lonog).
4. If the bit string represents a number greater than `max`, go back to step three.
5. Return the generated number as an integer (base 10).

## The Q Operation
```C#
operation GenerateRandomBit() : Result {
    // Allocate a qubit.
    use q = Qubit();

    // Set the qubit into superposition of ZERO and ONE using the Hadamard 
    H(q);

    // At this point the qubit `q` has 50% chance of being measured in the
    // |0〉 state and 50% chance of being measured in the |1〉 state.
    // Measure the qubit value using the `M` operation, and store the
    // measurement value in the `result` variable.
    let result = M(q);

    // Reset qubit to the |0〉 state.
    // Qubits must be in the |0〉 state by the time they are released.
    Reset(q);

    // Return the result of the measurement.
    return result;
}
```
