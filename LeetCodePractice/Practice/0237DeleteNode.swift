//
//  0237DeleteNode.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class Solution237 {
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? -1
        node?.next = node?.next?.next
    }
}
