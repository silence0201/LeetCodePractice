//
//  Offer11MinArray.swift
//  Practice
//
//  Created by Silence on 2022/1/10.
//

import Foundation


class SolutionOffer11 {
    func minArray(_ numbers: [Int]) -> Int {
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let mid = (left + right) >> 1
            
            if (numbers[mid] < numbers[right]) {
                right = mid
            } else if (numbers[mid] > numbers[right]) {
                left = mid + 1
            } else {
                right -= 1
            }
        }
        return numbers[left]
    }
}
