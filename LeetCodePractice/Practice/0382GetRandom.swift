//
//  0382GetRandom.swift
//  Practice
//
//  Created by Silence on 2022/1/16.
//

import Foundation

class Solution382 {
    var head: ListNode?

    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        guard let head = head else {
            return 0
        }
        
        var res = head.val
        var count = 0
        var current: ListNode? = head
        
        while current != nil {
            count += 1
            if (Int.random(in: 0..<count) == 0) {
                res = current!.val
            }
            current = current!.next
        }
        
        return res
    }
}
