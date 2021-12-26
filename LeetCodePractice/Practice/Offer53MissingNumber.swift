//
//  Offer53MissingNumber.swift
//  Practice
//
//  Created by Silence on 2021/12/26.
//

import XCTest

class SolutionOffer53_2 {
    func missingNumber(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let m = (l + r) / 2
            if nums[m] ==  m {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        return l
    }
}
