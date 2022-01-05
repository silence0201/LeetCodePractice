//
//  0031NextPermutation.swift
//  Practice
//
//  Created by Silence on 2022/1/4.
//

import XCTest

class Solution31 {
    func nextPermutation(_ nums: inout [Int]) {
      var i = nums.count - 2
    
      while i >= 0 && nums[i] >= nums[i+1] {
         i-=1
      }
    
      if i >= 0 {
        var j = nums.count - 1
        while j >= 0 && nums[i] >= nums[j]  {
          j -= 1
        }
        nums.swapAt(i, j)
      }
      nums[i+1..<nums.count].reverse()
    }
}

class Solution31Test: XCTestCase {
    func testFindNumberIn2DArray() {
        var nums = [1,2,3]
        let ans = [1,3,2]
        Solution31().nextPermutation(&nums)
        
        XCTAssertEqual(ans, nums)
    }
}

