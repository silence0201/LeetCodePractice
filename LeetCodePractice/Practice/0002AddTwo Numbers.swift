/*
 * You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 *
 * You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 *
 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 */

import XCTest

class Solution2 {
    func addTwoNumbers(_ l1: LinkNode?, _ l2: LinkNode?) -> LinkNode? {
        var link1 = l1
        var link2 = l2
        
        let result = LinkNode()
        
        var current = result
        var sum = 0
        
        while link1 != nil || link2 != nil {
            if let link = link1 {
                sum += link.value
                link1 = link.next
            }
            
            if let link = link2 {
                sum += link.value
                link2 = link.next
            }
            
            
            current.next = LinkNode(sum % 10)
            sum /= 10
            current = current.next!
        }
        
        if (sum > 0) {
            current.next = LinkNode(sum % 10)
        }
        return result.next
    }
}

func +(l: LinkNode, r: LinkNode) -> LinkNode {
    return Solution2().addTwoNumbers(l, r) ?? LinkNode(0)
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
