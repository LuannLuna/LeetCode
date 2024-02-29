// Input: temperatures = [73,74,75,71,69,72,76,73]
// Output:                [1, 1, 4, 2, 1, 1, 0, 0]
import Foundation

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var ans = Array(repeating: 0, count: n)
        for i in 0..<n - 1 {
            var current = 1
            for j in (i+1)..<n {
                if temperatures[j] > temperatures[i] {
                    ans[i] = current
                    break
                }
                current += 1
            }
        }
        return ans
    }
}