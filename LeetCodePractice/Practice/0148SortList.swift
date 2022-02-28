//
//  0148SortList.swift
//  Practice
//
//  Created by Silence on 2022/2/27.
//

import Foundation

class Solution148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        
        let middleNode = middleNode(head)
        
        let last = middleNode?.next
        middleNode?.next = nil
        
        let left = sortList(head)
        let right = sortList(last)
        
        return mergeNode(left, right)
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        
        while (fast != nil && fast?.next != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
    }
    
    func mergeNode(_ n1:ListNode?, _ n2: ListNode?) -> ListNode? {
        let dummpy = ListNode(-1)
        var tail: ListNode? = dummpy
        var node1 = n1, node2 = n2
        
        while (node1 != nil && node2 != nil) {
            if (node1!.val < node2!.val) {
                tail?.next = node1
                node1 = node1?.next
            } else {
                tail?.next = node2
                node2 = node2?.next
            }
            tail = tail?.next
        }
        
        tail?.next = node1 ?? node2
        
        return dummpy.next
    }
}
