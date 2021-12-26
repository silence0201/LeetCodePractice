/* 22. 括号生成
* 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
* 示例 1：
*
* 输入：n = 3
* 输出：["((()))","(()())","(())()","()(())","()()()"]
* 示例 2：
*
* 输入：n = 1
* 输出：["()"]
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/generate-parentheses
*/

import XCTest

class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        if (n == 1) {
            return ["()"];
        }
        
        if (n == 2) {
            return ["()()","(())"]
        }
        
        var ans = Set<String>()
        func generateSubParenthesis(_ i: Int, _ subParenthesis: String) {
            for p in generateParenthesis(i) {
                let leftAppend = p + subParenthesis
                let rightAppend = subParenthesis + p
                
                ans.insert(leftAppend)
                ans.insert(rightAppend)
            }
        }
        
        func generateMiddleParenthesis(_ i: Int, _ subParenthesis: String) {
            var middleAppend = subParenthesis
            for _ in 0..<i {
                middleAppend = "(" + middleAppend + ")"
            }
            ans.insert(middleAppend)
        }
        
        
        for i in 1...n-2 {
            for p in generateParenthesis(n - i) {
                generateMiddleParenthesis(i, p)
                generateSubParenthesis(i, p)
            }
        }
        
        return Array(ans)
    }
}

class Solution22Test: XCTestCase {
    func testGenerateParenthesis01() {
        let n = 3
        let ans = ["((()))","(()())","(())()","()(())","()()()"];
        let result = Solution22().generateParenthesis(n)
        
        XCTAssertEqual(Set(ans), Set(result))
    }
    
    func testGenerateParenthesis02() {
        let n = 4
        let ans = ["(((())))","((()()))","((())())","((()))()","(()(()))","(()()())","(()())()","(())(())","(())()()","()((()))","()(()())","()(())()","()()(())","()()()()"];
        let result = Solution22().generateParenthesis(n).sorted()
        
        XCTAssertEqual(Set(ans), Set(result))
    }
}
