//
//  0704Search.swift
//  Practice
//
//  Created by Silence on 2022/1/25.
//

import Foundation

class Solution704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (left + right) >> 1
            if (nums[mid] > target) {
                right = mid
            } else if (nums[mid] < target) {
                left = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
}
