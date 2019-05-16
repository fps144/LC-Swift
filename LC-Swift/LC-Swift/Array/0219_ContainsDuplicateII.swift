//
//  0219_ContainsDuplicateII.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的绝对值最大为 k。
 
 示例 1:
 
 输入: nums = [1,2,3,1], k = 3
 输出: true
 
 示例 2:
 
 输入: nums = [1,0,1,1], k = 1
 输出: true
 
 示例 3:
 
 输入: nums = [1,2,3,1,2,3], k = 2
 输出: false
 */

class ContainsDuplicateIISolution {
    
    // Time Complexity: O(n) | Space Complexity: O(n)
    // Thought: 利用 HashMap，遍历原数组，记录每个值 (首次出现的位置, 最后一次出现的位置, 两次出现 index 差的最小值)，最后遍历记录值，根据条件判断即可。
    // 执行用时 : 168 ms, 在Contains Duplicate II的Swift提交中击败了71.79% 的用户
    // 内存消耗 : 25.4 MB, 在Contains Duplicate II的Swift提交中击败了7.69% 的用户
    private func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var result = false
        guard nums.count > 1 else {
            return result
        }
        
        var numMap = [Int: (Int, Int, Int)]()
        for index in nums.indices {
            if let num = numMap[nums[index]] {
                numMap[nums[index]] = (num.0 ,index, num.0 != num.1 ? min(num.2, index - num.1) : index - num.1)
            } else {
                numMap[nums[index]] = (index, index, index)
            }
        }
        for (_, indexAndDistance) in numMap {
            if indexAndDistance.0 == indexAndDistance.1 { continue }
            if indexAndDistance.2 <= k {
                result = true
                break
            }
        }
        return result
    }
    
    // Testcase: [1,2,3,1,2,3], 2 -> false
    func test() {
        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }
}
