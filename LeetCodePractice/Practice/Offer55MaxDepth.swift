//
//  Offer55MaxDepth.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class SolutionOffer55 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        
        let l = maxDepth(root.left)
        let r = maxDepth(root.right)
        
        return abs(l - r) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let maxLeft = maxDepth(root.left)
        let maxRight = maxDepth(root.right)
        return max(maxLeft, maxRight) + 1
    }
}
