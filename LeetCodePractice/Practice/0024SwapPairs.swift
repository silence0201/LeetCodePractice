//
//  0024SwapPairs.swift
//  Practice
//
//  Created by Silence on 2022/3/1.
//

import Foundation

class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(-1, head)
        var cur: ListNode? = dummyHead
        while (cur?.next != nil && cur?.next?.next != nil) {
            let first = cur?.next
            let second = cur?.next?.next
            
            cur?.next = second
            first?.next = second?.next
            second?.next = first
            
            cur = first
        }
        return dummyHead.next
    }
}
