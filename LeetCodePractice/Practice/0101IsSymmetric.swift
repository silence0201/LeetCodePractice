//
//  0101IsSymmetric.swift
//  Practice
//
//  Created by Silence on 2022/3/18.
//

import Foundation

class Solution101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return symmetric(root?.left, root?.right)
    }
    
    func symmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if (left == nil && right == nil) {
            return true
        }
        if (left == nil || right == nil) {
            return false
        }
        
        if (left?.val != right?.val) {
            return false
        }
        
        return symmetric(left?.left, right?.right) && symmetric(left?.right, right?.left)
    }
    
}
