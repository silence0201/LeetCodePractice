//
//  0198Rob.swift
//  Practice
//
//  Created by Silence on 2022/2/21.
//

import Foundation

class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count != 1 else {
            return nums[0]
        }
        var first = nums[0]
        var second = max(nums[0], nums[1])
        for i in 2..<nums.count {
            (first, second) = (second, max(nums[i] + first, second))
        }
        return second
    }
}
