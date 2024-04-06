import Foundation

class Solution {
    func threeSum(_ numbers: [Int]) -> [[Int]] {
        var values = [Int: (Int, Int)]()
        for (index, number) in numbers.enumerated() {
            var temp: [Int?] = numbers
            temp[index] = nil
            
            values[number] = twoSum(temp, 0 - number)
        }
        return values.map {
            [$0.key, $0.value.0, $0.value.1]
        }
    }
    
    func twoSum(_ numbers: [Int?], _ target: Int) -> (Int,Int)? {
        var indices = [Int: Int]()
        
        for (index, number) in numbers.enumerated() {
            guard let number else { continue }
            let complement = target - number
            
            if let complementIndex = indices[complement] {
                return (complementIndex, index)
            }
            indices[number] = index
        }
        return nil
    }
}

let A = Solution().threeSum([-1,0,1,2,-1,-4])
print(A)
print(A == [[-1,-1,2],[-1,0,1]])
