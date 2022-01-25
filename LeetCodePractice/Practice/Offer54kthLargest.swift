//
//  Offer54kthLargest.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class SolutionOffer54 {
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var n = k
        var res = 0
        func dfs(_ root: TreeNode?) {
            if root == nil {
                return
            }
            dfs(root?.right)
            if n == 0 {
                return
            }
            n -= 1
            if n == 0 {
                res = root?.val ?? 0
            }
            dfs(root?.left)
        }
        dfs(root)
        return res
    }
}
