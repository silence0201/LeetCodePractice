//
//  0105BuildTree.swift
//  Practice
//
//  Created by Silence on 2022/3/7.
//

import Foundation

class Solution105 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorder = preorder, inorder = inorder
        if (preorder.isEmpty) {
            return nil
        }
        
        if (preorder.count == 1) {
            return TreeNode(preorder.first!)
        }
        
        let root = preorder.removeFirst()
        
        let inorderRootIndex = inorder.firstIndex(of: root)!
        
        let inorderLeft = inorder.prefix(upTo:inorderRootIndex)
        let inorderRight = inorder.suffix(from:inorderRootIndex + 1)
        
        let preorderLeft = preorder.prefix(upTo: inorderLeft.count)
        let preorderRight = preorder.suffix(from: inorderLeft.count)
        
        let leftNode = buildTree(Array(preorderLeft), Array(inorderLeft))
        let rightNode = buildTree(Array(preorderRight), Array(inorderRight))
        let node = TreeNode(root, leftNode, rightNode)
        return node
    }
}
