/* 1005. K 次取反后最大化的数组和
* 给你一个整数数组 nums 和一个整数 k ，按以下方法修改该数组：
*
* 选择某个下标 i 并将 nums[i] 替换为 -nums[i] 。
* 重复这个过程恰好 k 次。可以多次选择同一个下标 i 。
*
* 以这种方式修改数组后，返回数组 可能的最大和 。
*
* 示例 1：
*
* 输入：nums = [4,2,3], k = 1
* 输出：5
* 解释：选择下标 1 ，nums 变为 [4,-2,3] 。
* 示例 2：
*
* 输入：nums = [3,-1,0,2], k = 3
* 输出：6
* 解释：选择下标 (1, 2, 2) ，nums 变为 [3,1,0,2] 。
* 示例 3：
*
* 输入：nums = [2,-3,-1,5,-4], k = 2
* 输出：13
* 解释：选择下标 (1, 4) ，nums 变为 [2,3,-1,5,4] 。
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/maximize-sum-of-array-after-k-negations
*/

import XCTest

class Solution1005 {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var n = k
        var res = nums.sorted()
        for index in 0..<res.count {
            let value = res[index]
            if (value < 0 && n > 0) {
                res[index] = -value
                n -= 1
            }
        }
        res = res.sorted()
        if (n % 2 == 1) {
            res[0] *= -1
        }
        let sum = res.reduce(0) { $0 + $1 }
        return sum;
    }
}


class Solution1005Test: XCTestCase {
    func testfindNthDigit01() {
        let nums = [-2,5,0,2,-2]
        let res = 11
        XCTAssertEqual(Solution1005().largestSumAfterKNegations(nums, 3), res)
    }
}