//
//  0674_LongestContinuousIncreasingSubsequence.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个未经排序的整数数组，找到最长且连续的的递增序列。
 
 示例 1:
 
 输入: [1,3,5,4,7]
 输出: 3
 解释: 最长连续递增序列是 [1,3,5], 长度为3。尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为5和7在原数组里被4隔开。
 
 示例 2:
 
 输入: [2,2,2,2,2]
 输出: 1
 解释: 最长连续递增序列是 [2], 长度为1。
 
 注意：数组长度不会超过10000。
 */

class LongestContinuousIncreasingSubsequenceSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 先处理 nums.count <= 1 的特殊情况。用 tmp 记录当前这段连续递增序列的个数，每发现一个中断标志，就和当前结果 result 取最大值，并恢复 tmp 的状态。
    // 执行用时 : 112 ms, 在Longest Continuous Increasing Subsequence的Swift提交中击败了85.29% 的用户
    // 内存消耗 : 20.8 MB, 在Longest Continuous Increasing Subsequence的Swift提交中击败了9.09% 的用户
    private func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var result = 1
        var tmp = 1
        for index in 0..<nums.count - 1 {
            if nums[index] >= nums[index + 1] {
                result = max(result, tmp)
                tmp = 1
            } else {
                tmp += 1
            }
        }
        
        return max(result, tmp)
    }
    
    // Testcase: [1,3,5,4,7] -> 3 | [1,3,5,4,2,3,4,5] -> 4
    func test() {
        print(findLengthOfLCIS([1,3,5,4,2,3,4,5]))
    }
}
