
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans = -1;
        
        using (q1 = Qubit())
        {
            using (q2 = Qubit()) 
            {
                H(q1);
                
                unitary(q1); // H(q1); //
                
                H(q1);
                
                unitary(q1); // H(q1); //
                
                if(M(q1) == One)
                {
                    set ans = 1;
                }
                
                else
                {
                    set ans = 0;
                }
                
                // DumpMachine();
                    
                Reset(q2);
            }
                
            Reset(q1);
        }
        
        return ans;
    }
}
