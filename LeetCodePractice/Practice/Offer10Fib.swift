//
//  Offer10Fib.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import Foundation

class SolutionOffer10 {
    func fib(_ n: Int) -> Int {
        var result: [Int] = [0, 1]
        if n >= 2  {
            let divisor = 1000000007
            for i in 2...n {
                var tmp = result[i-1] + result[i-2]
                if tmp > divisor {
                    tmp = tmp % divisor
                }
                result.append(tmp)
            }
        }
        return result[n]
    }
}
