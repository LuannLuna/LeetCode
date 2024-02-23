//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]


import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequence: [Int: Int] = [:]
        nums.forEach {
            frequence[$0, default: 0] += 1
        }
        return frequence.sorted { $0.value > $1.value }.prefix(k).map(\.key)
    }
}