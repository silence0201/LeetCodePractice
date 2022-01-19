//
//  Offer21Exchange.swift
//  Practice
//
//  Created by Silence on 2022/1/20.
//

import Foundation

class SolutionOffer21 {
    func exchange(_ nums: [Int]) -> [Int] {
        var res = nums
        var left = 0
        var right = nums.count - 1
        
        while (left < right) {
            if (res[left] % 2 == 0) {
                (res[left], res[right]) = (res[right], res[left])
            } else {
                left += 1
            }
            if (res[right] % 2 != 0) {
                (res[right], res[left]) = (res[right], res[left])
            } else {
                right -= 1
            }
        }
        
        return res
    }
}
