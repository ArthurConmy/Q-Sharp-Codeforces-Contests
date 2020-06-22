
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit, b : Int[]) : ()
    {
        body
        {
            // your code here
            
            let N = Length(b);
            
            for(i in 0..N-1)
            {
                if(b[i]==1)
                {
                    Controlled X([x[i]],y);
                }
                
                if(b[i]==0)
                {
                    X(x[i]);
                    Controlled X([x[i]],y);    
                    X(x[i]);
                }
            }
        }
    }
}
