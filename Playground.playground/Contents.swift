import Foundation

class Solution {
    func threeSum(_ numbers: [Int]) -> [[Int]] {
        var values = [Int: [(Int, Int)]]()
        for (index, number) in numbers.enumerated() {
            var temp: [Int] = numbers
            temp.remove(at: index)
            let target = 0 - number
            let two = twoSum(temp, target)
            values[number, default: []].append(contentsOf: two)
        }
        var result: Set<[Int]> = Set()
        values.forEach { elm in
            elm.value.forEach { (A, B) in
                result.insert([elm.key, A, B])
            }
        }
        
        let array = Array(result)
        return removeDuplicateRows(from: array)
    }
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [(Int,Int)] {
        var indices = [Int: Int]()
        var result = [(Int, Int)]()
        
        for (index, number) in numbers.enumerated() {
            let complement = target - number
            
            if let complementIndex = indices[complement] {
                result.append((numbers[complementIndex], number))
            }
            indices[number] = index
        }
        
        return result
    }
    
    func removeDuplicateRows(from matrix: [[Int]]) -> [[Int]] {
        var rowSet = Set<[Int]>()
        matrix.forEach {
            rowSet.insert($0.sorted())
        }
        return Array(rowSet)
    }
}

//let A = Solution().threeSum([-1,0,1,2,-1,-4])
//print(A)
//print(A == [[-1,-1,2],[-1,0,1]])

var A = Solution().threeSum([-1,0,1,2,-1,-4,-2,-3,3,0,4])

for index in 0..<A.count {
    A[index] = A[index].sorted()
}
print(A.count)
print([[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]].count)
print(A == [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]])
