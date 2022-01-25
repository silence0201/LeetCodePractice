//
//  Offer024ReverseList.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return head
        }
        
        var prev: ListNode? = nil
        var current: ListNode? = head
        var next: ListNode? = nil
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
