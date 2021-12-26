//
//  0686RepeatedStringMatch.swift
//  Practice
//
//  Created by Silence on 2021/12/22.
//

import Foundation

class Solution686 {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        let lenA = a.count
        let lenB = b.count
        
        let maxLen = 2 * lenA + lenB
        
        var count = 0
        
        var str = ""
        while str.count < maxLen {
            count += 1
            str.append(a)
            if str.contains(b) {
                return count
            }
        }
        
        return -1
    }
}
