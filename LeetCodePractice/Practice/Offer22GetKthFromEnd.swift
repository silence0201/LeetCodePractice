//
//  Offer22GetKthFromEnd.swift
//  Practice
//
//  Created by Silence on 2022/1/19.
//

import Foundation

class SolutionOffer22 {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var tk = k
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while tk > 0 {
            fast = fast?.next
            tk -= 1
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
}
