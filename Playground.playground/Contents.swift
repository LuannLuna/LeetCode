import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var lhs = 0
        var rhs = height.count-1
        var maxValue = 0
        
        while lhs < rhs {
            let area = min(height[lhs], height[rhs]) * (rhs - lhs)
            maxValue = max(maxValue, area)
            if height[lhs] < height[rhs] {
                lhs += 1
            } else {
                rhs -= 1
            }
        }
        return maxValue
    }
}
//                        0 1 2 3 4 5 6 7 8
print(Solution().maxArea([1,8,6,2,5,4,8,3,7]) == 49)
