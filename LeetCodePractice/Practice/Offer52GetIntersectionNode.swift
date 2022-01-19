//
//  Offer52GetIntersectionNode.swift
//  Practice
//
//  Created by Silence on 2022/1/20.
//

import Foundation

class SolutionOffer52 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard let headA = headA else {
            return nil
        }
        
        guard let headB = headB else {
            return nil
        }
        
        var n1: ListNode? = headA
        var n2: ListNode? = headB
        
        while (n1 !== n2) {
            n1 = n1 == nil ? headB : n1!.next
            n2 = n2 == nil ? headB : n2!.next
        }
        
        return n1
    }
}

extension ListNode: Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        // 用于唯一标识
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }

    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
 }
