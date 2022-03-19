//
//  0236LowestCommonAncestor.swift
//  Practice
//
//  Created by Silence on 2022/3/18.
//

import Foundation

class Solution236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
            
        if root === p || root === q {
            return root
        }
        
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        
        // 在树的左右两侧
        if left != nil && right != nil {
            return root
        }
         
        // 不在树上
        if left == nil && right == nil {
            return nil
        }
        
        // 在树的一侧
        return left ?? right
    }
}
