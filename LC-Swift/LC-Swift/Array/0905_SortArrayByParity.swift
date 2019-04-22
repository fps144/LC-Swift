//
//  0905_SortArrayByParity.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/19.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个非负整数数组 A，返回一个由 A 的所有偶数元素组成的数组，后面跟 A 的所有奇数元素。
 
 你可以返回满足此条件的任何数组作为答案。
 
 示例：
 
 输入：[3,1,2,4]
 输出：[2,4,3,1]
 输出 [4,2,3,1]，[2,4,1,3] 和 [4,2,1,3] 也会被接受。
 
 提示：
 
 1 <= A.length <= 5000
 0 <= A[i] <= 5000
 */

class SortArrayByParitySolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 分别找出偶数数组和奇数数组，最后合并。
    // 执行用时 : 120 ms, 在Sort Array By Parity的Swift提交中击败了50.00% 的用户
    // 内存消耗 : 19.1 MB, 在Sort Array By Parity的Swift提交中击败了77.42% 的用户
    // TODO: 再快点？
    private func sortArrayByParity(_ A: [Int]) -> [Int] {
        return A.filter { $0 % 2 == 0 } + A.filter { $0 % 2 == 1 }
    }
    
    // Testcase: [3,1,2,4] -> [4,2,3,1] || [2,4,1,3] || [4,2,1,3]
    func test() {
        print(sortArrayByParity([3,1,2,4]))
    }
}
