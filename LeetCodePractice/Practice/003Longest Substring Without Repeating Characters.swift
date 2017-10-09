/*
 * Given a string, find the length of the longest substring without repeating characters.
 *
 * Examples:
 *
 * Given "abcabcbb", the answer is "abc", which the length is 3.
 *
 * Given "bbbbb", the answer is "b", with the length of 1.
 *
 * Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 *
 */


import Foundation
import XCTest

class LongestSubstringWithoutRepeatingCharacters {
    class func lengthOfLongestSubstring(s: String) -> Int {
        if s.characters.count == 0 {
            return 0
        }
        
        var set = Set<Character>()
        var maxLen = 0
        var startIndex = 0
        var chars = [Character](s.characters)
        
        for i in 0..<chars.count {
            let current = chars[i]
            
            if set.contains(current) {
                maxLen = max(maxLen, i-startIndex)
                while chars[startIndex] != current {
                    set.remove(chars[startIndex])  // 经对象从集合装中删除
                    startIndex += 1  // 移动标志直到相等
                }
                startIndex += 1   // 向前移动标志
            } else {
                set.insert(current);
            }
        }
        maxLen = max(maxLen, chars.count - startIndex)
        return maxLen
    }
}

class LongestSubstringWithoutRepeatingCharactersTest: XCTestCase {
    
    func testAddTwoNumbers() {
        let l0 = LongestSubstringWithoutRepeatingCharacters.lengthOfLongestSubstring(s:"abcabcbb")
        XCTAssertEqual(l0,3,"Error")
        
        let l1 = LongestSubstringWithoutRepeatingCharacters.lengthOfLongestSubstring(s:"bbbbb")
        XCTAssertEqual(l1,1,"Error")
        
        let l2 = LongestSubstringWithoutRepeatingCharacters.lengthOfLongestSubstring(s:"pwwkew")
        XCTAssertEqual(l2,3,"Error")
    }
    
}
