// Import a quantum library
import Microsoft.Quantum.Diagnostics.*;

// Define a quantum operation, its input and output values
// In this case, out operation is Main, takes no arguments and returns Result values, either 0 or 1

operation Main(): (Result, Result) {
    // Allocate two qubits
    use (q1, q2) = (Qubit(), Qubit());
    // Put one qubit into superposition
    H(q1); // -> 50% chance of being measured as 0 or 1

    // Entangle the quibits by using controlled-NOT operation (cnot).
    // q1 -> control q bit, q2 -> target q bit
    CNOT(q1, q2);

    // Output the state of our q program
    DumpMachine();

    // Measuring q1 and q2 and storing the result in m1 and m2
    let (m1, m2) = (M(q1), M(q2));

    // Reset q1 and q2 to the 0 state
    Reset(q1);
    Reset(q2);

    // Return the measured results
    return (m1, m2)
}