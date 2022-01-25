//
//  Offer40GetLeastNumbers.swift
//  Practice
//
//  Created by Silence on 2022/1/22.
//

import Foundation

class SolutionOffer40 {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        let sorted = arr.sorted()
        let res = sorted[0..<k]
        return Array(res)
    }
}
