namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            mutable phi = false;
            
            using(q1=Qubit())
            {
                Controlled X(qs,q1);
                X(qs[0]);
                X(qs[1]);
                Controlled X(qs,q1);
                X(qs[0]);
                X(qs[1]);
                
                if(M(q1) == One)
                {
                    set phi = true;
                }
                
                Reset(q1);
            }
                
            if(phi)
            {
                CNOT(qs[0],qs[1]);
                H(qs[0]);
                
                if(M(qs[0]) == Zero)
                {
                    return 0;
                }
                
                else
                {
                    return 1;
                }
            }
            
            else
            {
                CNOT(qs[0],qs[1]);
                H(qs[0]);
                
                if(M(qs[0]) == Zero)
                {
                    return 2;
                }
                
                else
                {
                    return 3;
                }
            }
            
            return 0;
        }
    }
}
