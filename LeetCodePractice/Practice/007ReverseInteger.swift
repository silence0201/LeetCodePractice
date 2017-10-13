/* Reverse digits of an integer.
 *
 * Example1: x = 123, return 321
 * Example2: x = -123, return -321
 */

import XCTest

class ReverseInteger {
    func reverse(_ x: Int) -> Int {
        var isBelowZero = 1
        var num = x
        if x < 0 {
            isBelowZero = -1
            num = -x
        }
        
        var result = 0
        while  num > 0 {
            if result > (Int(Int32.max) - num % 10) / 10 {
                return 0
            }
            
            result = result * 10 + num % 10
            num = num / 10
        }
        
        return result * isBelowZero
    }
}


class ReverseIntegerTest: XCTestCase {
    func testReverseInteger() {
        let result1 = ReverseInteger().reverse(123)
        XCTAssertEqual(result1,321,"Error")
        
        let result2 = ReverseInteger().reverse(-123)
        XCTAssertEqual(result2, -321,"Error")
    }
}
