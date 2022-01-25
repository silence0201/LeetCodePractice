//
//  Offer61IsStraight.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class SolutionOffer61 {
    func isStraight(_ nums: [Int]) -> Bool {
        var maxV = 1
        var minV = 14
        var list = Array(repeating: -1, count: 14)
        for num in nums {
            if (num == 0) {
                continue
            }
            
            if (list[num] != -1) {
                return false
            }
            list[num] = 1
            maxV = max(maxV, num)
            minV = min(minV, num)
        }
        return maxV - minV < 5
    }
}
