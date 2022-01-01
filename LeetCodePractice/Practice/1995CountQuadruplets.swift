/* 1995. 统计特殊四元组
* 给你一个 下标从 0 开始 的整数数组 nums ，返回满足下述条件的 不同 四元组 (a, b, c, d) 的 数目 ：
*
* nums[a] + nums[b] + nums[c] == nums[d] ，且
* a < b < c < d
*
*
* 示例 1：
*
* 输入：nums = [1,2,3,6]
* 输出：1
* 解释：满足要求的唯一一个四元组是 (0, 1, 2, 3) 因为 1 + 2 + 3 == 6 。
* 示例 2：
*
* 输入：nums = [3,3,6,4,5]
* 输出：0
* 解释：[3,3,6,4,5] 中不存在满足要求的四元组。
* 示例 3：
*
* 输入：nums = [1,1,1,3,5]
* 输出：4
* 解释：满足要求的 4 个四元组如下：
* - (0, 1, 2, 3): 1 + 1 + 1 == 3
* - (0, 1, 3, 4): 1 + 1 + 3 == 5
* - (0, 2, 3, 4): 1 + 1 + 3 == 5
* - (1, 2, 3, 4): 1 + 1 + 3 == 5
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/count-special-quadruplets
* 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import XCTest

class Solution1995 {
    func countQuadruplets(_ nums: [Int]) -> Int {
        let len = nums.count
        var res = 0
        var map = [Int: Int]()
        
        for c in (2..<len-1).reversed() {
            let count = map[nums[c+1]] ?? 0
            map[nums[c+1]] = count + 1
            
            for a in 0..<c {
                for b in a+1..<c {
                    if let count = map[nums[a] + nums[b] + nums[c]] {
                        res += count
                    }
                }
            }
        }
        return res
    }
}

class Solution1995Test: XCTestCase {
    func testCountQuadruplets01() {
        let nums = [1,2,3,6]
        let ans = 1
        let result = Solution1995().countQuadruplets(nums)
        XCTAssertEqual(ans, result)
    }
    
    func testCountQuadruplets02() {
        let nums = [3,3,6,4,5]
        let ans = 0
        let result = Solution1995().countQuadruplets(nums)
        XCTAssertEqual(ans, result)
    }
    
    func testCountQuadruplets03() {
        let nums = [9,6,8,23,39,23]
        let ans = 2
        let result = Solution1995().countQuadruplets(nums)
        XCTAssertEqual(ans, result)
    }
}
