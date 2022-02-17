//
//  Offer15HammingWeight.swift
//  Practice
//
//  Created by Silence on 2022/1/24.
//

import Foundation

class SolutionOffer15 {
    func hammingWeight(_ n: Int) -> Int {
        var num = n
        var count = 0
        while num != 0 {
            if (num & 1 == 1) {
                count += 1
            }
            num >>= 1
        }
        return count
    }
}
