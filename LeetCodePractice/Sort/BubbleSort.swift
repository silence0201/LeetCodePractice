//
//  BubbleSort.swift
//  Practice
//
//  Created by Silence on 2022/2/28.
//

import Foundation
import XCTest

class BubbleSort {
    func bubbleSort(_ arr: [Int]) -> [Int] {
        var arr = arr
        let len = arr.count
        for i in 0..<len - 1 {
            for j in 0..<len - i - 1 {
                if arr[j] > arr[j+1] {
                    (arr[j], arr[j+1]) = (arr[j+1],arr[j])
                }
            }
        }
        return arr
    }
}

class BubbleSortTest: XCTestCase {
    
    func testBubbleSort() {
        let list = [2,3,5,3,4,5,12,1]
        let ans = [1,2,3,3,4,5,5,12]
        let res = BubbleSort().bubbleSort(list)
        XCTAssert(res == ans)
    }
    
}
