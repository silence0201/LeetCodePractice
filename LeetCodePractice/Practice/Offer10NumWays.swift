//
//  Offer10NumWays.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import Foundation

class SolutionOffer10_2 {
    func numWays(_ n: Int) -> Int {
        var res = [1,1]
        let divisor = 1000000007
        
        guard n >= 2 else {
            return res[n]
        }
        
        for i in 2...n {
            var tmp = res[i-1] + res[i-2]
            if tmp > divisor {
                tmp = tmp % divisor
                
            }
            res.append(tmp)
        }
        return res[n]
    }
}
