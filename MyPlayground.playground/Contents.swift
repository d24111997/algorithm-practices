import UIKit

/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 Example 1: Input: intervals = [[1,3],[2,6],[8,10],[15,18]] Output: [[1,6],[8,10],[15,18]] Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6]
 Example 2: Input: intervals = [[1,4],[4,5]] Output: [[1,5]1 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 Example 3: Input: [[1,12],[2,6],[8,10],[15,18]] Output: [[1, 12], [15, 18]]
 */

public func solution(_ array:  [[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    for (index, item) in array.enumerated() {
        if index == 0 {
            result.append(item)
        } else {
            let merged = merge(firstArray: result.last!, secondArray: item)
            if merged.count == 1 {
                result.removeLast()
                result.append(merged[0])
            } else {
                result.append(item)
            }
        }
    }
    return result
}

func merge(firstArray: [Int], secondArray: [Int]) -> [[Int]] {
    if firstArray[1] > secondArray[0] {
        if firstArray[1] >= secondArray[1] {
            return [firstArray]
        } else {
            return [[firstArray[0], secondArray[1]]]
        }
    } else if firstArray[1] == secondArray[0] {
        return [[firstArray[0], secondArray[1]]]
    } else {
        return [firstArray, secondArray]
    }
}
var aa = [[1,3],[2,6],[8,10],[15,18]]
print(aa)
print(solution(aa))
var aa1 = [[1,4],[4,5]]
print(aa1)
print(solution(aa1))
var aa2 = [[1,12],[2,6],[8,10],[15,18]]
print(aa2)
print(solution(aa2))

