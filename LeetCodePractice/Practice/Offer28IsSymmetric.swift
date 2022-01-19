//
//  Offer28IsSymmetric.swift
//  Practice
//
//  Created by Silence on 2022/1/19.
//

import Foundation

class SolutionOffer28 {
    func symmetricCompare(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        
        if root1 == nil || root2 == nil {
            return false
        }
        
        if root1?.val != root2?.val {
            return false
        }
        
        return symmetricCompare(root1?.left, root2?.right) && symmetricCompare(root2?.right, root1?.left)
    }
    
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return symmetricCompare(root, root)
    }
}
