//
//  0334IncreasingTriplet.swift
//  Practice
//
//  Created by Silence on 2022/1/12.
//

import Foundation

class Solution334 {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else {
            return false
        }
        
        var a = Int.max
        var b = Int.max
        for num in nums {
            if (num <= a) {
                a = num
            } else if (num <= b) {
                b = num
            } else {
                return true
            }
        }
        return false
    }
}
