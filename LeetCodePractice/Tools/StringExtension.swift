//
//  StringExtension.swift
//  Practice
//
//  Created by Silence on 2021/11/26.
//

import Foundation

extension String {
    //获取字符串首字符
    var first: String {
        get{return String(self[startIndex])}
        
    }
  
    // 获取字符串尾字符
    var last: String {
          //注意最后一个字符的索引位置
          get{return String(self[index(before: self.endIndex)])}
    }
 
    //字符串所表示数字的ASCII整数值(定义大写为字符值)
    var ASCII:Character {
          get {return Character(UnicodeScalar(Int(self)!)!)}
      }
 
    //字符的ASCII整数值(定义小写为整数值)
    var ascii: Int {
        get{return Int(self.unicodeScalars.first!.value)}
    }
 
    //获取指定索引位置的字符，返回为字符串形式
    func charAt(_ num:Int) -> String {
        return String(self[index(self.startIndex,offsetBy: num)])
    }
 
    // 将字符串转为指定进制的Int
    //Radix is in range 2...36
    func convertToInt(_ num:Int) -> Int {
          //Radix is in range 2...36
          //判断区间是否包含包含某个特定的值
          if (2...36).contains(num) {
              return Int(self, radix: num)!
          }
          return 0
    }
 
    //获取重复指定次数的字符串
    func repeatString(_ times: Int ) -> String {
          var result = String()
          for _ in 0...times {
              result += self
          }
          return result
      }
 
      //整体反转字符串
      func reverse() -> String
      {
          return String(self.reversed())
      }
 
      // 截取字符串：从起始处到index
      // - Parameter index: 结束索引
      // - Returns: 子字符串
      func subStringTo(_ index: Int) -> String {
          let theIndex = self.index(self.startIndex,offsetBy:min(self.count,index))
          return String(self[startIndex...theIndex])
      }
 
      // 截取字符串：从index到结束处
      // - Parameter index: 开始索引
      // - Returns: 子字符串
      func subStringFrom(_ index: Int) -> String {
          let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
          return String(self[theIndex..<endIndex])
      }
 
      // 截取字符串：指定区间
      // - Parameter range: 闭区间
      // - Returns: 子字符串
      func subStringInRange(_ range: CountableClosedRange<Int>) -> String {
          let start = self.index(self.startIndex, offsetBy: max(0, range.lowerBound))
          let end = self.index(self.startIndex, offsetBy: min(self.count, range.upperBound))
          return String(self[start...end])
      }
 
      //截取字符串：指定索引和字符数
      // - begin: 开始截取处索引
      // - count: 截取的字符数量
      func subString(_ begin:Int,_ count:Int) -> String {
          let start = self.index(self.startIndex, offsetBy: max(0, begin))
          let end = self.index(self.startIndex, offsetBy:  min(self.count, begin + count))
          return String(self[start..<end])
      }
 
      //subscript函数可以检索数组中的值
      //直接按照索引方式截取指定索引的字符
      subscript (_ i: Int) -> Character {
         //读取字符
         get {return self[index(startIndex, offsetBy: i)]}

         //修改字符
         set
         {
             //转换为字符数组
             var arr:[Character] = Array(self)
             arr[i] = newValue
             self = String(arr)
         }
     }

     //subscript函数可以检索数组中的值
     //直接按照索引方式截取指定索引的字符串
     subscript(_ numbers: Int...) -> String {
         var str:String = String()
         for num in numbers {
             str.append(self[num])
         }
         return str
     }

     //subscript函数可以检索数组中的值
     //直接按照索引方式截取指定索引的字符串
     subscript (bounds: CountableRange<Int>) -> Substring {
         let start = index(startIndex, offsetBy: bounds.lowerBound)
         let end = index(startIndex, offsetBy: bounds.upperBound)
         return self[start ..< end]
     }

     subscript (bounds: CountableClosedRange<Int>) -> Substring {
         let start = index(startIndex, offsetBy: bounds.lowerBound)
         let end = index(startIndex, offsetBy: bounds.upperBound)
         return self[start ... end]
     }

     subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
         let start = index(startIndex, offsetBy: bounds.lowerBound)
         let end = index(endIndex, offsetBy: -1)
         return self[start ... end]
     }

     subscript (bounds: PartialRangeThrough<Int>) -> Substring {
         let end = index(startIndex, offsetBy: bounds.upperBound)
         return self[startIndex ... end]
     }

     subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
         let end = index(startIndex, offsetBy: bounds.upperBound)
         return self[startIndex ..< end]
     }
 }
