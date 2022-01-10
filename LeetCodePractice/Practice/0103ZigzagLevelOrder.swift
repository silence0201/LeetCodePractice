//
//  0103ZigzagLevelOrder.swift
//  Practice
//
//  Created by Silence on 2022/1/8.
//

import Foundation

class Solution103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var queue = [TreeNode]()
        guard let root = root else {
            return res
        }
        queue.append(root)
        while !queue.isEmpty {
            var arr = [Int]()
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                arr.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            if (res.count % 2 == 1) {
                res.append(arr.reversed())
            } else {
                res.append(arr)
            }
        }
        return res
    }
}
