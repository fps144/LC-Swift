//
//  0566_ReshapeTheMatrix.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/6.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 在MATLAB中，有一个非常有用的函数 reshape，它可以将一个矩阵重塑为另一个大小不同的新矩阵，但保留其原始数据。
 
 给出一个由二维数组表示的矩阵，以及两个正整数r和c，分别表示想要的重构的矩阵的行数和列数。
 
 重构后的矩阵需要将原始矩阵的所有元素以相同的行遍历顺序填充。
 
 如果具有给定参数的reshape操作是可行且合理的，则输出新的重塑矩阵；否则，输出原始矩阵。
 
 示例 1:
 
 输入:
 nums =
 [[1,2],
 [3,4]]
 r = 1, c = 4
 输出:
 [[1,2,3,4]]
 解释:
 行遍历nums的结果是 [1,2,3,4]。新的矩阵是 1 * 4 矩阵, 用之前的元素值一行一行填充新矩阵。
 示例 2:
 
 输入:
 nums =
 [[1,2],
 [3,4]]
 r = 2, c = 4
 输出:
 [[1,2],
 [3,4]]
 解释:
 没有办法将 2 * 2 矩阵转化为 2 * 4 矩阵。 所以输出原矩阵。
 注意：
 
 给定矩阵的宽和高范围在 [1, 100]。
 给定的 r 和 c 都是正数。
 */

class ReshapeTheMatrixSolution {
    
    // TimeComplexity: O(n * m) | SpaceComplexity: O(r * c)
    // Thought: 记一个总数，用来判断是否需要返回原数组。遍历原数组，在满足 c 的条件下给 result 中添加 node。
    // 执行用时 : 172 ms, 在Reshape the Matrix的Swift提交中击败了87.50% 的用户
    // 内存消耗 : 19.2 MB, 在Reshape the Matrix的Swift提交中击败了83.33% 的用户
    private func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        var result = [[Int]]()
        var totalCount = 0
        var node = [Int]()
        for num in nums {
            totalCount += num.count
            for n in num {
                node.append(n)
                if node.count == c {
                    result.append(node)
                    node.removeAll()
                }
            }
        }
        return totalCount != r * c ? nums : result
    }
    
    // Testcase:[[1,2],[3,4]] r = 2, c = 4 -> [[1,2],[3,4]] | r = 1, c = 4 -> [[1, 2, 3, 4]]
    func test() {
        print(matrixReshape([[1,2],[3,4]], 2, 4))
    }
}
