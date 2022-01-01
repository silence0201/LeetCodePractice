//
//  2022Construct2DArray.swift
//  Practice
//
//  Created by Silence on 2022/1/1.
//

import XCTest

class Solution2022 {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        var result = [[Int]]()
        guard original.count == m * n  else {
            return result
        }
        
        var row = [Int]()
        for i in 0..<m {
            for j in 0..<n {
                row.append(original[n*i+j])
            }
            result.append(row)
            row = []
        }
        return result
    }
}
