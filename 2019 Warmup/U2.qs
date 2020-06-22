
namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        // your code here
        
        let N = Length(qs);
        
        for(i in 0..N-1)
        {
            if(i!=1)
            {
                H(qs[i]);    
            }
        }
    }
}
