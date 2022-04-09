//
//  0215FindKthLargest.swift
//  Practice
//
//  Created by Silence on 2022/4/9.
//

import Foundation

class Solution215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var unsorted = nums
        
        for i in 0..<k {
            var maxIndex = i
            for j in i+1..<nums.count {
                if (unsorted[j] > unsorted[maxIndex]) {
                    maxIndex = j
                }
            }
            
            if maxIndex != i {
                unsorted.swapAt(maxIndex, i)
            }
        }
        return unsorted[k-1]
    }
}
