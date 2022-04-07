//Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
//
//Example 1:
//Input: head = [1,1,2]
//Output: [1,2]


// * Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var curr: ListNode? = head
        while curr?.next != nil {
            if curr?.val == curr?.next?.val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return head
    }
}
