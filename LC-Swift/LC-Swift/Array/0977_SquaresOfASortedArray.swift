//
//  0977_SquaresOfASortedArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/19.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。
 
 示例 1：
 
 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 
 示例 2：
 
 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
 
 提示：
 
 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A 已按非递减顺序排序。
 */

class SquaresOfASortedArraySolution {
    
    // Time Complexity: O(nlog n) | Space Complexity: O(n)
    // Thought: 对数组里面的元素求平方再非降序排序
    // 执行用时 : 680 ms, 在Squares of a Sorted Array的Swift提交中击败了41.76% 的用户
    // 内存消耗 : 20.2 MB, 在Squares of a Sorted Array的Swift提交中击败了75.00% 的用户
    // TODO: 再快点？
    private func sortedSquares(_ A: [Int]) -> [Int] {
        return A.map { $0 * $0}.sorted(by:<)
    }
    
    // Testcase: [-7,-3,2,3,11] -> [4,9,9,49,121]
    func test() {
        print(sortedSquares([-7,-3,2,3,11]))
    }
}
