
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (qs : Qubit[]) : Unit {
        // your code here
        
        let N = Length(qs);
        mutable finished_up = false;
        
        repeat {
            for(i in 0..N-1)
            {
                H(qs[i]);
            }
            
            using(q=Qubit())
            {
                Controlled X(qs,q);
                
                if(M(q)==Zero)
                {
                    set finished_up = true;
                }
                
                Reset(q);
            }
        }
        until (finished_up)
        fixup {
            for(i in 0..N-1)
            {
                X(qs[i]);
            }
        }
    }
}
