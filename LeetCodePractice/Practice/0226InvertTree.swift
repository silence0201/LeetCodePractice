//
//  0226InvertTree.swift
//  Practice
//
//  Created by Silence on 2022/3/18.
//

import Foundation

class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let leftRoot = invertTree(root.left)
        let rightRoot = invertTree(root.right)
        
        root.left = rightRoot
        root.right = leftRoot
        
        return root
    }
}
