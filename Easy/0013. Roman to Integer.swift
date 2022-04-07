//
//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9. 
//X can be placed before L (50) and C (100) to make 40 and 90. 
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given a roman numeral, convert it to an integer.
//
// 
//
//Example 1:
//
//Input: s = "III"
//Output: 3
//Explanation: III = 3.


import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        var array: [Character] = s.reversed()
        var number = 0
        var needToJump = false
        while !array.isEmpty {
            if let c = array.popLast() {
                if needToJump {
                    needToJump = false
                    continue
                }
                switch c {
                case "V": number += 5
                case "L": number += 50
                case "D": number += 500
                case "M": number += 1000
                case "I":
                    if let last = array.last {
                        switch last {
                        case "V":
                            number += 4
                            needToJump.toggle()
                        case "X":
                            needToJump.toggle()
                            number += 9
                        default: number += 1
                        }
                    } else {
                        number += 1
                    }
                case "X":
                    if let last = array.last {
                        switch last {
                        case "L":
                            needToJump.toggle()
                            number += 40
                        case "C":
                            needToJump.toggle()
                            number += 90
                        default: number += 10
                        }
                    } else {
                        number += 10
                    }
                case "C":
                    if let last = array.last {
                        switch last {
                        case "D":
                            needToJump.toggle()
                            number += 400
                        case "M":
                            needToJump.toggle()
                            number += 900
                        default: number += 100
                        }
                    } else {
                        number += 100
                    }
                default: break
                }
            }
        }
        
        return number
    }
}
