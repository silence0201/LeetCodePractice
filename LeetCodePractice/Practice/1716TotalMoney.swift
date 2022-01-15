//
//  1716TotalMoney.swift
//  Practice
//
//  Created by Silence on 2022/1/15.
//

import Foundation

class Solution1716 {
    func totalMoney(_ n: Int) -> Int {
        var res = 0
        
        let w = n / 7
        for i in 0..<w {
            res += 28 + 7 * i
        }
        
        let d = n % 7
        for i in 0..<d {
            res += w + 1 + i
        }
        
        return res
    }
}
