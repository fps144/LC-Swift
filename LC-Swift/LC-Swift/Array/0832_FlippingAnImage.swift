//
//  0832_FlippingAnImage.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/19.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个二进制矩阵 A，我们想先水平翻转图像，然后反转图像并返回结果。
 
 水平翻转图片就是将图片的每一行都进行翻转，即逆序。例如，水平翻转 [1, 1, 0] 的结果是 [0, 1, 1]。
 
 反转图片的意思是图片中的 0 全部被 1 替换， 1 全部被 0 替换。例如，反转 [0, 1, 1] 的结果是 [1, 0, 0]。
 
 示例 1:
 
 输入: [[1,1,0],[1,0,1],[0,0,0]]
 输出: [[1,0,0],[0,1,0],[1,1,1]]
 解释: 首先翻转每一行: [[0,1,1],[1,0,1],[0,0,0]]；
 然后反转图片: [[1,0,0],[0,1,0],[1,1,1]]
 示例 2:
 
 输入: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 输出: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 解释: 首先翻转每一行: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]]；
 然后反转图片: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 说明:
 
 1 <= A.length = A[0].length <= 20
 0 <= A[i][j] <= 1
 */

class FlippingAnImageSolution {
    
    // Time Complexity: O(n²) | Space Complexity: O(n²)
    // Thought: 遍历二维数组，翻转内层数组再对其元素与1异或。
    private func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        for innerArr in A {
            var tmpArr = innerArr
            tmpArr.reverse()
            tmpArr = tmpArr.map{ $0 ^ 1 }
            result.append(tmpArr)
        }
        return result
    }
    
    // 执行用时 : 76 ms, 在Flipping an Image的Swift提交中击败了32.26% 的用户
    // 内存消耗 : 18.6 MB, 在Flipping an Image的Swift提交中击败了88.24% 的用户
    // TODO: 再快点？
    
    // Testcase: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]] -> [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
    func test() {
        print(flipAndInvertImage([[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]))
    }
}
