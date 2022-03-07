//
//  SelectionSort.swift
//  Practice
//
//  Created by Silence on 2022/3/1.
//

import Foundation
import XCTest

class SelectionSort {
    func selectionSort(_ arr: [Int]) -> [Int] {
        let len = arr.count
        var minIndex = 0, arr = arr
        for i in 0..<len-1 {
            minIndex = i
            for j in i+1..<len {
                if(arr[j] < arr[i]) {
                    minIndex = j
                }
            }
            
            (arr[i], arr[minIndex]) = (arr[minIndex], arr[i])
        }
        
        return arr
    }
}

class SelectionSortTest: XCTestCase {
    
    func testSelectionSort() {
        let list = [2,3,5,3,4,5,12,1]
        let ans = [1,2,3,3,4,5,5,12]
        let res = SelectionSort().selectionSort(list)
        XCTAssert(res == ans)
    }
    
}
