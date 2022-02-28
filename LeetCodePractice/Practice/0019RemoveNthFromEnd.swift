//
//  0019RemoveNthFromEnd.swift
//  Practice
//
//  Created by Silence on 2022/2/27.
//

import Foundation

class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        guard n > 0 else {
            return head
        }
        
        let dummyHead = ListNode(-1,head)
        
        var slow: ListNode? = dummyHead
        var fast: ListNode? = dummyHead
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return dummyHead.next
    }
}
