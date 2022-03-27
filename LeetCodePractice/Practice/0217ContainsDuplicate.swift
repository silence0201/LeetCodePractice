//
//  0217ContainsDuplicate.swift
//  Practice
//
//  Created by Silence on 2022/3/27.
//

import Foundation

class Solution217 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}
