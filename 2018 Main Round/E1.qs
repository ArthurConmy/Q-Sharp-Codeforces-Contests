
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable ans = new Int[N];
    
            using ((x, y) = (Qubit[N], Qubit())) 
            {
                for(i in 0..N-1)
                {
                    H(x[i]);
                }
                
                X(y);
                H(y);
                Uf(x,y);
                
                for(i in 0..N-1)
                {
                    H(x[i]);
                }
                
                for(i in 0..N-1)
                {
                    if(M(x[i]) == One)
                    {
                        set ans w/= i <- 1; // ans[i] = 1;
                    }
                    
                    else
                    {
                        set ans w/= i <- 0;
                    }
                }
                
                ResetAll(x);
                Reset(y);
            }
            
            return ans;
        }
    }
}
