//
//  Offer64SumNums.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class SolutionOffer64 {
    func sumNums(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        return n + sumNums(n - 1)
    }
}
