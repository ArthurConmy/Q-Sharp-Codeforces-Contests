
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans = 1;
        
        using (q1 = Qubit()) {
        
            using (q2 = Qubit()) {
                
                X(q1);
                H(q1);
                X(q2);
                H(q2);
                unitary([q1,q2]);
                H(q1);
                H(q2);
                
                if(M(q2) == One)
                {
                    set ans = 0; // return 0;
                }
                
                Reset(q2);
            }
            
            Reset(q1);
        }
        
        return ans;
    }
}
