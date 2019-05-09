//
//  0136_SingleNumber.swift
//  LC-Swift
//
//  Created by 南门 on 2019/5/9.
//  Copyright © 2019 Songyu. All rights reserved.
//

import Foundation

/**
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 
 说明：
 
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 
 示例 1:
 
 输入: [2,2,1]
 输出: 1
 
 示例 2:
 
 输入: [4,1,2,1,2]
 输出: 4
*/

class SingleNumberSolution {
    
    // TimeComplexity: O(n) | SpaceComplexity: O(1)
    // Thought: 利用异或 a^b^a = b 的特性，遍历原数组，将所有元素求异或，最终剩下的就是只出现过一次的数。
    // 执行用时 : 124 ms, 在Single Number的Swift提交中击败了77.05% 的用户
    // 内存消耗 : 18.6 MB, 在Single Number的Swift提交中击败了77.78% 的用户
    private func singleNumber(_ nums: [Int]) -> Int {
        var a = nums[0]
        for index in 1..<nums.count {
            a ^= nums[index]
        }
        return a
    }
    
    // Testcase: [4,1,2,1,2] -> 4
    func test() {
        print(singleNumber([4,1,2,1,2]))
    }
}
