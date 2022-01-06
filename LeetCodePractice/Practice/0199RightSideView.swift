//
//  0199RightSideView.swift
//  Practice
//
//  Created by Silence on 2022/1/6.
//

import Foundation

class Solution199 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let size = queue.count
            for i in 0..<size {
                let node = queue.removeFirst()
                if i == size - 1 {
                    res.append(node.val)
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }
}
