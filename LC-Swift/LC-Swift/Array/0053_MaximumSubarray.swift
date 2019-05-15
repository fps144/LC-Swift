//
//  0053_MaximumSubarray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 */

class MaximumSubarraySolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 最终结果 = 各子数组和的最小值。用 sum 记录上一个子数组的和，result 表示最终结果。
    //          如果 sum < 0，表示当前这个子数组的和为负数，那么下一个子数组为了求最大值，则必然不包括这个子数组的集合，即新的子数组从此处的值开始算。
    // 执行用时 : 64 ms, 在Maximum Subarray的Swift提交中击败了73.17% 的用户
    // 内存消耗 : 20.7 MB, 在Maximum Subarray的Swift提交中击败了5.66% 的用户
    private func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var sum = 0
        var result = nums[0]
        for num in nums {
            sum = sum > 0 ? sum + num : num
            result = max(result, sum)
        }
        return result
    }
    
    // Testcase: [-2,1,-3,4,-1,2,1,-5,4] -> 6
    func test() {
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
    }
}
