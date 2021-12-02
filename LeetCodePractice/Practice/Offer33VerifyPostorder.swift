/*
 * 剑指 Offer 33. 二叉搜索树的后序遍历序列
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。
*
*
*
* 参考以下这颗二叉搜索树：
*     5
*    / \
*   2   6
*  / \
* 1   3
* 示例 1：
*
* 输入: [1,6,3,2,5]
* 输出: false
* 示例 2：
*
* 输入: [1,3,2,6,5]
* 输出: true
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof
*/

import Foundation

class SolutionOffer33 {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        func postor(_ l: Int, _ r: Int) -> Bool {
            if l >= r {
                return true
            }
            var p = l
            // 左树全小
            while postorder[p] < postorder[r] {
                p = p + 1
            }
            // 左右分割位置
            let m = p
            
            // 右树全大
            while postorder[p] > postorder[r] {
                p = p + 1
            }
            return p == r && postor(l, m - 1) && postor(m, r - 1)
        }
        return postor(0, postorder.count - 1)
    }
}
