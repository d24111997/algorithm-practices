import UIKit

/*
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:

 Input: root = [1,null,2]
 Output: 2
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100
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
    func maxDepth_recursive(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDepth = maxDepth_recursive(root!.left)
        let rightDepth = maxDepth_recursive(root!.right)
        return 1 + max(leftDepth, rightDepth)
    }
    
    func maxDepth_iterative(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [TreeNode] = [root]
        var depth = 0
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            depth += 1
        }
        return depth
    }
}

// P/S: Both solutions have a time complexity of O(n), where n is the number of nodes in the binary tree, as each node is visited only once. The space complexity of the recursive solution is O(h), where h is the height of the tree, as the call stack can go as deep as the height of the tree. The space complexity of the iterative solution is O(w), where w is the maximum width of the tree, as at most, we need to store all the nodes at the maximum depth, which is the width of the tree.
