
namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            // your code here
            
            let N = Length(x);
            
            using(qs = Qubit[4])
            {
                for(i in 0..3)
                {
                    X(qs[i]);
                    
                    if(i<N)
                    {
                        if(i+i<N-1)
                        {
                            X(x[i]);
                            
                            Controlled X([x[i],x[N-1-i]],qs[i]);
                        
                            X(x[i]);
                            X(x[N-1-i]);
                            
                            Controlled X([x[i],x[N-1-i]],qs[i]);
                            
                            X(x[N-1-i]);
                        }
                    }
                }
                
                Controlled X(qs,y);
                
                for(i in 0..3)
                {
                    X(qs[i]);
                    
                    if(i<N)
                    {
                        if(i+i<N-1)
                        {
                            X(x[i]);
                            
                            Controlled X([x[i],x[N-1-i]],qs[i]);
                        
                            X(x[i]);
                            X(x[N-1-i]);
                            
                            Controlled X([x[i],x[N-1-i]],qs[i]);
                            
                            X(x[N-1-i]);
                        }
                    }
                }
            }
        }
        adjoint auto;
    }
}
