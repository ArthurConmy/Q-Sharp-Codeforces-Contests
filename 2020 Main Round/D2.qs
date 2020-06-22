
namespace Solution {
    open Microsoft.Quantum.MachineLearning;
    open Microsoft.Quantum.Math;
 
    operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        // your code here
        
        let parameters = [0.0, 0.75];
        
        return ((4, parameters), [ControlledRotation((0, [1]), PauliX, 0), ControlledRotation((1, [0]), PauliX, 0)],
                ([PI()], 0.0));
    }
}
