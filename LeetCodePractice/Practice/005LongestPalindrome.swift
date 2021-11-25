/* 给你一个字符串 s，找到 s 中最长的回文子串。
*
*
*
* 示例 1：
*
* 输入：s = "babad"
* 输出："bab"
* 解释："aba" 同样是符合题意的答案。
* 示例 2：
*
* 输入：s = "cbbd"
* 输出："bb"
* 示例 3：
*
* 输入：s = "a"
* 输出："a"
* 示例 4：
*
* 输入：s = "ac"
* 输出："a"
*
* 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
**/

import XCTest


// 使用穷举的方式
class Solution005 {
    func isPalindrome(_ s: String) -> Bool {
        let length = s.count
        // 取字符串的长度
        for i in 0...length / 2 {
            let start = s.index(s.startIndex, offsetBy: i)
            let end = s.index(s.startIndex, offsetBy: length - i - 1)
            if s[start] != s[end] {
                return false
            }
        }
        return true
    }
    
    func longestPalindrome(_ s: String) -> String {
        var result: String = String(s[s.startIndex])
        var maxLen = 0
        let length = s.count
        // 用双循环进行遍历,以此来判断每一个子串
        for i in 0..<length {
            for j in (0..<length).reversed() {
                if i > j {
                    break
                }
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = s.index(s.startIndex, offsetBy: j)
                
                let subString = s[startIndex...endIndex]
                if subString.count > maxLen && isPalindrome(String(subString)) {
                    maxLen = subString.count
                    result = String(subString)
                    break
                }
            }
        }
        
        return result
    }
}

class Solution005Test: XCTestCase {
    func testLongestPalindromicSubstring() {
        XCTAssertEqual(Solution005().longestPalindrome("babad"), "bab")
        XCTAssertEqual(Solution005().longestPalindrome("cbbd"), "bb")
        XCTAssertEqual(Solution005().longestPalindrome("aaaaa"), "aaaaa")
        XCTAssertEqual(Solution005().longestPalindrome("aa"), "aa")
        XCTAssertEqual(Solution005().longestPalindrome("aaaa"), "aaaa")
    }
}
