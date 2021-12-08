/* 689. 三个无重叠子数组的最大和
* 给你一个整数数组 nums 和一个整数 k ，找出三个长度为 k 、互不重叠、且 3 * k 项的和最大的子数组，并返回这三个子数组。
* 以下标的数组形式返回结果，数组中的每一项分别指示每个子数组的起始位置（下标从 0 开始）。如果有多个结果，返回字典序最小的一个。
*
* 示例 1：
*
* 输入：nums = [1,2,1,2,6,7,5,1], k = 2
* 输出：[0,3,5]
* 解释：子数组 [1, 2], [2, 6], [7, 5] 对应的起始下标为 [0, 3, 5]。
* 也可以取 [2, 1], 但是结果 [1, 3, 5] 在字典序上更大。
* 示例 2：
*
* 输入：nums = [1,2,1,2,1,2,1,2,1], k = 2
* 输出：[0,2,4]
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/maximum-sum-of-3-non-overlapping-subarrays
*/

import XCTest

class Solution689 {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let size = nums.count - k + 1
        var sum = [Int](repeating: 0, count: size)
        for i in 0..<k {
            sum[0] += nums[i]
        }
        
        for i in 1..<size {
            sum[i] = sum[i-1]-nums[i-1]+nums[i+k-1]
        }
        
        var left = [Int](repeating: 0, count: size)
        var right = [Int](repeating: size - 1, count: size)
        for i in 1..<size {
            left[i] = sum[i] > sum[left[i-1]] ? i:left[i-1]
            right[size-1-i] = sum[size-1-i] >= sum[right[size-i]] ? size-1-i: right[size-i];
        }
        
        var res = [Int](repeating: 0, count: 3)
        var maxSum = 0
        
        for i in k...nums.count-2*k {
            let tmpMax = sum[i] + sum[left[i-k]] + sum[right[i+k]]
            if (maxSum < tmpMax){
                maxSum = tmpMax
                res[0] = left[i-k]
                res[1] = i
                res[2] = right[i+k]
            }
        }
        
        return res
    }
}

class Solution689Test: XCTestCase {
    func testfindNthDigit01() {
        let nums = [1,2,1,2,6,7,5,1]
        let k = 2
        let res = [0,3,5]
        XCTAssertEqual(Solution689().maxSumOfThreeSubarrays(nums, k), res)
    }
}
