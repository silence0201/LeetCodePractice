//
//  Offer18DeleteNode.swift
//  Practice
//
//  Created by Silence on 2022/1/19.
//

import Foundation

class SolutionOffer18 {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var res: ListNode? = head
        var pre: ListNode? = nil
        var current: ListNode? = res
        
        while current != nil {
            if (current?.val == val) {
                if pre == nil {
                    res = res!.next
                } else {
                    pre?.next = current?.next
                }
                break
            }
            pre = current
            current = current?.next
        }
        return res
    }
}
