/*剑指 Offer 46. 把数字翻译成字符串
*
* 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。
*
* 示例 1:
*
* 输入: 12258
* 输出: 5
* 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
*
* 链接：https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof
*/

import XCTest

class SolutionOffer46 {
    func translateNum(_ num: Int) -> Int {
        var res = 0
        let numStr = String(num)
        
        func search(_ cur: Int, _ string: String) {
            let n = Int(string)!
            let length = string.count
            if (length == 2 && (n > 25 || n < 10)) {
                return
            }
            
            if (cur == numStr.count - 1) {
                res += 1
                return
            }
            
            if (length != 2) {
                let str = numStr.subString(cur, 2)
                search(cur + 1, str)
            }
            
            let str = numStr.subString(cur + 1, 1)
            search(cur + 1, str)
        }
        
        let startStr = numStr.subString(0, 1)
        search(0, startStr)
        
        return res
    }
}

class SolutionOffer46Test: XCTestCase {
    func testTranslateNum01() {
        let num = 12258
        let ans = 5
        XCTAssertEqual(SolutionOffer46().translateNum(num), ans)
    }
}
