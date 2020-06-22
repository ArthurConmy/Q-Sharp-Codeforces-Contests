namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            let N = Length(qs);
            
            H(qs[0]);
            
            for(i in 0 .. N-2)
            {
                let controls = qs[0..i];
            
                Controlled X(controls,qs[i+1]);
            }
        }
    }
}
