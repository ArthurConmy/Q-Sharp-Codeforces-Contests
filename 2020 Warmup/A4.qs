
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans=1;
        
        using (q1=Qubit())
        {
            using (q2=Qubit())
            {
                unitary([q1,q2]);
                
                if(M(q2) == One)
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
