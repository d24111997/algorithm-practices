import UIKit

var greeting = "Hello, playground"

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
        if nums.count == 1 {
            return TreeNode(nums[0])
        }
        if nums.count == 0 {
            return nil
        }
        let centerIndex = nums.count/2
        let rootNode = TreeNode(
            nums[centerIndex],
            sortedArrayToBST(Array(nums.prefix(centerIndex))),
            sortedArrayToBST(Array(nums.suffix(from: centerIndex + 1)))
        )
        return rootNode
    }
}

// P/S: 20 mins. Not clearly understand how many posible result this problem could have. For example: nums is [1,2,3,4,5,6,7] -> exchange the position of 2 not nil value of node -> new result?
