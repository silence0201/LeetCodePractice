//
//  0096NumTrees.swift
//  Practice
//
//  Created by Silence on 2022/3/17.
//

import Foundation

class Solution96 {
    func numTrees(_ n: Int) -> Int {
        guard n >= 2 else {
            return 1
        }
        var dp = [1,1]
        for i in 2...n {
            var count = 0
            for j in 0..<i {
                count += dp[j] * dp[i-j-1]
            }
            dp.append(count)
        }
        return dp[n]
    }
}
