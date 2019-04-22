//
//  0015_3Sum.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/19.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 */

class ThreeSumSolution {
    
    // Time Complexity: O(n²) | Space Complexity: O(n²)
    // Thought: 先将给定数组升序排列，之后就可以按照排列的递增特性进行操作了。
    //            遍历数组，将数组看做 i 位置的当前值和 nums[j...k] 数组，这就构成了一个两数之和问题。
    //            因为结果中不能有重复数组出现，所以在遍历的时候判断新值和旧值是否相等，相等则条件+1
    // 执行用时 : 312 ms, 在3Sum的Swift提交中击败了91.06% 的用户
    // 内存消耗 : 22.5 MB, 在3Sum的Swift提交中击败了26.79% 的用户
    // TODO: 减少内存消耗
    private func threeSum(_ nums: [Int]) -> [[Int]] {
        var _nums = nums
        _nums.sort()
        var result = [[Int]]()
        for i in 0..<_nums.count {
            if i > 0 && _nums[i] == _nums[i - 1] {
                continue
            }
            var j = i + 1, k = _nums.count - 1
            while j < k {
                let sum = _nums[i] + _nums[j] + _nums[k]
                if sum == 0 {
                    result.append([_nums[i], _nums[j], _nums[k]])
                    j += 1
                    k -= 1
                    while j < k && _nums[j] == _nums[j-1] {
                        j += 1
                    }
                    while j < k && _nums[k] == _nums[k+1] {
                        k -= 1
                    }
                } else if sum > 0 {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return result
    }
    
    // Testcase: [-1, 0, 1, 2, -1, -4] -> [[-1, -1, 2], [-1, 0, 1]]
    func test() {
        print(threeSum([-1, 0, 1, 2, -1, -4]))
    }
}
