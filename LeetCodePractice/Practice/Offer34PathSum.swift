/* 剑指 Offer 34. 二叉树中和为某一值的路径
* 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。
*
* 叶子节点 是指没有子节点的节点。
*
*
*
* 示例 1：
*
*
*
* 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
* 输出：[[5,4,11,2],[5,8,4,5]]
* 示例 2：
*
*
*
* 输入：root = [1,2,3], targetSum = 5
* 输出：[]
* 示例 3：
*
* 输入：root = [1,2], targetSum = 0
* 输出：[]
*
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof
*
 */
 
import XCTest

class SolutionOffer34 {
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        func search(_ root: TreeNode?, _ target: Int) {
            var tmp = target
            guard let root = root else{
                return
            }
            path.append(root.val)
            tmp -= root.val
            if tmp == 0 && root.left == nil && root.right == nil {
                res.append(path)
            }
            
            search(root.left, tmp)
            search(root.right, tmp)
            path.removeLast()
        }
        
        search(root, target)
        return res
    }
}
