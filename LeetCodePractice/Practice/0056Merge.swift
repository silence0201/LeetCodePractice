//
//  0056Merge.swift
//  Practice
//
//  Created by Silence on 2022/1/1.
//

import XCTest

class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted {
            return $0[0] < $1[0]
        }
        
        var results = [[Int]]()
        
        for i in 0..<intervals.count {
            let interval = intervals[i]
            if var last = results.last, last[1] >= interval[0] {
                last[1] = max(last[1], interval[1])
                results[results.count - 1] = last
            } else {
                results.append(interval)
            }
        }
        
        return results
    }
}

class Solution56Test: XCTestCase {
    func testmerge01() {
        let intervals = [[5,5],[1,3],[3,5],[4,6],[1,1],[3,3],[5,6],[3,3],[2,4],[0,0]]
        let ans = [[0,0],[1,6]]
        let result = Solution56().merge(intervals)
        
        XCTAssertEqual(ans, result)
    }
}
