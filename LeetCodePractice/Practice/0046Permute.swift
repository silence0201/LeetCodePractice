//
//  0046Permute.swift
//  Practice
//
//  Created by Silence on 2021/12/29.
//

import XCTest

class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        let len = nums.count
        var res = [[Int]]()
        
        func backtrack(_ path: [Int], _ list: [Int]) {
            if path.count == len {
                res.append(path)
                return
            }
            
            for i in 0..<list.count {
                var tmp = list
                tmp.remove(at: i)
                backtrack(path + [list[i]], tmp)
            }
        }
        
        backtrack([], nums)
        return res
    }
}

