//
//  0999_AvailableCapturesForRook.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/26.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

class AvailableCapturesForRookSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 先找到 rock 的位置，记录其坐标。然后以 rock 坐标为中心，向东南西北找最近的 pawn(有效卒) 或 bishop(无效卒)
    // 执行用时 : 20 ms, 在Available Captures for Rook的Swift提交中击败了85.71% 的用户
    // 内存消耗 : 19.6 MB, 在Available Captures for Rook的Swift提交中击败了33.33% 的用户
    private func numRookCaptures(_ board: [[Character]]) -> Int {
        var result = 0
        var rock = (0, 0)
        var isFindRock = false
        for i in 0..<8 {
            guard !isFindRock else { break }
            for j in 0..<8 {
                if String(board[i][j]) == "R" {
                    rock = (i, j)
                    isFindRock = true
                    break
                }
            }
        }
        var vertical = rock.0 - 1
        var horizontal = rock.1
        var firstBishop = false
        var firstPawn = false
        while vertical >= 0 {
            guard !firstBishop && !firstPawn else { break }
            if String(board[vertical][horizontal]) == "B" { firstBishop = true; break}
            if String(board[vertical][horizontal]) == "p" { firstPawn = true; result += 1;break}
            vertical -= 1
        }
        
        firstBishop = false
        firstPawn = false
        vertical = rock.0 + 1
        while vertical <= 7 {
            guard !firstBishop && !firstPawn else { break }
            if String(board[vertical][horizontal]) == "B" { firstBishop = true; break}
            if String(board[vertical][horizontal]) == "p" { firstPawn = true; result += 1;break}
            vertical += 1
        }
        
        firstBishop = false
        firstPawn = false
        vertical = rock.0
        horizontal = rock.1 - 1
        while horizontal >= 0 {
            guard !firstBishop && !firstPawn else { break }
            if String(board[vertical][horizontal]) == "B" { firstBishop = true; break}
            if String(board[vertical][horizontal]) == "p" { firstPawn = true; result += 1;break}
            horizontal -= 1
        }
        
        firstBishop = false
        firstPawn = false
        horizontal = rock.1 + 1
        while horizontal <= 7 {
            guard !firstBishop && !firstPawn else { break }
            if String(board[vertical][horizontal]) == "B" { firstBishop = true; break}
            if String(board[vertical][horizontal]) == "p" { firstPawn = true; result += 1;break}
            horizontal += 1
        }
        
        return result
    }
    
    // Testcase: ↓ -> 0 | 3
    func test() {
//        let captures: [[Character]] = [
//            [".",".",".",".",".",".",".","."],
//            [".","p","p","p","p","p",".","."],
//            [".","p","p","B","p","p",".","."],
//            [".","p","B","R","B","p",".","."],
//            [".","p","p","B","p","p",".","."],
//            [".","p","p","p","p","p",".","."],
//            [".",".",".",".",".",".",".","."],
//            [".",".",".",".",".",".",".","."]
//        ]
        let captures: [[Character]] = [
            [".",".",".",".",".",".",".","."],
            [".",".",".","p",".",".",".","."],
            [".",".",".","p",".",".",".","."],
            ["p","p",".","R",".","p","B","."],
            [".",".",".",".",".",".",".","."],
            [".",".",".","B",".",".",".","."],
            [".",".",".","p",".",".",".","."],
            [".",".",".",".",".",".",".","."]
        ]
        print (numRookCaptures(captures))
    }
}
