//
//  0200NumIslands.swift
//  Practice
//
//  Created by Silence on 2022/3/9.
//

import XCTest

class Solution200 {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count <= 0 {
            return 0
        }
        
        var grid = grid
        
        let row = grid.count
        let colum = grid[0].count
        
        func numDFS(_ curRow: Int, _ curColum: Int) {
            if curRow < 0 || curColum < 0 || curRow >= row || curColum >= colum {
                return
            }
            
            if (grid[curRow][curColum] == "0") {
                return
            }
            grid[curRow][curColum] = "0"
            numDFS(curRow, curColum + 1)
            numDFS(curRow, curColum - 1)
            numDFS(curRow + 1, curColum)
            numDFS(curRow - 1, curColum)
        }
        
        var res = 0
        for i in 0..<row {
            for j in 0..<colum {
                if grid[i][j] == "1" {
                    res += 1
                    numDFS(i, j)
                }
            }
        }
        return res
    }
}

class Solution200Test: XCTestCase {
    func testNumIslands() {
        let grid: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
        ]
        
        let res = Solution200().numIslands(grid)
        print(res)
    }
}

