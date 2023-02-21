import UIKit

/*
 Given an integer array nums where the elements are sorted in ascending order, convert it to a
 height-balanced binary search tree.

  

 Example 1:


 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:


 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return RecursiveSolution().sortedArrayToBST(nums)
    }
    
    class RecursiveSolution {
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            return constructBST(nums, 0, nums.count - 1)
        }
        
        func constructBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            
            let mid = (left + right) / 2
            let root = TreeNode(nums[mid])
            root.left = constructBST(nums, left, mid - 1)
            root.right = constructBST(nums, mid + 1, right)
            
            return root
        }
    }
    
    class IterativeSolution {
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            if nums.count == 0 { return nil }
            
            var stack: [(TreeNode, Int, Int)] = []
            
            let root = TreeNode()
            stack.append((root, 0, nums.count - 1))
            
            while !stack.isEmpty {
                let (node, left, right) = stack.removeLast()
                let mid = left + (right - left) / 2
                node.val = nums[mid]
                
                if left <= mid - 1 {
                    node.left = TreeNode()
                    stack.append((node.left!, left, mid - 1))
                }
                
                if mid + 1 <= right {
                    node.right = TreeNode()
                    stack.append((node.right!, mid + 1, right))
                }
            }
            
            return root
        }
        
    }
}
