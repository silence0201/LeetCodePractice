/*
* 400. 第 N 位数字
* 给你一个整数 n ，请你在无限的整数序列 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...] 中找出并返回第 n 位上的数字。
*
*
*
* 示例 1：
*
* 输入：n = 3
* 输出：3
* 示例 2：
*
* 输入：n = 11
* 输出：0
* 解释：第 11 位数字在序列 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... 里是 0 ，它是 10 的一部分。
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/nth-digit
 */

import XCTest

class Solution400 {
    func findNthDigit(_ n: Int) -> Int {
        if n < 10  {
            return n
        }
        var tmp = n
        
        var digits = 1
        var base = 9
        while tmp > digits * base {
            tmp -= digits * base
            digits+=1
            base *= 10
        }
        
        let index = tmp - 1
        let start = pow(10,(digits - 1))
        let num = start + index / digits
        let digitsIndex = index % digits
        
        let digitsValue = pow(10, digits - digitsIndex - 1)
        
        let res = (num / digitsValue) % 10
        return res
    }
    
    func pow(_ x: Int, _ p: Int) -> Int {
        var res = 1
        for _ in 0..<p {
            res *= x
        }
        return res
    }
}

class Solution400Test: XCTestCase {
    func testfindNthDigit01() {
        let n = 3
        let res = 3
        XCTAssertEqual(Solution400().findNthDigit(n), res)
    }
    
    func testfindNthDigit02() {
        let n = 11
        let res = 0
        XCTAssertEqual(Solution400().findNthDigit(n), res)
    }
}
