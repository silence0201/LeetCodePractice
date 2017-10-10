/* There are two sorted arrays nums1 and nums2 of size m and n respectively.
 *
 * Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 *
 * Example 1:
 * nums1 = [1, 3]
 * nums2 = [2]
 *
 * The median is 2.0
 * Example 2:
 * nums1 = [1, 2]
 * nums2 = [3, 4]
 *
 * The median is (2 + 3)/2 = 2.5
 */

import XCTest

class MedianOfTwoSortedArrays{
    class func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if (nums1.count + nums2.count) % 2 == 0 {
            let lowerMedian = findInSortedArrays(k: (nums1.count + nums2.count) / 2, nums1: nums1, nums2: nums2)
            let higherMedian = findInSortedArrays(k: (nums1.count + nums2.count) / 2 + 1, nums1: nums1, nums2: nums2)
            return (Double(lowerMedian) + Double(higherMedian)) / 2;
        } else {
            return Double(findInSortedArrays(k: (nums1.count + nums2.count + 1) / 2, nums1: nums1, nums2: nums2))
        }
    }
    
    class func findInSortedArrays(k: Int,  nums1: [Int], nums2: [Int]) -> Int {
        
        guard nums1.count <= nums2.count else {
            return findInSortedArrays(k: k, nums1: nums2, nums2: nums1)
        }
        
        guard nums1.count > 0 else {
            return nums2[k - 1]
        }
        
        guard k > 1 else {
            return min(nums1[0], nums2[0])
        }
        
        let num1Index = min(k / 2 - 1, nums1.count - 1)
        let num2Index = min(k / 2 - 1, nums2.count - 1)
        
        if nums1[num1Index] < nums2[num2Index] {
            return findInSortedArrays(k: k - (num1Index + 1), nums1: Array(nums1[num1Index + 1 ..< nums1.count]), nums2: nums2)
        } else {
            return findInSortedArrays(k: k - (num2Index + 1), nums1: nums1, nums2: Array(nums2[num2Index + 1 ..< nums2.count]))
        }
    }
}

class MedianOfTwoSortedArraysTest: XCTestCase {
    
    func testMedian() {
        
        let nums1 = [1, 3]
        let nums2 = [2]
        
        let median1 = MedianOfTwoSortedArrays.findMedianSortedArrays(nums1, nums2)
        XCTAssertEqual(median1,2.0,"Error")
        
        let nums3 = [1, 2]
        let nums4 = [3, 4]
        
        let median2 = MedianOfTwoSortedArrays.findMedianSortedArrays(nums3, nums4)
        XCTAssertEqual(median2,2.5,"Error")
    }
    
}
