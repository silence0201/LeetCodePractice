//
//  0309MaxProfit.swift
//  Practice
//
//  Created by Silence on 2022/3/27.
//

import Foundation

class Solution309 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        
        let count = prices.count
        
        var f = Array(repeating: Array(repeating: 0, count: 3), count: count)
        
        f[0][0] = -prices[0]
        for i in 1..<count {
            f[i][0] = max(f[i - 1][0], f[i - 1][2] - prices[i])
            f[i][1] = f[i - 1][0] + prices[i]
            f[i][2] = max(f[i - 1][1],f[i - 1][2])
        }
        
        return max(f[count - 1][1], f[count - 1][2])
    }
}
