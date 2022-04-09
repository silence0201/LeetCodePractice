//
//  Offer48LengthOfLongestSubstring.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import XCTest

class SolutionOffer48 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charAry = [Character]()
        var maxLength = 0
        for char in s {
            if let index = charAry.firstIndex(of: char) {
                charAry.removeFirst(index + 1)
            }
            charAry.append(char)
            if (maxLength < charAry.count) {
                maxLength = charAry.count
            }
        }
        return maxLength
    }
    
    func lengthOfLongestSubstring_2(_ s: String) -> Int {
        var charIndex = [Character: Int]()
        
        var maxLen = 0
        var lastMaxLen = 0
        for (i, c) in s.enumerated() {
            let j = charIndex[c] ?? -1
            lastMaxLen = lastMaxLen < i - j ? lastMaxLen + 1 : i - j
            charIndex[c] = i
            maxLen = max(maxLen, lastMaxLen)
        }
        
        return maxLen
    }
}

class SolutionOffer48Test: XCTestCase {
    func testLengthOfLongestSubstring() {
        let s = "abba"
        let ans = SolutionOffer48().lengthOfLongestSubstring_2(s)
    }
}
