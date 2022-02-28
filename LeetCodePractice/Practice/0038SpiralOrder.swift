//
//  0038SpiralOrder.swift
//  Practice
//
//  Created by Silence on 2022/2/22.
//

import Foundation

class Solution38: Codable {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var left = 0
        var right = matrix[0].count - 1
        var top = 0
        var bottom = matrix.count - 1
        
        var res = [Int]()
        while left <= right && top <= bottom {
            // left -> right
            for i in left...right {
                res.append(matrix[top][i])
            }
            
            // top -> bottom
            if (top < bottom) {
                for i in top+1...bottom {
                    res.append(matrix[i][right])
                }
            }
            
            // right -> left
            if (top < bottom && left < right) {
                for i in (left...right-1).reversed() {
                    res.append(matrix[bottom][i])
                }
            }
            
            // bottom -> top
            if (left < right && top < bottom - 1) {
                for i in (top+1...bottom-1).reversed() {
                    res.append(matrix[i][left])
                }
            }
            
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        
        return res
    }
}


