//
//  1629SlowestKey.swift
//  Practice
//
//  Created by Silence on 2022/1/9.
//

import Foundation

class Solution1629 {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var ans = Character("")
        var time = 0
        
        for (index, c) in keysPressed.enumerated() {
            let nv = releaseTimes[index] - (index < 1 ? 0 : releaseTimes[index-1])
            if nv > time || (nv == time && c > ans) {
                (ans, time) = (c, nv)
            }
        }
        return ans
    }
}
