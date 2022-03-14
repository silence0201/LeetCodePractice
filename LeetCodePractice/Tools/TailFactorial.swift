//
//  TailFactorial.swift
//  Practice
//
//  Created by Silence on 2022/3/2.
//

import Foundation

func tailFactorial(_ n: Int, _ sum: Int) -> Int{
    if (n == 1) {
        return sum
    }
    return tailFactorial(n - 1, n * sum)
}

func factorial(_ n: Int) -> Int {
    return tailFactorial(n, 1)
}
