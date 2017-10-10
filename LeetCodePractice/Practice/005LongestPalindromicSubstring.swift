/* Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 *
 * Example:
 *
 * Input: "babad"
 *
 * Output: "bab"
 *
 * Note: "aba" is also a valid answer.
 * Example:
 *
 * Input: "cbbd"
 *
 * Output: "bb"
 */

import XCTest

class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        
        let chars = [Character](s.characters)
        let length = chars.count
        guard length > 0 else {
            return ""
        }
        
        var isPalidromeMatrix = Array(repeating: Array(repeating: false, count : length), count : length)
        
        var maxLength = 0
        var maxStartIndex = 0
        
        for palidromeLength in 1 ... length {
            for startIndex in 0 ... length - palidromeLength {
                let endIndex = startIndex + palidromeLength - 1
                var isPalidrome = false
                
                if palidromeLength == 1 {
                    isPalidrome = true
                } else if palidromeLength == 2 {
                    isPalidrome = chars[startIndex] == chars[endIndex]
                } else {
                    isPalidrome = chars[startIndex] == chars[endIndex] && isPalidromeMatrix[startIndex + 1][endIndex - 1]
                }
                
                if isPalidrome {
                    isPalidromeMatrix[startIndex][endIndex] = true
                    
                    if palidromeLength > maxLength {
                        maxStartIndex = startIndex
                        maxLength = palidromeLength
                    }
                }
            }
        }
        return String(chars[maxStartIndex...maxStartIndex + maxLength - 1])
    }
}

class LongestPalindromicSubstringTest: XCTestCase {
    
    func testLongestPalindromicSubstring() {
        
        let input1 = "babad"
        let output1 = LongestPalindromicSubstring().longestPalindrome(input1)
        XCTAssertEqual(output1,"bab","Error")
        
        let input2 = "cbbd"
        let output2 = LongestPalindromicSubstring().longestPalindrome(input2)
        XCTAssertEqual(output2,"bb","Error")
    }
    
}
