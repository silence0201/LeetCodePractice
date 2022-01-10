//
//  Offer32LevelOrder.swift
//  Practice
//
//  Created by Silence on 2022/1/11.
//

import Foundation

class SolutionOffer32 {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            res.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        return res
    }
}
