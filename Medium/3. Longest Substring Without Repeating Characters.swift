import Foundation

class SolutionTimeExceeded {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLenght = 0
        let array = Array(s)
        var dict: [String.Element: Int] = [:]
        var left = 0
        var right = 0
        
        while right < s.count {
            let c = array[right]
            
            if dict[c] != nil {
                left = max(dict[c]! + 1, left)
            }
            
            dict[c] = right
            maxLenght = max(maxLenght, right - left + 1)
            
            right += 1
        }
        
        return maxLenght
    }
    
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLenght = 0
        var dict: [String.Element: Int] = [:]
        var lastPos = -1
        var i = 0
        
        for c in s {
            if dict[c] != nil && dict[c]! > lastPos {
                lastPos = dict[c]!
            }
            
            maxLenght = max(i - lastPos, maxLenght)
            dict[c] = i
            i += 1
        }
        
        
        return maxLenght
    }
}
