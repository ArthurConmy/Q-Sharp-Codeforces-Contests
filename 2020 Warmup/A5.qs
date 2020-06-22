
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // your code here
        
        mutable ans=1;
        
        using(qs=Qubit[2])
        {
            H(qs[0]);
            Controlled unitary([qs[0]],qs[1]);
            H(qs[0]);
            
            if(M(qs[0]) == Zero)
            {
                set ans=0;
            }
            
            Reset(qs[0]);
            Reset(qs[1]);
        }
        
        return ans;
    }
}
