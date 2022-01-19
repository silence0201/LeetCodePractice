//
//  Offer27MirrorTree.swift
//  Practice
//
//  Created by Silence on 2022/1/19.
//

import Foundation

class SolutionOffer27 {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let right = mirrorTree(root.right)
        let left = mirrorTree(root.left)
        root.right = left
        root.left = right
        
        return root
    }
}
