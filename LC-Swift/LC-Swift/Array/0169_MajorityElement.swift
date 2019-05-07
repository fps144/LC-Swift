//
//  0169_MajorityElement.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/7.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 
 你可以假设数组是非空的，并且给定的数组总是存在众数。
 
 示例 1:
 
 输入: [3,2,3]
 输出: 3
 
 示例 2:
 
 输入: [2,2,1,1,1,2,2]
 输出: 2
 */

class MajorityElementSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(n)
    // Thought: 遍历原数组，取一个字典记录每个值出现的次数，然后遍历该字典，找到最多次数对应的值。
    // 执行用时 : 276 ms, 在Majority Element的Swift提交中击败了40.18% 的用户
    // 内存消耗 : 19.5 MB, 在Majority Element的Swift提交中击败了22.94% 的用户
    private func majorityElement(_ nums: [Int]) -> Int {
        var numMap = [Int: Int]()
        var majority = Int.min
        var maxCount = 0
        for num in nums {
            numMap[num] = numMap[num] == nil ? 1 : numMap[num]! + 1
        }
        for (key, value) in numMap {
            if value > maxCount {
                maxCount = value
                majority = key
            }
        }
        return majority
    }
    
    // Testcase: [2,2,1,1,1,2,2] -> 2
    func test() {
        print(majorityElement([2,2,1,1,1,2,2]))
    }
}
