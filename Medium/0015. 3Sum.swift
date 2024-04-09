/*

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

*/
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