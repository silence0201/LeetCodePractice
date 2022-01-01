/* 33. 搜索旋转排序数组
* 整数数组 nums 按升序排列，数组中的值 互不相同 。
*
* 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
*
* 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。
*
*
* 示例 1：
*
* 输入：nums = [4,5,6,7,0,1,2], target = 0
* 输出：4
* 示例 2：
*
* 输入：nums = [4,5,6,7,0,1,2], target = 3
* 输出：-1
* 示例 3：
*
* 输入：nums = [1], target = 0
* 输出：-1
*
*
* 链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
* 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

import XCTest

class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) >> 1
            
            let leftValue = nums[left]
            let rightValue = nums[right]
            let midValue = nums[mid]
            if (midValue == target) {
                return mid
            }
            
            if (leftValue <= midValue) {
                if (target < midValue && target >= leftValue) {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if (target > midValue && target <= rightValue) {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        
        return -1
    }
}

class Solution33Test: XCTestCase {
    func testSearch01() {
        let nums = [8,9,2,3,4]
        let target = 9
        let ans = 1
        let result = Solution33().search(nums, target)
        
        XCTAssertEqual(ans, result)
    }
    
    func testSearch02() {
        let nums = [4,5,6,7,0,1,2]
        let target = 3
        let ans = -1
        let result = Solution33().search(nums, target)
        
        XCTAssertEqual(ans, result)
    }
    
    func testSearch03() {
        let nums = [1]
        let target = 1
        let ans = 0
        let result = Solution33().search(nums, target)
        
        XCTAssertEqual(ans, result)
    }
}
