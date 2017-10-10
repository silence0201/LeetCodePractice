/*

* Given an array of integers, return indices of the two numbers such that they add up to a specific target.
*
* You may assume that each input would have exactly one solution, and you may not use the same element twice.
*
* Example:
* Given nums = [2, 7, 11, 15], target = 9,
*
* Because nums[0] + nums[1] = 2 + 7 = 9,
* return [0, 1].
 
*/

import XCTest

class TwoSum {
    
    class func twoSum0(_ array:[Int],_ target: Int) ->[Int]? {
        for (index1,value1) in array.enumerated() {
            for (index2,value2) in array.enumerated() {
                if value1 + value2 == target {
                    return [index1,index2]
                }
            }
        }
        return nil
    }
    
    class func twoSum1 (_ array:[Int],_ target: Int) ->[Int]? {
        var dic = [Int: Int]()
        for (index,num) in array.enumerated() {
            if let lastIndex = dic[target - num] {
                return [lastIndex,index]
            }
            dic[num] = index
        }
        return nil
    }
}

class TwoSumTest: XCTestCase {
    let case0 = [2, 4, 6, 7, 8]
    let case1 = [2, 7, 11, 15]
    let case2 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
    
    func testTwoSum0() {
        let result0 = TwoSum.twoSum0(self.case0,9)!
        XCTAssert(result0.first == 0 && result0.last == 3, "Error")
        
        let result1 = TwoSum.twoSum0(self.case1,9)!
        XCTAssert(result1.first == 0 && result1.last == 1, "Error")
        
        let result2 = TwoSum.twoSum0(self.case2,9)
        XCTAssert(result2 == nil, "TowSum.twoSum0")
    }
    
    func testTwoSum1() {
        let result0 = TwoSum.twoSum1(self.case0,9)!
        XCTAssert(result0.first == 0 && result0.last == 3, "Error")
        
        let result1 = TwoSum.twoSum1(self.case1,9)!
        XCTAssert(result1.first == 0 && result1.last == 1, "Error")
        
        let result2 = TwoSum.twoSum1(self.case2,9)
        XCTAssert(result2 == nil, "TowSum.twoSum0")
    }

}
