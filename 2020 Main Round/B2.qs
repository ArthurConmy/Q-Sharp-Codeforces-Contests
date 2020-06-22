
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        // your code here
        
        let arr = [[0], [0], [0, 3], [0, 3, 6], [0, 3, 6, 9, 12, 15], [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30], [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63], [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99, 102, 105, 108, 111, 114, 117, 120, 123, 126], [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99, 102, 105, 108, 111, 114, 117, 120, 123, 126, 129, 132, 135, 138, 141, 144, 147, 150, 153, 156, 159, 162, 165, 168, 171, 174, 177, 180, 183, 186, 189, 192, 195, 198, 201, 204, 207, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 243, 246, 249, 252, 255]];
        
        let N = Length(inputs);
        
        for(j in 0..Length(arr[N])-1)
        {
            for(b in 0..N-1)
            {
                if((arr[N][j]>>>b) % 2 == 0)
                {
                    X(inputs[b]);
                }
            }
            
            Controlled X(inputs,output);
            
            for(b in 0..N-1)
            {
                if((arr[N][j]>>>b) % 2 == 0)
                {
                    X(inputs[b]);
                }
            }
        }
    }
}
