namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            // your code here
            
            mutable ans = true;
 
            // Allocate an array of N qubits for the input register x and one qubit for the answer register y.
            
            using ((x, y) = (Qubit[N], Qubit())) 
            {
                // Newly allocated qubits start in the |0⟩ state.
                // The first step is to prepare the qubits in the required state before calling the oracle.
                // Each qubit of the input register has to be in the |+⟩ state.
                // ...
                
                for(i in 0..N-1)
                {
                    H(x[i]);
                }
        
                // The answer register has to be in the |-⟩ state.
                // ...
                
                // really??
                
                X(y);
                H(y);
        
                // Apply the oracle to the input register and the answer register.
                // ...
                
                Uf(x,y);
        
                // Apply a Hadamard gate to each qubit of the input register again.
                // ...
                
                for(i in 0..N-1)
                {
                    H(x[i]);
                }
        
                // Measure each qubit of the input register in the computational basis using the M operation.
                // If any of the measurement results is One, the function implemented by the oracle is balanced.
                // ...
                
                for(i in 0..N-1)
                {
                    if(M(x[i]) == One)
                    {
                        set ans = false;
                        X(x[i]);
                    }
                }
        
                // Before releasing the qubits make sure they are all in the |0⟩ state.
                // ...
                
                Reset(y);
            }
            
            // Return the answer.
            // ...
            
            return ans;
        }
    }
}
