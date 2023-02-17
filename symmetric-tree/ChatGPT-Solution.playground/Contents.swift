import UIKit

var greeting = "Hello, playground"

/*
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

  

 Example 1:


 Input: root = [1,2,2,3,4,4,3]
 Output: true
 Example 2:


 Input: root = [1,2,2,null,3,null,3]
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100
  

 Follow up: Could you solve it both recursively and iteratively?
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
            
            var queue = [root.left, root.right]
            
            while !queue.isEmpty {
                let node1 = queue.removeFirst()
                let node2 = queue.removeFirst()
                
                if node1 == nil && node2 == nil { continue }
                if node1 == nil || node2 == nil { return false }
                if node1!.val != node2!.val { return false }
                
                queue.append(node1!.left)
                queue.append(node2!.right)
                queue.append(node1!.right)
                queue.append(node2!.left)
            }
            
            return true
    }
}

