//Example 1:
//
//Input: nums = [1,2,3,1]
//Output: true
//Example 2:
//
//Input: nums = [1,2,3,4]
//Output: false
//Example 3:
//
//Input: nums = [1,1,1,3,3,4,3,2,4,2]
//Output: true
                                        
import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict: [Int: Int] = [:]
        nums.forEach {
            dict[$0] = (dict[$0] ?? 0) + 1
        }
        return dict.contains {
            return $0.value > 1
        }
    }
}
