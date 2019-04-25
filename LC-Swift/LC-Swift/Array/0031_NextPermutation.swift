//
//  0031_NextPermutation.swift
//  LC-Swift
//
//  Created by 南门 on 2019/4/25.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 
 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 
 必须原地修改，只允许使用额外常数空间。
 
 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */

class NextPermutationSolution {
    
    // Time Complexity: O(n) | Space Complexity: O(1)
    // Thought: 
    // 执行用时 : 32 ms, 在Next Permutation的Swift提交中击败了100.00% 的用户
    // 内存消耗 : 19 MB, 在Next Permutation的Swift提交中击败了33.33% 的用户
    private func nextPermutation(_ nums: inout [Int]) {
        var firstIndex = 0, lastIndex = 0;
        var workIndex = nums.count - 2
        while workIndex >= 0 {
            if (nums[workIndex] < nums[workIndex + 1]) {
                firstIndex = workIndex
                for index in firstIndex..<nums.count {
                    if nums[firstIndex] < nums[index] && (index == nums.count - 1 || nums[firstIndex] >= nums[index + 1]) {
                        lastIndex = index
                        break
                    }
                }
                break;
            }
            workIndex -= 1
        }
        if firstIndex == 0 && lastIndex == 0 {
            nums = nums.reversed()
        } else {
            (nums[firstIndex], nums[lastIndex]) = (nums[lastIndex], nums[firstIndex])
            let range = firstIndex + 1..<nums.count
            nums.replaceSubrange(range, with: nums[range].sorted(by: { $0 < $1}))
        }
    }
    
    // Testcase: [1, 5, 1] -> [5, 1, 1] | [1, 5, 8, 4, 7, 6, 5, 3, 1] -> [1, 5, 8, 5, 1, 3, 4, 6, 7]
    func test() {
//        var testArr = [9, 5, 4, 3, 1]
        var testArr = [1, 5, 8, 4, 7, 6, 5, 3, 1]
//        var testArr = [1, 3, 2]
//        var testArr = [1, 5, 1]
        nextPermutation(&testArr)
        print(testArr)
    }
}
