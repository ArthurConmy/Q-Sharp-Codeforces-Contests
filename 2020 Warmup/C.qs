
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (qs : Qubit[]) : Unit {
        using (anc = Qubit()) { 
            // Using the repeat-until-success pattern to prepare the right state
            repeat {
                H(qs[0]);
                H(qs[1]);
                X(qs[0]);
                X(qs[1]);
                Controlled X(qs, anc);
                X(qs[0]);
                X(qs[1]);
                let res = M(anc);
                
                if(res==One)
                {
                    X(anc);
                }
            } 
            until (res == Zero)
            fixup {
                ResetAll(qs);
            }
        }
    }
}
