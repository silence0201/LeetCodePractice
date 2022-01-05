//
//  1576ModifyString.swift
//  Practice
//
//  Created by Silence on 2022/1/5.
//

import XCTest

class Solution1576 {
    func modifyString(_ s: String) -> String {
        var charStr = Array(s)
        
        func change(_ index: Int) {
            let cs = "abc"
            for c in cs {
                if (index == 0) {
                    if (charStr.count == 1 || c != charStr[index+1]) {
                        charStr[index] = c
                        break
                    }
                    continue
                } else if (index == charStr.count - 1) {
                    if (c != charStr[index - 1]) {
                        charStr[index] = c
                        break
                    }
                    continue
                } else if (c != charStr[index - 1] && c != charStr[index + 1]) {
                    charStr[index] = c
                    break
                }
            }
        }
        
        for (index,value) in charStr.enumerated() {
            if (value == "?") {
                change(index)
            }
        }
        return String(charStr)
    }
}

class Solution1576Test: XCTestCase {
    func testFindNumberIn2DArray() {
        let s = "?a?ub???w?b"
        let ans = Solution1576().modifyString(s)
        
        XCTAssertFalse(ans.contains("?"))
    }
}
