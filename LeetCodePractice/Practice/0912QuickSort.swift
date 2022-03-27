//
//  0912QuickSort.swift
//  Practice
//
//  Created by Silence on 2022/3/26.
//

import Foundation

class Solution912 {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        
        var nums = nums
        
        func partition(_ left: Int, _ right: Int) -> Int {
            var low = left, high = right
            let pivote = nums[left]
            
            while low < high {
                while low < high && nums[high] > pivote {
                    high -= 1
                }
                nums[low] = nums[high]
                
                while low < high && nums[low] <= pivote {
                    low += 1
                }
                nums[high] = nums[low]
            }
            
            nums[low] = pivote
            return low
        }
        
        func quickSort(_ left: Int, _ right: Int) {
            if left > right {
                return
            }
            
            let pivoteIndex = partition(left, right)
            quickSort(left, pivoteIndex - 1)
            quickSort(pivoteIndex + 1, right)
        }
        
        quickSort(0, nums.count - 1)
        
        return nums
    }
}
