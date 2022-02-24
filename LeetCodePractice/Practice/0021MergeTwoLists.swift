//
//  0021MergeTwoLists.swift
//  Practice
//
//  Created by Silence on 2022/2/24.
//

import Foundation

class Solution21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let head = ListNode(-1)
        
        var cur:ListNode? = head
        var l1 = list1,l2 = list2
        
        while (l1 != nil && l2 != nil) {
            if (l1!.val < l2!.val) {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        
        cur?.next = l1 != nil ? l1 : l2
        
        return head.next
    }
}
