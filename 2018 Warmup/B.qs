namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], index : Int) : ()
    {
        body
        {
            if(index==0)
            {
                H(qs[0]);
                CNOT(qs[0],qs[1]);
            }
            
            if(index==1)
            {
                H(qs[0]);
                CNOT(qs[0],qs[1]);
                Z(qs[1]);
            }
            
            if(index==2)
            {
                H(qs[0]);
                
                X(qs[0]);
                CNOT(qs[0],qs[1]);
                X(qs[0]);
            }
            
            if(index==3)
            {
                H(qs[0]);
                
                Z(qs[0]);
                
                X(qs[0]);
                CNOT(qs[0],qs[1]);
                X(qs[0]);
            }
        }
    }
}
