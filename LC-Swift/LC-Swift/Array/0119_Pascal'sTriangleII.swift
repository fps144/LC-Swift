//
//  0119_Pascal'sTriangleII.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/7.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
*/

class PascalsTriangleIISolution {
    
    // TimeComplexity: O(n²) | SpaceComplexity: O(n)
    // Thought: 特殊处理第 0、1 行，其余行按照杨辉三角特性依次求出即可。
    // 执行用时 : 16 ms, 在Pascal's Triangle II的Swift提交中击败了75.86% 的用户
    // 内存消耗 : 18.7 MB, 在Pascal's Triangle II的Swift提交中击败了41.67% 的用户
    private func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex != 0 && rowIndex != 1 else {
            return rowIndex == 0 ? [1] : [1, 1]
        }
        
        var beforeRow = [1, 1]
        var tempRow = [Int]()
        for i in 0...rowIndex - 2 {
            let count = 2 + i
            tempRow = []
            for j in 0...count {
                if j == 0 || j == count {
                    tempRow.append(1)
                } else {
                    tempRow.append(beforeRow[j - 1] + beforeRow[j])
                }
            }
            beforeRow = tempRow
        }
        return tempRow
    }
    
    // Testcase: 3 -> [1,3,3,1]
    func test() {
        print(getRow(3))
    }
}
