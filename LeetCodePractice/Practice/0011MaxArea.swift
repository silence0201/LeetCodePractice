/* 11. 盛最多水的容器
* 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
* 说明：你不能倾斜容器。
*
* 示例 1：
*
* 输入：[1,8,6,2,5,4,8,3,7]
* 输出：49
* 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
* 示例 2：
*
* 输入：height = [1,1]
* 输出：1
* 示例 3：
*
* 输入：height = [4,3,2,1,4]
* 输出：16
* 示例 4：
*
* 输入：height = [1,2,1]
* 输出：2
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/container-with-most-water
*/

import XCTest

class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        var ans = 0
        
        var left = 0
        var right = height.count - 1
        
        while (left < right) {
            let leftValue = height[left]
            let rightValue = height[right]
            let res = (right - left) * min(leftValue, rightValue)
            ans = max(res, ans)
            if (leftValue < rightValue) {
                left += 1
            } else {
                right -= 1
            }
        }
        return ans
    }
}

class Solution11Test: XCTestCase {
    func testmaxArea01() {
        let height = [1,8,6,2,5,4,8,3,7]
        let ans = 49
        let result = Solution11().maxArea(height)
        XCTAssertEqual(ans, result)
    }
    
    func testmaxArea02() {
        let height = [4,3,2,1,4]
        let ans = 16
        let result = Solution11().maxArea(height)
        XCTAssertEqual(ans, result)
    }
    
    func testmaxArea03() {
        let height = [1,2,1]
        let ans = 2
        let result = Solution11().maxArea(height)
        XCTAssertEqual(ans, result)
    }
}
