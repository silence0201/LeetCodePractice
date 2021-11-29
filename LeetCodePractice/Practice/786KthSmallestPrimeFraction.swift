/*
* 给你一个按递增顺序排序的数组 arr 和一个整数 k 。数组 arr 由 1 和若干 素数  组成，且其中所有整数互不相同。
*
* 对于每对满足 0 < i < j < arr.length 的 i 和 j ，可以得到分数 arr[i] / arr[j] 。
*
* 那么第 k 个最小的分数是多少呢?  以长度为 2 的整数数组返回你的答案, 这里 answer[0] == arr[i] 且 answer[1] == arr[j] 。
*
*
* 示例 1：
*
* 输入：arr = [1,2,3,5], k = 3
* 输出：[2,5]
* 解释：已构造好的分数,排序后如下所示:
* 1/5, 1/3, 2/5, 1/2, 3/5, 2/3
* 很明显第三个最小的分数是 2/5
* 示例 2：
*
* 输入：arr = [1,7], k = 1
* 输出：[1,7]
*
* 链接：https://leetcode-cn.com/problems/k-th-smallest-prime-fraction
*/
import XCTest

class Solution786 {
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var tmp = [[Int]]()
        for i in 0..<arr.count-1 {
            for j in i+1..<arr.count {
                let value = [arr[i], arr[j]]
                tmp.append(value)
            }
        }
        
        let resAry = tmp.sorted { m, n in
            return m[0] * n[1] < m[1] * n[0];
        }
        
        if (k > resAry.count) {
            return []
        }
        
        return resAry[k-1]
    }
}

class Solution786Test: XCTestCase {
    func testKthSmallestPrimeFraction01() {
        let arr = [1,2,3,5]
        let k = 3;
        let res = [2,5]
        XCTAssertEqual(Solution786().kthSmallestPrimeFraction(arr, k),res)
    }
    
    func testKthSmallestPrimeFraction02() {
        let arr = [1,7]
        let k = 1
        let res = [1,7]
        XCTAssertEqual(Solution786().kthSmallestPrimeFraction(arr, k),res)
    }
}
