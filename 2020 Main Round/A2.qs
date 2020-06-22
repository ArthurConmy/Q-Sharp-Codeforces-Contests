
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans = -1;
        
        using (q1 = Qubit()) {
        
            using (q2 = Qubit()) {
                
                //X(q1);
                
                H(q1);
                X(q2);
                H(q2);
                
                unitary([q1,q2]); // SWAP(q2,q1);
                
                H(q1);
                H(q2);
                
                // DumpMachine();
                
                if(M(q1) == One)
                {
                    if(M(q2) == One)
                    {
                        set ans = 1;
                    }
                    
                    else
                    {
                        set ans = 3;
                    }
                }
                
                Reset(q2);
            }
            
            Reset(q1);
        }
        
        if(ans == -1)
        {
            // either I x I or CNOT 21
            
            using(q1 = Qubit())
            {
                using(q2 = Qubit())
                {
                    X(q2);
                    unitary([q1,q2]);
                    
                    if(M(q1) == One)
                    {
                        set ans = 2;
                    }
                    
                    else
                    {
                        set ans = 0;
                    }
                    
                    Reset(q2);
                }
                Reset(q1);
            }
        }
        
        return ans;
    }
}
