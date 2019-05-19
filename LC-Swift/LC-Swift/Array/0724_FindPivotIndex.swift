//
//  0724_FindPivotIndex.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数类型的数组 nums，请编写一个能够返回数组“中心索引”的方法。
 
 我们是这样定义数组中心索引的：数组中心索引的左侧所有元素相加的和等于右侧所有元素相加的和。
 
 如果数组不存在中心索引，那么我们应该返回 -1。如果数组有多个中心索引，那么我们应该返回最靠近左边的那一个。
 
 示例 1:
 
 输入:
 nums = [1, 7, 3, 6, 5, 6]
 输出: 3
 解释:
 索引3 (nums[3] = 6) 的左侧数之和(1 + 7 + 3 = 11)，与右侧数之和(5 + 6 = 11)相等。
 同时, 3 也是第一个符合要求的中心索引。
 
 示例 2:
 
 输入:
 nums = [1, 2, 3]
 输出: -1
 解释:
 数组中不存在满足此条件的中心索引。
 
 说明:
 
 nums 的长度范围为 [0, 10000]。
 任何一个 nums[i] 将会是一个范围在 [-1000, 1000]的整数。
 */

class FindPivotIndexSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 先求数组所有元素之和，此时的和默认为右侧所有元素之和 rightSum
    //          再遍历数组，当 index > 0 时，即可以开始计算 leftSum
    //          当第一次 leftSum == rightSum 时，index 即满足条件，终止循环。
    // 执行用时 : 224 ms, 在Find Pivot Index的Swift提交中击败了94.74% 的用户
    // 内存消耗 : 20.6 MB, 在Find Pivot Index的Swift提交中击败了5.88% 的用户
    private func pivotIndex(_ nums: [Int]) -> Int {
        var result = -1
        guard nums.count > 0 else {
            return result
        }
        var leftSum = 0
        var rightSum = nums.reduce(0, +)
        for index in nums.indices {
            leftSum += index == 0 ? 0 : nums[index - 1]
            rightSum -= nums[index]
            if leftSum == rightSum {
                result = index
                break
            }
        }
        return result
    }
    
    // Testcase: [1, 7, 3, 6, 5, 6] -> 3
    func test() {
        print(pivotIndex([1, 7, 3, 6, 5, 6]))
    }
}
