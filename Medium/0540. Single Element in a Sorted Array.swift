// Return the single element that appears only once.

// Input: nums = [1,1,2,3,3,4,4,8,8]
// Output: 2

import Foundation

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        nums.forEach {
            dict[$0] = (dict[$0] ?? 0) + 1
        }
        if let filtered = dict.filter({ $1 == 1 }).first {
            return filtered.key
        }
        
        return 0
    }
}
