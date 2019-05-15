//
//  0628_MaximumProductOfThreeNumbers.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。
 
 示例 1:
 
 输入: [1,2,3]
 输出: 6
 
 示例 2:
 
 输入: [1,2,3,4]
 输出: 24
 
 注意:
 
 给定的整型数组长度范围是[3,104]，数组中所有的元素范围是[-1000, 1000]。
 输入的数组中任意三个数的乘积不会超出32位有符号整数的范围。
 */

class MaximumProductOfThreeNumbersSolution {
    
//    // Time Complexity: O(n logn) | Space Complexity: O(n)
//    // Thought: 先排序，最大值一定在 nums[0] * nums[1] * nums.last! 和 nums[nums.count - 3] * nums[nums.count - 2] * nums.last! 中产生。
//    // 执行用时 : 1088 ms, 在Maximum Product of Three Numbers的Swift提交中击败了6.67% 的用户
//    // 内存消耗 : 20.9 MB, 在Maximum Product of Three Numbers的Swift提交中击败了11.11% 的用户
//    // TODO: 为了找3个最大值和两个最小值而排序，浪费很多时间，不排序直接遍历数组，找出这五个值。
//    private func maximumProduct(_ nums: [Int]) -> Int {
//        var product = Int.min
//        var nums = nums.sorted()
//        product = max(nums[0] * nums[1] * nums.last!, nums[nums.count - 3] * nums[nums.count - 2] * nums.last!)
//        return product
//    }
    
    // 执行用时 : 596 ms, 在Maximum Product of Three Numbers的Swift提交中击败了60.00% 的用户
    // 内存消耗 : 20.8 MB, 在Maximum Product of Three Numbers的Swift提交中击败了11.11% 的用户
    private func maximumProduct(_ nums: [Int]) -> Int {
        var maxTuple = (Int.min, Int.min, Int.min)
        var minTuple = (Int.max, Int.max)
        for num in nums {
            // 求前3大的值
            if num > maxTuple.0 {
                maxTuple = (num, maxTuple.0, maxTuple.1)
            } else if num > maxTuple.1 {
                maxTuple = (maxTuple.0, num, maxTuple.1)
            } else if num > maxTuple.2 {
                maxTuple.2 = num
            }
            
            // 求前2小的值
            if num < minTuple.0 {
                minTuple = (num, minTuple.0)
            } else if num < minTuple.1 {
                minTuple.1 = num
            }
        }
        return max(maxTuple.0 * maxTuple.1 * maxTuple.2, minTuple.0 * minTuple.1 * maxTuple.0)
    }
    
    func test() {
        print(maximumProduct([1,2,3,4]))
    }
}
