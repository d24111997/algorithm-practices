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
    func maxDepth(_ root: TreeNode?) -> Int {
        var nodes: [TreeNode?] = []
        var result = 0
        guard let root = root else { return 0 }
        result += 1
        if root.left == nil && root.right == nil { return 1 }
        nodes = [root.left, root.right]
        while !nodes.isEmpty {
            var nextNode: [TreeNode?] = []
            for item in nodes {
                guard let item = item else { continue }
                nextNode += [item.left, item.right]
            }
            if nextNode.isEmpty { return result }
            result += 1
            nodes = nextNode
        }
        
        return result
    }
}

// P/S: 26 mins
