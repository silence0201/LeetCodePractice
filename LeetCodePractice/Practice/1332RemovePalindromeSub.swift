//
//  1332RemovePalindromeSub.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class Solution1332 {
    func removePalindromeSub(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        
        if s == String(s.reversed()) {
            return 1
        }
        
        return 2
    }
}
