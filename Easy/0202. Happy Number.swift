// Input: n = 19
// Output: true
// Explanation:
// 12 + 92 = 82
// 82 + 22 = 68
// 62 + 82 = 100
// 12 + 02 + 02 = 1

import Foundation

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}

class Solution {
    func isHappy(_ n: Int) -> Bool {
        let array = n.digits
        let sum = array.reduce(0) { partialResult, elm in
            return partialResult + (elm * elm)
        }
        
        if sum == 1 { return true }
        return sum == 4 ? false : isHappy(sum)
        
    }
}