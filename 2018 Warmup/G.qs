namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit, k : Int) : ()
    {
        body
        {
            // your code here
            
            Controlled X([x[k]],y);
        }
    }
}
