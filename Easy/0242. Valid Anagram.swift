// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once. 
// Example 1:

// Input: s = "anagram", t = "nagaram"
// Output: true

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict = [Character: Int]()
        let ar = Array(s)
        let ray = Array(t)
        for i in 0..<ar.count {
            let a = ar[i]
            let b = ray[i]
            dict[a, default: 0] += 1
            dict[b, default: 0] -= 1
        }
        for el in dict {
            if el.value != 0 {
                return false
            }
        }
        return true
    }
}