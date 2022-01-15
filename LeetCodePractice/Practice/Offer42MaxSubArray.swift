//
//  Offer42MaxSubArray.swift
//  Practice
//
//  Created by Silence on 2022/1/12.
//

import Foundation

class SolutionOffer42 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var sum = 0
        for num in nums {
            sum = max(sum + num, num)
            res = max(sum, res)
        }
        return res
    }
}
