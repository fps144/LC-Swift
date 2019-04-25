//
//  0033_SearchInRotatedSortedArray.swift
//  LC-Swift
//
//  Created by Songyu on 2019/4/25.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 
 你可以假设数组中不存在重复的元素。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 示例 1:
 
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:
 
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 */

class SearchInRotatedSortedArraySolution {
    
    // Time Complexity: O(log n) | Space Complexity: O(1)
    // Thought: 无论在哪个点旋转，除非一侧没有值，否则两侧都是单调递增的，所以只需在旋转点左右两侧进行查找就行。
    // 执行用时 : 40 ms, 在Search in Rotated Sorted Array的Swift提交中击败了71.43% 的用户
    // 内存消耗 : 19.1 MB, 在Search in Rotated Sorted Array的Swift提交中击败了8.33% 的用户（？？？）
    private func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var i = 0, j = nums.count - 1
        // 此循环无法判断 i += 1 >= j || j -= 1 <= i 时， nums[i] / nums[j] 的值是否等于 target，所以需要在循环过后判断。
        while i < j {
            if target >= nums[i] {
                if target == nums[i] {
                    return i
                }
                if nums[i + 1] < nums[i] {
                    break
                }
                i += 1
            } else {
                if target == nums[j] {
                    return j
                }
                if nums[j - 1] > nums[j] {
                    break
                }
                j -= 1
            }
        }
        if target == nums[i] {
            return i
        }
        if target == nums[j] {
            return j
        }
        return -1
    }
    
    // Testcase: [4,5,6,7,0,1,2], 3 -> -1 | [4,5,6,7,0,1,2], 0 -> 4
    func test() {
        print(search([4,5,6,7,0,1,2], 0))
    }
}
