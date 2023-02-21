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
        var result: [[Int]] = []
        var temp: [Int] = [1]
        while result.count < numRows {
            result.append(temp)
            if temp.count == 1 {
                temp = [1,1]
            } else {
                var newRow = [1]
                for index in 0..<temp.count-1 {
                    newRow.append(temp[index] + temp[index+1])
                }
                newRow.append(1)
                temp = newRow
            }
        }
        return result
    }
}

// P/S: 10 mins
