//
//  0003LengthOfLongestSubstring.swift
//  Practice
//
//  Created by Silence on 2022/3/8.
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
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
