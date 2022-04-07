//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//
//
//Example 1:
//
//Input: strs = ["flower","flow","flight"]
//Output: "fl"

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.count == 0 {
                return ""
            }
            
            var output = strs[0]
            
            for i in 1..<strs.count {
                output = commonPrefix(output, strs[i])
            }
            
            return output
        }
        
        func commonPrefix(_ str1: String, _ str2: String) -> String {
            var out = ""
            var i = 0
            while i < str1.count && i < str2.count && str1[String.Index.init(encodedOffset: i)] == str2[String.Index.init(encodedOffset: i)] {
                out = out + String(str1[String.Index.init(encodedOffset: i)])
                i+=1
            }
            
            return out
        }
}

print(Solution().longestCommonPrefix(["flower","flow","flight"]))
