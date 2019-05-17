//
//  0643_MaximumAverageSubarrayI.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/17.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定 n 个整数，找出平均数最大且长度为 k 的连续子数组，并输出该最大平均数。
 
 示例 1:
 
 输入: [1,12,-5,-6,50,3], k = 4
 输出: 12.75
 解释: 最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
 
 注意:
 
 1 <= k <= n <= 30,000。
 所给数据范围 [-10,000，10,000]。
 */

class MaximumAverageSubarrayISolution {
    
//    // Time Out!!!
//    // Time Complexity: O(nk) | Space Complexity: O(1)
//    // Thought: 遍历数组，求长度为 k 子数组的最大值，再求平均数。
//    // Proposals: 找到最大子数组再求和，不用每次循环都求和。或减少求和算子的个数，不用每次都求 k 个值的和，可以一次循环移一位，一次计算只有一个减值(最后一个值)和一个增值(当前值)。
//    private func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
//        var sum = Int.min
//        for index in 0...nums.count - k {
//            sum = max(sum, nums[index...index + k - 1].reduce(0, +))
//        }
//        return Double(sum) / Double(k)
//    }
    
    // Time Complexity: O(nk) | Space Complexity: O(1)
    // Thought: 减少求和的算子个数，加快速度。
    // 执行用时 : 1564 ms, 在Maximum Average Subarray I的Swift提交中击败了60.00% 的用户
    // 内存消耗 : 21.7 MB, 在Maximum Average Subarray I的Swift提交中击败了25.00% 的用户
    private func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum = nums[0...k - 1].reduce(0, +)
        var tmp = sum
        for index in k..<nums.count {
            tmp = tmp - nums[index - k] + nums[index]
            sum = max(sum, tmp)
        }
        return Double(sum) / Double(k)
    }
    
    // Testcase: [1,12,-5,-6,50,3], 4 -> 12.75
    func test() {
        print(findMaxAverage([5,0], 1))
    }
}
