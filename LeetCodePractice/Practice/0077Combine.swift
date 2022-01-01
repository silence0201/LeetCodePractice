/*

* 给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。

* 你可以按 任何顺序 返回答案。
*
* 输入：n = 4, k = 2
* 输出：
* [
*   [2,4],
*   [3,4],
*   [2,3],
*   [1,2],
*   [1,3],
*   [1,4],
* ]
*
*
* 输入：n = 1, k = 1
* 输出：[[1]]
*
* 链接：https://leetcode-cn.com/problems/combinations/
*
*/

import XCTest

class Solution077 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n > 0 else {
            return []
        }
        
        var result = [[Int]]()
        
        func backtracking(_ start: Int, _ end: Int, _ k: Int, _ add: [Int]) {
            if (k == 0) {
                result.append(add);
                return
            }
            
            // n = 4, k = 2
            // 第一层  1,2,3
            for i in start...(end-k+1) {
                var tmp = add
                tmp.append(i)
                
                // 第二层
                // 1 -> 2,3,4
                // 2 -> 3,4
                // 3 -> 4
                backtracking(i+1, end, k-1, tmp)
            }
        }
        
        backtracking(1, n, k, [])
        return result
    }
    

}

class Solution077Test: XCTestCase {
    func testCombine1() {
        let result = Solution077().combine(4, 2)
        let answer =  [[2,4],[3,4],[2,3],[1,2],[1,3],[1,4]];
        
        let s1 = Set(result)
        let s2 = Set(answer)
        
        XCTAssert(s1 == s2, "Error");
    }
    
    func testCombine2() {
        let result = Solution077().combine(1, 1)
        let answer =  [[1]];
        
        let s1 = Set(result)
        let s2 = Set(answer)
        
        XCTAssert(s1 == s2, "Error");
    }
}
