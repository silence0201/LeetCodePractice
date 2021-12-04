/*
* 输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
*
* 示例 1:
*
* 输入: [10,2]
* 输出: "102"
* 示例 2:
*
* 输入: [3,30,34,5,9]
* 输出: "3033459"
*
* 链接：https://leetcode-cn.com/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof
*/ 

import XCTest

class SolutionOffer45 {
    func minNumber(_ nums: [Int]) -> String {
        let resAry = nums.sorted { Int("\($0)" + "\($1)")! < Int("\($1)" + "\($0)")! }
        let res = resAry.reduce("") { $0 + "\($1)"}
        return res
    }
}

class SolutionOffer45Test: XCTestCase {
    func testMinNumber01() {
        let nums = [10,2]
        let ans = "102"
        
        XCTAssertEqual(SolutionOffer45().minNumber(nums), ans)
    }
    
    func testMinNumber02() {
        let nums = [3,30,34,5,9]
        let ans = "3033459"
        
        XCTAssertEqual(SolutionOffer45().minNumber(nums), ans)
    }
}

