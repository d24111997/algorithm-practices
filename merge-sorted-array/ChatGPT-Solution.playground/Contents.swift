import UIKit

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1 // index of last element in nums1
        var j = n - 1 // index of last element in nums2
        var k = m + n - 1 // index of last position in merged nums1
        
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
        
        // handle remaining elements in nums2
        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
    }
}

var nums1 = [1,2,3,0,0,0]
//, m = 3, nums2 = [2,5,6], n = 3
// Output: [1,2,2,3,5,6]

print(nums1)
Solution().merge(&nums1, 3, [2,5,6], 3)
print(nums1)
