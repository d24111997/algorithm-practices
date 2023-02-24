import UIKit

/*
 phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

 

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
Example 3:

Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
 

Constraints:

1 <= s.length <= 2 * 105
s consists only of printable ASCII characters.
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var charString = s.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
        for _ in 0..<charString.count/2 {
            let last = charString.removeLast()
            let first = charString.removeFirst()
            if last != first {
                return false
            }
        }
        return true
    }
}
print(Solution().isPalindrome("a bcd1234"))
print(Solution().isPalindrome("A man, a plan, a canal: Panama"))
print(Solution().isPalindrome("race a car"))
print(Solution().isPalindrome(" "))
print(Solution().isPalindrome("0P"))

// P/S: 23 mins
