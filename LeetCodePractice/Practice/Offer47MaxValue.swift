/* 剑指 Offer 47. 礼物的最大价值
* 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

* 示例 1:
*
* 输入:
* [
*  [1,3,1],
*  [1,5,1],
*  [4,2,1]
* ]
* 输出: 12
* 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
 
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof
*/

import XCTest

class SolutionOffer47 {
    func maxValue(_ grid: [[Int]]) -> Int {
        let (row,colum) = (grid.count, grid[0].count)
        var dp = Array(repeating: Array(repeating: 0, count: colum), count: row)
        
        for i in 0..<row {
            for j in 0..<colum {
                if (i == 0 && j == 0) {
                    dp[i][j] = grid[i][j]
                } else if (i == 0) {
                    dp[i][j] = grid[i][j] + dp[i][j-1]
                } else if(j == 0) {
                    dp[i][j] = grid[i][j] + dp[i-1][j]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + grid[i][j]
                }
            }
        }
        return dp[row-1][colum-1]
    }
}

class SolutionOffer47Test: XCTestCase {
    func testMaxValue() {
        let grid = [[1,3,1],[1,5,1],[4,2,1]]
        let ans = 12
        XCTAssertEqual(SolutionOffer47().maxValue(grid), ans)
    }
}
