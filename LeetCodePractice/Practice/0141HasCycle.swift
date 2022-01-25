//
//  141HasCycle.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return false
        }
        
        var slow = head
        var fast = slow?.next
        while fast != nil && fast !== slow {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return fast != nil
    }
}
