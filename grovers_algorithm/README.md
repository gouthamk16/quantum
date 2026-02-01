# Grover's search algorithm
Definition and implementation of Grover's algorithm in Q# to solve search-based (Yes or No) problems. 

## Problem (Search Problem)
Any search problem can be mathematically formulated with an abstract function f(x) that accepts search items x. If the item x is a solution to the search problem, then f(x)=1. if the item x isnt a solution, then f(x)=0. The search problem consists of finding any item x0 such that f(x0)=1.

## Quantum Oracle
An oracle in quantum computing is a fundamental concept used to encapsulate a classical function into a quantum operation, enabling algorithms to leverage quantum mechanics for enhanced computation. 


Read more about Oracles: https://learn.microsoft.com/en-us/azure/quantum/concepts-oracles

## Process
To implement **Grover's algorithm** to solve a search problem

### 1. Transform the Problem into a Grover’s Task

To apply Grover’s algorithm, first reformulate your problem into a **Grover's task**.

For instance, if you want to find the factors of an integer \( M \), you can define a function:

```math
f_M(x) = \mathbf{1}[r],
```

where:
- \( \mathbf{1}[r] = 1 \) if \( r = 0 \)
- \( \mathbf{1}[r] = 0 \) if \( r \neq 0 \)
- \( r \) is the remainder of \( M / x \)

In this setup, the inputs \( x_i \) for which \( f_M(x_i) = 1 \) are the factors of \( M \). This reformulation converts the original problem into a Grover’s task.

### 2. Implement the Grover’s Task as a Quantum Oracle

The next step is to implement the function \( f(x) \) as a **quantum oracle**. This oracle marks the correct inputs (the solution space) by flipping the sign of the amplitude associated with the desired result.

### 3. Apply Grover’s Algorithm

With the quantum oracle defined, use **Grover's algorithm** to iteratively amplify the probability of the correct result. The algorithm allows you to efficiently search for the desired input(s), and interpret the output after measurement.

## Grover's Algorithm
1.  **Initialization:** Start with $n$ qubits in the $|0\rangle$ state.
2.  **Superposition:** Apply Hadamard gates ($H$) to all qubits to create a uniform superposition of all possible states.
    $$ |s\rangle = \frac{1}{\sqrt{N}} \sum_{x=0}^{N-1} |x\rangle $$
3.  **The Grover Iteration:** Repeat the following two steps $k \approx \frac{\pi}{4}\sqrt{N}$ times:
    *   **Oracle ($O$):** Marks the target state $|w\rangle$ by flipping its phase (multiplying its amplitude by -1).
        $$ O|x\rangle = (-1)^{f(x)}|x\rangle $$
        where $f(w) = 1$ and $f(x) = 0$ for $x \neq w$.
    *   **Diffuser ($D$):** Also known as the "Inversion about the mean". It amplifies the amplitude of the marked state and suppresses the others. Geometrically, this reflects the state vector about the uniform superposition vector $|s\rangle$.
        $$ D = 2|s\rangle\langle s| - I $$
4.  **Measurement:** Measure the qubits. The probability of collapsing to the marked state $|w\rangle$ is near 1.