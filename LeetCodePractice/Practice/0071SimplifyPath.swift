//
//  0071SimplifyPath.swift
//  Practice
//
//  Created by Silence on 2022/1/6.
//

import Foundation

class Solution71 {
    func simplifyPath(_ path: String) -> String {
        let components = path.split(separator: "/")
        
        var queue = [String.SubSequence]()
        for str in components {
            if str == "." {
                continue
            }
            if str == ".." {
                if queue.count > 0 {
                    queue.removeLast()
                }
            } else {
                queue.append(str)
            }
        }
        return "/" + queue.joined(separator: "/")
    }
}
