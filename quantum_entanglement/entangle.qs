import Microsoft.Quantum.Intrinsic.*;
import Microsoft.Quantum.Canon.*;

// Operation to initialize a qubit to a known state
operation SetQubitState(desired : Result, target : Qubit) : Unit {
    if desired != M(target) {
        X(target);
    }
    // M -> Meausres the state of the qubit and compares the result to the value specified in `desired`
    // X -> Flips the state of the qubit where the probabilites of measurement returning 0 and 1 are reversed
}

operation Main() : (Int, Int, Int, Int) {
    mutable numOnesQ1 = 0;
    mutable numOnesQ2 = 0;
    let count = 1000;

    // Allocate the qubits
    use (q1, q2) = (Qubit(), Qubit());
    for test in 1..count {
        // Set Q1 to One and Q2 to zero and test if the setQubitState operation is accurate
        SetQubitState(One, q1);
        SetQubitState(Zero, q2);

        //Apply superposition - Hadamard Operation
        H(q1);
        //Apply the CNOT operation
        CNOT(q1, q2); // If q1 returns ZERO, 100% q2 will also return ZERO

        // measure each qubit
        let resultQ1 = M(q1);
        let resultQ2 = M(q2);
        // Count the number of 1s returned:
        if resultQ1 == One {
            numOnesQ1 += 1;
        }
        if resultQ2 == One {
            numOnesQ2 += 1;
        }
    }

    //reset the qubits
    SetQubitState(Zero, q1);
    SetQubitState(Zero, q2);

    // No of times that |0> and |1> is returned.
    Message($"Q1 - Zeros: {count - numOnesQ1}");
    Message($"Q1 - Ones: {numOnesQ1}");
    Message($"Q2 - Zeros: {count - numOnesQ2}");
    Message($"Q2 - Ones: {numOnesQ2}");

    return (count - numOnesQ1, numOnesQ1, count - numOnesQ2, numOnesQ2);
}
    