/* 剑指 Offer 30. 包含min函数的栈
* 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。
* 示例:
* MinStack minStack = new MinStack();
* minStack.push(-2);
* minStack.push(0);
* minStack.push(-3);
* minStack.min();   --> 返回 -3.
* minStack.pop();
* minStack.top();      --> 返回 0.
* minStack.min();   --> 返回 -2.
 
* 提示：
* 各函数的调用总次数不超过 20000 次
 
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof
*/

import Foundation

class MinStack {

    var stack: [Int]
    var minStack: [Int]
    
    init() {
        stack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.count == 0 || x < self.min() {
            minStack.append(x)
        } else {
            minStack.append(self.min())
        }
    }
    
    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }
    
    func top() -> Int {
        return stack.last ?? -1
    }
    
    func min() -> Int {
        return minStack.last ?? -1
    }
}
