//
//  0104LevelOrder.swift
//  Practice
//
//  Created by Silence on 2022/1/6.
//

import Foundation

class Solution104 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var queue = [TreeNode]()
        guard let root = root else {
            return res
        }
        queue.append(root)
        while (!queue.isEmpty) {
            var arr = [Int]()
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                arr.append(first.val)
                if let left = first.left {
                    queue.append(left)
                }
                if let right = first.right {
                    queue.append(right)
                }
            }
            res.append(arr)
        }
        return res
    }
}
