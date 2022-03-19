//
//  0543DiameterOfBinaryTree.swift
//  Practice
//
//  Created by Silence on 2022/3/18.
//

import Foundation

class Solution543 {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxHeight = 0
        
        func oneSideHeight(_ node: TreeNode?) -> Int {
            guard let node = node else {
                return 0
            }
            
            let left = oneSideHeight(node.left)
            let right = oneSideHeight(node.right)
            maxHeight = max(maxHeight, left + right)
            
            return max(left, right) + 1
        }
        
        _ = oneSideHeight(root)
        return maxHeight
    }
}
