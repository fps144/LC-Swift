//
//  0661_ImageSmoother.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/14.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 包含整数的二维矩阵 M 表示一个图片的灰度。你需要设计一个平滑器来让每一个单元的灰度成为平均灰度 (向下舍入) ，平均灰度的计算是周围的8个单元和它本身的值求平均，如果周围的单元格不足八个，则尽可能多的利用它们。
 
 示例 1:
 
 输入:
 [[1,1,1],
 [1,0,1],
 [1,1,1]]
 输出:
 [[0, 0, 0],
 [0, 0, 0],
 [0, 0, 0]]
 解释:
 对于点 (0,0), (0,2), (2,0), (2,2): 平均(3/4) = 平均(0.75) = 0
 对于点 (0,1), (1,0), (1,2), (2,1): 平均(5/6) = 平均(0.83333333) = 0
 对于点 (1,1): 平均(8/9) = 平均(0.88888889) = 0
 注意:
 
 给定矩阵中的整数范围为 [0, 255]。
 矩阵的长和宽的范围均为 [1, 150]。
 */

class ImageSmootherSolution {
    
    // Time Complexity: O(x * y) | Space Complexity: O(x * y)
    // Thought: 为了计算当前位置的平均值，就需要知道当前位置周围有效值的个数 numberCount 以及这些有效值的和 sum。
    //          为了求 numberCount，需要对当前位置周围的八个方向做判断，坐标系如下。
    //          遍历二维数组，对每个值的八个方向进行判断，记录有效值个数及其和。
    //          计算结果并保存。
    // 执行用时 : 728 ms, 在Image Smoother的Swift提交中击败了71.43% 的用户
    // 内存消耗 : 21.4 MB, 在Image Smoother的Swift提交中击败了25.00% 的用户
    private func imageSmoother(_ M: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        let xRange = M.count
        let yRange = M.first!.count
        
        /**
         坐标系:
         |————————————→Y
         |
         |  surroundingOperator: ⤴️ ⤵️ ⬅️ ➡️ ↖️ ↙️ ↗️ ↘️
         |
         |
         ↓X
         */
        let surroundingOperator = [[-1,0],[1,0],[0,-1],[0,1],[-1,-1],[1,-1],[-1,1],[1,1]]
        for x in 0..<xRange {
            var tmpResult = [Int]()
            for y in 0..<yRange {
                var sum = M[x][y]
                var numberCount = 1
                for i in 0..<surroundingOperator.count {
                    let testX = x + surroundingOperator[i][0];
                    let testY = y + surroundingOperator[i][1];
                    if testX < 0 || testX > xRange - 1 || testY < 0 || testY > yRange - 1 { continue }
                    sum += M[testX][testY]
                    numberCount += 1
                }
                tmpResult.append(sum / numberCount)
            }
            result.append(tmpResult)
        }
        
        return result
    }
    
    // Testcase: [[1,1,1], [1,0,1], [1,1,1]] -> [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    func test() {
        print(imageSmoother([[1,1,1], [1,0,1], [1,1,1]]))
    }
}
