//
//  0167_TwoSumII-InputArrayIsSorted.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/9.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
 
 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
 
 说明:
 
 返回的下标值（index1 和 index2）不是从零开始的。
 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
 
 示例:
 
 输入: numbers = [2, 7, 11, 15], target = 9
 输出: [1,2]
 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 */

class TwoSumIIInputArrayIsSortedSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(n)
    // Thought: 和两数之和一样，只是最终结果需要加1。
    // 执行用时 : 68 ms, 在Two Sum II - Input array is sorted的Swift提交中击败了47.92% 的用户
    // 内存消耗 : 19 MB, 在Two Sum II - Input array is sorted的Swift提交中击败了35.29% 的用户
    private func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var numMap = [Int: Int]()
        for (firstIndex, num) in numbers.enumerated() {
            if let lastIndex = numMap[target - num] {
                result = firstIndex > lastIndex ? [lastIndex + 1, firstIndex + 1] : [firstIndex + 1, lastIndex + 1]
                break
            }
            numMap[num] = firstIndex
        }
        return result
    }
    
    // Testcase: [2, 7, 11, 15], 9
    func test() {
        print(twoSum([2, 7, 11, 15], 9))
    }
}

