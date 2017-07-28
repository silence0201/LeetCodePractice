//
//  002Add Two Numbers.swift
//  LeetCodePractice
//
//  Created by 杨晴贺 on 2017/7/28.
//
//

/*
 * You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 *
 * You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 *
 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 */

import Foundation
import XCTest

func +(l: LinkNode, r: LinkNode) -> LinkNode {
    var link0: LinkNode? = l
    var link1: LinkNode? = r
    
    let result = LinkNode()
    var current = result
    var sum = 0
    
    while  link0 != nil || link1 != nil{
        sum /= 10
        
        if let link = link0 {
            sum += link.value
            link0 = link.next
        }
        
        if let link = link1 {
            sum += link.value
            link1 = link.next
        }
        
        // 移到下一个
        current.next = LinkNode(sum % 10)
        current = current.next!
    }
    
    // 如果上一个节点大于10
    if sum / 10 > 0{
        current.next = LinkNode(1)
    }
    
    return result.next!
}

class AddTwoNumbersTest: XCTestCase {
    
    func testAddTwoNumbers() {
        let l0 = LinkNode(2, LinkNode(4, LinkNode(3))) + LinkNode(5, LinkNode(6, LinkNode(4)))
        XCTAssertEqual(l0.debugDescription, "7 0 8", "")
        
        let l1 = LinkNode(1, LinkNode(3, LinkNode(5))) + LinkNode(9, LinkNode(5, LinkNode(5)))
        XCTAssertEqual(l1.debugDescription, "0 9 0 1", "")
        
        let l2 = LinkNode(0) + LinkNode(0)
        XCTAssertEqual(l2.debugDescription, "0", "")
        
        let l3 = LinkNode(5) + LinkNode(5)
        XCTAssertEqual(l3.debugDescription, "0 1", "")
        
        let l4 = LinkNode(8) + LinkNode(5, LinkNode(2))
        XCTAssertEqual(l4.debugDescription, "3 3", "")
        
        let l5 = LinkNode(9) + LinkNode(9, LinkNode(9))
        XCTAssertEqual(l5.debugDescription, "8 0 1")
    }
    
}
