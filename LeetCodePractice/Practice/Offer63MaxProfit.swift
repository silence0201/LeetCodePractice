//
//  Offer63MaxProfit.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import Foundation

class SolutionOffer63 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else {
            return 0
        }
        
        var minPrice = prices[0]
        var maxVal = 0
        for price in prices {
            if (price < minPrice) {
                minPrice = price
            } else {
                maxVal = max(maxVal, price - minPrice)
            }
        }
        return maxVal
    }
}
