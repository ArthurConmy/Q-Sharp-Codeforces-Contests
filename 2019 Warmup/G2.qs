
namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            // your code here
            
            let N = Length(x);
            
            for(i in 0..N-1)
            {
                X(x[i]);
            }
            
            Controlled X(x,y);
            X(y);
            
            for(i in 0..N-1)
            {
                X(x[i]);
            }
        }
        adjoint auto;
    }
}
