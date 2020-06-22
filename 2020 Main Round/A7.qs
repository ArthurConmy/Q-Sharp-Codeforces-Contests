
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable is_y = false;
    
        using(q1 = Qubit())
        {
            using(q2 = Qubit())
            {
                H(q1);
    
                Controlled unitary([q1],q2);
                Controlled unitary([q1],q2);
    
                H(q1);
    
                if(M(q1) == Zero)
                {
                    set is_y = true;
                }
    
                Reset(q2);        
            }
            Reset(q1);
        }
    
        mutable ans = -1;
    
        if(is_y)
        {
            using(q1 = Qubit())
            {
                using(q2 = Qubit())
                {
                    H(q1);
                    CNOT(q1,q2); // q1-q2 state is |00> + i|11>
                    Controlled S([q1],q2);
    
                    Controlled unitary([q1],q2);
    
                    H(q1);
    
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
        
        else
        {
            using(q1 = Qubit())
            {
                using(q2 = Qubit())
                {
                    H(q1);
                    CNOT(q1,q2); // q1-q2 state is |00> + i|11>
                    // Controlled S([q1],q2);
    
                    Controlled unitary([q1],q2);
    
                    H(q1);
    
                    if(M(q1) == One)
                    {
                        set ans = 3;
                    }
    
                    else
                    {
                        set ans = 1;
                    }
    
                    Reset(q2);
                }
    
                Reset(q1);
            }
        }
    
        return ans;
    }
}
