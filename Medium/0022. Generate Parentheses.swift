/*
0022. Generate Parentheses
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.


                        (0, 0, '')
                            |
                       (1, 0, '(')
                      /           \
             (2, 0, '((')      (1, 1, '()')
                /                   \
          (2, 1, '(()')           (2, 1, '()(')
              /                        \
       (2, 2, '(())')                (2, 2, '()()')
           |                                 |
   res.append('(())')             res.append('()()')
*/

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        let length = n * 2
        var combinations = Set<String>()

        func backtrack(lhs: Int, rhs: Int, str: String) {
            if str.count == length { combinations.insert(str) }
            if lhs < n {
                backtrack(lhs: lhs + 1, rhs: rhs, str: str + "(")
            } 
            if rhs < lhs {
                backtrack(lhs: lhs, rhs: rhs + 1, str: str + ")")
            }
        }
        
        backtrack(lhs: 0, rhs: 0, str: "")
        return Array(combinations)
   }
}
