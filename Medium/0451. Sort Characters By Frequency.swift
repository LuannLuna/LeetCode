//Input: s = "tree"
//Output: "eert"
//Explanation: 'e' appears twice while 'r' and 't' both appear once.
//So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
                                        
import Foundation

class Solution {
    func frequencySort(_ s: String) -> String {
        var dict: [Character: Int] = [:]
        s.forEach { c in
            dict[c] = (dict[c] ?? 0) + 1
        }
        var result: String = ""
        dict.sorted { $0.value > $1.value }.forEach { elm in
            for i in 0..<elm.value {
                result.append(elm.key)
            }
        }
        return result
    }
}