//
//  1614MaxDepth.swift
//  Practice
//
//  Created by Silence on 2022/1/7.
//

import Foundation

class Solution1614 {
    func maxDepth(_ s: String) -> Int{
        var res = 0
        var dp = 0
        for c in s {
            if (c == "(") {
                dp += 1
                res = max(res, dp)
            } else if (c == ")"){
                dp -= 1
            }
        }
        return res
    }
}

