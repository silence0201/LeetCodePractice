//
//  0104MaxDepth.swift
//  Practice
//
//  Created by Silence on 2022/3/18.
//

import Foundation

class Solution0104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        
        return max(leftDepth, rightDepth) + 1
    }
}
