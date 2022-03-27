//
//  0014LongestCommonPrefix.swift
//  Practice
//
//  Created by Silence on 2022/3/27.
//

import Foundation

class Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let arys = strs.sorted { $0.count < $1.count }
    
        guard let minStr = arys.first else {
            return ""
        }
        for i in 0..<minStr.count {
            let preStr = String(minStr[minStr.startIndex..<minStr.index(minStr.endIndex, offsetBy: -i)])
            for (index,str) in strs.enumerated() {
                if (!str.hasPrefix(preStr)) {
                    break
                }
                
                if(index == strs.count - 1) {
                    return preStr
                }
            }
        }
        
        return ""
    }
}
