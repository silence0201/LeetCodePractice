//
//  1220CountVowelPermutation.swift
//  Practice
//
//  Created by Silence on 2022/1/17.
//

import Foundation

class Solution1220 {
    func countVowelPermutation(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        let mod = 1_000_000_007
        var num = n
        var a = 1, e = 1, i = 1, o = 1, u = 1
        while num > 1 {
            let aa = (e + i + u) % mod
            let ee = (a + i) % mod
            let ii = (e + o) % mod
            let oo = i % mod
            let uu = (i + o) % mod
            
            a = aa
            e = ee
            i = ii
            o = oo
            u = uu
            
            num -= 1
        }
        return (a + e + i + o + u) % mod
    }
}
