import UIKit

/*
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.
 
 Example 1:

 Input: nums = [1,3,5,6], target = 5
 Output: 2
 Example 2:

 Input: nums = [1,3,5,6], target = 2
 Output: 1
 Example 3:

 Input: nums = [1,3,5,6], target = 7
 Output: 4
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
            var right = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    return mid
                } else if nums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return left
    }
}
let input1 = [1,3,5,6]
let target1 = 5
print(">>> \(Solution().searchInsert(input1, target1))")
let input2 = [1,3,5,6]
let target2 = 2
print(">>> \(Solution().searchInsert(input2, target2))")
let input3 = [1,3,5,6]
let target3 = 7
print(">>> \(Solution().searchInsert(input3, target3))")
