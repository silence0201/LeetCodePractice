//
//  0794ValidTicTacToe.swift
//  Practice
//
//  Created by Silence on 2021/12/9.
//

import XCTest

class Solution794 {
    func validTicTacToe(_ board: [String]) -> Bool {
        //理解题意，给的棋盘是否符合规则
        //规则1，X先手，X的个数必须大于等于O，
        //规则2，轮流放，X多比O大一个
        //规则3，谁赢就停止，不会发生双赢的局面
        var xCount = 0
        var oCount = 0
        var list = [Character]()
        for i in 0...2{
            let strList = Array(board[i])
            for j in 0...2{
                let item = strList[j]
                list.append(item)
                if item == "X"{
                    xCount += 1
                    continue
                }
                if item == "O"{
                    oCount += 1
                    continue
                }
            }
        }
        
        if xCount < oCount || xCount > oCount + 1{
            return false
        }
        //不能双赢
        let xWin = win("X",list)
        let oWin =  win("O",list)
        if xWin && oWin{
            return false
        }
        if xWin && xCount != oCount + 1{
            return false
        }
        if oWin && oCount != xCount{
            return false
        }
        
        return true
    }

    func win(_ str : Character, _ list:[Character]) -> Bool{
        for i in 0...2{
            //行相同
            if(list[i*3] == str && list[i*3 + 1] == str && list[i*3 + 2] == str){
                return true
            }
            //列相同
            if(list[i] == str && list[i + 3] == str && list[i + 6] == str){
                return true
            }
        }

        if(list[0] == str && list[4] == str && list[8] == str){
            return true
        }
        if(list[2] == str && list[4] == str && list[6] == str){
            return true
        }

        return false
    }
}

class Solution794Test: XCTestCase {
    func testfindNthDigit01() {
        let board = ["O  ","   ","   "]
        let res = false
        XCTAssertEqual(Solution794().validTicTacToe(board), res)
    }
}
