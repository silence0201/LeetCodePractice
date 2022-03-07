//
//  0070ClimbStairs.swift
//  Practice
//
//  Created by Silence on 2022/3/1.
//

import XCTest

class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        var stairs: [Int] = Array(repeating: 0, count: n + 1)
        
        stairs[0] = 1
        stairs[1] = 1
        for i in 2...n {
            stairs[i] = stairs[i-1] + stairs[i-2]
        }
        
        return stairs[n]
    }
}

