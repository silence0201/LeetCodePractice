//
//  0089GrayCode.swift
//  Practice
//
//  Created by Silence on 2022/1/8.
//

import Foundation

class Solution89 {
    func grayCode(_ n: Int) -> [Int] {
        if (n == 0) {
            return [0]
        }
        
        let pre = grayCode(n - 1)
        let append = pre.reversed().map{$0 + 1<<(n-1)}
        
        return pre + append
    }
}
