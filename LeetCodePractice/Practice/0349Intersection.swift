//
//  0349Intersection.swift
//  Practice
//
//  Created by Silence on 2022/3/21.
//

import Foundation

class Solution349 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set = Set(nums1)
        var res = Set<Int>()
        for num in nums2 {
            if set.contains(num) {
                res.insert(num)
            }
        }
        return Array(res)
    }
}
