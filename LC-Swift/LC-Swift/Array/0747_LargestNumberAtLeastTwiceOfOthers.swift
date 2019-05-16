//
//  0747_LargestNumberAtLeastTwiceOfOthers.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/16.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 在一个给定的数组nums中，总是存在一个最大元素 。
 
 查找数组中的最大元素是否至少是数组中每个其他数字的两倍。
 
 如果是，则返回最大元素的索引，否则返回-1。
 
 示例 1:
 
 输入: nums = [3, 6, 1, 0]
 输出: 1
 解释: 6是最大的整数, 对于数组中的其他整数,
 6大于数组中其他元素的两倍。6的索引是1, 所以我们返回1.
 
 示例 2:
 
 输入: nums = [1, 2, 3, 4]
 输出: -1
 解释: 4没有超过3的两倍大, 所以我们返回 -1.
 
 提示:
 
 nums 的长度范围在[1, 50].
 每个 nums[i] 的整数范围在 [0, 99].
 */

class LargestNumberAtLeastTwiceOfOthersSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 遍历原数组，记录其最大值、次大值、最大值 index，其中 次大值 != 最大值。最后根据条件返回对应的值即可。
    // 执行用时 : 16 ms, 在Largest Number At Least Twice of Others的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 20.4 MB, 在Largest Number At Least Twice of Others的Swift提交中击败了7.69% 的用户
    private func dominantIndex(_ nums: [Int]) -> Int {
        var maxPreMaxAndMaxIdx = (nums[0], Int.min, 0)
        for index in nums.indices {
            if nums[index] > maxPreMaxAndMaxIdx.0 {
                maxPreMaxAndMaxIdx = (nums[index], maxPreMaxAndMaxIdx.0, index)
            } else if nums[index] > maxPreMaxAndMaxIdx.1 && nums[index] != maxPreMaxAndMaxIdx.0 {
                maxPreMaxAndMaxIdx.1 = nums[index]
            }
        }
        return (nums.count == 1 || maxPreMaxAndMaxIdx.0 >= maxPreMaxAndMaxIdx.1 * 2) ? maxPreMaxAndMaxIdx.2 : -1
    }
    
    // Testcase: [1, 2, 3, 4] -> 0 | [3, 6, 1, 0] -> 1
    func test() {
        print(dominantIndex([1, 0]))
    }
}
