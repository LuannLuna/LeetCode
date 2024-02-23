//Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
//The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
//You must write an algorithm that runs in O(n) time and without using the division operation.
//
//
//
//Example 1
//Input: nums = [1,2,3,4]
//Output: [24,12,8,6]


import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 1, count: n)
        var leftProduct = 1
        var rightProduct = 1


        for i in 0..<n {
            // Calcula os produtos à esquerda
            result[i] *= leftProduct
            leftProduct *= nums[i]

            // Calcula os produtos à direita
            result[(n-1)-i] *= rightProduct
            rightProduct *= nums[(n-1)-i]
        }

        return result
    }
}

let solution = Solution()
print(solution.productExceptSelf([1,2,3,4]))
