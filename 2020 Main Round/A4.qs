
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
 
    operation Solve (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans = 1;
        
        using(q1 = Qubit())
        {
            using(q2 = Qubit())
            {
                H(q1);
                Controlled unitary([q1],(2.0*PI(),q2));
                H(q1);
            
                if(M(q1) == One)
                {
                    set ans = 0;    
                }
            
                Reset(q2);
            }
            
            Reset(q1);
        }
        
        return ans;
    }
}
