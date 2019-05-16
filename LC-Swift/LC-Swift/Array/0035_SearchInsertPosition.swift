//
//  0035_SearchInsertPosition.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 
 你可以假设数组中无重复元素。
 
 示例 1:
 
 输入: [1,3,5,6], 5
 输出: 2
 
 示例 2:
 
 输入: [1,3,5,6], 2
 输出: 1
 
 示例 3:
 
 输入: [1,3,5,6], 7
 输出: 4
 
 示例 4:
 
 输入: [1,3,5,6], 0
 输出: 0
 */

class SearchInsertPositionSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 遍历原数组，根据大小和边界条件判断位置即可。
    // 执行用时 : 52 ms, 在Search Insert Position的Swift提交中击败了95.16% 的用户
    // 内存消耗 : 21.1 MB, 在Search Insert Position的Swift提交中击败了5.79% 的用户
    private func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var result = 0
        for index in nums.indices {
            if target <= nums[index] {
                result = index
                break
            } else {
                if index == nums.count - 1 {
                    result = nums.count
                }
            }
        }
        return result
    }
    
    // Testcase: [1,3,5,6], 7 -> 4
    func test() {
        print(searchInsert([1,3,5,6], 7))
    }
}
