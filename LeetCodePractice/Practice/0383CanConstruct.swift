/* 383. 赎金信
* 为了不在赎金信中暴露字迹，从杂志上搜索各个需要的字母，组成单词来表达意思。
*
* 给你一个赎金信 (ransomNote) 字符串和一个杂志(magazine)字符串，判断 ransomNote 能不能由 magazines 里面的字符构成。
*
* 如果可以构成，返回 true ；否则返回 false 。
*
* magazine 中的每个字符只能在 ransomNote 中使用一次。
*
*
*
* 示例 1：
*
* 输入：ransomNote = "a", magazine = "b"
* 输出：false
* 示例 2：
*
* 输入：ransomNote = "aa", magazine = "ab"
* 输出：false
* 示例 3：
*
* 输入：ransomNote = "aa", magazine = "aab"
* 输出：true
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/ransom-note
*/

import XCTest

class Solution383 {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        if (ransomNote.count > magazine.count) {
            return false
        }
        
        var charAry = Array(repeating: 0, count: 26)
        let aCharValue =  ("a".unicodeScalars.first?.value)!

        for c in magazine.unicodeScalars {
            let index = Int(c.value - aCharValue)
            charAry[index] += 1
        }
        
        for c in ransomNote.unicodeScalars {
            let index = Int(c.value - aCharValue)
            charAry[index] -= 1
            if (charAry[index] < 0) {
                return false
            }
        }
        
        return true
    }
}

class Solution383Test: XCTestCase {
    func testCanConstruct01() {
        let ransomNote = "a"
        let magazine = "b"
        let ans = false
        
        XCTAssertEqual(Solution383().canConstruct(ransomNote, magazine), ans)
    }
    
    func testCanConstruct02() {
        let ransomNote = "aa"
        let magazine = "ab"
        let ans = false
        
        XCTAssertEqual(Solution383().canConstruct(ransomNote, magazine), ans)
    }
    
    func testCanConstruct03() {
        let ransomNote = "aa"
        let magazine = "aab"
        let ans = true
        
        XCTAssertEqual(Solution383().canConstruct(ransomNote, magazine), ans)
    }
}
