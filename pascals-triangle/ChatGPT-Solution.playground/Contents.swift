import UIKit

/*
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


  

 Example 1:

 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 Example 2:

 Input: numRows = 1
 Output: [[1]]
  

 Constraints:

 1 <= numRows <= 30
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle: [[Int]] = []
        for i in 0..<numRows {
            var row: [Int] = []
            for j in 0...i {
                if j == 0 || j == i {
                    row.append(1)
                } else {
                    let prevRow = triangle[i-1]
                    row.append(prevRow[j-1] + prevRow[j])
                }
            }
            triangle.append(row)
        }
        return triangle
    }
}

