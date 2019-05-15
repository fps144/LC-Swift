//
//  0189_RotateArray.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/15.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 
 示例 1:
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 
 示例 2:
 
 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 
 说明:
 
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的原地算法。
 */

class RotateArraySolution {
    
//    // Time Complexity: O(1) | Space Complexity: O(1)
//    // Thought: 数组拼接
//    // 执行用时 : 96 ms, 在Rotate Array的Swift提交中击败了54.33% 的用户
//    // 内存消耗 : 22 MB, 在Rotate Array的Swift提交中击败了5.97% 的用户
//    private func rotate(_ nums: inout [Int], _ k: Int) {
//        let k = k > nums.count ? k - nums.count : k
//        guard nums.count > 1 && k != 0 && k != nums.count else {
//            return
//        }
//        nums = Array(nums[nums.count - k ... nums.count - 1]) + Array(nums[0...nums.count - k - 1])
//    }
    
//    // Time Complexity: O(k) | Space Complexity: O(1)
//    // Thought: 算出要挪的次数，依次挪。
//    // 执行用时 : 92 ms, 在Rotate Array的Swift提交中击败了56.69% 的用户
//    // 内存消耗 : 21 MB, 在Rotate Array的Swift提交中击败了5.97% 的用户
//    private func rotate(_ nums: inout [Int], _ k: Int) {
//        var k = k > nums.count ? k - nums.count : k
//        while k > 0 {
//            nums.insert(nums.last!, at: 0)
//            nums.removeLast()
//            k -= 1
//        }
//    }
    
    // Time Complexity: O(1) | Space Complexity: O(1)
    // Thought: 算出要挪的子数组，一次性挪。
    // 执行用时 : 60 ms, 在Rotate Array的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 21 MB, 在Rotate Array的Swift提交中击败了5.97% 的用户
    private func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k > nums.count ? k - nums.count : k
        guard nums.count > 1 && k != 0 && k != nums.count else {
            return
        }
        nums.insert(contentsOf: nums[nums.count - k ... nums.count - 1], at: 0)
        nums.removeLast(k)
    }
    
//    // Time Complexity: O(n) | Space Complexity: O(1)
//    // Thought: 三次交换，不利用 swift 特性的解法。
//    // 执行用时 : 56 ms, 在Rotate Array的Swift提交中击败了100.00% 的用户
//    // 内存消耗 : 21 MB, 在Rotate Array的Swift提交中击败了5.97% 的用户
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        var k = k % nums.count
//
//        _reverse(&nums, 0, nums.count - 1)
//        _reverse(&nums, 0, k - 1)
//        _reverse(&nums, k, nums.count - 1)
//    }
//
//    private func _reverse(_ nums: inout [Int], _ startIdx: Int, _ endIdx: Int) {
//        // edge case
//        if startIdx < 0 || endIdx > nums.count || startIdx >= endIdx {
//            return
//        }
//
//        var startIdx = startIdx
//        var endIdx = endIdx
//
//        while startIdx < endIdx {
//            _swap(&nums, startIdx, endIdx)
//            startIdx += 1
//            endIdx -= 1
//        }
//    }
//
//    private func _swap<T>(_ nums: inout Array<T>, _ p: Int, _ q: Int) {
//        (nums[p], nums[q]) = (nums[q], nums[p])
//    }
    
    // Testcase: [1,2,3,4,5,6,7], 3 -> [5,6,7,1,2,3,4]
    func test() {
        var nums = [1,2,3,4,5,6,7]
        let k = 3
        rotate(&nums, k)
        print(nums)
    }
}
