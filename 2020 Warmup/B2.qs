
namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
        // your code here
        
        let N = Length(register!);
        
        for(i in (N-2)..(-1)..0)
        {
            for(j in 0..i)
            {
                X(register![j]);
            }
        
            Controlled X(register![0..i],register![i+1]);
            
            for(j in 0..i)
            {
                X(register![j]);
            }
        }
        
        X(register![0]);
    }
}
