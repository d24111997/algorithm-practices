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
        guard let left = root.left, let right = root.right else { return root.left == nil && root.right == nil }
        guard left.val == right.val else { return false }
        return isSymmetric(left, right)
    }
    
    func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        guard let left = left, let right = right else { return left == nil && right == nil }
        guard left.val == right.val else { return false }
        return isSymmetric(left.left, right.right) && isSymmetric(right.left, left.right)
    }
}

// P/S: Recursive Solution within 13 mins
