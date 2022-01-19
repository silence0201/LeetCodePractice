//
//  0219ContainsNearbyDuplicate.swift
//  Practice
//
//  Created by Silence on 2022/1/19.
//

import Foundation

class Solution219 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map: [Int: Int] = [Int: Int]()
        
        for (i, value) in nums.enumerated() {
            if let index = map[value] {
                if (i - index <= k) {
                    return true
                }
            }
            map[value] = i
        }
        return false
    }
}
