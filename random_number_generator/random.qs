import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

operation GenerateRandomBit() : Result {
    // Allocate a qubit.
    use q = Qubit();

    // Set the qubit into superposition of 0 and 1 using the Hadamard 
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

// Operation to generate a random number between 0 and 1
operation GenerateRandomNumberInRange(max: Int) : Int {
    // Determine the number of bits required to represent the max value
    mutable bits = [];
    let nBits = BitSizeI(max);
    for idxBit in 1..nBits {
        bits += [GenerateRandomBit()];
    }
    let sample = ResultArrayAsInt(bits);

    // Return random number is it is in the requested range
    // Else generate it again if it is outside the range
    return sample > max ? GenerateRandomNumberInRange(max) | sample;
}

operation Main() : Int {
    let max = 100;
    Message($"Sampling a random number between 0 and {max}: ");
    
    // Generate a random number between 0 and max
    return GenerateRandomNumberInRange(max);
}