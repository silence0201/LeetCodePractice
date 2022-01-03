//
//  0390LastRemaining.swift
//  Practice
//
//  Created by Silence on 2022/1/2.
//

import XCTest

class Solution390 {
    func lastRemaining(_ n: Int) -> Int {
        var remaining = n
        var flag = true
        var res = 1
        var step = 1
        
        while remaining > 1 {
            if (flag || remaining % 2 == 1) {
                res += step
            }
            flag = !flag
            step <<= 1
            remaining >>= 1
        }
        return res
    }
}

class Solution390Test: XCTestCase {
    func testLastRemaining01() {
        let n = 9
        let ans = 6
        let result = Solution390().lastRemaining(n)
        
        XCTAssertEqual(ans, result)
    }
}
