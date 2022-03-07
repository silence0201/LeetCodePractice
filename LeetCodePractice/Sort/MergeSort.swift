//
//  MergeSort.swift
//  Practice
//
//  Created by Silence on 2022/2/28.
//

import Foundation
import XCTest

class MergeSort {
    func mergeSort(_ list:[Int]) -> [Int] {
        let count = list.count
        guard count > 1 else {
            return list
        }
        
        let middle = count / 2
        let left = Array(list[0..<middle])
        let right = Array(list[middle..<count])
        
        return merge(mergeSort(left), mergeSort(right))
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int]{
        var res = [Int]()
        var left = left,right = right
        
        while (!left.isEmpty && !right.isEmpty) {
            if (left[0] < right[0]) {
                res.append(left.removeFirst())
            } else {
                res.append(right.removeFirst())
            }
        }
        
        while !left.isEmpty {
            res.append(left.removeFirst())
        }
        
        while !right.isEmpty {
            res.append(right.removeFirst())
        }
        
        return res
    }
}

class MergeSortTest: XCTestCase {
    
    func testMergeSortTest() {
        let list = [2,3,5,3,4,5,12,1]
        let ans = [1,2,3,3,4,5,5,12]
        let res = MergeSort().mergeSort(list)
        XCTAssert(res == ans)
    }
    
}
