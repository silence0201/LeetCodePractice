//
//  0306IsAdditiveNumber.swift
//  Practice
//
//  Created by Silence on 2022/1/10.
//

import XCTest

class Solution306 {
    func isAdditiveNumber(_ num: String) -> Bool {
        let numArray = Array(num)
        // 小于三位一定不是
        if numArray.count < 3 {
            return false
        }
        // 穷举第二个数的开头和结尾，通过计算得到第一个数，只要确定了第一第二个数，就能确定整个累加数列
        for secondStartIndex in 1..<numArray.count {
            //第一个数如果超过两位，则开头不能有0
            if (secondStartIndex - 1 > 0) && Int(String(numArray[0]))! == 0 {
                break
            }
            for secondEndIndex in secondStartIndex..<numArray.count {
                //第二个数如果超过两位，则开头不能有0
                if (secondEndIndex - secondStartIndex > 0) && Int(String(numArray[secondStartIndex]))! == 0 {
                    break
                }
                //确定了第二个数就可以开始做判断了
                if (valid(secondStartIndex, secondEndIndex)) {
                    return true
                }
            }
        }
        
        //判断函数
        func valid(_ start: Int, _ end: Int) -> Bool {
            var startT = start, endT = end //记录当前数的开头和结尾
            var preStart = 0, preEnd = startT-1 //记录上一个数的开头和结尾
            while endT < numArray.count-1 {
                let num1 = Int(String(numArray[preStart...preEnd]))!
                let num2 = Int(String(numArray[startT...endT]))!
                let num3Str = String(num1 + num2)
                let thirdStartIndex = endT + 1
                let thirdEndIndex = endT + num3Str.count
                // 如果计算出第三个数超出数组长度了，则累加数列不成立
                if thirdEndIndex > numArray.count-1 {
                    return false
                }
                let num3 = Int(String(numArray[thirdStartIndex...thirdEndIndex]))!
                //如果计算出第三个数正好等于剩余的数组长度，则累加数列成立
                if thirdEndIndex == numArray.count - 1  && Int(num3Str)! == num3{
                    return true
                } else if Int(num3Str)! == num3 {
                    //如果计算出第三个数与后面的数相等，且没超过数组长度，就继续遍历
                    preStart = startT
                    preEnd = endT
                    startT = thirdStartIndex
                    endT = thirdEndIndex
                } else {
                    //如果计算出第三个数与后面的数不相等，则累加数列不成立
                    return false
                }
            }
            return false
        }
        return false
    }
}

class Solution306Test: XCTestCase {
    func testFindNumberIn2DArray() {
        let num = "199111992"
        let ans = Solution309().isAdditiveNumber(num)
        
        XCTAssertTrue(ans)
    }
}

