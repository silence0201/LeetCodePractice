//
//  0076Exist.swift
//  Practice
//
//  Created by Silence on 2022/3/4.
//

import Foundation

class Solution076 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var res = false
        
        guard board.count > 0, word.count > 0 else {
            return false
        }
        
        let row = board.count
        let colum = board[0].count

        let word = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: colum), count: row)

        func backtrack(_ i: Int, _ j: Int, _ index: Int) -> Bool {
            if index >= word.count {
                return true
            }
            
            if i < 0 || j < 0 || i >= row || j >= colum {
                return false
            }

            if board[i][j] != word[index] {
                return false
            }

            if visited[i][j] == true {
                return false
            }

            visited[i][j] = true
     
            if backtrack(i + 1, j, index + 1)  ||
               backtrack(i - 1, j, index + 1)  ||
               backtrack(i, j + 1, index + 1)  ||
               backtrack(i, j - 1, index + 1) {
                return true
            }

            visited[i][j] = false
            return false
        }
        
        for i in 0..<row {
            for j in 0..<colum {
                if backtrack(i, j, 0) {
                    res = true
                }
            }
        }

        return res
    }
}
