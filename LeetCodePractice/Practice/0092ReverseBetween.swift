//
//  0092ReverseBetween.swift
//  Practice
//
//  Created by Silence on 2022/1/8.
//

import XCTest

class Solution92 {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let root = ListNode(-1)
        root.next = head
        var prev: ListNode? = root
        
        for _ in 0 ..< left - 1 {
            prev = prev?.next
        }
        
        let cur: ListNode? = prev?.next
        var next: ListNode? = nil
        
        for _ in 0 ..< right - left {
            next = cur?.next
            cur?.next = next?.next
            next?.next = prev?.next
            prev?.next = next
        }
        return root.next
    }
}
