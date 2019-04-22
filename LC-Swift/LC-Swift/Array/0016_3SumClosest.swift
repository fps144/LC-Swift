//
//  0016_3SumClosest.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/21.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1, 2, 1, -4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 [0,5,-1,-2,4,-1,0,-3,4,-5]
 1
 */

class ThreeSumClosestSolution {
    
    // Time Complexity: O(n²) | Space Complexity: O(n²)
    // Thought: 求最近值其实就是求 min(abs(3sum - target))
    //            思路和求3数之和差不多，内循环 index 值自增的判定条件为 threeSum 和 target 之间的 > < == 关系
    // 执行用时 : 60 ms, 在3Sum Closest的Swift提交中击败了94.44% 的用户
    // 内存消耗 : 19 MB, 在3Sum Closest的Swift提交中击败了15.79% 的用户
    // TODO: 减少内存消耗
    private func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return -999
        }
        var _nums = nums.sorted()
        var closest = _nums[0] + _nums[1] + _nums[2]
        for i in 0..<_nums.count - 2 {
            if closest - target == 0 {
                break
            }
            var j = i + 1, k = _nums.count - 1
            while j < k {
                let threeSum = _nums[i] + _nums[j] + _nums[k]
                if abs(closest - target) > abs(threeSum - target) {
                    closest = threeSum
                }
                if threeSum > target {
                    k -= 1
                } else if threeSum < target {
                    j += 1
                } else {
                    break
                }
            }
        }
        return closest
    }
    
    // Testcase: [0,5,-1,-2,4,-1,0,-3,4,-5], 1 -> 1
    func test() {
        print(threeSumClosest([0,5,-1,-2,4,-1,0,-3,4,-5], 1))
    }
}
