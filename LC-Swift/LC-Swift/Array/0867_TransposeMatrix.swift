//
//  0867_TransposeMatrix.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/24.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个矩阵 A， 返回 A 的转置矩阵。
 
 矩阵的转置是指将矩阵的主对角线翻转，交换矩阵的行索引与列索引。
 
 示例 1：
 
 输入：[[1,2,3],[4,5,6],[7,8,9]]
 输出：[[1,4,7],[2,5,8],[3,6,9]]
 
 示例 2：
 
 输入：[[1,2,3],[4,5,6]]
 输出：[[1,4],[2,5],[3,6]]
 
 提示：
 
 1 <= A.length <= 1000
 1 <= A[0].length <= 1000
 */

class TransposeMatrixSolution {
    
    // Time Complexity: O(n * m) | Space Complexity: O(n)
    // Thought: 转置矩阵在数组上的表现就是将内层数组相同的 index 对应的值取出放入新数组中，新数组的个数与每个内层数组的元素个数相同。
    // 执行用时 : 156 ms, 在Transpose Matrix的Swift提交中击败了62.50% 的用户
    // 内存消耗 : 19 MB, 在Transpose Matrix的Swift提交中击败了100.00% 的用户
    private func transpose(_ A: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        for n in 0..<A.first!.count {
            var node = [Int]()
            for item in A {
                node.append(item[n])
            }
            result.append(node)
        }
        return result
    }
    
    // Testcase: [[1,2,3],[4,5,6]] -> [[1,4],[2,5],[3,6]]
    func test() {
        print(transpose([[1,2,3],[4,5,6]]))
    }
}
