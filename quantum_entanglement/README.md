# Quantum Entanglement
Manipuatling and measuring qubits and to demonstrate the effects of superposition and entanglement.

## Goal
1. Create Q# operations to initialize a qubit to a desired state.
2. Put a qubit in superposition.
3. Entangle a pair of qubits.
4. Measure a qubit and observe the results.

## Init qubit to known state
The first step is to define a Q# operation that initializes qubit to a known state. This operation can be called to set a qubit to a classical state, meaning that when measures it either returns Zero 100% of the time or One 100% of the time.
```C#
import Microsoft.Quantum.Intrinsic.*;
import Microsoft.Quantum.Canon.*;

operation SetQubitState(desired : Result, target : Qubit) : Unit {
    if desired != M(target) {
        X(target);
    }
}
```
The `SetQubitState` operation:

Takes two parameters: a type Result, named desired, that represents the desired state for the qubit to be in (Zero or One), and a type Qubit.
Performs a measurement operation, M, which measures the state of the qubit (Zero or One) and compares the result to the value specified in desired.
If the measurement doesn't match the compared value, it runs an X operation, which flips the state of the qubit to where the probabilities of a measurement returning Zero and One are reversed. This way, SetQubitState always puts the target qubit in the desired state.

## Put a qubit in superposition
At the start, the qubits are set to a known classical state (Zero or One). Putting a qubit in superposition state returns Zero 50% of the time and One 50% of the time on measuring the qubit. i.e, each qubit has an equal probability of being measured as Zero or One. 

To put a qubit in superposition, Q# provides the `Hadamard Operation`. Flips the qubit halfway into a state of equal probabilites of Zero or One. When measured, the qubit should return roughly an equal number of Zero and One results.

## Entangle two qubits
Entangled qubits - whatever operation happens to one qubit, also happend to the entangled qubit. Allows us to know the resulting state of a qubit without having to measure it, just by  measuring the state of the other qubit.

`CNOT` (Controlled NOT) operation - Given two qubits, flips the second qubit if the first qubit is ONE. So in this case, the two qubits (assume A and B) will have the same number of ZEROs and same number of ONEs (number of ZEROs mean the number of times the measurement of the qubit resulted in a ZERO).

## Noob Summary
- We ran a total of 1000 experiments

- Each experiment returns ZERO or ONE for the qubit we measure.

- On applying the Hadamard operation on a qubit, we might get a ZERO or ONE during measurement, since the qubit is put in superposition. Wicked part - out of the total 1000 experiments, almost 50% of the measurements return ZERO and the other 50 return ONE ! 

- On applying entanglement (CNOT), we get the same number of zeros and ones for both the qubits, but the number of ZEROs and ONEs for each qubit remains 50-50 (Here again the number of ZEROs mean the number of times the measurement of the qubit resulted in a ZERO).