/*

You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.

Evaluate the expression. Return an integer that represents the value of the expression.

Note that:

The valid operators are '+', '-', '*', and '/'.
Each operand may be an integer or another expression.
The division between two integers always truncates toward zero.
There will not be any division by zero.
The input represents a valid arithmetic expression in a reverse polish notation.
The answer and all the intermediate calculations can be represented in a 32-bit integer.

*/

final class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var queue = [Int]()
        for token in tokens {
            if let value = Int(token) {
                queue.append(value)
                continue
            }
            let a = queue.removeLast()
            let b = queue.removeLast()
            switch token {
                case "+": queue.append(a+b)
                case "-": queue.append(b-a)
                case "*": queue.append(a*b)
                default: queue.append(b/a)
            }
        }
        return queue.removeLast()
    }
}