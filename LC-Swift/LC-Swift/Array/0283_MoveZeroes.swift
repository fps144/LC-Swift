//
//  0283_MoveZeroes.swift
//  LC-Swift
//
//  Created by Songyu on 2019/5/8.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */

class MoveZeroesSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(1)
    // Thought: 因为最后一个值不需要考虑，所以遍历 nums.count - 1 次，用 nowIndex 记录当前的索引值，在遇到0时保持该值不变，否则加1。
    // 执行用时 : 108 ms, 在Move Zeroes的Swift提交中击败了40.16% 的用户
    // 内存消耗 : 19.3 MB, 在Move Zeroes的Swift提交中击败了18.05% 的用户
    private func moveZeroes(_ nums: inout [Int]) {
        var times = nums.count - 1
        var nowIndex = 0
        while times > 0 {
            if nums[nowIndex] == 0 {
                nums.remove(at: nowIndex)
                nums.append(0)
            } else {
                nowIndex += 1
            }
            times -= 1
        }
    }
    
    // Testcase: [0,1,0,3,12] -> [1,3,12,0,0]
    func test() {
        var nums = [0,1,0,3,12]
        moveZeroes(&nums)
        print(nums)
    }
}
