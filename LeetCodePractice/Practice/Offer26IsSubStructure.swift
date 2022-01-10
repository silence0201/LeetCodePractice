//
//  Offer26IsSubStructure.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import Foundation

class SolutionOffer26 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard A != nil && B != nil else {
            return false
        }
        
        return dfs(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
    }
    
    func dfs(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard let B = B else {
            return true
        }
        
        guard let A = A else {
            return false
        }

        return A.val == B.val && dfs(A.left, B.left) && dfs(A.right, B.right)
    }
}
