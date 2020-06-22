
namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            // your code here
            
            let N = Length(qs);
            
            mutable ans = 1;
            
            for(i in 0..N-1)
            {
                X(qs[i]);
            }
            
            using(q=Qubit())
            {
                Controlled X(qs,q);
                if(M(q)==One)
                {
                    set ans=0;
                    X(q);    
                }
            }
            
            return ans;
        }
    }
}
