import Foundation

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var temp = num
        var steps = 0
        
        while temp > 0 {
            if temp % 2 == 0 {
                temp /= 2
                steps += 1
            } else {
                temp -= 1
                steps += 1
            }
        }
        return steps
    }
}