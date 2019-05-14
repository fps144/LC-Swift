//
//  0691_DegreeOfAnArray.swift
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
    
    private func findShortestSubArray(_ nums: [Int]) -> Int {
        // 求度
        func degree(_ arr: [Int]) -> Int {
            var numCountMap = [Int: Int]()
            for num in nums {
                if numCountMap.keys.contains(num) {
                    numCountMap[num]! += 1
                } else {
                    numCountMap[num] = 1
                }
            }
            var degree = 1
            for (_, value) in numCountMap {
                degree = max(degree, value)
            }
            return degree
        }
        
        let numsDegree = degree(nums)
        var result = nums.count
        var i = 0
        var j = result - 1
        var allSubArrs = [[Int]]()
        for i in nums.indices {
            for j in 0..<nums.count - i {
                
            }
        }
        while i < j {
            let subArr = Array(nums[i...j])
            if degree(subArr) == numsDegree {
                
            }
        }
        return result
    }
    
    // Testcase: [1,2,2,3,1,4,2] -> 6
    func test() {
        print(findShortestSubArray([1,2,2,3,1,4,2]))
    }
}
