//
//  LinkNode.swift
//  LeetCodePractice
//
//  Created by Silence on 2017/7/28.
//
//

import Foundation

class LinkNode: CustomDebugStringConvertible {
    
    var value: Int = 0
    var next: LinkNode? = nil
    
    init(_ value: Int = 0,_ next: LinkNode? = nil) {
        self.value = value
        self.next = next
    }
    
    var debugDescription: String {
        var v = "\(value)"
        var p = self
        while p.next != nil {
            p = p.next!
            v = "\(v) \(p.value)"
        }
        return v;
    }
}
