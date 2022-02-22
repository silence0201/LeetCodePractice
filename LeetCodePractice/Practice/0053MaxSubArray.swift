//
//  0053MaxSubArray.swift
//  Practice
//
//  Created by Silence on 2022/2/17.
//

import Foundation

class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var pre = 0
        var res = nums[0]
        for num in nums {
            pre = max(pre + num, num)
            res = max(res,pre)
        }
        
        return res
    }
}
