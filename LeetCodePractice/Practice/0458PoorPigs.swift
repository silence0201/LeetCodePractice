/* 
* 有 buckets 桶液体，其中正好有一桶含有毒药，其余装的都是水。
* 它们从外观看起来都一样。为了弄清楚哪只水桶含有毒药，你可以喂一些猪喝
* 通过观察猪是否会死进行判断。不幸的是，你只有 minutesToTest 分钟时间来确定哪桶液体是有毒的。
*
* 喂猪的规则如下：
*
* 选择若干活猪进行喂养
* 可以允许小猪同时饮用任意数量的桶中的水，并且该过程不需要时间。
* 小猪喝完水后，必须有 minutesToDie 分钟的冷却时间。在这段时间里，你只能观察，而不允许继续喂猪。
* 过了 minutesToDie 分钟后，所有喝到毒药的猪都会死去，其他所有猪都会活下来。
* 重复这一过程，直到时间用完。
* 给你桶的数目 buckets ，minutesToDie 和 minutesToTest ，返回在规定时间内判断哪个桶有毒所需的 最小 猪数。
*
* 链接：https://leetcode-cn.com/problems/poor-pigs
*
*/

import XCTest

class Solution458 {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let times = minutesToTest / minutesToDie;
        let base = times + 1;
        // base ^ ans >= buckets
        // ans >= log(buckets) / log(base)
        let temp = log(Double(buckets)) / log(Double(base));
        let ans = Int(ceil(temp))
        return ans;
    }
}

class Solution458Test: XCTestCase {
    func testPoorPigs1() {
        let result = Solution458().poorPigs(1000, 15, 60)
        let answer = 5;
        
        XCTAssert(result == answer, "Error");
    }
    
    func testPoorPigs2() {
        let result = Solution458().poorPigs(4, 15, 15)
        let answer = 2;
        
        XCTAssert(result == answer, "Error");
    }
    
    func testPoorPigs3() {
        let result = Solution458().poorPigs(4, 15, 30)
        let answer = 2;
        
        XCTAssert(result == answer, "Error");
    }
}
