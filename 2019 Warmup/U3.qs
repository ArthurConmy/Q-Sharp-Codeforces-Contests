
namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        // your code here
        
        let N = Length(qs);
        
        for(i in 0..N-2)
        {
            X(qs[N-1]);
            
            Controlled X([qs[N-1]],qs[i]);
            
            X(qs[N-1]);
            
            Controlled H([qs[N-1]],qs[i]);
        }
    }
}
