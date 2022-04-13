import Foundation

// * Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
}
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var left = l1
        var right = l2
        var curr = dummy
        var carry = 0
        
        while left != nil || right != nil {
            let x = left?.val ?? 0
            let y = right?.val ?? 0
            let sum = carry + x + y
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            if let next = curr.next {
                curr = next
            }
            left = left?.next
            right = right?.next
        }
        if carry > 0 {
            curr.next = ListNode(carry)
        }
        return dummy.next
    }
}
