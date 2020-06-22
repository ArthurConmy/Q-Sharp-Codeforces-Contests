
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // your code here
        
        let two_thirds_pi = 2.0*1.04719755;
        mutable k_theta = theta;
        mutable k = 1;
        
        for(do_this in 1..100) // while(k_theta < third_pi)
        {
            if(k_theta < two_thirds_pi)
            {
                set k = k+1;
                set k_theta = k_theta + theta;
            }
        }
        
        mutable is_ry = false;
        
        using(qs = Qubit[10])
        {
            for(i in 0..9)
            {   
                for(do_this_2 in 1..k)
                {
                    unitary(qs[i]);
                }
                
                if(M(qs[i]) == One)
                {
                    set is_ry = true;
                }
            }
            
            ResetAll(qs);
        }
        
        if(is_ry)
        {
            return 1;
        }
        
        else
        {
            return 0;
        }
    }
}
