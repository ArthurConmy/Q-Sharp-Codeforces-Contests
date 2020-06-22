
namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
        // your code here
        
        let N = Length(register!);
        
        for(i in (N-2)..(-1)..0)
        {
            Controlled X(register![0..i],register![i+1]);
        }
        
        X(register![0]);
    }
}
