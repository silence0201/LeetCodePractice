//
//  Offer50FirstUniqChar.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import Foundation

class SolutionOffer50 {
    func firstUniqChar(_ s: String) -> Character {
        guard !s.isEmpty else {
            return " "
        }
        var dict: [Character: Int] = [Character: Int]()
        
        for c in s {
            if let num = dict[c] {
                dict[c] = num + 1
            } else {
                dict[c] = 1
            }
        }
        
        for c in s {
            if dict[c] == 1 {
                return c
            }
        }
        
        return " "
    }
}
