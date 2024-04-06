/*
Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

The tests are generated such that there is exactly one solution. You may not use the same element twice.

Your solution must use only constant extra space.
*/


class Solution {
    // O(nˆ2)
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        for i in 0..<numbers.count-1 {
            for j in i+1..<numbers.count {
                if numbers[i] + numbers[j] == target {
                    return [i+1, j+1]
                }
            }
        }
        return result
    }



    // O(n)
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var indices = [Int: Int]()

        for (index, number) in numbers.enumerated() {
            let complement = target - number

            if let complementIndex = indices[complement] {
                return [complementIndex+1, index+1]
            }
            indices[number] = index
        }
        return []
    }
}