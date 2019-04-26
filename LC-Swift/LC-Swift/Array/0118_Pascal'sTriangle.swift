//
//  0118_Pascal'sTriangle.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/26.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 输入: 5
 输出:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 */

class PascalsTriangleSolution {
    
    // Time Complexity: O(n²) | Space Complexity: O(n²)
    // Thought: 杨辉三角前两项特殊，从第三项开始，即存在普遍规律，仅需注意每一项的首尾都为1就行。
    // 执行用时 : 16 ms, 在Pascal's Triangle的Swift提交中击败了79.63% 的用户
    // 内存消耗 : 18.7 MB, 在Pascal's Triangle的Swift提交中击败了30.43% 的用户
    private func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        var row = 0
        while row < numRows {
            if row == 0 {
                result.append([1])
            } else if row == 1 {
                result.append([1, 1])
            } else {
                var tmp = [Int]()
                for index in 0...row {
                    if index == 0 || index == row {
                        tmp.append(1)
                    } else {
                        tmp.append(result[row - 1][index] + result[row - 1][index - 1])
                    }
                }
                result.append(tmp)
            }
            row += 1
        }
        return result
    }
    
    // Testcase: 5 -> [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    func test() {
        print(generate(5))
    }
}
