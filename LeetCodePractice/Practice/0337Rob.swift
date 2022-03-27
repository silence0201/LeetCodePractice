//
//  0337Rob.swift
//  Practice
//
//  Created by Silence on 2022/3/19.
//

import Foundation

class Solution337 {
    func rob(_ root: TreeNode?) -> Int {
        let (rob, notRob) = robOrNot(root)
        return max(rob, notRob)
    }
    
    func robOrNot(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else {
            return (0, 0)
        }

        let (leftRob, leftNotRob) = robOrNot(root.left)
        let (rightRob, rightNotRob) = robOrNot(root.right)
        
        let rob = root.val + leftNotRob + rightNotRob
        let notRob = max(leftRob,leftNotRob) + max(rightRob,rightNotRob)
        
        return (rob, notRob)
    }
}
