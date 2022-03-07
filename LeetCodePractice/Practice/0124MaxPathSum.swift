//
//  0124MaxPathSum.swift
//  Practice
//
//  Created by Silence on 2022/3/7.
//

import Foundation

class Solution124 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = Int.min
        
        func oneSildeMax(_ node: TreeNode?) -> Int {
            guard let node = node else {
                return 0
            }
            
            let left = max(0, oneSildeMax(node.left))
            let right = max(0,oneSildeMax(node.right))
            res = max(res,left + right + node.val)
            
            return max(left,right) + node.val
        }
        
        _ = oneSildeMax(root)
        
        return res
    }
}
