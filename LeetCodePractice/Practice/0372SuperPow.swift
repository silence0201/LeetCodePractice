/* 372. 超级次方
* 你的任务是计算 ab 对 1337 取模，a 是一个正整数，b 是一个非常大的正整数且会以数组形式给出。
*
*
*
* 示例 1：
*
* 输入：a = 2, b = [3]
* 输出：8
* 示例 2：
*
* 输入：a = 2, b = [1,0]
* 输出：1024
* 示例 3：
*
* 输入：a = 1, b = [4,3,3,8,5,2]
* 输出：1
* 示例 4：
*
* 输入：a = 2147483647, b = [2,0,0]
* 输出：1198
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/super-pow
*/

import XCTest

class Solution372 {
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        let mod = 1337
        let base = a % mod
        var ans = 1
        var x = base
        b.reversed().forEach { bit in
            ans = (ans * quickpow(x, bit, mod)) % mod
            x = quickpow(x, 10, mod) % mod
        }
        
        return ans
    }
    
    func quickpow(_ base: Int, _ exponent: Int, _ mod: Int) -> Int {
        var ans = 1
        var base = base
        var exponent = exponent
        
        while exponent > 0 {
            if exponent & 1 == 1 {
                ans = (base * ans) % mod
            }
            base = (base * base) % mod
            exponent >>= 1
        }
        
        return ans
    }
}

class Solution372Test: XCTestCase {
    func testSuperPow01() {
        let a = 2
        let b = [3]
        let ans = 8
        XCTAssertEqual(Solution372().superPow(a,b), ans)
    }
    
    func testSuperPow02() {
        let a = 2
        let b = [1,0]
        let ans = 1024
        XCTAssertEqual(Solution372().superPow(a,b), ans)
    }
    
    func testSuperPow03() {
        let a = 1
        let b = [4,3,3,8,5,2]
        let ans = 1
        XCTAssertEqual(Solution372().superPow(a,b), ans)
    }
    
    func testSuperPow04() {
        let a = 2147483647
        let b = [2,0,0]
        let ans = 1198
        XCTAssertEqual(Solution372().superPow(a,b), ans)
    }
}
