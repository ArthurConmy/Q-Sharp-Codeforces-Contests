namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    function FindFirstDiff (bits1 : Bool[], bits2 : Bool[]) : Int 
    {
        for (i in 0 .. Length(bits1) - 1) {
            if (bits1[i] != bits2[i]) {
                return i;
            }
        }
        return -1;
    }
    
    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        body
        {
 
            let firstDiff = FindFirstDiff(bits0, bits1);
            let res = M(qs[firstDiff]) == One;
 
            return res == bits0[firstDiff] ? 0 | 1;
        }
    }
}
