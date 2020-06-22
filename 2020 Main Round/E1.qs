
namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
 
    operation Solve (p : Int, inputRegister : LittleEndian) : Unit is Adj+Ctl {
        // your code here
        
        for(i in 1..(p%4))
        {
            QFTLE(inputRegister);
        }
    }
}
