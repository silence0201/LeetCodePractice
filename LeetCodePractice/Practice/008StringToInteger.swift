/* Implement atoi to convert a string to an integer.
 * 
 * Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 *
 * Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 */

class StringToInteger {
    func myAtoi(_ str: String) -> Int {
        let chars = [Character](str.characters)
        
        var result = 0
        var sign = 0
        var isPrefix = true
        for char in chars {
            if (char == " " || char == " ") && isPrefix {
                continue
            }
            
            isPrefix = false
            
            if char == "+" || char == "-" {
                if sign != 0 {
                    break
                }
                sign = char == "+" ? 1 : -1
                continue
            }
            
            if char >= "0" && char <= "9" {
                let charValue = Int(String(char))!
                
                if sign >= 0 && result > (Int(Int32.max) - charValue) / 10 {
                    result = Int(Int32.max)
                    break
                }
                
                if sign == -1 && result > (-Int(Int32.min) - charValue) / 10 {
                    result = -Int(Int32.min)
                    break
                }
                
                result = result * 10 + charValue
                
            } else {
                break
            }
        }
        
        if sign == 0 {
            sign = 1
        }
        return result * sign
    }
}
