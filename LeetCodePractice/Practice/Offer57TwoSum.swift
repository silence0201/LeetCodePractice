//
//  Offer57tTwoSum.swift
//  Practice
//
//  Created by Silence on 2022/1/20.
//

import XCTest

class SolutionOffer57 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        
        var res: [Int] = [Int]()
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == target {
                res.append(contentsOf: [nums[left],nums[right]])
                break
            } else if (sum > target) {
                right -= 1
            } else {
                left += 1
            }
        }
        return res
    }
}
