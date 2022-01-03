//
//  Offer04FindNumberIn2DArray.swift
//  Practice
//
//  Created by Silence on 2022/1/3.
//

import XCTest

class SolutionOffer44 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = matrix.count - 1
        var colum = 0
        while row >= 0 && colum < matrix[row].count {
            let val = matrix[row][colum]
            if (val > target) {
                row -= 1
            } else if (val < target) {
                colum += 1
            } else {
                return true
            }
        }
        
        return false
    }
}

class SolutionOffer44Test: XCTestCase {
    func testFindNumberIn2DArray() {
        let matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
        let target = 5
        let ans = true
        let result = SolutionOffer44().findNumberIn2DArray(matrix, target)
        
        XCTAssertEqual(ans, result)
    }
}
