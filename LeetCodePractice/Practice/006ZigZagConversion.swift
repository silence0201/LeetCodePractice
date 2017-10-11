/* The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 *
 * P   A   H   N
 * A P L S I I G
 * Y   I   R
 * And then read line by line: "PAHNAPLSIIGYIR"
 * Write the code that will take a string and make this conversion given a number of rows:
 *
 * string convert(string text, int nRows);
 * convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
 */

import XCTest

class ZigZagConversion {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows >= 2 else {
            return s
        }
        
        let chars = [Character](s.characters)
        
        let loop = numRows + (numRows - 2)
        var result = ""
        for rowIndex in 0..<numRows {
            var row = ""
            for num in stride(from:rowIndex, to:chars.count, by: loop) {
                row.append(chars[num])
                
                if rowIndex > 0 && rowIndex < numRows - 1 { // 不是第一行和最后一行
                    let next = num + (numRows - rowIndex - 1) * 2
                    if next < chars.count {
                        row.append(chars[next])
                    }
                }
            }
            result.append(row)
        }
        return result
    }
}

class ZigZagConversionTest: XCTestCase {
    
    func testZigZagConversion() {
        let result = ZigZagConversion().convert("PAYPALISHIRING", 3)
        XCTAssertEqual(result,"PAHNAPLSIIGYIR","Error")
    }
    
}
