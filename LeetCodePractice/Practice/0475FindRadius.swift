/* 475. 供暖器
* 冬季已经来临。 你的任务是设计一个有固定加热半径的供暖器向所有房屋供暖。
*
* 在加热器的加热半径范围内的每个房屋都可以获得供暖。
*
* 现在，给出位于一条水平线上的房屋 houses 和供暖器 heaters 的位置，请你找出并返回可以覆盖所有房屋的最小加热半径。
*
* 说明：所有供暖器都遵循你的半径标准，加热的半径也一样。
*
* 示例 1:
*
* 输入: houses = [1,2,3], heaters = [2]
* 输出: 1
* 解释: 仅在位置2上有一个供暖器。如果我们将加热半径设为1，那么所有房屋就都能得到供暖。
* 示例 2:
*
* 输入: houses = [1,2,3,4], heaters = [1,4]
* 输出: 1
* 解释: 在位置1, 4上有两个供暖器。我们需要将加热半径设为1，这样所有房屋就都能得到供暖。
* 示例 3：
*
* 输入：houses = [1,5], heaters = [2]
* 输出：3
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/heaters
*/

import XCTest

class Solution475 {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let sortedHeaters = heaters.sorted()
        
        var result = 0
        var left = 0
        var right = sortedHeaters.count
        
        for house in houses {
            left = 0
            right = sortedHeaters.count
            while left < right {
                let mid = (right + left) >> 1
                if sortedHeaters[mid] >= house {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            
            if right == 0 {
                result = max(result, abs(house - sortedHeaters.first!))
            } else if right == sortedHeaters.count {
                result = max(result, abs(house - sortedHeaters.last!))
            } else {
                let rightRadius = abs(house - sortedHeaters[right])
                let leftRadius = abs(house - sortedHeaters[right - 1])
                result = max(result, min(leftRadius, rightRadius))
            }
        }
        return result
    }
}

class SolutionOffer475Test: XCTestCase {
    func testFindRadius01() {
        let houses = [1,2,3,4]
        let heaters = [1,4]
        let ans = 1
        let result = Solution475().findRadius(houses, heaters)
        
        XCTAssertEqual(ans, result)
    }
}
