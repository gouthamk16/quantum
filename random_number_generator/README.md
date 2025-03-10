# Random Number Generator
Leveraging quantum mechanics to produce a random number.

## Problem
Classsical computers (binary) don't produce random numbers as such, they produce pseudo-random numbers, ie., a deterministic sequence of numbers based on some initial value (seed). The seed is in turn derived from the CPU's clock. Since most of the cryptographic methods we have today make use of these pseudo-random numbers, we need a more undeterminstic, truly random number generator

On the other hand, quantum computers can generate truly random numbers since measurement of a qubit (unit of quantum information) in superposition is a probabilistic occurence. The result of this measurement is random, no way to predict the outcome. When measured we will get a value of 0 or 1, but before measurement, the state of a qubit represents the prpbability of reading either a 0 or 1.

## Process
- Take a qubit in a basis state (0 or 1) -> analogous to an electron spin state about an axis (x or z).
- Qubit -> Hadamard Operation (Quantum gate) -> Equal superposition
- Measurement of the qubit state results in a 0 or 1 with 50% prob of each outcome, hence a truly random bit.
- Leverage this property to genrate large random numbers. -> Repeat the above process n times to generate n random bits -> concat to form an bin integer.

## Algorithm
1. Define `max` as the maximum number you want to generate.
2. Define the number of random bits you want to generate -> calculating how many bits you need (n) to express integers upto max.
3. Generate the random bit string (n bits lonog).
4. If the bit string represents a number greater than `max`, go back to step three.
5. Return the generated number as an integer (base 10).