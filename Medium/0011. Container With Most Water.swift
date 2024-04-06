
/*
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.
*/

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