//
//  0143ReOrderList.swift
//  Practice
//
//  Created by Silence on 2022/2/22.
//

import Foundation

class Solution143 {
    func reorderList(_ head: ListNode?) {
        guard head != nil && head?.next != nil else {
            return
        }
        let middle = middleNode(head)
        let tail = reverseReorderList(middle?.next)
        middle?.next = nil
        mergeNodeList(head, tail)
    }

    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast: ListNode? = head
        var slow: ListNode? = head
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    func reverseReorderList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        var next: ListNode? = nil

        while (cur != nil) {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }

    func mergeNodeList(_ node1: ListNode?, _ node2: ListNode?) {
        var before = node1
        var after = node2
        while before != nil && after != nil {
            let tmp1 = before?.next
            let tmp2 = after?.next
            
            before?.next = after
            after?.next = tmp1
            
            before = tmp1
            after = tmp2
        }
    }
}
