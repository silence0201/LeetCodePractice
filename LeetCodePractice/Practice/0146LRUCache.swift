/* 146. LRU 缓存
* 请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。
* 实现 LRUCache 类：
* LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
* int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
* void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
* 函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。
*
*
*
* 示例：
*
* 输入
* ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
* [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
* 输出
* [null, null, null, 1, null, -1, null, -1, 3, 4]
*
* 解释
* LRUCache lRUCache = new LRUCache(2);
* lRUCache.put(1, 1); // 缓存是 {1=1}
* lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
* lRUCache.get(1);    // 返回 1
* lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
* lRUCache.get(2);    // 返回 -1 (未找到)
* lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
* lRUCache.get(1);    // 返回 -1 (未找到)
* lRUCache.get(3);    // 返回 3
* lRUCache.get(4);    // 返回 4
* 来源：力扣（LeetCode）
* 链接：https://leetcode-cn.com/problems/lru-cache
* 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

import Foundation

class LRUCacheNode {
    var key: Int!
    var value: Int!
    var prev: LRUCacheNode?
    var next: LRUCacheNode?
}

class LRUCache {

    var cache = [Int: LRUCacheNode]()
    var maxCount = 0
    var currentCount = 0
    var headerNode: LRUCacheNode?
    var tailNode: LRUCacheNode?

    init(_ capacity: Int) {
        self.maxCount = capacity
    }
    
    func get(_ key: Int) -> Int {
        let node = cache[key]

        if node == nil {
            return -1
        }

        self.put(key, node!.value)
        return node!.value
    }
    
    func put(_ key: Int, _ value: Int) {
        var node = cache[key]

        if node == nil {
            node = LRUCacheNode()
            node?.key = key
            node?.value = value

            cache[key] = node

            headerNode?.prev = node

            node?.prev = nil
            node?.next = headerNode

            headerNode = node
            if currentCount == 0 { tailNode = headerNode }
            currentCount += 1

        } else {
            node?.value = value
            if node?.key == headerNode?.key {
                return
            }

            if node?.key == tailNode?.key {
                tailNode = node?.prev
            }
            
            node?.next?.prev = node?.prev
            node?.prev?.next = node?.next
            
            node?.prev = nil
            node?.next = headerNode
            
            headerNode?.prev = node

            headerNode = node
        }

        while currentCount > maxCount {
            let oldTailNode = tailNode
            tailNode = oldTailNode?.prev
            
            tailNode?.next = nil

            oldTailNode?.prev = nil
            oldTailNode?.next = nil

            cache.removeValue(forKey: oldTailNode!.key)
            currentCount -= 1
        }
    }
}
