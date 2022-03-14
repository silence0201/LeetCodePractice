//
//  0152MaxProduct.swift
//  Practice
//
//  Created by Silence on 2022/3/14.
//

import Foundation

class Solution152 {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.first ?? 0
        }
        var res = Int.min
        var imin = 1
        var imax = 1
        for num in nums {
            if num < 0 {
                (imax, imin) = (imin, imax)
            }
            imax = max(num, num * imax)
            imin = min(num, num * imin)
            res = max(imax, res)
        }
        return res
    }
}
