//Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
//The overall run time complexity should be O(log (m+n)).
//
// 
//
//Example 1:
//
//Input: nums1 = [1,3], nums2 = [2]
//Output: 2.00000
//Explanation: merged array = [1,2,3] and median is 2.
//Example 2:
//
//Input: nums1 = [1,2], nums2 = [3,4]
//Output: 2.50000
//Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var array = [Int](repeating: 0, count: nums1.count + nums2.count)
        
        var A = nums1.count - 1
        var B = nums2.count - 1
        var C = array.count - 1
        
        while C >= 0 {
            if B < 0 || A >= 0 && nums1[A] > nums2[B] {
                array[C] = nums1[A]
                A -= 1
            } else {
                array[C] = nums2[B]
                B -= 1
            }
            C -= 1
        }
        let lenght = array.count
        let mid = lenght / 2
        return lenght % 2 == 0 ? Double(array[mid-1] + array[mid]) / 2 : Double(array[mid])
    }
}