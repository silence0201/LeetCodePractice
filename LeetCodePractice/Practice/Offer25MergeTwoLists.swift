//
//  Offer25MergeTwoLists.swift
//  Practice
//
//  Created by Silence on 2022/1/20.
//

import Foundation

class SolutionOffer25 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        let head = ListNode(-1)
        var pre: ListNode? = head

        var node1: ListNode? = l1
        var node2: ListNode? = l2
        
        while node1 != nil && node2 != nil {
            if (node1!.val < node2!.val) {
                pre?.next = node1
                node1 = node1?.next
            } else {
                pre?.next = node2
                node2 = node2?.next
            }
            pre = pre?.next
        }
        pre?.next = node1 ?? node2
        
        return head.next
    }
}
