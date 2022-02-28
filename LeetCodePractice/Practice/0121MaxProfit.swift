//
//  0121MaxProfit.swift
//  Practice
//
//  Created by Silence on 2022/2/27.
//

import Foundation

class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else {
            return 0
        }
        
        var maxValue = 0
        var minPrice  = prices[0]
        
        for price in prices {
            if (price < minPrice) {
                minPrice = price
            } else {
                maxValue = max(maxValue, price - minPrice)
            }
        }
        return maxValue
    }
}
