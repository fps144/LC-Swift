//
//  0697_DegreeOfAnArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/14.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个非空且只包含非负数的整数数组 nums, 数组的度的定义是指数组里任一元素出现频数的最大值。
 
 你的任务是找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。
 
 示例 1:
 
 输入: [1, 2, 2, 3, 1]
 输出: 2
 解释:
 输入数组的度是2，因为元素1和2的出现频数最大，均为2.
 连续子数组里面拥有相同度的有如下所示:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 最短连续子数组[2, 2]的长度为2，所以返回2.
 
 示例 2:
 
 输入: [1,2,2,3,1,4,2]
 输出: 6
 
 注意:
 
 nums.length 在1到50,000区间范围内。
 nums[i] 是一个在0到49,999范围内的整数。
 */

class DegreeOfAnArraySolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 利用 HashMap 的思想，遍历原数组，建立 [值 : (出现次数, 首次出现位置, 最后一次出现离首次出现的长度)] 的映射。
    //            找到映射中出现次数最多的值，并取这些值的最短长度即可。
    // 执行用时 : 276 ms, 在Degree of an Array的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 21.9 MB, 在Degree of an Array的Swift提交中击败了20.00% 的用户
    private func findShortestSubArray(_ nums: [Int]) -> Int {
        var numMap = [Int: (Int, Int, Int)]()
        var degree = nums.count
        var maxFrequency = 0
        for i in nums.indices {
            if let (count, head, _) = numMap[nums[i]] {
                numMap[nums[i]] = (count + 1, head, i - head + 1)
            } else {
                numMap[nums[i]] = (1, i , 1)
            }
        }
        
        for (_, value) in numMap {
            if maxFrequency < value.0 {
                degree = value.2
                maxFrequency = value.0
            }
            if maxFrequency == value.0 {
                degree = min(degree, value.2)
            }
        }
        return degree
    }
    
    // Testcase: [1,2,2,3,1,4,2] -> 6
    func test() {
        print(findShortestSubArray([1,2,2,3,1,4,2]))
    }
}
