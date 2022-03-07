//
//  0347TopKFrequent.swift
//  Practice
//
//  Created by Silence on 2022/3/1.
//

import Foundation

class Solution347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map = [Int: Int]()
        for n in nums {
            if let count = map[n] {
                map[n] = count + 1
            } else {
                map[n] = 1
            }
        }
        let keys = map.keys.sorted { map[$0]! > map[$1]! }
        let res = Array(keys[0..<k])
        return res
    }
}
