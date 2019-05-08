//
//  0485_MaxConsecutiveOnes.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/8.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个二进制数组， 计算其中最大连续1的个数。
 
 示例 1:
 
 输入: [1,1,0,1,1,1]
 输出: 3
 解释: 开头的两位和最后的三位都是连续1，所以最大连续1的个数是 3.
 
 注意：
 
 输入的数组只包含 0 和1。
 输入数组的长度是正整数，且不超过 10,000。
 */

class MaxConsecutiveOnesSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(1)
    // Thought: 连续的1是由0进行分割的，只需要记录每一段连续1的总数，取最大值即可。
    // 执行用时 : 400 ms, 在Max Consecutive Ones的Swift提交中击败了93.18% 的用户
    // 内存消耗 : 18.9 MB, 在Max Consecutive Ones的Swift提交中击败了55.56% 的用户
    private func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var total = 0
        var tmpTotal = 0
        for index in 0..<nums.count {
            if nums[index] == 1 {
                tmpTotal += 1
                if index == nums.count - 1 {
                    total = max(total, tmpTotal)
                }
            } else {
                total = max(total, tmpTotal)
                tmpTotal = 0
            }
        }
        return total
    }
    
    // Testcase: [1,1,0,1,1,1] -> 3
    func test() {
        print(findMaxConsecutiveOnes([1,1,0,1,1,1]))
    }
}
