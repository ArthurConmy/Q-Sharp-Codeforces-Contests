
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans = -1;
    
        using(q1 = Qubit())
        {
            using(q2 = Qubit())
            {
                H(q1);
                CNOT(q1,q2);
                
                unitary(q1);
                
                CNOT(q1,q2);
                
                H(q1);
                
                if(M(q1) == Zero)
                {
                    if(M(q2) == Zero)
                    {
                        set ans = 0;
                    }
                    
                    else
                    {
                        set ans = 1;
                    }
                }
                
                else
                {
                    if(M(q2) == Zero)
                    {
                        set ans = 3;
                    }
                    
                    else
                    {
                        set ans = 2;
                    }
                }
            
                Reset(q2);        
            }
            Reset(q1);
        }
        
        return ans;
    }
}
