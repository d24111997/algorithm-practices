import UIKit

/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 Example 1: Input: intervals = [[1,3],[2,6],[8,10],[15,18]] Output: [[1,6],[8,10],[15,18]] Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6]
 Example 2: Input: intervals = [[1,4],[4,5]] Output: [[1,5]1 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 Example 3: Input: [[1,12],[2,6],[8,10],[15,18]] Output: [[1, 12], [15, 18]]
 */

func solution(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else {
        return []
    }

    let intervals = intervals.sorted { $0[0] < $1[0] }
    var result = [intervals[0]]

    for interval in intervals[1...] {
        if interval[0] <= result[result.count - 1][1] {
            result[result.count - 1][1] = max(result[result.count - 1][1], interval[1])
        } else {
            result.append(interval)
        }
    }

    return result
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

