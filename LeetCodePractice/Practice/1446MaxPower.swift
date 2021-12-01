/*
* 给你一个字符串 s ，字符串的「能量」定义为：只包含一种字符的最长非空子字符串的长度。
*
* 请你返回字符串的能量。
*
*
*
* 示例 1：
*
* 输入：s = "leetcode"
* 输出：2
* 解释：子字符串 "ee" 长度为 2 ，只包含字符 'e' 。
* 示例 2：
*
* 输入：s = "abbcccddddeeeeedcba"
* 输出：5
* 解释：子字符串 "eeeee" 长度为 5 ，只包含字符 'e' 。
* 示例 3：
*
* 输入：s = "triplepillooooow"
* 输出：5
* 示例 4：
*
* 输入：s = "hooraaaaaaaaaaay"
* 输出：11
* 示例 5：
*
* 输入：s = "tourist"
* 输出：1
*
*
* 链接：https://leetcode-cn.com/problems/consecutive-characters
*/

import XCTest

class Solution1446 {
    func maxPower(_ s: String) -> Int {
        let count = s.count
        var cur = 1
        var res = 1
        for i in 1..<count {
            let l = s[s.index(s.startIndex, offsetBy: i-1)];
            let r = s[s.index(s.startIndex, offsetBy: i)]
            if l == r {
               cur += 1
               res = max(res, cur)
            } else {
                cur = 1
            }
        }
        return res
    }
}

class Solution1446Test: XCTestCase {
    func testMaxPower01() {
        let s = "leetcode"
        let res = 2
        XCTAssertEqual(Solution1446().maxPower(s), res)
    }
    
    func testMaxPower02() {
        let s = "abbcccddddeeeeedcba"
        let res = 5
        XCTAssertEqual(Solution1446().maxPower(s), res)
    }
    
    func testMaxPower03() {
        let s = "triplepillooooow"
        let res = 5
        XCTAssertEqual(Solution1446().maxPower(s), res)
    }
    
    func testMaxPower04() {
        let s = "hooraaaaaaaaaaay"
        let res = 11
        XCTAssertEqual(Solution1446().maxPower(s), res)
    }
    
    func testMaxPower05() {
        let s = "tourist"
        let res = 1
        XCTAssertEqual(Solution1446().maxPower(s), res)
    }
}

