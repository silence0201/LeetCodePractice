//
//  0015ThreeSum.swift
//  Practice
//
//  Created by Silence on 2022/3/29.
//

import XCTest

class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        
        let nums = nums.sorted()
        let count = nums.count
        
        var res = [[Int]]()
        
        for i in 0..<count - 2 {
            let num = nums[i]
             
            if (num > 0) {
                break
            }
            
            // 跳过相同的元素
            if (i > 0 && num == nums[i-1]) {
                continue
            }
            
            var left = i + 1
            var right = count - 1
            
            while left < right {
                let sum = num + nums[left] + nums[right]
                if (sum == 0) {
                    res.append([num,nums[left],nums[right]])
                    
                    while (left < right && nums[left] == nums[left + 1]) {
                        left += 1
                    }
                    
                    while (left < right && nums[right] == nums[right - 1]) {
                        right -= 1
                    }
                    
                    left += 1
                    right -= 1
                } else if (sum < 0) {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return res
    }
}

class Solution15Test: XCTestCase {
    func testThreeSum() {
        let res = Solution15().threeSum([0,0,0])
        print(res)
    }
}
