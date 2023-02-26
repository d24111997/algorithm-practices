import UIKit

/*
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.

  

 Example 1:


 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
 Example 2:


 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
 Example 3:


 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.
  

 Constraints:

 The number of the nodes in the list is in the range [0, 104].
 -105 <= Node.val <= 105
 pos is -1 or a valid index in the linked-list.
  

 Follow up: Can you solve it using O(1) (i.e. constant) memory?
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        if head!.val == Int.max {
            return true
        }
        
        head!.val = Int.max
        return hasCycle(head!.next)
    }
    
    func failed_hasCycle(_ head: ListNode?) -> Bool {
        guard var currentNode = head else { return false }
        var array: [Int] = []
        while currentNode.next != nil {
            if array.contains(currentNode.val) {
                return true
            }
            array.append(currentNode.val)
            currentNode = currentNode.next!
        }
        return false
        
    }
}

// P/S: Not clearly understand the question. Not understand why the failed solution failed on "[-21,10,17,8,4,26,5,35,33,-7,-16,27,-12,6,29,-12,5,9,20,14,14,2,13,-24,21,23,-21,5]

